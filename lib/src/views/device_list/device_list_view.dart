import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/src/common/locale_name/device_list.dart';
import 'package:myapp/src/views/device_list/components/connect_button_widget.dart';
import 'package:myapp/src/views/device_list/components/no_data.dart';
import 'package:myapp/src/views/device_list/components/tips_view.dart';
import 'package:myapp/src/views/device_list/device_list_controller.dart';



class DeviceListPage extends StatelessWidget {
  const DeviceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DevcieListController>();
    // 修改状态栏背景颜色
    // if (Platform.isAndroid) {
    //   SystemUiOverlayStyle uiStyle = SystemUiOverlayStyle.light.copyWith(
    //     statusBarColor: Colors.green,
    //   );
    //   SystemChrome.setSystemUIOverlayStyle(uiStyle);
    // }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img_backgroung.png'),
          // fit: BoxFit.cover,  // 阴影0
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        gradient: LinearGradient( //  渐变色
          begin: Alignment(0.0, -1.0),
          end: Alignment(0.0, 1.0),
          colors: <Color>[
            Color.fromRGBO(229, 237, 247, 1),
            Color.fromRGBO(229, 237, 247, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
        appBar: AppBar(
          // systemOverlayStyle: SystemUiOverlayStyle.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            DEVICE_LIST_PAGE_TEXT.PAGE_TITLE.tr,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          leading: const Icon(
            Icons.cloud,
            color: Color.fromRGBO(37, 38, 49, 1),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.qr_code_scanner,
                color: Color.fromRGBO(37, 38, 49, 1),
              ),
              onPressed: () {
                
              }
            ),
          ],
        ),
        body: Scrollbar(
          child:
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
              child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                        minHeight: MediaQuery.of(context).size.height * 0.75,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            child: TipsViewWidget(),
                            height: 260,
                          ),
                          NoDataWidget(),
                        ],
                      ),
                    ),
                    const ConnectButtonWidget(),
                  ],
                ),
            )
        ),
      ),
    );
  }
}
