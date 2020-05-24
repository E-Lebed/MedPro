import 'package:flutter/material.dart';
import 'package:medpro/models/patient.dart';
import 'package:medpro/screens/patient_choice_screen.dart';
import 'package:medpro/widgets/custom_slider_thumb.dart';

class ProcessPatient extends StatefulWidget {
  static const routeName = "/process";
  @override
  _ProcessPatientState createState() => _ProcessPatientState();
}

class _ProcessPatientState extends State<ProcessPatient> {
  double voltageValue = 10.0;
  double amperValue = 2.0;
  int btnActive = 0;
  bool amperSwitch = true;
  bool hasStarted = false;

  @override
  Widget build(BuildContext context) {
    Patient patient = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        title: Text(
          "MedPro",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: patient.pic,
                            height: 200,
                            width: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              patient.fName +
                                  " " +
                                  patient.mName +
                                  " " +
                                  patient.lName,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 30, right: 20, left: 20),
                              child: Text(
                                "Выберите диапазон тока",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.lightBlue,
                              child: Text("Изменить диапазон"),
                              onPressed: () {
                                setState(() {
                                  amperSwitch = !amperSwitch;
                                });
                              },
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: amperSwitch
                                      ? voltageSlider()
                                      : amperSlider(),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                if (hasStarted == false) {
                                  showConfirm(context);
                                }
                                setState(() {
                                  hasStarted = false;
                                });
                              },
                              child: Text(hasStarted ? "Пауза" : "Старт"),
                              color: hasStarted ? Colors.yellow : Colors.green,
                              padding: EdgeInsets.only(
                                  top: 30, bottom: 30, right: 120, left: 120),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                            RaisedButton(
                                color: Colors.red,
                                onPressed: () {
                                  Navigator.pushNamed(context, SelectPatient.routeName);
                                },
                                child: Text("Завершение и выход"),
                                padding: EdgeInsets.only(
                                    top: 30, bottom: 30, right: 120, left: 120))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 30, right: 20, left: 20),
                                child: Text("Выберите время процедуры",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  btnTime(10, 10),
                                  btnTime(15, 15),
                                  btnTime(20, 20),
                                  btnTime(25, 25),
                                  btnTime(30, 30),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget btnTime(int time, int btn) {
    return InkWell(
      highlightColor: Colors.yellow,
      hoverColor: Colors.yellow,
      onTap: () {
        setState(() {
          btnActive = btn;
        });
      },
      child: CircleAvatar(
        backgroundColor: btnActive == btn ? Colors.blue.shade900 : Colors.blue,
        child: Text(time.toString()),
      ),
    );
  }

  Widget amperSlider() {
    return Container(
      width: (60) * 5.5,
      height: (48),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(
          Radius.circular((48 * .3)),
        ),
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF00c6ff),
              const Color(0xFF0072ff),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.00),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(48 * .2, 2, 48 * .2, 2),
        child: Row(
          children: <Widget>[
            Text(
              '0 mA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48 * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 48 * .1,
            ),
            Expanded(
              child: Center(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 5.0,
                    thumbShape: CustomSliderThumbCircle(
                      thumbRadius: 48 * .4,
                      min: 0,
                      max: 5,
                    ),

                    activeTrackColor: Colors.transparent,
                    overlayColor: Colors.white.withOpacity(.4),
                    //valueIndicatorColor: Colors.white,

                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.white,
                  ),
                  child: Slider(
                      value: amperValue,
                      max: 5,
                      min: 0,
                      divisions: 5,
                      onChanged: (value) {
                        setState(() {
                          amperValue = value;
                        });
                      }),
                ),
              ),
            ),
            SizedBox(
              width: 48 * .1,
            ),
            Text(
              '5 mA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48 * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showConfirm(BuildContext buildContext) {
    showDialog(
      context: buildContext,
      child: new AlertDialog(
        titlePadding: new EdgeInsets.all(0.0),
        title: new Container(
          color: Colors.white,
          padding: new EdgeInsets.symmetric(vertical: 32.0),
          child: new Center(
            child: Icon(
              Icons.done_outline,
              color: Colors.yellow,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  "Диапазон: ${amperSwitch ? voltageValue.toStringAsPrecision(2) : amperValue.toStringAsPrecision(2)}"),
              Text("Время процедуры: ${btnActive}"),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(buildContext).pop();
            },
            child: new Text('Нет'),
          ),
          new FlatButton(
            onPressed: () {
              setState(() {
                hasStarted = true;
              });
              Navigator.of(buildContext).pop();
            },
            child: new Text('Да'),
          ),
        ],
      ),
    );
  }

  Widget voltageSlider() {
    return Container(
      width: (60) * 5.5,
      height: (48),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(
          Radius.circular((48 * .3)),
        ),
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF00c6ff),
              const Color(0xFF0072ff),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.00),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(48 * .2, 2, 48 * .2, 2),
        child: Row(
          children: <Widget>[
            Text(
              '0 mA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48 * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 48 * .1,
            ),
            Center(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white.withOpacity(1),
                  inactiveTrackColor: Colors.white.withOpacity(.5),

                  trackHeight: 4.0,
                  thumbShape: CustomSliderThumbCircle(
                    thumbRadius: 48 * .4,
                    min: 0,
                    max: 20,
                  ),
                  overlayColor: Colors.white.withOpacity(.4),
                  //valueIndicatorColor: Colors.white,
                  activeTickMarkColor: Colors.white,
                  inactiveTickMarkColor: Colors.red.withOpacity(.7),
                ),
                child: Slider(
                    value: voltageValue,
                    max: 20,
                    min: 0,
                    onChanged: (value) {
                      setState(() {
                        voltageValue = value;
                      });
                    }),
              ),
            ),
            SizedBox(
              width: 48 * .1,
            ),
            Text(
              '20 mA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48 * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
