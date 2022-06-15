import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mosplitkastroy24/text.dart';
import 'package:relative_scale/relative_scale.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
    required this.click,
  }) : super(key: key);
  final Function(int id) click;
  @override
  State<StatefulWidget> createState() => HeaderState();
}

class HeaderState extends State<Header> {
  late dynamic Function(int id) _click;
  @override
  void initState() {
    super.initState();
    _click = widget.click;
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Column(
        children: <Widget>[
          Container(
            color: const Color.fromRGBO(109, 10, 10, 1),
            height: sy(25) < 40 ? 40 : sy(25),
            child: Center(
              child: Text(
                'МОСПЛИТКАСТРОЙ24',
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: sy(12) < 20 ? 20 : sy(12),
                ),
              ),
            ),
          ),
          Container(
            color: const Color.fromRGBO(201, 0, 0, 1),
            height: sy(25) < 40 ? 40 : sy(25),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MenuButton(id: 0, btnPress: _click),
                  MenuButton(id: 1, btnPress: _click),
                  MenuButton(id: 2, btnPress: _click),
                  MenuButton(id: 3, btnPress: _click),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

class MenuButton extends StatefulWidget {
  const MenuButton({
    Key? key,
    required this.id,
    required this.btnPress,
  }) : super(key: key);
  final int id;
  final Function(int id) btnPress;

  @override
  State<StatefulWidget> createState() => MenuButtonState();
}

class MenuButtonState extends State<MenuButton> {
  Color _backcolor = Colors.transparent;
  Color _forecolor = Colors.white;
  int _id = -1;
  late dynamic Function(int id) _btnPress;

  @override
  void initState() {
    super.initState();
    _id = widget.id;
    _btnPress = widget.btnPress;
  }

  @override
  Widget build(context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return InkWell(
        onTap: () => _btnPress(_id),
        onHover: (hover) {
          setState(() {
            if (hover) {
              _forecolor = Colors.black;
              _backcolor = Colors.white;
            } else {
              _forecolor = Colors.white;
              _backcolor = Colors.transparent;
            }
          });
        },
        child: Container(
          height: sy(40) < 80 ? 80 : sy(40),
          width: sx(30) * 0.7 + sy(100) * 0.3 < 70
              ? 70
              : sx(30) * 0.7 + sy(100) * 0.3,
          decoration: BoxDecoration(
            color: _backcolor,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Center(
            child: Text(
              Texts.buttons[_id],
              style: GoogleFonts.oswald(
                fontWeight: FontWeight.bold,
                color: _forecolor,
                fontSize: sx(5) * 0.6 + sy(15) * 0.4 < 15
                    ? 15
                    : sx(5) * 0.6 + sy(15) * 0.4,
              ),
            ),
          ),
        ),
      );
    });
  }
}
