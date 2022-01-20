import 'package:get/get.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:myapp/src/common/index.dart';
import 'package:myapp/src/utils/request.dart';
import 'package:myapp/src/utils/index.dart';
import 'package:myapp/src/views/login/login_model.dart';

class LoginController extends GetxController {
  final _userName = '18013488032'.obs;
  set userName(value) {
    _userName.value = value;
  }

  get userName => _userName.value;

  final _password = 'gooodwefanfan66'.obs;
  set password(value) {
    _password.value = value;
  }

  get password => _password.value;

  void login() async {
    //创建Dio对象
    Dio dio = new Dio();

    ///请求地址 获取用户列表
    String url = "http://192.168.1.119:8700/api/Account/CrossLogin";

    ///发起get请求
    // var response = await dio.post(
    //   url,
    //   data: {
    //     'account': userName,
    //     'password': password,
    //   },
    //   options: Options(headers: {
    //     'token': jsonEncode({
    //       "uid": "",
    //       "timestamp": 0,
    //       "token": "",
    //       "client": "web",
    //       "version": "",
    //       "language": "zh",
    //     }),
    //   }),
    // );
    // // dio.post(url, data: {
    // //   'account': userName,
    // //   'password': password,
    // // });

    // ///响应数据
    // var data = response.data;
    var data = await Request().post('Account/CrossLogin', params: {
      'account': userName,
      'password': password,
    });
    var loginInfo = Login.fromJson(data);
    print(data['data']['token']);
    print(loginInfo.token);
    print('---------------------');
    // var token = data.token;
    // LocalStorage().setJSON(LOCAL_STORAGE_USER_TOKEN_KEY, token);
    // print(jsonEncode(data));
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}
}
