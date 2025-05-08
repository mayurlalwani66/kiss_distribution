// import 'package:flutter/material.dart';
// import 'package:k_distribution/presentation/resources/color_manager.dart';
// import 'package:k_distribution/presentation/resources/styles_manager.dart';
// import 'package:k_distribution/presentation/resources/values_manager.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'login_provider.dart';

// class QrScannerScreen extends ConsumerStatefulWidget {
//   const QrScannerScreen({super.key});

//   @override
//   ConsumerState<QrScannerScreen> createState() => _QrScannerScreenState();
// }

// class _QrScannerScreenState extends ConsumerState<QrScannerScreen> {
//   final MobileScannerController controller = MobileScannerController();
//   bool _isScanning = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           MobileScanner(
//             controller: controller,
//             onDetect: (capture) {
//               if (!_isScanning) return;

//               final barcode = capture.barcodes.first;
//               final qrCode = barcode.rawValue;

//               if (qrCode != null) {
//                 _isScanning = false;

//                 ref
//                     .watch(loginProvider.notifier)
//                     .loginWithQrCode(qrCode, context);
//                 Future.delayed(const Duration(milliseconds: 500), () {
//                   Navigator.of(context).pop();
//                 });
//               }
//             },
//           ),
//           Positioned(
//             top: AppSize.s60,
//             left: AppSize.s20,
//             right: AppSize.s20,
//             child: Column(
//               children: [
//                 Text(
//                   "Use volume buttons for extra light",
//                   style: getRegularStyle(
//                       color: ColorManager.colorWhite, fontSize: AppSize.s16),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: AppSize.s10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.flip_camera_ios_outlined,
//                           color: ColorManager.colorWhite),
//                       onPressed: controller.switchCamera,
//                     ),
//                     IconButton(
//                       icon:
//                           Icon(Icons.flash_on, color: ColorManager.colorWhite),
//                       onPressed: controller.toggleTorch,
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.close, color: ColorManager.colorWhite),
//                       onPressed: () => Navigator.of(context).pop(),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import 'login_provider.dart';

class QrScannerScreen extends ConsumerStatefulWidget {
  const QrScannerScreen({super.key});

  @override
  ConsumerState<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends ConsumerState<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool _isScanning = true;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;
    controller?.scannedDataStream.listen((scanData) {
      final qrCode = scanData.code;
      if (qrCode != null && _isScanning) {
        print("qr result $qrCode");
        setState(() {
          _isScanning = false;
        });
        ref.read(loginProvider.notifier).loginWithQrCode(qrCode, context);
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR Code")),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).primaryColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }
}
