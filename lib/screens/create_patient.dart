import 'package:flutter/material.dart';
import 'package:medpro/models/patient.dart';
import 'package:medpro/screens/patient_choice_screen.dart';
import 'package:medpro/utils/lists.dart';

class CreatePatient extends StatefulWidget {
  static const routeName = "/create";

  @override
  _CreatePatientState createState() => _CreatePatientState();
}

bool fNameBool = false;
bool mNameBool = false;
bool lNameBool = false;

class _CreatePatientState extends State<CreatePatient> {
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController mNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  DateTime selectedDateBirth;
  DateTime selectedDateVisit;
  String dropdownValue = docList[0].fName;

  @override
  Widget build(BuildContext context) {
    Image patientPic = Image.asset(
      "assets/patient4.png",
      height: 200,
      width: 180,
      fit: BoxFit.contain,
    );

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      patientPic,
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5 -
                            patientPic.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: fNameController,
                                maxLength: 15,
                                decoration: new InputDecoration.collapsed(
                                    hintText: 'Имя пациента'),
                                onChanged: verifName(fNameController.text),
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: mNameController,
                                maxLength: 15,
                                decoration: new InputDecoration.collapsed(
                                    hintText: 'Отчество пациента'),
                                onChanged: verifMidName(fNameController.text),
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: lNameController,
                                maxLength: 15,
                                decoration: new InputDecoration.collapsed(
                                    hintText: 'Фамилия пациента'),
                                onChanged: verifLastName(fNameController.text),
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                            RaisedButton(
                                child: Text(
                                  selectedDateBirth != null
                                      ? selectedDateBirth.day.toString() +
                                          "-" +
                                          selectedDateBirth.month.toString() +
                                          "-" +
                                          selectedDateBirth.year.toString()
                                      : "Дата рождения",
                                ),
                                onPressed: () async {
                                  final DateTime picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.parse("1901-01-01"),
                                      lastDate: DateTime.now());
                                  if (picked != null)
                                    setState(() {
                                      selectedDateBirth = picked;
                                    });
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                maxLines: 3,
                                decoration: new InputDecoration.collapsed(
                                    hintText: 'Диагноз'),
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          child: Align(
                              alignment: FractionalOffset.bottomRight,
                              child: new Container(
                                  margin: new EdgeInsets.only(
                                      left: 16.0, right: 16.0, top: 24.0),
                                  child: new RaisedButton(
                                    onPressed: () {
                                      if (fNameBool && mNameBool && lNameBool) {
                                        print(patientList);
                                        Patient pat = Patient(
                                            fName: fNameController.text,
                                            mName: mNameController.text,
                                            lName: lNameController.text,
                                            pic: Image.asset(
                                                "assets/patient4.png"));
                                        patientList.add(pat);
                                        print(patientList);
                                        Navigator.of(context).popAndPushNamed(SelectPatient.routeName);
                                      } else {
                                        print("error");
                                      }
                                    },
                                    color: Colors.black,
                                    child: new ListTile(
                                      title: new Text('Далее',
                                          style: new TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                      trailing: new Icon(Icons.arrow_forward,
                                          color: Colors.white),
                                    ),
                                  ))),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  )
                ],
              ),
            )),
      ),
    );
  }

  verifName(String fName) {
    if (fName.trim().length > 15) {
      setState(() => fNameBool = false);
      return;
    }
    setState(() => fNameBool = true);
  }

  verifMidName(String fName) {
    if (fName.trim().length > 15) {
      setState(() => mNameBool = false);
      return;
    }
    setState(() => mNameBool = true);
  }

  verifLastName(String fName) {
    if (fName.trim().length > 15) {
      setState(() => lNameBool = false);
      return;
    }
    setState(() => lNameBool = true);
  }
}
