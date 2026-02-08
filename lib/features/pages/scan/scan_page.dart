import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
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
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  QrCodeType? detectedQrType;
  Flutter3DController? _3dController;
  bool isPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
    _3dController = Flutter3DController();
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
    return Scaffold(
      extendBodyBehindAppBar: true, // Optional, for full screen AR feel
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
                if (detectedQrType != null) _build3dView(),
                if (detectedQrType != null) _buildButtonMenu(),
                if (detectedQrType != null) _buildCapsuleMenu(),
                if (detectedQrType != null) _buildControls(),
              ],
            ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = MediaQuery.of(context).size.height * 0.4;

    // Only show overlay if NO QR is detected (and we are scanning)
    // When 3D model is shown, overlay is removed (passed as null or empty shape)
    // However, QRView overlay parameter is nullable.

    return QRView(
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
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // If we already detected a type, ignore further scans until reset
      if (detectedQrType == null && scanData.code != null) {
        try {
          final type = QrCodeTypeExtension.fromString(scanData.code!);
          setState(() {
            detectedQrType = type;
          });
        } catch (e) {
          debugPrint('Invalid QR Code: ${scanData.code}');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('QR Code Tidak Valid')));
        }
      }
    });
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
              TtsHelper.speak(detectedQrType!.getNarration());
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
              padding: EdgeInsets.only(left: index == 0 ? 12 : 4, right: index == detectedQrType!.getBahan().length - 1 ? 12 : 4),
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
                            Text(bahan['description'] ?? ""),
                            if( bahan['capsule_data'] != null && (bahan['capsule_data'] as List).isNotEmpty) ...[
                              SizedBox(height: 24),
                              Center(
                                child: SizedBox(
                                  height: 100,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: (bahan['capsule_data'] as List).length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 4),
                                    itemBuilder: (context, index) {
                                      final capsule = bahan['capsule_data'][index];
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
                  child: Image.asset(bahan['icon'], fit: BoxFit.contain,),
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
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
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
    super.dispose();
  }
}
