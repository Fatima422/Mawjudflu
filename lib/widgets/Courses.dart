/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Backend.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  ScheduleModel Schedule=ScheduleModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Schedule")
        .doc()
        .get()
        .then((value) {
      this.Schedule = ScheduleModel.fromMap(value.data());
      setState(() {});
    });}

  @override
  Widget build(BuildContext context) {

  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('lectures').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      List<DocumentSnapshot> lectures = snapshot.data.docs;
      DateTime now = DateTime.now();
      int hour = now.hour;
      int day = now.weekday;
      String subject;
      switch (day) {
        case 1:
          while {
            subject = Schedule.CourseName!;
            hour = Schedule.Start!.hour;}
          break;
        case 7:
          subject = 'Graduation';
          if (hour < 8) {
            subject = 'No lecture';
          }
          break;
        default:
          subject = 'No lecture';
      }
      return Text(subject);
    },
  );
}}*/