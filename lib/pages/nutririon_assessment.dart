import 'dart:convert';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../main.dart';
import '../models/error_message.dart';
import '../models/user_hive.dart';
import '../widgets/title.dart';

class NutritionAssessment extends StatefulWidget {
  final Map patient;
  final Map file;
  final String type;
  const NutritionAssessment({
    super.key,
    required this.patient,
    required this.file,
    required this.type,
  });

  @override
  State<NutritionAssessment> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NutritionAssessment> {
  var comm = TextEditingController();
  var admCont = TextEditingController();
  var likeOrDisCont = TextEditingController();
  var ngtCont = TextEditingController();
  var npoCont = TextEditingController();
  var other = TextEditingController();

  var kcalCont = TextEditingController();
  var proCont = TextEditingController();
  var fluidCont = TextEditingController();
  var problemCont = TextEditingController();
  var relatedToCont = TextEditingController();

  var asEvidCont = TextEditingController();
  var breastFeedingCont = TextEditingController();
  var afterhourCont = TextEditingController();
  var netritionConsCont = TextEditingController();

  var show = T;

  var htCont = TextEditingController();
  var wtCont = TextEditingController();
  var ibwCont = TextEditingController();
  var bmiCont = TextEditingController();
  var oneHourCont = TextEditingController();

  var anor = false;
  var swall = false;
  var chew = false;
  var dental = false;
  var naus = false;
  var vomti = false;
  var constip = false;

  var diarrhe = false;
  var foodAllerg = false;
  var hearing = false;
  var limitedVis = false;
  var dementia = false;
  var languageBar = false;
  var na = false;

  var post = false;
  var fever = false;
  var wond = false;
  var trauma = false;
  var sepsis = false;
  var adaqu = false;
  var obsese = false;
  var atRisk = false;

  var malori = false;
  var low = false;
  var modrat = false;

  var high = false;
  List checBoxes = [];
  List anthro = [];
  List nuDiaList = [];
  List foodList = [];
  String whatNutritionLevel = '';
  @override
  void initState() {
    getinfo(context).then((value) => setState(() {
          user = value;
        }));
    foodList = [
      ["Breast Feeding", breastFeedingCont],
      ['After 1/2 Hour', wtCont],
      ['1 Hour', oneHourCont],
    ];
    anthro = [
      ["Ht", htCont],
      ['Wt', wtCont],
      ["IBW", ibwCont],
      ["BMI", bmiCont]
    ];
    nuDiaList = [
      ["Problem", problemCont],
      ['Related To', relatedToCont],
      ["As Evidenced By", asEvidCont],
    ];
    checBoxes = [
      ['Anorexia', anor],
      ['Swallowing Problem', swall],
      ['Chewing Problem', chew],
      ['Dental Problem', dental],
      ['Nausea', naus],
      ['Vomting', vomti],
      ['Constiption', constip],
      ["Diarrhea", diarrhe],
      ["Food Allergy / Control", foodAllerg],
      ['Hearing Imparied', hearing],
      ['Limited Vision', limitedVis],
      ['Dementia', dementia],
      ['Language Barrier', languageBar],
      ["N / A", na],
      ['Post-op. / Surgery', post],
      ['Fever / Infection', fever],
      ['Wonds', wond],
      ['Trauma / Fracture', trauma],
      ['Sepsis', sepsis],
      ['Adequately Nourished', adaqu],
      ['Obese', obsese],
      ['At.Risk Malnutrition', atRisk],
      ['Maluorished', malori],
      ['Low', low],
      ['Moderate', modrat],
      ['High', high]
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    if (!show) {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          strokeWidth: 1,
        )),
      );
    }
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleD(setUniColor(widget.file['unit']), size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Nutrition Assessment form',
                  style: kLoginTitleStyle(size / 1.3, Colors.black),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  alignment: Alignment(0, 0),
                  // color: Colors.green,
                  child: TextFormField(
                    maxLines: 2,
                    controller: comm,
                    style: kTextFormFieldStyle(),
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.person),

                      label: Text(
                        'Adm. Medical Diagnosis',
                        style: kLoginTitleStyle(size / 2, Colors.black),
                      ),
                    ),
                    // controller: nameController,
                    // The validator receives the text that the user has entered.
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Anthropometric Data",
                    style: kLoginTitleStyle(size / 2, Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (var i in anthro)
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Container(
                        width: size.width / 4.5,
                        alignment: Alignment(0, 0),
                        // color: Colors.green,
                        child: TextFormField(
                          maxLines: 2,
                          controller: i[1],
                          style: kTextFormFieldStyle(),
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.person),

                            label: Text(i[0]),
                          ),
                          // controller: nameController,
                          // The validator receives the text that the user has entered.
                        ),
                      ),
                    ),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Investigation',
                        style: kLoginTitleStyle(size / 2, Colors.black),
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          'Intake / Digestive problem',
                          style: kLoginTitleStyle(size / 2, Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: ResponsiveGridRow(children: [
                    for (int i = 0; i < 9; i++)
                      ResponsiveGridCol(
                        xs: 4,
                        md: 3,
                        child: Container(
                          height: 50,
                          alignment: const Alignment(0, 0),
                          // color: Colors.purple,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: checBoxes[i][1],
                                  onChanged: (v) {
                                    setState(() {
                                      checBoxes[i][1] = !checBoxes[i][1];
                                    });
                                  }),
                              SizedBox(
                                width: size.width / 5,
                                child: Text(
                                  checBoxes[i][0],
                                  // style: kLoginTitleStyle(size/4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Physical & Mental State',
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
                  child: ResponsiveGridRow(children: [
                    for (int i = 9; i < 14; i++)
                      ResponsiveGridCol(
                        xs: 4,
                        md: 3,
                        child: Container(
                          height: 50,
                          alignment: const Alignment(0, 0),
                          // color: Colors.purple,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: checBoxes[i][1],
                                  onChanged: (v) {
                                    setState(() {
                                      checBoxes[i][1] = !checBoxes[i][1];
                                    });
                                  }),
                              SizedBox(
                                width: size.width / 5,
                                child: Text(
                                  checBoxes[i][0],
                                  // style: kLoginTitleStyle(size/4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Metabolic Stressors',
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
                  child: ResponsiveGridRow(children: [
                    for (int i = 14; i < 19; i++)
                      ResponsiveGridCol(
                        xs: 4,
                        md: 3,
                        child: Container(
                          height: 50,
                          alignment: const Alignment(0, 0),
                          // color: Colors.purple,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: checBoxes[i][1],
                                  onChanged: (v) {
                                    setState(() {
                                      checBoxes[i][1] = !checBoxes[i][1];
                                    });
                                  }),
                              SizedBox(
                                width: size.width / 5,
                                child: Text(
                                  checBoxes[i][0],
                                  // style: kLoginTitleStyle(size/4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Physical Appearance',
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
                  child: ResponsiveGridRow(children: [
                    for (int i = 19; i < 23; i++)
                      ResponsiveGridCol(
                        xs: 4,
                        md: 3,
                        child: Container(
                          height: 50,
                          alignment: const Alignment(0, 0),
                          // color: Colors.purple,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: checBoxes[i][1],
                                  onChanged: (v) {
                                    setState(() {
                                      checBoxes[i][1] = !checBoxes[i][1];
                                    });
                                  }),
                              SizedBox(
                                width: size.width / 5,
                                child: Text(
                                  checBoxes[i][0],
                                  // style: kLoginTitleStyle(size/4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ResponsiveGridCol(
                      child: Text(
                        'Nutrition Risk Level :',
                        style: kLoginTitleStyle(size / 2.5, Colors.black),
                      ),
                    ),
                    for (int i = 23; i < 26; i++)
                      ResponsiveGridCol(
                        xs: 4,
                        md: 3,
                        child: Container(
                          alignment: const Alignment(0, 0),
                          // color: Colors.purple,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: checBoxes[i][1],
                                  onChanged: (v) {
                                    setState(() {
                                      checBoxes[23][1] = F;
                                      checBoxes[24][1] = F;
                                      checBoxes[25][1] = F;
                                      checBoxes[i][1] = !checBoxes[i][1];
                                      whatNutritionLevel = checBoxes[i][0];
                                    });
                                  }),
                              SizedBox(
                                width: size.width / 5,
                                child: Text(
                                  checBoxes[i][0],
                                  // style: kLoginTitleStyle(size/4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Nutrition Diagnostic Statment',
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
                    child: Column(
                      children: [
                        for (var i in nuDiaList)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width,
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: i[1],
                                style: kTextFormFieldStyle(),
                                decoration: InputDecoration(
                                  label: Text(
                                    i[0],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Food - Nutrition Therapy',
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
                    child: Column(
                      children: [
                        for (var i in foodList)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width,
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: i[1],
                                style: kTextFormFieldStyle(),
                                decoration: InputDecoration(
                                  label: Text(
                                    i[0],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  alignment: Alignment(0, 0),
                  // color: Colors.green,
                  child: TextFormField(
                    maxLines: 2,
                    controller: netritionConsCont,
                    style: kTextFormFieldStyle(),
                    decoration: InputDecoration(
                      label: Text(
                        'Nutrition Counseling',
                        style: kLoginTitleStyle(size / 2, Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  alignment: Alignment(0, 0),
                  // color: Colors.green,
                  child: TextFormField(
                    maxLines: 3,
                    controller: comm,
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      // prefixIcon: Icon(Icons.person),

                      label: Text('Comment'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    // controller: nameController,
                    // The validator receives the text that the user has entered.
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: Center(
                    child: ElevatedButton(

                        // style:ButtonStyle(backgroundColor:Colors.te ),
                        onPressed: () {
                          postLabRequest();
                        },
                        child: SizedBox(
                            height: 30,
                            child: Center(
                              child: Text("Confirm"),
                            ))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  User user = User({}, '');

  postLabRequest() async {
    setState(() {
      show = F;
    });
    final body = jsonEncode({
      "adm": admCont.text,
      "ht": htCont.text,
      "wt": wtCont.text,
      "ibw": ibwCont.text,
      "bmi": bmiCont.text,
      "anore": anor.toString(),
      "swall": swall.toString(),
      "chew": chew.toString(),
      "dental": dental.toString(),
      "naus": naus.toString(),
      "vomt": vomti.toString(),
      "consi": constip.toString(),
      "diarr": diarrhe.toString(),
      "food": foodAllerg.toString(),
      "hear": hearing.toString(),
      "limit": limitedVis.toString(),
      "demen": dementia.toString(),
      "language": languageBar.toString(),
      "na": na.toString(),
      "post": post.toString(),
      "fever": fever.toString(),
      "wond": wond.toString(),
      "adequa": adaqu.toString(),
      "obese": obsese.toString(),
      "risk": atRisk.toString(),
      "malu": malori.toString(),
      "nutrition_risk": whatNutritionLevel,
      "problem": problemCont.text,
      "related": relatedToCont.text,
      "as_evidence": asEvidCont.text,
      "breast": breastFeedingCont.text,
      "after": afterhourCont.text,
      "one_hour": oneHourCont.text,
      "counseling": netritionConsCont.text,
      "comment": comm.text,
      "dr_id": user.user!['id'].toString(),
      "patient_id": widget.patient['id'].toString(),
      "file_id": widget.file['id'].toString(),
    });

    try {
      await http
          .post(Uri.parse('${url}nutr/add'),
              headers: {
                'Content-type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer ${user.token!}'
              },
              body: body)
          .then((value) {
        if (value.statusCode == 201) {
          errono(
              "Lab investigation sent succesfully",
              "Lab investigation sent succesfully",
              context,
              true,
              Icon(
                Icons.check,
                color: Colors.green,
              ),
              5);
          print(json.decode(value.body));

          // Navigator.of(context).pop();
        } else {
          setState(() {
            show = T;
          });
          print(json.decode(value.body));
          // errono("${json.decode(value.body)}", "${json.decode(value.body)}",
          //     context, true, Container(), 1);
        }
      });
    } catch (e) {}
  }
}
