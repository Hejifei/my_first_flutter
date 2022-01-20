import 'dart:convert';
import 'dart:developer';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/views/login/login_controller.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => LoginPageState();
// }

class LoginPage extends GetView<LoginController> {
  // late TextEditingController _userNameController;
  // TextEditingController _passwordController = TextEditingController();
  FocusNode _userNameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusScopeNode? focusScopeNode;
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _userNameController = TextEditingController();
    //  默认值
    // _userNameController.text = 'hello world!';
    // 默认选中效果
    // _userNameController.selection = TextSelection(
    //   baseOffset: 2,
    //   extentOffset: _userNameController.text.length,
    // );
    // _userNameController.addListener(() {
    //   print(_userNameController.text);
    // });
  }

  @override
  void dispose() {
    // _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('login'),
        ),
        // drawer: const Drawer(),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  hintColor: Colors.grey[200], //  定义下划线颜色
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.grey), //  定义label字体样式
                    hintStyle: TextStyle(
                        color: Colors.grey, fontSize: 14.0), //  定义提示文本样式
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      // controller: _userNameController,
                      initialValue: '18013488032',
                      autofocus: true,
                      focusNode: _userNameFocusNode,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person),
                      ),
                      onChanged: (value) {
                        controller.userName = value;
                      },
                      validator: (value) {
                        return value!.trim().length > 0 ? null : '用户名不能为空';
                      },
                    ),
                    TextFormField(
                      // controller: _passwordController,
                      initialValue: 'gooodwefanfan66',
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                      focusNode: _passwordFocusNode,
                      validator: (value) {
                        return value!.trim().length > 5 ? null : '密码不能少于6位';
                      },
                      onChanged: (value) {
                        controller.password = value;
                      },
                    ),
                    Builder(builder: (ctx) {
                      return Column(
                        children: [
                          ElevatedButton(
                              child: const Text('账号添加焦点'),
                              onPressed: () {
                                focusScopeNode ??= FocusScope.of(context);
                                focusScopeNode
                                    ?.requestFocus(_userNameFocusNode);
                              }),
                          ElevatedButton(
                              child: const Text('隐藏键盘'),
                              onPressed: () {
                                _userNameFocusNode.unfocus();
                                _passwordFocusNode.unfocus();
                              }),
                        ],
                      );
                    }),

                    //  登录按钮
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Row(
                        children: [
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                return ElevatedButton(
                                  child: const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text('登录'),
                                  ),
                                  onPressed: () async {
                                    print('---start');
                                    print((_formKey.currentState));
                                    print('---end');
                                    if ((_formKey.currentState as FormState)
                                        .validate()) {
                                      controller.login();
                                      // var username =
                                      //     _userNameController.value.text;
                                      // var password =
                                      //     _passwordController.value.text;
                                      // print(_userNameController);
                                      // debugger();
                                      // print(
                                      //     'username: ${_userNameController.value.text}, password: ${_passwordController.value.text}');
                                      // var httpClient = new HttpClient();

                                      // try {
                                      //   var url = new Uri.http(
                                      //       'http://192.168.1.119:8700',
                                      //       '/api/Account/CrossLogin', {
                                      //     'account': "18013488032",
                                      //     'password': "gooodwefanfan66",
                                      //   });
                                      //   var request =
                                      //       await httpClient.getUrl(url);
                                      //   var response = await request.close();

                                      //   if (response.statusCode ==
                                      //       HttpStatus.OK) {
                                      //     var responseBody = await response
                                      //         .transform(utf8.decoder)
                                      //         .join();
                                      //     var data = jsonDecode(responseBody);
                                      //     print(data);
                                      //   }
                                      // } catch (error) {
                                      //   print(error);
                                      // }
                                    }

                                    // if (Form.of(context)?.validate()) {}
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),

                    Divider(),

                    //进度条显示50%
                    LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      value: 0.5,
                    ),

                    // 模糊进度条(会执行一个旋转动画)
                    CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),

                    Divider(),

                    //进度条显示50%，会显示一个半圆
                    CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      value: .5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
