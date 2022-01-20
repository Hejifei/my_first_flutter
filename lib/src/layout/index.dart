import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   child: Text('xx')
    // )
    // return GestureDetector(
    //   onTap: () {
    //     print('MyButton was tapped!');
    //   },
    //   child: ListView(
    //     children: [
    //       Row(children: [
    //         new RaisedButton(
    //           child: Text('1'),
    //           onPressed: null,
    //         ),
    //         FlatButton(
    //           child: Text('2'),
    //           color: Colors.blue,
    //           onPressed: () {
    //             print("2 clidked");
    //           },
    //         ),
    //         Container(
    //           // height: 150.0,
    //           width: 200,
    //           padding: const EdgeInsets.all(8.0),
    //           margin: const EdgeInsets.symmetric(horizontal: 8.0),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(5.0),
    //             color: Colors.lightGreen[500],
    //           ),
    //           child: const Center(
    //             child: Text('1'),
    //           ),

    //         ),
    //         Container(
    //           // height: 150.0,
    //           width: 200,
    //           padding: const EdgeInsets.all(8.0),
    //           margin: const EdgeInsets.symmetric(horizontal: 8.0),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(5.0),
    //             color: Colors.lightGreen[500],
    //           ),
    //           child: const Center(
    //             child: Text('2'),
    //           ),
    //         ),
    //         Container(
    //           // height: 150.0,
    //           width: 200,
    //           padding: const EdgeInsets.all(8.0),
    //           margin: const EdgeInsets.symmetric(horizontal: 8.0),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(5.0),
    //             color: Colors.lightGreen[500],
    //           ),
    //           child: const Center(
    //             child: Text('3'),
    //           ),
    //         ),
    //       ],)
    //     ],
    //   ),
    // );
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Layout show'),
        ),
        floatingActionButton: const FloatingActionButton(
          tooltip: 'Add', // used by assistive technologies
          child: Icon(Icons.add),
          onPressed: null,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              'Hejifei',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                fontFamily: 'Georgia',
                letterSpacing: 4,
              ),
            ),
            new Divider(),
            Container(
              child: Center(
                child: Container(
                  child: RichText(
                    text: TextSpan(style: TextStyle(), children: <TextSpan>[
                      TextSpan(text: 'TextSpan1'),
                      TextSpan(
                        text: 'textSpan2',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          fontSize: 48,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            new Divider(),
            Container(
              child: Center(
                child: Container(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consec etur Lorem ipsum dolor sit amet, consec etur Lorem ipsum dolor sit amet, consec etur',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  width: 100,
                  height: 50,
                ),
              ),
            ),
            new Divider(),
            Text(
              'Hebi',
              textAlign: TextAlign.center,
              style: TextStyle(
                backgroundColor: Colors.yellow,
                fontSize: 14,
              ),
            ),
            Container(
              child: Text(
                'lorem ipsum',
                textAlign: TextAlign.center,
                style: TextStyle(
                  backgroundColor: Colors.green,
                ),
              ),
              width: 300,
              height: 80,
              // color: Colors.grey[300],
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(const Radius.circular(8))),
            ),
            new Divider(),
            Container(
                child: Center(
                    child: Container(
                  child: Text(
                    'I\'m center',
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(16),
                  width: 240,
                )),
                width: 300,
                height: 80,
                color: Colors.green),
            new Divider(),
            Container(
              child: Stack(
                children: [
                  Center(
                      child: Container(
                    child: Text(
                      'I\'m center',
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    padding: EdgeInsets.all(16),
                    width: 240,
                  )),
                  Positioned(
                    child: Container(
                      child: Text(
                        '绝对定位',
                      ),
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                    ),
                    left: 24,
                    top: 24,
                  ),
                  Positioned(
                    child: Container(
                      child: Text(
                        '绝对定位2',
                      ),
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                    ),
                    right: 24,
                    bottom: 24,
                  )
                ],
              ),
              width: 320,
              height: 80,
              color: Colors.grey,
            ),
            new Divider(),
            Container(
              child: Center(
                child: Transform(
                  child: Container(
                    child: Container(
                      child: Text(
                        'Hejifei',
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateZ(15 * 3.1415926 / 180),
                ),
              ),
              width: 320,
              height: 80,
              color: Colors.grey,
            ),
            new Divider(),
            Container(
              child: Center(
                child: Transform(
                  child: Container(
                    child: Container(
                      child: Text(
                        'Hejifei',
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(1.5),
                ),
              ),
              width: 320,
              height: 80,
              color: Colors.grey,
            ),
            new Divider(),
            Container(
              child: Center(
                child: Container(
                  child: Text(
                    'xxxx',
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(-1.0, -1.0),
                        end: const Alignment(1.0, 1.0),
                        colors: <Color>[
                          // const Color(0xffef5350),
                          // const Color(0x00ef5350),
                          Colors.red,
                          Colors.green,
                        ],
                      ),
                      borderRadius: BorderRadius.all(const Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          offset: Offset(0, 2),
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.orange,
                          offset: Offset(0, 6),
                          blurRadius: 20,
                        ),
                      ]),
                  padding: EdgeInsets.all(16),
                ),
              ),
              width: 320,
              height: 120,
              color: Colors.grey,
            ),
            new Divider(),
            Container(
              child: Center(
                child: Container(
                  child: Center(
                    child: Text(
                      'xxxx',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  width: 80,
                  height: 80,
                ),
              ),
              width: 320,
              height: 120,
              color: Colors.grey,
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Text('left'),
                    height: 150,
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: Text('right'),
                    height: 150,
                  ),
                  flex: 7,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Container(
                  child: Text('left'),
                  color: Colors.blue,
                  width: (MediaQuery.of(context).size.width - 32) * 0.3,
                  height: 50,
                ),
                Container(
                  child: Text('center'),
                  color: Colors.yellow,
                  width: (MediaQuery.of(context).size.width - 32) * 0.3,
                  height: 50,
                ),
                Container(
                  // padding: EdgeInsets.all(16),
                  child: Text('right'),
                  color: Colors.green,
                  width: (MediaQuery.of(context).size.width - 32) * 0.4,
                  height: 50,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                new IconButton(
                  icon: new Icon(Icons.menu),
                  tooltip: 'Navigation menu',
                  onPressed: null, // null 会禁用 button
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: Text('center'),
                    height: 150,
                  ),
                ),
                new IconButton(
                  icon: new Icon(Icons.menu),
                  tooltip: 'Navigation menu',
                  onPressed: null, // null 会禁用 button
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                print('MyButton was tapped!');
              },
              child: Container(
                height: 50.0,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.lightGreen[500],
                ),
                child: const Center(
                  child: Text(
                    'Engage',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
          ],
        ));
  }
}
