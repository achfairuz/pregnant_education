import 'dart:io';
import 'dart:typed_data';
import 'package:showcaseview/showcaseview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter/services.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pregnant_education/core/enums/qr_code_type_enum.dart';
import 'package:pregnant_education/shared/helpers/tts_helper.dart';
import 'package:pregnant_education/shared/widgets/nutrition_capsule_widget.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey _scanAreaKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _helpButtonKey = GlobalKey();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  QrCodeType? detectedQrType;
  Flutter3DController? _3dController;
  final ImagePicker _imagePicker = ImagePicker();
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  bool isPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
    _3dController = Flutter3DController();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ShowCaseWidget.of(
    //     context,
    //   ).startShowCase([_scanAreaKey, _galleryKey, _helpButtonKey]);
    // });
  }

  Future<void> _checkPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      isPermissionGranted = status.isGranted;
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    bool _tutorialStarted = false;
    return ShowCaseWidget(
      builder: (context) {
        if (!_tutorialStarted) {
          _tutorialStarted = true;

          Future.delayed(const Duration(milliseconds: 600), () {
            ShowCaseWidget.of(
              context,
            ).startShowCase([_helpButtonKey, _galleryKey, _scanAreaKey]);
          });
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: !isPermissionGranted
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Camera permission is required'),
                      ElevatedButton(
                        onPressed: _checkPermission,
                        child: const Text('Grant Permission'),
                      ),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    _buildQrView(context),
                    if (detectedQrType == null) _buildBottomActions(),
                    if (detectedQrType != null) _build3dView(),
                    if (detectedQrType != null) _buildButtonMenu(),
                    if (detectedQrType != null) _buildCapsuleMenu(),
                    if (detectedQrType != null) _buildControls(),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = MediaQuery.of(context).size.height * 0.4;

    // Only show overlay if NO QR is detected (and we are scanning)
    // When 3D model is shown, overlay is removed (passed as null or empty shape)
    // However, QRView overlay parameter is nullable.

    return Showcase(
      key: _scanAreaKey,
      title: "Scan QR Code",
      description: "Arahkan kamera ke QR Code untuk melihat visualisasi AR.",
      titleTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      descTextStyle: const TextStyle(fontSize: 12, color: Colors.black),
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: detectedQrType == null
            ? QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea,
              )
            : null, // Remove overlay when model is shown
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // If we already detected a type, ignore further scans until reset
      if (detectedQrType == null && scanData.code != null) {
        _handleQrCode(scanData.code!);
      }
    });
  }

  Future<void> _handleQrCode(String code) async {
    try {
      final type = QrCodeTypeExtension.fromString(code);
      if (!mounted) {
        return;
      }
      setState(() {
        detectedQrType = type;
      });
    } catch (e) {
      debugPrint('Invalid QR Code: $code');
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('QR Code Tidak Valid')));
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Izin tidak diberikan')));
    }
  }

  Widget _build3dView() {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Flutter3DViewer(
          controller: _3dController,
          src: detectedQrType!.getModelPath(),
          progressBarColor: Colors.orange,
          activeGestureInterceptor: true,
          enableTouch: true,
          onLoad: (modelAddress) {
            if (detectedQrType != null) {
              Future.delayed(const Duration(seconds: 3), () {
                TtsHelper.speak(detectedQrType!.getNarration());
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildButtonMenu() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 45,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: detectedQrType!.getBahan().length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 0),
          itemBuilder: (context, index) {
            final bahan = detectedQrType!.getBahan()[index];
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 12 : 4,
                right: index == detectedQrType!.getBahan().length - 1 ? 12 : 4,
              ),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 50,
                                height: 5,
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Text(
                              bahan['name'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              bahan['description'] ?? "",
                              textAlign: TextAlign.justify,
                            ),
                            if (bahan['capsule_data'] != null &&
                                (bahan['capsule_data'] as List).isNotEmpty) ...[
                              SizedBox(height: 24),
                              Center(
                                child: SizedBox(
                                  height: 100,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        (bahan['capsule_data'] as List).length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 4),
                                    itemBuilder: (context, index) {
                                      final capsule =
                                          bahan['capsule_data'][index];
                                      return nutritionCapsule(
                                        label: capsule['name'],
                                        value: capsule['value'],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                            SizedBox(height: 40),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(bahan['icon'], fit: BoxFit.contain),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCapsuleMenu() {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          height: 150,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: detectedQrType!.getCapsuleData().length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 4),
            itemBuilder: (context, index) {
              final capsule = detectedQrType!.getCapsuleData()[index];
              return Column(
                children: [
                  nutritionCapsule(
                    label: capsule['name'],
                    value: capsule['value'],
                  ),
                  Transform(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.yellow[800],
                      child: Text(
                        '${capsule['percentage']}%',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Center(
        child: ElevatedButton.icon(
          onPressed: _resetScan,
          icon: const Icon(Icons.qr_code_scanner),
          label: const Text('Scan Lagi'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActions() {
    return Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Showcase(
            key: _galleryKey,
            title: "Galeri",
            description:
                "Pilih gambar QR dari galeri jika sudah menyimpan QR Code.",
            titleTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            descTextStyle: const TextStyle(fontSize: 12),
            child: ElevatedButton.icon(
              onPressed: _pickFromGallery,
              icon: const Icon(Icons.photo_library),
              label: const Text('Galeri'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
          ),
          Showcase(
            key: _helpButtonKey,
            title: "Download QR Code",
            description:
                "Klik tombol ini untuk mendownload QR Code menu yang bisa kamu scan.",
            titleTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            descTextStyle: const TextStyle(fontSize: 12),
            child: ElevatedButton.icon(
              onPressed: _showGuideSheet,
              icon: const Icon(Icons.info_outline),
              label: const Text('Petunjuk'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _ensureGalleryPermission() async {
    PermissionStatus status;
    if (Platform.isIOS) {
      status = await Permission.photos.request();
    } else if (Platform.isAndroid) {
      final photosStatus = await Permission.photos.request();
      status = photosStatus.isGranted
          ? photosStatus
          : await Permission.storage.request();
    } else {
      status = await Permission.storage.request();
    }

    if (status.isGranted) {
      return true;
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    if (!mounted) {
      return false;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Izin galeri tidak diberikan')),
    );
    return false;
  }

  Future<void> _pickFromGallery() async {
    if (!await _ensureGalleryPermission()) {
      return;
    }

    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    try {
      final inputImage = InputImage.fromFilePath(image.path);
      final barcodes = await _barcodeScanner.processImage(inputImage);
      final code = barcodes.isNotEmpty ? barcodes.first.rawValue : null;
      if (code == null || code.isEmpty) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('QR tidak ditemukan di gambar')),
        );
        return;
      }

      await _handleQrCode(code);
    } catch (e) {
      debugPrint('Failed to scan from gallery: $e');
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal memindai dari galeri')),
      );
    }
  }

  void _showGuideSheet() {
    final downloadItems = [
      {
        'label': 'Makanan Utama 1',
        'asset': 'assets/images/qrcode/menu_1.png',
        'fileName': 'menu_1_qr',
      },
      {
        'label': 'Makanan Utama 2',
        'asset': 'assets/images/qrcode/menu_2.png',
        'fileName': 'menu_2_qr',
      },
      {
        'label': 'Makanan Utama 3',
        'asset': 'assets/images/qrcode/menu_3.png',
        'fileName': 'menu_3_qr',
      },
      {
        'label': 'Makanan Selingan 1',
        'asset': 'assets/images/qrcode/bubur_kacang_ijo.png',
        'fileName': 'bubur_kacang_ijo_qr',
      },
      {
        'label': 'Makanan Selingan 2',
        'asset': 'assets/images/qrcode/nagasari.png',
        'fileName': 'nagasari_qr',
      },
    ];

    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      enableDrag: true,
      scrollControlDisabledMaxHeightRatio: 0.9,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              const Center(
                child: SizedBox(
                  width: 50,
                  height: 5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFBDBDBD),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Petunjuk Penggunaan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Klik tombol Download di bawah ini untuk melihat visualisasi Isi Piringku yang mudah dipahami dan bisa langsung diterapkan sehari-hari!',
              ),
              const SizedBox(height: 12),
              ...downloadItems.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item['label'] as String,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _downloadQrAsset(
                            assetPath: item['asset'] as String,
                            fileName: item['fileName'] as String,
                          );
                          Navigator.of(context).pop();
                        },
                        child: const Text('Download'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Berikut langkah-langkah penggunaan fitur scan:'),
              const SizedBox(height: 8),
              const Text('1. Download QRCode menu yang ingin dilihat.'),
              const SizedBox(height: 8),
              const Text(
                '2. Scan QR yang telah di download atau klik tombol galeri dan pilih QRCode yang telah di download.',
              ),
              const SizedBox(height: 8),
              const Text(
                '3. Nikmati visualisasi Isi Piringku dalam tampilan Augmented Reality.',
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  Future<void> _downloadQrAsset({
    required String assetPath,
    required String fileName,
  }) async {
    if (!await _ensureGalleryPermission()) {
      return;
    }

    try {
      final byteData = await rootBundle.load(assetPath);
      final Uint8List bytes = byteData.buffer.asUint8List();
      final result = await SaverGallery.saveImage(
        bytes,
        fileName: '$fileName.png',
        androidRelativePath: 'Pictures/pregnant_education',
        skipIfExists: false,
      );
      final isSuccess = result.isSuccess == true;
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isSuccess ? 'Gambar berhasil disimpan' : 'Gagal menyimpan gambar',
          ),
        ),
      );
    } catch (e) {
      debugPrint('Failed to save QR asset: $e');
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Gagal menyimpan gambar')));
    }
  }

  void _resetScan() {
    setState(() {
      detectedQrType = null;
    });
    // Ensure camera is active (it should be, but just in case)
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    _barcodeScanner.close();
    super.dispose();
  }
}
