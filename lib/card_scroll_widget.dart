import 'package:flutter/material.dart';
import 'dart:math';
import './data.dart';


class CardScrollWidget extends StatelessWidget {

  List colors = [Colors.red, Colors.green, Colors.yellow];

  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  static var cardAspectRatio = 12.0 / 16.0;
  var widgetAspectRatio = cardAspectRatio * 1.2;

  CardScrollWidget(this.currentPage);


  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;


          Random random = new Random();
          int index = random.nextInt(2);
          int cc;
          switch (index) {
            case 0:
              cc = 0;
              break;
            case 1:
              cc = 1;
              break;
            case 2:
              cc = 2;
              break;
          }


          bool isOnRight = delta > 0;

          var start = padding +
              max(primaryCardLeft -
                  horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white,
                    gradient:LinearGradient(
                        colors: [
                          Colors.deepPurple[700],
                          Colors.purple[500]
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        tileMode: TileMode.clamp)
                    , boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0)
                    ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,

                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      //Image.asset(colors[index].toString(), fit: BoxFit.cover),
                      //Container(color: colors[cc],),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 60.0),
                              child: Center(child: Text(ImgaesTitle[i],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular"))),
                            ),
//                            SizedBox(
//                              height: 10.0,
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.only(
//                                  left: 12.0, bottom: 12.0),
//                              child: Container(
//                                padding: EdgeInsets.symmetric(
//                                    horizontal: 22.0, vertical: 6.0),
//                                decoration: BoxDecoration(
//                                    color: Colors.blueAccent,
//                                    borderRadius: BorderRadius.circular(20.0)),
//                                child: Text("Read Later",
//                                    style: TextStyle(color: Colors.white)),
//                              ),
//                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }

        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

class RandomColor {
  static final Random _random = new Random();

  /// Returns a random color.
  static Color next() {
    return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}