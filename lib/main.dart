import 'package:cinemy/movies.dart';
import 'package:cinemy/text.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // neccessary validations
  List trendingMovie = [];
  List topRated = [];
  List popularShows = [];

  final String apiKey = 'c320bde3409e0ddfe3eadaaf8b919943';

  final String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMzIwYmRlMzQwOWUwZGRmZTNlYWRhYWY4YjkxOTk0MyIsInN1YiI6IjYyNWNkYmFmZGQ3MzFiMDA2NzBhNDdkYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.jcV6qeGupNEHt-omsWg8OTLaWWWJJ2jnsxp-GRFTdsA';

  @override
  void initState() {
    load();
    super.initState();
  }

  // getting data from api
  load() async {
    TMDB tmdb = TMDB(ApiKeys(apiKey, accessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    // map object fetched through api

    Map res = await tmdb.v3.trending.getTrending();
    Map res2 = await tmdb.v3.movies.getTopRated();
    Map res3 = await tmdb.v3.tv.getPopular();
    // print(res);
    setState(() {
      trendingMovie = res['results'];
      topRated = res2['results'];
      popularShows = res3['results'];
    });
    // print(trendingMovie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovie),
        ],
      ),
      appBar: AppBar(
        title: Center(
            child: Textchange(
          fontSize: 30,
          color: Colors.white,
          text: 'Cinemy',
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
