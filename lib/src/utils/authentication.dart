import 'package:get/get.dart';
import 'dart:convert';
import 'package:myapp/src/common/index.dart';
import 'package:myapp/src/router/app_pages.dart';
import 'package:myapp/src/utils/local_storage.dart';

getUserToken() {
  var token = LocalStorage().getJSON(LOCAL_STORAGE_USER_TOKEN_KEY);
  return token != null ? jsonEncode(token) : null;
}

bool checkIsLogin() {
  var token = LocalStorage().getJSON(LOCAL_STORAGE_USER_TOKEN_KEY);
  return token != null;
}

clearLoginInfo() async {
  await LocalStorage().remove(LOCAL_STORAGE_USER_TOKEN_KEY);
}

logout() async {
  await clearLoginInfo();
  Get.offAllNamed(AppRoutes.Login);
}
