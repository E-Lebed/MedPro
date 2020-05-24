import 'package:flutter/material.dart';
import 'package:medpro/models/doctor.dart';
import 'package:medpro/screens/create_patient.dart';
import 'package:medpro/screens/password_screen.dart';
import 'package:medpro/screens/patient_choice_screen.dart';
import 'package:medpro/screens/process_patient.dart';
import 'package:medpro/utils/lists.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedPro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        PasswordScreen.routeName: (BuildContext ctx) => PasswordScreen(),
        SelectPatient.routeName: (BuildContext ctx) => SelectPatient(),
        CreatePatient.routeName: (BuildContext ctx) => CreatePatient(),
        ProcessPatient.routeName: (BuildContext ctx) => ProcessPatient(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "MedPro",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .6,
              color: Colors.white,
              width: MediaQuery.of(context).size.width * .5,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    doctorInfos(docList[0], context),
                    doctorInfos(docList[1], context),
                    doctorInfos(docList[2], context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget doctorInfos(Doctor doc, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(PasswordScreen.routeName, arguments: doc);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            doc.pic,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "Доктор " + doc.fName + " " + doc.mName + " " + doc.lName),
            ),
          ],
        ),
      ),
    );
  }
}
