import 'package:cinemy/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textchange(
            text: 'Trending Movies',
            fontSize: 26,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']))),
                        ),
                        Container(
                          child: Textchange(
                            text: trending[index]['title'] != null
                                ? trending[index]['title']
                                : 'Loading',
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                );
              },
              itemCount: trending.length,
            ),
          )
        ],
      ),
    );
  }
}
