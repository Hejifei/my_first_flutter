import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import '../../layout/index.dart';
import '../../layout/material_components.dart';
import '../../stateful_demo.dart';
import '../../shopping_list_item.dart';
import '../../layout/persistent_labels.dart';
import '../../views/settings.dart';

import '../../locales/index.dart';

import '../../router/app_pages.dart';

import '../../components/bottom_Navigation_bar.dart';

import './index_controller.dart';

class Other extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final IndexController c = Get.find();

  @override
  Widget build(context) {
    // 访问更新后的计数变量
    return Scaffold(
        body: ListView(children: [
      Text('title'.tr),
      Text('hello'.tr),
      Text("${c.count}")
    ]));
  }
}

class IndexPage extends GetView<IndexController> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final bool _inCart = false;

  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);

    //  使用Get.put()实例化你的类,使其对当下对所有子路由可用.
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Clicks: ${controller.count}')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: null,
            tooltip: 'language_change'.tr,
          ),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: const SettingPage(),
      bottomNavigationBar: BottomNavigationBarComponent(selectIndex: 1),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: controller.increment,
      ),
      body: _buildSuggestions(context),
    );
  }

  Widget _buildSuggestions(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('title'.tr),
          Text('hello'.tr),
          Text('locale: ${ui.window.locale}'),
          new RaisedButton(
            child: const Text('Go to Layout'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new SecondScreen(),
                ),
              );
            },
          ),

          const Divider(),

          new RaisedButton(
            child: const Text('Go to Counter'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new Counter(),
                ),
              );
            },
          ),

          const Divider(),

          new RaisedButton(
            child: const Text('Go to Shopping list item'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => const ShoppingList(
                    products: [
                      const Product(name: 'Egg'),
                      Product(name: 'DoughNut'),
                      Product(name: 'Apple'),
                      const Product(name: 'Juice'),
                      const Product(name: 'Orange'),
                    ],
                  ),
                ),
              );
            },
          ),

          Text('$_inCart'),

          const Text('ListView嵌套ListView'),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true, //解决无限高度问题
            physics: new NeverScrollableScrollPhysics(), //禁用滑动事件
            itemBuilder: (context, index) {
              return Text("row _ " + index.toString());
              //....一些布局代码
            },
          ),
          // ListView.builder(
          //   itemCount: 3,
          //   shrinkWrap: true,
          //   physics: new NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, i) {
          //       if (i.isOdd) return new Divider();

          //       final index = i ~/ 2;
          //       if (index >= _suggestions.length) {
          //         _suggestions.addAll(generateWordPairs().take(10));
          //       }
          //       return _buildRow(_suggestions[index]);
          //     },
          // ),
          const Divider(),

          new RaisedButton(
            child: const Text('Go to MaterialComponents'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new MaterialComponents(),
                ),
              );
            },
          ),

          new RaisedButton(
            child: const Text('Go to BottomNavigationDemo'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new AppBarDemo(),
                ),
              );
            },
          ),

          const Divider(),

          new RaisedButton(
            child: const Text('open baidu.com'),
            onPressed: () {
              const url = 'https://www.baidu.com';
              launch(url);
            },
          ),

          ElevatedButton(
            child: const Text('Go to Other'),
            onPressed: () => Get.to(Other()),
          ),
        ]);
  }
}
