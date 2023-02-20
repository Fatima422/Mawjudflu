import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mawjud_1/screens/absencesd.dart';
import 'package:mawjud_1/widgets/bottomColorContainer.dart';
import 'package:mawjud_1/widgets/bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  _DashbordScreenState createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  FirebaseFirestore _store = FirebaseFirestore.instance;

  User? user = FirebaseAuth.instance.currentUser;
  DateTime now = DateTime.now();
  String? name;
  String? job;


  Future fetchData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.email)
        .get()
        .then((value) {
      setState(() {
        name = value.data()!['UsersName'];
        job = value.data()!['Job'];

      });
    });
  }

  String? day_name;
  @override
  void initState() async{
    super.initState();
    day_name = DateFormat('EEEE').format(now);
    print(day_name);
   await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: CustomAppBar(),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                name ?? 'loading',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: const Color(0xFF3F4343),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Text(
                job ?? 'loading',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: const Color(0xFF3F4343),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(300, 10, 0, 10),
              child: Text(
                'التالي',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: const Color(0xFFB38E44),
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(),
                  FutureBuilder(
                      future: _store
                          .collection('Courses')
                          .where('days', arrayContains: day_name)  // get from daye subject of the day
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 35),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var item = snapshot.data!.docs[index];
                                return CustomCard(
                                    course_name: item['CourseName'],
                                    hours: item['Hours'],
                                    sections: item['Section'],
                                );
                              });
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                ],
              ),
            ),
            Column(
              children: [
                const BottomBar(),
                const BottomColorContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Text(
          'الرئيسية',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Tajawal',
            color: const Color(0xFF004146),
            fontSize: 20,
          ),
        ),
      ),
      actions: const [],
      centerTitle: true,
      toolbarHeight: 70,
      elevation: 5,
    );
  }
}

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.course_name,
    required this.hours,
    required this.sections,
  });
  final String course_name;
  final String hours;
  final String sections;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
 late bool isTeacher;
 @override
  void initState() {
   setState(() {
     isTeacher=false;
   });
   // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 6,
                      color: Color(0x33000000),    offset: Offset(0, 2),
                  )]),
            ),
            GestureDetector(
               onTap:(){
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return AlertDialog(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),),
                        title: Text('اختار طريقة عرض الاتجاه'),
                        actions: <Widget> [
                           TextButton(
                        child: Text ('الواقع المعزز'),
                        onPressed: _launchUrl,
                        ),
                        TextButton(
                        child: Text ('خريطة '),
                        onPressed: () {
                        // Perform action for button 1 here
                        Navigator.of(context) .pop ();
                            },
                  )]);
               }
              );
            },
            child: Padding (
            padding: EdgeInsets.only(top: 75, left: 300),
            child: Align(alignment: Alignment. centerLeft,
            child: Text('القاعة'), // Adds padding to the top, left child: Align(
              // Aligns the text to the left child: Text ('doll"),
               ),
               ),
            ),

            Positioned(
              top: 10,
              right: 10,
              child: Text(
                widget.course_name,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004146)),

                ),
              ),

            Positioned(
              bottom: 30,
              right: 10,
              child:Text(
                '${widget.hours}',
                style: TextStyle(color: Color(0xFF004146)),
                textAlign: TextAlign.right,
              ),
           ),

         isTeacher?  Positioned(
              bottom: 20,
              left: 10,
              child: MaterialButton(
                elevation: 3,
                color: Color(0xFF004146),
                onPressed: () async {
                  await Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) => const AbsencesdScreen(),
                    ),
                  );
                },
                child: Text('تحضير',
                style: TextStyle(color: Colors.white)),
              ),
            ):SizedBox(),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}



Future<void> _launchUrl() async {
  final Uri _url=
  Uri.parse('https://anchor.arway.ai/map/519276b7-5ee4-492a-b724-2b3867be556c');
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}