import 'package:flutter/material.dart';
import 'package:flutter_app2/movies.dart';

class MovieDetails extends StatelessWidget {
  static const imageTag = "imageTag";
  final Result movie;

  const MovieDetails({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Flexible(child: Text(movie.title,textAlign: TextAlign.center, style: TextStyle(fontSize: 20),)),
            Hero(
              tag: movie.id,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("http://image.tmdb.org/t/p/w185" + movie.posterPath,),
//              image: NetworkImage("http://image.tmdb.org/t/p/w185" + movie.posterPath,),
                    )
                ),
              ),
            ),
            Text(movie.overview)
          ],
        ),
      ),
    );
  }
}
