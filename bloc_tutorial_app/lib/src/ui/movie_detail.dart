import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget{
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  MovieDetail({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId
  });

  @override
  State<StatefulWidget> createState(){
    return MovieDetailState(
      title: title,
      posterUrl: posterUrl,
      description: description,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      movieId: movieId
    );
  }
}

class MovieDetailState extends State<MovieDetail>{
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  MovieDetailState({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return<Widget>[
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://image.tmdb.org/t/p/w500$posterUrl",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(margin: EdgeInsets.only(top: 5)),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 8, bottom: 8)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1, right: 1),
                    ),
                    Text(
                      voteAverage,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Container(margin: EdgeInsets.only(left: 10, right: 10),
                    ),
                    Text(
                      releaseDate,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(margin: EdgeInsets.only(top: 8, bottom: 8)),
                Text(description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}