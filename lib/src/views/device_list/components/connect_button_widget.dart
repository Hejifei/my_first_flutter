import 'package:flutter/material.dart';

class ConnectButtonWidget extends StatelessWidget {
  const ConnectButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: <Color>[
            Color.fromRGBO(112, 209, 244, 1),
            Color.fromRGBO(90, 152, 255, 1),
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: () {

        },
        child: const Text(
          "连接设备",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),  //  去除阴影
          backgroundColor: MaterialStateProperty.all(Colors.transparent), //  将按钮背景设置为透明
        ),
      ),
    );
  }
}
