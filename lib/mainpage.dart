import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mosplitkastroy24/text.dart';
import 'package:relative_scale/relative_scale.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final _imgList = <Widget>[];
  final _imagesList = <String>[
    'assets/img/42.jpeg',
    'assets/img/5.jpeg',
    'assets/img/7.jpeg',
    'assets/img/2.jpeg',
    'assets/img/35.jpeg',
    'assets/img/8.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      _imgList.clear();
      for (var i = 0; i < 6; i++) {
        _imgList.add(
          Container(
            width: sy(200) < 200 ? 200 : sy(200),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_imagesList[i]),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
        _imgList.add(
          SizedBox(
            width: sy(5),
          ),
        );
      }
      return Row(
        children: <Widget>[
          SizedBox(
            width: sx(50),
          ),
          Expanded(
            flex: 70,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: sy(15),
                ),
                Text(
                  Texts.main,
                  style: GoogleFonts.oswald(
                    fontSize: sx(10) * 0.1 + sy(10) * 0.9 < 15
                        ? 15
                        : sx(10) * 0.1 + sy(10) * 0.9,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: sy(30),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    color: Colors.grey,
                    height: sy(200) < 200 ? 200 : sy(200),
                    child: Padding(
                      padding: EdgeInsets.all(sy(5)),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.touch,
                          },
                        ),
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: _imgList),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sy(15),
                ),
              ],
            ),
          ),
          SizedBox(
            width: sx(50),
          )
        ],
      );
    });
  }
}
