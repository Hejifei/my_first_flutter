import 'package:flutter/material.dart';

class TipsViewWidget extends StatelessWidget {
  const TipsViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
          margin: const EdgeInsets.only(bottom: 10),
          child:
            Column(
              children: const [
                Text(
                  "1. 设备不在列表中？请下拉刷新或点击底部按钮连接设备；",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(18, 79, 205, 1),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "2. Solar Go 仅限储能逆变器连接，若是并网逆变器，请使用   ",
                        style: TextStyle(
                          color: Color.fromRGBO(18, 79, 205, 1),
                        ),
                      ),
                      TextSpan(
                        text: "PV Master",
                        style: TextStyle(
                          color: Color.fromRGBO(18, 79, 205, 1),
                          decoration: TextDecoration.underline,
                        ), 
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ]
          ),
          
          decoration: const BoxDecoration(
            color: Color.fromRGBO(142, 173, 210, 0.2),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        Row(
          children: const [
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "问题反馈",
                      style: TextStyle(
                        color: Color.fromRGBO(119, 140, 162, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: Icon(
                          Icons.help_outline,
                          size: 16,
                          color: Color.fromRGBO(119, 140, 162, 1),
                        ),
                      )
                    )
                  ],
                ),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(
                'PVMaster v4.2.5',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Color.fromRGBO(119, 140, 162, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }
}
