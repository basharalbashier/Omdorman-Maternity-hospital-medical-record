import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../widgets/title.dart';

class NeoUnit extends StatefulWidget {
  const NeoUnit({super.key});

  @override
  State<NeoUnit> createState() => _NeoUnitState();
}

class _NeoUnitState extends State<NeoUnit> {
  bool resu = false;
  bool admit = false;
  bool certain = false;
  bool fetall_distrces = false;
  bool cord_round = false;
  bool vitaminK = false;
  bool resu_necess = false;
  List<String> titles = [
    "Name of Mother",
    "Sex",
    "Baby No.",
    "Address",
    "Birth Date",
    "Birth Tiem",
    "Obstotrical Unit",
    "Discharge Date.",
    "Summary",
    "Birth Weight",
    "Follow UJ",
    "Dicharge Weight",
    "Feeding On Discharg",
    "Previod Occupation",
    "Medical Problem",
    "Husband Occupation",
    "Medical Status at Delivery",
    "Age",
    "Blood Group",
    "Antibodies",
    "Obataric History",
    "Gravida",
    "Para",
    "Illnes during this pregnancy (Including details an of admissions to hospital)",
    "Drugs during this pregnancy",
    "Labour",
    "Type of delivery and Complications",
    "Specify Fetall distreces",
    "Describe Cord round neck ",
    "Dlivery By",
    "Indication C.S",
    "Respiration",
    "Regular Respirations or Cry",
    "Color",
    "Tone",
    "Spontaneous Movements",
    "Movement When Stimulated",
    "Pale",
    "Limp",
    "Heart",
    "Respitation",
    "Tone",
    "Responsiveness",
    "Color",
    "Examined at Minutes by",
    "General",
    "Skull",
    "Skin",
    "Limbs & Spine",
    "Abdomen",
    "Auns",
    "A- Spontaneous Movements",
    "C - Rooting Reflex",
    "D - Sucking Reflex",
    "E- Traction Response",
    "F - Grasp Reflex",
    "G - Automatic Walking",
    "H - Moro Reflex",
    "Transferred to Post - Natal Ward / Special Care Nursy at",
    "Received By ",
    "Condition on Arrival ",
    "Tempreture",
    "Color",
    "Respirations",
    "Examined at",
    "Hours by",
    "Hips",
    "Gestational Assessment",
    "Heart",
    "Feeding: Mother Wishes to Breast Feed/ Bottle Feed",
    "Comment"
  ];
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    for (var i in titles) {
      controllers.add(TextEditingController());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleD(Colors.lightBlueAccent, size),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Neonatal Unit',
              style: kLoginTitleStyle(size, Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          ResponsiveGridRow(children: [
            for (int i = 0; i < 8; i++)
              ResponsiveGridCol(
                  lg: 12,
                  child: TextField(
                    controller: controllers[i],
                    decoration: InputDecoration(label: Text(titles[i])),
                  )),
          ]),
          MaterialButton(
            onPressed: () {
              for (var i in controllers) {
                print(i.text);
              }
            },
            child: Text('button'),
          )
        ],
      ),
    );
  }
}
