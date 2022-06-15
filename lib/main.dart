import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mosplitkastroy24/contacts.dart';
import 'package:mosplitkastroy24/header.dart';
import 'package:mosplitkastroy24/mainpage.dart';
import 'package:mosplitkastroy24/platepage.dart';
import 'package:mosplitkastroy24/services.dart';
import 'package:relative_scale/relative_scale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'МОСПЛИТКАСТРОЙ24',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'МОСПЛИТКАСТРОЙ24'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _homePage = const MainPage();
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        bottomNavigationBar: Container(
          color: const Color.fromRGBO(201, 0, 0, 1),
          height: sy(30),
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text(
                '\u00a9 Rockus-Web',
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: sy(10),
                ),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Header(
              click: ((id) {
                setState(() {
                  switch (id) {
                    case 0:
                      _homePage = const MainPage();
                      break;
                    case 1:
                      _homePage = const PlatePage();
                      break;
                    case 2:
                      _homePage = const ServicesPage();
                      break;
                    case 3:
                      _homePage = const ContactPage();
                      break;
                    default:
                      _homePage = const MainPage();
                      break;
                  }
                });
              }),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _homePage,
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
