import 'package:cinemy/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  final List topRatedList;

  const TopRated({Key? key, required this.topRatedList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textchange(
            text: 'Top Rated Movies',
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
                                          topRatedList[index]['poster_path']))),
                        ),
                        Container(
                          child: Textchange(
                            text: topRatedList[index]['title'] != null
                                ? topRatedList[index]['title']
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
              itemCount: topRatedList.length,
            ),
          )
        ],
      ),
    );
  }
}
