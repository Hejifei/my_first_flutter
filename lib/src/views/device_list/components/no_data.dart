import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      children: [
        const Center(
          child: 
            Image(
              image: 
              AssetImage('assets/images/img_zanwushebei.png'),
            )
            // ,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: const Center(
            child: Text(
              "暂无数据",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(118, 170, 253, 1),
              ),  
            ),
          ),
        ),
      ],
    );
  }
}
