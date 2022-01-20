import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Echo extends StatelessWidget {
  const Echo({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.grey,
  });

  final String text;
  final Color backgroundColor;

  @override
  build(BuildContext context) {
    return Center(
        child: Container(
      child: Text(text),
      color: backgroundColor,
    ));
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({required this.initValue, Key? key}) : super(key: key);

  final int initValue;

  // @override
  // StatefulWidget createElement() => StatefulElement(this);

  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('initState');
    _counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Column(
      children: [
        TextButton(
          child: Text('$_counter'),
          onPressed: () => {
            this.setState(() {
              _counter = _counter + 1;
            })
          },
        ),
        ElevatedButton(
          onPressed: () {
            // 查找父级最近的Scaffold对应的ScaffoldState对象
            ScaffoldState _state =
                context.findAncestorStateOfType<ScaffoldState>()!;
            // 打开抽屉菜单
            _state.openDrawer();
          },
          child: Text('打开抽屉菜单1'),
        ),
        ElevatedButton(
          onPressed: () {
            // 查找父级最近的Scaffold对应的ScaffoldState对象
            ScaffoldState _state = Scaffold.of(context);
            // 打开抽屉菜单
            _state.openDrawer();
          },
          child: Text('打开抽屉菜单2'),
        ),
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: const Text('我是SnackBar')),
              );
            },
            child: Text('show SnackBar')),
        CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("Press"),
            onPressed: () {}),
        // Image.asset('/assets/images/train.png'),
        // DecoratedBox(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/images/train.png'),
        //     ),
        //   ),
        // ),
        Image.asset(
          //  本地图片
          'assets/images/train.png',
          width: 100,
        ),
        Image.network(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: 100.0,
        ),
        Image.network(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: 100.0,
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
        ),
        Image.network(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: 100.0,
          height: 200,
          repeat: ImageRepeat.repeatY,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.accessible, color: Colors.green),
            Icon(Icons.error, color: Colors.green),
            Icon(Icons.fingerprint, color: Colors.green),
          ],
        ),
        Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
          ],
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(
        'didUpdateWidget old_counter: ${oldWidget.initValue}, _counter=${_counter}');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
