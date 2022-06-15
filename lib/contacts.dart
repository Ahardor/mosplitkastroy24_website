import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mosplitkastroy24/map.dart';
import 'package:mosplitkastroy24/text.dart';
import 'package:relative_scale/relative_scale.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Row(
          children: [
            SizedBox(
              width: sx(50),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Texts.contacts,
                    style: GoogleFonts.oswald(
                      fontSize: sx(10) * 0.1 + sy(10) * 0.9 < 15
                          ? 15
                          : sx(10) * 0.1 + sy(10) * 0.9,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: sy(15),
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    runSpacing: sy(5),
                    children: [
                      Container(
                        width: sx(250) * 0.3 + sy(250) * 0.7 < 350
                            ? 350
                            : sx(250) * 0.3 + sy(250) * 0.7,
                        height: sx(250) * 0.3 + sy(250) * 0.7 < 350
                            ? 350
                            : sx(250) * 0.3 + sy(250) * 0.7,
                        color: Colors.white,
                        child: getMap(),
                      ),
                      const MailForm(),
                    ],
                  ),
                  SizedBox(
                    height: sy(15),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: sx(50),
            ),
          ],
        );
      },
    );
  }
}

class MailForm extends StatefulWidget {
  const MailForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MailFormState();
}

class MailFormState extends State<MailForm> {
  final _msgCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _mailCtrl = TextEditingController();

  bool _msgVal = false;
  bool _nameVal = false;
  bool _mailVal = false;
  bool _mailRight = false;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          width: sx(200) * 0.3 + sy(200) * 0.7 < 350
              ? 350
              : sx(200) * 0.3 + sy(200) * 0.7,
          child: Padding(
            padding: EdgeInsets.all(
              sy(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Напишите нам',
                  style: GoogleFonts.oswald(
                    fontSize: sx(15) * 0.1 + sy(15) * 0.9 < 15
                        ? 15
                        : sx(15) * 0.1 + sy(15) * 0.9,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: sy(15),
                ),
                TextField(
                  controller: _nameCtrl,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Имя',
                    labelStyle: GoogleFonts.oswald(
                      fontSize: sx(10) * 0.1 + sy(10) * 0.9 < 15
                          ? 15
                          : sx(10) * 0.1 + sy(10) * 0.9,
                      fontWeight: FontWeight.w400,
                    ),
                    errorText: _nameVal ? 'Заполните имя' : null,
                  ),
                ),
                SizedBox(
                  height: sy(15),
                ),
                TextField(
                  controller: _mailCtrl,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: GoogleFonts.oswald(
                      fontSize: sx(10) * 0.1 + sy(10) * 0.9 < 15
                          ? 15
                          : sx(10) * 0.1 + sy(10) * 0.9,
                      fontWeight: FontWeight.w400,
                    ),
                    errorText: _mailVal
                        ? 'Заполните почту'
                        : _mailRight
                            ? 'Введите правильную почту'
                            : null,
                  ),
                ),
                SizedBox(
                  height: sy(15),
                ),
                TextField(
                  controller: _msgCtrl,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Сообщение',
                    labelStyle: GoogleFonts.oswald(
                      fontSize: sx(10) * 0.1 + sy(10) * 0.9 < 15
                          ? 15
                          : sx(10) * 0.1 + sy(10) * 0.9,
                      fontWeight: FontWeight.w400,
                    ),
                    errorText: _msgVal ? 'Заполните' : null,
                  ),
                  minLines: 10,
                  maxLines: 100,
                ),
                SizedBox(
                  height: sy(15),
                ),
                InkWell(
                  child: Container(
                    width: sx(50) * 0.3 + sy(120) * 0.7,
                    height: sy(20) < 40 ? 40 : sy(20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Color.fromRGBO(201, 0, 0, 1),
                    ),
                    child: Center(
                      child: Text(
                        'Отправить',
                        style: GoogleFonts.oswald(
                          fontSize: sx(15) * 0.1 + sy(10) * 0.9 < 15
                              ? 15
                              : sx(15) * 0.1 + sy(10) * 0.9,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    bool cansend = false;
                    String msg = '';
                    String name = '';
                    String mail = '';
                    setState(() {
                      _mailRight = !RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_mailCtrl.text);
                      _nameVal = _nameCtrl.text.isEmpty;
                      _mailVal = _mailCtrl.text.isEmpty;
                      _msgVal = _msgCtrl.text.isEmpty;
                      if (!(_mailRight || _mailVal || _msgVal || _nameVal)) {
                        cansend = true;
                        mail = _mailCtrl.text;
                        name = _nameCtrl.text;
                        msg = _msgCtrl.text;
                        _msgCtrl.clear();
                        _mailCtrl.clear();
                        _nameCtrl.clear();
                      } else {
                        cansend = false;
                      }
                    });

                    if (cansend) {
                      final url = Uri.parse(
                          'https://api.emailjs.com/api/v1.0/email/send');

                      var _body = {
                        'service_id': 'service_z8psq9u',
                        'template_id': 'template_0npa799',
                        'user_id': 'i07aZmIjYeYgGnhR2',
                        'template_params': {
                          'name': name,
                          'message': msg,
                          'email': mail,
                        }
                      };

                      final response = await http.post(
                        url,
                        headers: {
                          'Content-Type': 'application/json',
                        },
                        body: jsonEncode(_body),
                      );
                      debugPrint(response.statusCode.toString());
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
