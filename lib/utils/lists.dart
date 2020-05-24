import 'package:flutter/material.dart';
import 'package:medpro/models/doctor.dart';
import 'package:medpro/models/patient.dart';

List<Doctor> docList = [
  Doctor(fName: "Иван", mName: "Александрович", lName: "Петров", jobName: "Врач-физиотерапевт", pic: Image.asset("assets/doctor1.png", fit: BoxFit.contain,)),
  Doctor(fName: "Екатерина", mName: "Олеговна", lName: "Соколова", jobName: "Врач-физиотерапевт", pic: Image.asset("assets/doctor2.png", fit: BoxFit.contain,)),
  Doctor(fName: "Анна", mName: "Ивановна", lName: "Сидорова", jobName: "Врач-физиотерапевт", pic: Image.asset("assets/doctor3.png", fit: BoxFit.contain,))
];

List<Patient> patientList = [
  Patient(fName: "Татьяна", mName: "Павловна", lName: "Новикова", pic: Image.asset("assets/patient1.png")),
  Patient(fName: "Игорь", mName: "Иванович", lName: "Васильев", pic: Image.asset("assets/patient2.png")),
  Patient(fName: "Диана", mName: "Анатольевна", lName: "Прохорова", pic: Image.asset("assets/patient3.png"))
];