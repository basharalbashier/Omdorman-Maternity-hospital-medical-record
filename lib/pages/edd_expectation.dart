import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../constant.dart';
import '../controller/simpleUIController.dart';
import '../models/error_message.dart';

class EddExpectation extends StatefulWidget {
  const EddExpectation({Key? key}) : super(key: key);

  @override
  State<EddExpectation> createState() => _LoginViewState();
}

class _LoginViewState extends State<EddExpectation> {
  var gA = '';
  var edd = '';
  bool whichWay = true;

  @override
  void dispose() {
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildLargeScreen(size, simpleUIController);
            } else {
              return _buildSmallScreen(size, simpleUIController);
            }
          },
        ),
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: RotatedBox(
            quarterTurns: 0,
            child: Lottie.asset(
              'lib/assets/16367-madre-embarazada.json',
              // height: size.height ,
              // width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: _buildMainBody(
            size,
            simpleUIController,
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Center(
      child: _buildMainBody(
        size,
        simpleUIController,
      ),
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: size.width > 600
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: SizedBox(
                width: size.height * .3,
                child: Image.asset('lib/assets/download.png')),
          ),
          size.width > 600
              ? Container()
              : Lottie.asset(
                  'lib/assets/wave.json',
                  height: size.height * 0.1,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
          SizedBox(
            height: size.height / 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              children: [
                Text(
                  'Welcome  Doctor',
                  style: kLoginTitleStyle(size / 1.5, Colors.black),
                ),
                Text(
                  'hope this might help you a little ',
                  style: kLoginTitleStyle(size / 4, Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 14,
          ),
          Visibility(
            visible: gA != '',
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EDD :  $edd',
                  style: kLoginTitleStyle(size / 2, Colors.blue),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'GA : $gA +/- Weeks',
                  style: kLoginTitleStyle(size / 2, Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.pink,
                      value: whichWay,
                      onChanged: (v) {
                        setState(() {
                          whichWay = !whichWay;
                        });
                      }),
                  Text("9 Month + 9 Days")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.pink,
                      value: !whichWay,
                      onChanged: (v) {
                        setState(() {
                          whichWay = !whichWay;
                        });
                      }),
                  Text("9 Month + 7 Days")
                ],
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// Login Button
                pick(size),

                SizedBox(
                  height: size.height / 13,
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      await launchUrl(
                          Uri.parse("https://wa.me/+249117630388?text=Dr."));
                    } catch (e) {
                      errono('+249117630388', '+249117630388', context, true,
                          Container(), 1);
                    }
                  },
                  child: Column(
                    children: [
                      Text(
                        'إهداء من م/بشار قمر الدولة محمد',
                        // style: kLoginTermsAndPrivacyStyle(size),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "فكرة أ / محمد حسين",
                        // style: kLoginTermsAndPrivacyStyle(size),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  var chosenDateTime;
  // Login Button
  Widget pick(Size size) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          if (defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.iOS) {
            iosDatePicker(context);
          } else {
            iosDatePicker(context);
          }
        },
        child: Text(
          'Pick LMP Date',
          style: kLoginTitleStyle(size / 3, Colors.white),
        ),
      ),
    );
  }

  iosDatePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                DateTime date =
                    DateFormat("yyyy-MM-dd").parse(value.toString());
                var newEdd = DateTime(
                    date.year, date.month + 9, date.day + (whichWay ? 9 : 7));
                var dateNow = DateTime.now();
                var def = newEdd.difference(dateNow).inDays;

                var newGa = ((280 - def) / 7);
                setState(() {
                  edd = '${newEdd}'.substring(0, 10);
                  if (newGa < 1) {
                    gA = '';
                  } else {
                    gA = newGa.toStringAsFixed(0);
                  }
                });
              },
              initialDateTime: DateTime.now(),
              minimumYear: 2000,
              maximumYear: 3000,
            ),
          );
        });
  }
}
