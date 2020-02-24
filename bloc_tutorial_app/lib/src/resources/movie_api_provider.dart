import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider{
  Client client = Client();
  final _apiKey = '34d64ab7126fd9a0ca24e5b01876ffd8';

  Future <ItemModel> fetchMovieList() async {
    print('entered');
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200){
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    }else{
      // If was not successful
      throw Exception('Failed Load Post');
    }
  }
}