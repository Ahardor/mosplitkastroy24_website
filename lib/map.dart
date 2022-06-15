import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

Widget getMap() {
  final IFrameElement _iframeElement = IFrameElement();
  _iframeElement.height = '500';
  _iframeElement.width = '500';
  _iframeElement.src =
      'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2252.804586198329!2d37.265070815925526!3d55.62281588051879!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x175c852ab3ad28ef!2zNTXCsDM3JzIyLjEiTiAzN8KwMTYnMDIuMSJF!5e0!3m2!1sen!2sru!4v1650871006135!5m2!1sen!2sru';
  _iframeElement.style.border = 'none';

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry
      .registerViewFactory('iframeElement', (int viewId) => _iframeElement);

  return HtmlElementView(
    key: UniqueKey(),
    viewType: 'iframeElement',
  );
}
