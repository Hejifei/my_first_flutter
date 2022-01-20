import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'login.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Login {
  final String account;
  final bool isEnable;
  final bool isIot;
  final dynamic server;
  final dynamic token;

  Login(
    this.account,
    this.isEnable,
    this.isIot,
    this.server,
    this.token,
  );

  //不同的类使用不同的mixin即可
  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}


// import 'dart:convert';

// class Login {
//   final String account;
//   final bool isEnable;
//   final bool isIot;
//   final dynamic server;
//   final dynamic token;

//   Login(
//     this.account,
//     this.isEnable,
//     this.isIot,
//     this.server,
//     this.token,
//   );

//   Login.fromJson(Map<String, dynamic> json)
//       : account = json['account'],
//         isEnable = json['isEnable'],
//         isIot = json['isIot'],
//         server = json['server'],
//         token = json['token'];

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'account': account,
//         'isEnable': isEnable,
//         'isIot': isIot,
//         'server': server,
//         'token': token,
//       };
// }
