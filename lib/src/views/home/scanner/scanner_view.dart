import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import "package:scan/scan.dart";
import 'package:flutter/material.dart';
import 'package:myapp/src/views/home/scanner/scanner_controller.dart';
import "package:images_picker/images_picker.dart";

class ScannerPage extends GetView<ScannerController> {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    ScanController controller = ScanController();
    String qrcode = 'Unknown';
    return Scaffold(
        appBar: AppBar(
          title: Text('home'.tr),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.qr_code_scanner), onPressed: () {}),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(
              width: 250, // custom wrap size
              height: 250,
              child: ScanView(
                controller: controller,
                // custom scan area, if set to 1.0, will scan full area
                scanAreaScale: .7,
                scanLineColor: Colors.green.shade400,
                onCapture: (data) {
                  EasyLoading.showSuccess(data);
                  // use data do something
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.resume();
              },
              child: const Text('恢复'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.pause();
              },
              child: const Text('暂停'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.toggleTorchMode();
              },
              child: const Text('打开/关闭闪光灯'),
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     try {
            //       String? result = await Scan.parse(imagePath);
            //     } catch (err) {
            //       EasyLoading.showError(err.toString());
            //     }
            //   },
            //   child: const Text('从图片中解析二维码'),
            // ),
            ElevatedButton(
              onPressed: () async {
                var imgs = await ImagesPicker.pick(
                  count: 3, // 最大可选择数量
                  pickType: PickType.image, // 选择媒体类型，默认图片
                  // language: Language.English, //  set language
                  //  增加选择图片后的裁剪
                  cropOpt: CropOption(
                    aspectRatio: CropAspectRatio.custom,
                    cropType: CropType.circle, // currently for android
                  ),
                  //  增加选择图片后的压缩
                  quality: 0.8, // only for android
                  maxSize: 500, // only for ios (kb)
                ) as List<Media>;
                if (imgs.isNotEmpty) {
                  var path = imgs[0].path;
                  String? result = await Scan.parse(path);
                  EasyLoading.showSuccess(result.toString());
                }
              },
              child: const Text('打开相册选择图片'),
            ),
            ElevatedButton(
              onPressed: () async {
                var imgs = await ImagesPicker.openCamera(
                  pickType: PickType.image, // 拍摄照片
                  maxTime: 15, // 最大拍摄时间,秒
                ) as List<Media>;
                if (imgs.isNotEmpty) {
                  var path = imgs[0].path;
                  var file = File(path);
                  ImagesPicker.saveImageToAlbum(file, albumName: "");
                  EasyLoading.showSuccess('保存成功');
                }
              },
              child: const Text('打开相机拍照,并保存.'),
            ),
            ElevatedButton(
              onPressed: () {
                ImagesPicker.openCamera(
                  pickType: PickType.video, // 拍摄视频
                  maxTime: 15, // 最大拍摄时间,秒
                );
              },
              child: const Text('打开相机拍视频'),
            ),
          ],
        ));
  }
}
