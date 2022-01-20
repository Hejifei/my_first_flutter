import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  @override
  Widget build(context) {
    return Row(
      children: [
        SizedBox(
            height: 70,
            width: 70,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                fit: BoxFit.fill,
              ),
            )),
        const SizedBox(width: 24),
        Expanded(
            child: Column(
          children: [
            ListTile(
              // leading: Image.network(
              //   "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              //   fit: BoxFit.fill,
              // ),
              title: Text('何继飞'),
              subtitle: Text('微信号: hjf657414658'),
              trailing: const Icon(Icons.arrow_forward_ios),
              // isThreeLine: true, //  是否显示第三行文本
              enabled: true, //  列表块是否可交互
              onTap: () => {print('tap')},
              onLongPress: () => {print('longPress')},
            ),
            Row(
              children: [
                CupertinoButton(
                    child: Text('status'),
                    onPressed: () => {print('button click')}),
              ],
            ),
            // const Divider(
            //   thickness: 2,
            // )
          ],
        ))
      ],
    );
  }
}
