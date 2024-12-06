/*import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp1/models/articleResponse/ArticleResponse.dart';
import 'package:newsapp1/models/sourceResponse/sourceResponse.dart';
  class Apimaneger  {
  static Future<SourceResponse?> getSources(String Category) async {
    try{
      Uri url = Uri.https("newsapi.org","/v2/top-headlines/sources",{
      "apiKey":"59df7a981b7b495e8fc57c3ed9e33612",
      "category":Category
    } );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var Sourceresponse = SourceResponse.fromJson(json);
    return Sourceresponse;
    }catch(e){
      print(e.toString());
    }
  }
  static Future<ArticleResponse?> getAriticles(String sourceId) async {
    try{
      Uri url = Uri.https("newsapi.org","/v2/everything",{
      "apiKey":"59df7a981b7b495e8fc57c3ed9e33612",
      "sources":sourceId,
    } );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var articlesReponse = ArticleResponse.fromJson(json);
    return articlesReponse;
    }catch(e){
      print(e.toString());
    }
  }
}
*/

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp1/models/articleResponse/ArticleResponse.dart';
import 'package:newsapp1/models/sourceResponse/sourceResponse.dart';
  class Apimaneger  {
  static Future<SourceResponse?> getSources(String Category) async {
    try{
      Uri url = Uri.https("newsapi.org","/v2/top-headlines/sources",{
      "apiKey":"59df7a981b7b495e8fc57c3ed9e33612",
      "category":Category
    } );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var Sourceresponse = SourceResponse.fromJson(json);
    return Sourceresponse;
    }catch(e){
      print(e.toString());
    }
  }
  static Future<ArticleResponse?> getAriticles(String sourceId, {String? searches}) async {
    try{
      Uri url = Uri.https("newsapi.org","/v2/everything",{
      "apiKey":"59df7a981b7b495e8fc57c3ed9e33612",
      "sources":sourceId,
      "q": searches ?? ""
    } );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var articlesReponse = ArticleResponse.fromJson(json);
    return articlesReponse;
    }catch(e){
      print(e.toString());
    }
  }
}