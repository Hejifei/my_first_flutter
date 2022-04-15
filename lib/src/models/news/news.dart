import 'package:json_annotation/json_annotation.dart';
// TIP 新建模块的时候 所有的news 替换为响应的name

// news.g.dart 将在我们运行生成命令后自动生成
part 'news.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class News {
  final String title;
  final String shareUrl;
  final String author;
  final String itemCover;
  final int hotValue;
  final String hotWords;
  final int playCount;
  final int diggCount;
  final int commentCount;

  News (
    this.title,
    this.shareUrl,
    this.author,
    this.itemCover,
    this.hotValue,
    this.hotWords,
    this.playCount,
    this.diggCount,
    this.commentCount
  );

  //不同的类使用不同的mixin即可
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

