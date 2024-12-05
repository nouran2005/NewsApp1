import 'Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "Jake Wood"
/// title : "Hundreds gather for funeral of woman who died with no relatives"
/// description : "Hundreds of people gathered for the funeral of a Carlow woman who died with no remaining relatives"
/// url : "https://www.bbc.co.uk/news/articles/c30nlqgegm4o"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/37da/live/b362bd40-b199-11ef-a0f2-fd81ae5962f4.jpg"
/// publishedAt : "2024-12-03T18:31:55Z"
/// content : "According to Mr Healy, about 40 people would regularly attend morning Mass at Askey Church. \r\nHe described the attendance of about 300 people to the funeral Mass held for Mary as demonstrating \"a gre… [+429 chars]"

class Articles {
  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
