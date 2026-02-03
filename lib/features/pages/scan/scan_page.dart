import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pregnant_education/core/enums/qr_code_type_enum.dart';
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
          // Do NOT pause camera to keep the AR illusion (live background)
          // controller.pauseCamera(); 
        } catch (e) {
          debugPrint('Invalid QR Code: ${scanData.code}');
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
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
          // Note: Background transparency depends on the 3D model and viewer implementation
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Center(
        child: ElevatedButton.icon(
          onPressed: _resetScan,
          icon: const Icon(Icons.qr_code_scanner),
          label: const Text('Scan Again'),
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
