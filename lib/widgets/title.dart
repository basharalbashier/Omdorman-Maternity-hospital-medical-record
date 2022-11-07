import 'package:flutter/material.dart';

import '../constant.dart';

class TitleD extends StatelessWidget {
  final unit;
  final size;

  const TitleD(this.unit, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: size.height / 6,
            width: size.width,
            color: Colors.orange,
            child: SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: size.width * .2,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(size.width * .2),
                          child: Image.asset('lib/assets/minstery.jpeg'))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Republic of Sudan',
                          style: fileTitle(size),
                        ),
                      ),
                      Text(
                        'Ministry of health - Khartoum State',
                        style: kLoginSubtitleStyle(size),
                      ),
                    ],
                  ),
                  SizedBox(
                      width: size.width * .2,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(200.0),
                          child: Image.asset('lib/assets/download.jpeg')))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Omdurman Maternity Hospital',
                style: kLoginOrSignUpTextStyle(size),
              ),
            ),
          ),
          Container(
            color: unit == 1
                ? Colors.teal
                : unit == 2
                    ? Colors.pink
                    : unit == 3
                        ? Colors.amber
                        : unit == 4
                            ? Colors.purple
                            : unit == 5
                                ? Colors.blue
                                : Colors.white,
            height: size.height / 16,
            width: size.width,
            child: Center(
              child: Text(
                'Health Information & Research',
                style: healthStyle(size),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
