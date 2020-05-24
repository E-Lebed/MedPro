import 'package:flutter/material.dart';
import 'package:medpro/models/patient.dart';
import 'package:medpro/screens/create_patient.dart';
import 'package:medpro/screens/process_patient.dart';
import 'package:medpro/utils/lists.dart';

class SelectPatient extends StatelessWidget {
  static const routeName = "/patient-choice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      appBar: AppBar(
        title: Text(
          "MedPro",
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(CreatePatient.routeName);
        },
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Выберите пациента",
            style: TextStyle(fontSize: 30),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * .4,
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (var patient in patientList)
                    patientInfos(patient, context),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  patientInfos(Patient patient, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProcessPatient.routeName,
          arguments: patient,
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            patient.pic,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  patient.fName + " " + patient.mName + " " + patient.lName),
            ),
          ],
        ),
      ),
    );
  }
}
