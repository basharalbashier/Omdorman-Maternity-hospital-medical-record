import 'dart:convert';
import 'dart:html';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/make_request.dart';
import 'package:aldayat_screens/models/route_manager.dart';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/pages/home_obs.dart';
import 'package:aldayat_screens/widgets/contact_me.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant.dart';
import '../controller/simpleUIController.dart';
import '../main.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool show = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Future<String> getIP() async {
    try {
      var ip = await NetworkInfo();
      print(ip);
      const url = 'https://api.ipify.org';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        print(response.body);
        return '';
      }
    } catch (exception) {
      print(exception);
      return '';
    }
  }

  @override
  void initState() {
    getIP();
    getinfo(context).then((value) => value.token != ''
        ? {routeManager(value.user!['dep'], context, value)}
        : setState(() {
            show = true;
            print(value.user);
          }));

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SimpleUIController simpleUIController = Get.find<SimpleUIController>();

    if (!show) {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          strokeWidth: 1,
        )),
      );
    }
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PrivateScaffold(LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildLargeScreen(size, simpleUIController);
            } else {
              return _buildSmallScreen(size, simpleUIController);
            }
          },
        ),context),
      
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: size.width > 600
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8, left: 30),
                child: SizedBox(
                    width: size.height * .17,
                    child: Image.asset('lib/assets/download.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, top: 8),
                child: SizedBox(
                    width: size.height * .17,
                    //
                    child: Image.asset('lib/assets/minstery.jpeg')),
              ),
            ],
          ),
          size.width > 600
              ? Container()
              : Lottie.asset(
                  'lib/assets/wave.json',
                  height: size.height * 0.2,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Login',
              style: kLoginTitleStyle(size, Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome  Doctor',
              style: kLoginSubtitleStyle(size),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  /// username or Gmail
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: emailController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      } else if (value.length < 4) {
                        return 'at least enter 4 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  /// password
                  Obx(
                    () => TextFormField(
                      style: kTextFormFieldStyle(),
                      controller: passwordController,

                      obscureText: simpleUIController.isObscure.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          icon: Icon(
                            simpleUIController.isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            simpleUIController.isObscureActive();
                          },
                        ),
                        hintText: 'Password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),

                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 5) {
                          return 'at least enter 5 characters';
                        } else if (value.length > 18) {
                          return 'maximum character is 18';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Trying to access hospital data without permission  is not allowed ',
                    style: kLoginTermsAndPrivacyStyle(size),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  /// Login Button
                  loginButton(),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  /// Navigate To Login Screen
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Login Button
  Widget loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () async {
          send();
          // Validate returns true if the form is valid, or false otherwise.
        },
        child: const Text('Login'),
      ),
    );
  }

  send() async {
    setState(() {
      show = false;
    });
    // if (_formKey.currentState!.validate()) {
    final msg = jsonEncode({
      "email": "${emailController.text}",
      "password": "${passwordController.text}",
    });
    var tryLogin =
        await makeHttpRequest('${url}user/login', msg, true, User({}, ""));
    if (tryLogin[1] == "Successfully sent") {
      List<dynamic> info = [tryLogin[0]['user'], tryLogin[0]['token']];
      stor(info).then((value) {
        if (value.token != 'no') {
          routeManager(tryLogin['user']['dep'].toString(), context, value);
        }
      });
    } else {
      errono(tryLogin[1], tryLogin[1], context, true, Container(), 5);
      setState(() {
        show = true;
      });
    }


  }
}
