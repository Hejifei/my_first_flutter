import 'package:flutter/material.dart';

class MenuLineWidget extends StatelessWidget {
  const MenuLineWidget({
    required this.name,
    required this.logoUrl,
    required this.onTapEvent,
    this.isLast = false,
    this.isBottomontainerVisible = false,
    Key? key,
  }) : super(key: key);

  final String name;
  final String logoUrl;
  final VoidCallback onTapEvent;
  final bool isLast;
  final bool isBottomontainerVisible;

  @override
  Widget build(context) {
    var bootomSpilt = <Widget>[];
    if (!isLast) {
      if (isBottomontainerVisible) {
        bootomSpilt.add(Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            // borderRadius: BorderRadius.all(const Radius.circular(8))
          ),
        ));
      } else {
        bootomSpilt.add(const Divider(
          thickness: 1,
          indent: 50,
        ));
      }
    }
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Image.network(
            logoUrl,
            fit: BoxFit.fitWidth,
            height: 30,
            // fit: BoxFit.fill,
            // width: 20,
            // height: 20,
          ),
          title: Text(name),
          // trailing: const Icon(Icons.arrow_forward_ios),
          trailing: const Icon(Icons.arrow_forward_ios),
          enabled: true, //  列表块是否可交互
          onTap: onTapEvent,
        ),
        ...bootomSpilt,
      ],
    );
  }
}
