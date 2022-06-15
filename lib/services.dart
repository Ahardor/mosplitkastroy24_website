import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mosplitkastroy24/text.dart';
import 'package:relative_scale/relative_scale.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heught, width, sy, sx) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: sx(50),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              width: sx(130) * 0.3 + sy(150) * 0.7,
                              height: sy(150),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/img/products/vibrolitaya/delivery.jpg'),
                                ),
                              ),
                            ),
                            DropCapText(
                              Texts.services1,
                              style: GoogleFonts.oswald(
                                fontSize: sx(10) * 0.1 + sy(10) * 0.9 < 15
                                    ? 15
                                    : sx(10) * 0.1 + sy(10) * 0.9,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                              dropCap: DropCap(
                                width: sx(130) * 0.3 + sy(150) * 0.7,
                                height: sy(150),
                                child: SizedBox(
                                  width: sx(130) * 0.3 + sy(150) * 0.7,
                                  height: sy(150),
                                ),
                              ),
                              dropCapPadding: const EdgeInsets.all(5),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: sx(10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              width: sx(130) * 0.3 + sy(150) * 0.7,
                              height: sy(150),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/img/products/vibrolitaya/ukladka.jpg'),
                                ),
                              ),
                            ),
                            DropCapText(
                              Texts.services2,
                              style: GoogleFonts.oswald(
                                fontSize: sx(10) * 0.1 + sy(10) * 0.9 < 15
                                    ? 15
                                    : sx(10) * 0.1 + sy(10) * 0.9,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                              dropCap: DropCap(
                                width: sx(130) * 0.3 + sy(150) * 0.7,
                                height: sy(150),
                                child: SizedBox(
                                  width: sx(130) * 0.3 + sy(150) * 0.7,
                                  height: sy(150),
                                ),
                              ),
                              dropCapPadding: const EdgeInsets.all(5),
                              dropCapPosition: DropCapPosition.end,
                            ),
                          ],
                        ),
                      ),
                    ],
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
