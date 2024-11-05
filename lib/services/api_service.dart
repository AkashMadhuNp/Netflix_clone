import 'dart:convert';
import 'dart:developer';

import 'package:apifinal/constant/utils.dart';
import 'package:apifinal/models/movie_details.dart';
import 'package:apifinal/models/movie_model.dart';
import 'package:http/http.dart' as http;

class Api{
  static const trending = '${baseUrl}trending/movie/week$key';
  static const upcoming = '${baseUrl}movie/upcoming$key';
  static const nowPlaying = '${baseUrl}movie/now_playing$key';
  static const topRated = '${baseUrl}tv/top_rated$key';
  static const popular = '${baseUrl}tv/popular$key';


  Future<List<Movie>> getUpcomingMovies()async{
    final response=await http.get(Uri.parse(upcoming));
    if(response.statusCode==200){
      final decodeDate=json.decode(response.body)['results'] as List;
      return decodeDate.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception("Upcoing movies error");
    }
  }

  Future<List<Movie>> getNowPlaying()async{
    final response=await http.get(Uri.parse(nowPlaying));
    if(response.statusCode==200){
      final decodeDate=json.decode(response.body)['results'] as List;
      return decodeDate.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception("Upcoing movies error");
    }
  } 

  Future<List<Movie>> getSearch(String searchText)async{
    final search ="${baseUrl}search/movie?query=$searchText";
    log(search);
    final response= await http.get(Uri.parse(search),headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkN2MwNmUwOWM0MzgwNGY0NDA5YmYwZjE1ZTQxOTIyYyIsIm5iZiI6MTczMDQ2OTI2NS45MjIxMjUzLCJzdWIiOiI2NTcxODIwOGEyMmQzZTAxMWIyZTNiYzMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qBhqKzwx4YglTCIMjxgIDGjExj7KVGvsxPq1ioH8uZM'

    });

    log(response.statusCode.toString());
    if(response.statusCode == 200){
      log(response.body);
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception();
    }
  } 


  Future<List<Movie>> getTopRated()async{
    final response = await http.get(Uri.parse(nowPlaying));
    if(response.statusCode == 200){
      final decodeDate=json.decode(response.body)['results']as List;
      return decodeDate.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception();
    }
  }


  Future<List<Movie>> getTrendingMovies()async{
    final response = await http.get(Uri.parse(trending));
    if(response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      print(response.statusCode);
      throw Exception();
    }
  }


  Future<MovieDetailModel> getDetails(int id)async{
    final details="${baseUrl}movie/$id$key";
    final response= await http.get(Uri.parse(details));

    if(response.statusCode == 200){
      final decodeDate = MovieDetailModel.fromJson(jsonDecode(response.body));
      print(decodeDate.toString());
      return decodeDate;
    }else{
      throw Exception();
    }
  }


  Future<List<Movie>> getRecommendation(int id)async{
    final recommendation ="${baseUrl}movie/$id/recommendations$key";
    final response = await http.get(Uri.parse(recommendation));
    if(response.statusCode == 200){
      final decodeDate = json.decode(response.body)['results'] as List;
      return decodeDate.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception();
    }
  }

}