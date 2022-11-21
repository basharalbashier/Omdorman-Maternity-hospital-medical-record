import 'package:flutter/material.dart';

import '../constant.dart';

class TitleD extends StatelessWidget {
  final Color color;
  final size;

  const TitleD(this.color, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                ClipRRect(
                    borderRadius: BorderRadius.circular(size.width * .2),
                    child: Image.asset('lib/assets/minstery.jpeg')),
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
                ClipRRect(
                    borderRadius: BorderRadius.circular(200.0),
                    child: Image.asset('lib/assets/download.png'))
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
          color: color,
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
    );
  }
}
