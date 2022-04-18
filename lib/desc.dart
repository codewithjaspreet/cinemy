import 'package:cinemy/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String movie, desc, bannerUrl, postUrl, vote, launchDate;
  const Description(
      {Key? key,
      required this.movie,
      required this.desc,
      required this.bannerUrl,
      required this.postUrl,
      required this.vote,
      required this.launchDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                      bottom: 10,
                      child: Textchange(
                        text: ' ⭐  Average Rating - ' + vote,
                        fontSize: 20,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Textchange(
                text: movie.isNotEmpty ? movie : 'Not Loaded',
                fontSize: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Textchange(
                text: 'Releasing on ' + launchDate,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(postUrl),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Textchange(
                      text: desc,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
