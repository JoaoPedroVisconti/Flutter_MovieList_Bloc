import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class MovieApiProvider{
  Client client = Client();
  final _apiKey = '34d64ab7126fd9a0ca24e5b01876ffd8';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future <ItemModel> fetchMovieList() async {
    final response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    if (response.statusCode == 200){
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    }else{
      // If was not successful
      throw Exception('Failed Load Post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async{
    final response = await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200){
      return TrailerModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load trailer');
    }
  }
}