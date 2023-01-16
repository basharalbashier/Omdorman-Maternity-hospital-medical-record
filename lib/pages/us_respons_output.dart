import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../models/setUnitColor.dart';
import '../widgets/back_button.dart';
import '../widgets/title.dart';

class UsResponseOutput extends StatelessWidget {
  final Map data;
  const UsResponseOutput({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleD(setUniColor('unit'), size),
              backButton(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'U/S Response',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                    Text(
                      'OBS',
                      style: kLoginTitleStyle(size, Colors.orange),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Number of Pregnancies',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Text("data")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Fetal Heart',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Text("data")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Presentation',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Text("data")),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Center(
                child: Text(
                  'Fetal Biometry',
                  style: kLoginTitleStyle(size / 1.8, Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('BPD'),
                        Text("data"),
                        Text('CM'),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('data'),
                        Text('Weeks'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('HC'),
                        Text('data'),
                        Text('CM'),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('data'),
                        Text('Weeks'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('F.L'),
                        Text('data'),
                        Text('CM'),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('data'),
                        Text('Weeks'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('AC'),
                        Text('data'),
                        Text('CM'),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('data'),
                        Text('Weeks'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('CRL'),
                        Text('data'),
                        Text('CM'),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: size.width / 4,
                    alignment: const Alignment(0, 0),
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Text('data'),
                        Text('Weeks'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        alignment: const Alignment(0, 0),
                        // color: Colors.green,
                        child: Row(
                          children: [
                            Text('EFW'),
                            Text('data'),
                            Text('Kgs'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        alignment: const Alignment(0, 0),
                        // color: Colors.green,
                        child: Row(
                          children: [
                            Text('USS EDD'),
                            Text('data'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Row(
                children: [
                  Text(
                    'Placental Site',
                    style: kLoginTitleStyle(size / 2, Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Text('data'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Row(
                children: [
                  Text(
                    'Amniotic Fluid Volume',
                    style: kLoginTitleStyle(size / 2, Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MVP',
                      style: kLoginTitleStyle(size / 3, Colors.black),
                    ),
                    Text('data'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  alignment: Alignment(0, 0),
                  // color: Colors.green,
                  child: Column(
                    children: [Text('Structural Abnormalities'), Text('data')],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Biophysical Profile',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Text('data')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Doppler EDF',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Text('data')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  alignment: Alignment(0, 0),
                  // color: Colors.green,
                  child: Column(
                    children: [Text('Comments and Suggestions'), Text('data')],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
