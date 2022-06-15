import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';

class PlatePage extends StatefulWidget {
  const PlatePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => PlatePageState();
}

class PlatePageState extends State<PlatePage> {
  var _vibrolitItemsData = [];
  var _vibropressItemsData = [];
  var _elementsItemsData = [];
  final _vibrolitItems = <Widget>[];
  final _vibropressItems = <Widget>[];
  final _elementsItems = <Widget>[];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/items.json');
    final data = await json.decode(response);
    setState(() {
      _vibrolitItemsData = data["lit"];
      _vibropressItemsData = data["press"];
      _elementsItemsData = data["elem"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson().then(
      (value) {
        for (var i = 0; i < _vibrolitItemsData.length; i++) {
          _vibrolitItems.add(PlateItem(
            text: _vibrolitItemsData[i]["name"],
            img: _vibrolitItemsData[i]["img"],
            info1: _vibrolitItemsData[i]["info1"],
            info2: _vibrolitItemsData[i]["info2"],
          ));
          _vibrolitItems.add(
            RelativeBuilder(
              builder: (context, height, width, sy, sx) {
                return SizedBox(
                  width: sy(5),
                );
              },
            ),
          );
        }
        for (var i = 0; i < _vibropressItemsData.length; i++) {
          _vibropressItems.add(PlateItem(
            text: _vibropressItemsData[i]["name"],
            img: _vibropressItemsData[i]["img"],
            info1: _vibropressItemsData[i]["info1"],
            info2: _vibropressItemsData[i]["info2"],
            color: const Color.fromRGBO(68, 24, 24, 1),
          ));
          _vibropressItems.add(
            RelativeBuilder(
              builder: (context, height, width, sy, sx) {
                return SizedBox(
                  width: sy(5),
                );
              },
            ),
          );
        }
        for (var i = 0; i < _elementsItemsData.length; i++) {
          _elementsItems.add(PlateItem(
            text: _elementsItemsData[i]["name"],
            img: _elementsItemsData[i]["img"],
            info1: _elementsItemsData[i]["info1"],
            info2: _elementsItemsData[i]["info2"],
          ));
          _elementsItems.add(
            RelativeBuilder(
              builder: (context, height, width, sy, sx) {
                return SizedBox(
                  width: sy(5),
                );
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: readJson(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        return RelativeBuilder(
          builder: (context, height, width, sy, sx) {
            return Column(
              children: [
                Container(
                  color: const Color.fromRGBO(68, 24, 24, 1),
                  height: sy(250) < 450 ? 450 : sy(250),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(sy(10)),
                        child: Center(
                          child: Text(
                            'Плитка вибролитая',
                            style: GoogleFonts.oswald(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: sy(20) < 30 ? 30 : sy(20),
                            ),
                          ),
                        ),
                      ),
                      _vibrolitItems.isNotEmpty
                          ? Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(sx(70), 0, sx(70), 0),
                                child: ScrollConfiguration(
                                  behavior:
                                      ScrollConfiguration.of(context).copyWith(
                                    dragDevices: {
                                      PointerDeviceKind.mouse,
                                      PointerDeviceKind.touch,
                                    },
                                  ),
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: _vibrolitItems,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: sy(5),
                      )
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(221, 221, 221, 1),
                  height: sy(250) < 450 ? 450 : sy(250),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(sy(10)),
                        child: Center(
                          child: Text(
                            'Плитка вибропрессованная и тактильная',
                            style: GoogleFonts.oswald(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(68, 24, 24, 1),
                              fontSize: sy(20) < 30 ? 30 : sy(20),
                            ),
                          ),
                        ),
                      ),
                      _vibropressItems.isNotEmpty
                          ? Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(sx(70), 0, sx(70), 0),
                                child: ScrollConfiguration(
                                  behavior:
                                      ScrollConfiguration.of(context).copyWith(
                                    dragDevices: {
                                      PointerDeviceKind.mouse,
                                      PointerDeviceKind.touch,
                                    },
                                  ),
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: _vibropressItems,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: sy(5),
                      )
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(68, 24, 24, 1),
                  height: sy(250) < 450 ? 450 : sy(250),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(sy(10)),
                        child: Center(
                          child: Text(
                            'Элементы',
                            style: GoogleFonts.oswald(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: sy(20) < 30 ? 30 : sy(20),
                            ),
                          ),
                        ),
                      ),
                      _elementsItems.isNotEmpty
                          ? Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(sx(70), 0, sx(70), 0),
                                child: ScrollConfiguration(
                                  behavior:
                                      ScrollConfiguration.of(context).copyWith(
                                    dragDevices: {
                                      PointerDeviceKind.mouse,
                                      PointerDeviceKind.touch,
                                    },
                                  ),
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: _elementsItems,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: sy(5),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class PlateItem extends StatelessWidget {
  const PlateItem({
    Key? key,
    required this.text,
    required this.img,
    this.info1 = "",
    this.info2 = "",
    this.color = Colors.white,
  }) : super(key: key);
  final String text;
  final String img;
  final String info1;
  final String info2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          color: color,
          width: sy(175) * 0.8 + sx(175) * 0.2 < 350
              ? 350
              : sy(175) * 0.8 + sx(175) * 0.2,
          child: Column(
            children: [
              SizedBox(
                height: sy(10),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: sy(140) < 270 ? 270 : sy(140),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    SizedBox(
                      width: sy(5),
                    ),
                    Text(
                      text,
                      style: GoogleFonts.oswald(
                        color:
                            color == Colors.white ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: sy(14) * 0.5 + sx(12) * 0.5 > 30
                            ? 30
                            : sy(14) * 0.5 + sx(12) * 0.5,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        info1 != ""
                            ? Text(
                                info1,
                                style: GoogleFonts.oswald(
                                  fontWeight: FontWeight.bold,
                                  fontSize: sy(14) * 0.5 + sx(5) * 0.5 > 15
                                      ? 15
                                      : sy(14) * 0.5 + sx(5) * 0.5,
                                  color: color == Colors.white
                                      ? const Color.fromRGBO(96, 96, 96, 1)
                                      : Colors.white,
                                ),
                              )
                            : Container(),
                        info2 != ""
                            ? Text(
                                info2,
                                style: GoogleFonts.oswald(
                                  fontWeight: FontWeight.bold,
                                  fontSize: sy(14) * 0.5 + sx(5) * 0.5 > 15
                                      ? 15
                                      : sy(14) * 0.5 + sx(5) * 0.5,
                                  color: color == Colors.white
                                      ? const Color.fromRGBO(96, 96, 96, 1)
                                      : Colors.white,
                                ),
                              )
                            : Container()
                      ],
                    ),
                    SizedBox(
                      width: sy(5),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
