import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/views/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {}

  @override
  void dispose() {
    // _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login'.tr),
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
                      decoration: const InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person),
                      ),
                      onChanged: (value) {
                        controller.userName = value;
                      },
                      validator: (value) {
                        return value!.trim().isNotEmpty ? null : '用户名不能为空';
                      },
                    ),
                    TextFormField(
                      // controller: _passwordController,
                      initialValue: 'gooodwefanfan66',
                      decoration: const InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                      validator: (value) {
                        return value!.trim().length > 5 ? null : '密码不能少于6位';
                      },
                      onChanged: (value) {
                        controller.password = value;
                      },
                    ),

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
                                    if ((_formKey.currentState as FormState)
                                        .validate()) {
                                      controller.login();
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
