import 'package:cinemy/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TV extends StatelessWidget {
  final List tvShows;

  const TV({Key? key, required this.tvShows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textchange(
            text: 'Popular TV Shows',
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
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          tvShows[index]['backdrop_path']),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Textchange(
                            text: tvShows[index]['original_name'] != null
                                ? tvShows[index]['original_name']
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
              itemCount: tvShows.length,
            ),
          )
        ],
      ),
    );
  }
}
