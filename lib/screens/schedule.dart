/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomColorContainer.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/courseDialog.dart';

class ScheduleeScreen extends StatefulWidget {
  const ScheduleeScreen({Key? key}) : super(key: key);

  @override
  _ScheduleeScreenState createState() => _ScheduleeScreenState();
}

class _ScheduleeScreenState extends State<ScheduleeScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  Future fetchData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.email)
        .snapshots();
  }

  @override
  void initState() {
    super.initState();
    print(user!.email);
    print('***************');
    fetchData();
    print('=======');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'الجدول الدراسي',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("users")
              .doc(user!.email)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GestureDetector(
               child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection("Courses")
                      .where('days')
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            height: 100,
                            child: ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  var item = snapshot.data!.docs[index];
                                  return Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0, 50, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.14,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 6,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                // Retrieve the text the that user has entered by using the
                                                content: CourseDialog(),
                                              );
                                            },
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(90, 10, 90, 0),
                                              child: Text(
                                                snapshot.data!['CourseName'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                  fontFamily: 'Tajawal',
                                                  color: const Color(
                                                      0xFFB38E44),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              snapshot.data!['Activity'],
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                fontFamily: 'Tajawal',
                                                color:
                                                const Color(0xFF004146),
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              'كلية الحاسب الآلي- قنفذة - طالبات',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                fontFamily: 'Tajawal',
                                                color:
                                                const Color(0xFF004146),
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              'معاذ مصطفى احمد نجيب',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                fontFamily: 'Tajawal',
                                                color:
                                                const Color(0xFF004146),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return Text('loading');
                      },
                    ),
                ],
               ),
              ),);
                //const Spacer(),
                /*Column(
                  children: [
                    const BottomBar(),
                    BottomColorContainer(),
                  ],
                ));*/
            } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
        }
        return Center(
          child: Center(child: CircularProgressIndicator()),
        );
          }
      ),
    );
  }
}*/
