import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myapp/src/common/index.dart';
import 'package:myapp/src/utils/dio_util/dio_method.dart';
import 'package:myapp/src/utils/dio_util/dio_response.dart';
import 'package:myapp/src/utils/dio_util/dio_util.dart';
import 'package:myapp/src/utils/index.dart';
import 'package:myapp/src/models/login.dart';

class LoginController extends GetxController {
  CancelToken _cancelToken = CancelToken();

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
    try {
      // await Request().post('Account/CrossLogin', params: {
      //   'account': userName,
      //   'password': password,
      // });
      var data = await DioUtil().request(
        'Account/CrossLogin',
        method: DioMethod.post,
        data: {
          'account': userName,
          'password': password,
        },
      );
      print(data);
      var loginInfo = Login.fromJson(data);
      var token = loginInfo.token;
      LocalStorage().setJSON(LOCAL_STORAGE_USER_TOKEN_KEY, token);
      EasyLoading.showSuccess('登录成功!');
    } on ErrorEntity catch (error) {
      print('on');
      EasyLoading.showInfo(error.message.toString());
    } catch (err) {
      print('catch');
      print(err);
      EasyLoading.showError(err.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}
}
