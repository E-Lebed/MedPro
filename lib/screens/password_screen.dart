import 'package:flutter/material.dart';
import 'package:medpro/models/doctor.dart';
import 'package:medpro/screens/patient_choice_screen.dart';

bool validPass = false;

class PasswordScreen extends StatefulWidget {
  static const routeName = "/password";

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController controller = TextEditingController();

  changesOnField() {
    setState(() {}); // Will re-Trigger Build Method
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(changesOnField);
  }

  @override
  Widget build(BuildContext context) {
    Doctor doc = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.white,
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: doc.pic,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Доктор " +
                            doc.fName +
                            " " +
                            doc.mName +
                            " " +
                            doc.lName),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .2,
                          child: TextField(
                            obscureText: true,
                            controller: controller,
                            maxLength: 10,
                            decoration: new InputDecoration.collapsed(
                                hintText: 'Введите пароль'),
                            onChanged: verifPassword(controller.text),
                            style: new TextStyle(
                                fontSize: 18.0, color: Colors.black),
                          ),
                        ),
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
                                          validPass ? Navigator.of(context).pushNamed(SelectPatient.routeName) : null;
                                        },
                                        color: validPass
                                            ? Colors.black
                                            : Colors.grey,
                                        child: new ListTile(
                                          title: new Text('Далее',
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600)),
                                          trailing: new Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white),
                                        ),
                                      ))),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  verifPassword(String inputName) {
    if (inputName.trim().length > 10 || inputName.trim().length < 6) {
      setState(() => validPass = false);
      return;
    }
    setState(() => validPass = true);
  }
}
