import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mawjud_1/widgets/bottomColorContainer.dart';
import 'package:mawjud_1/widgets/bottom_bar.dart';

class AbsencesdScreen extends StatefulWidget {
  const AbsencesdScreen({Key? key}) : super(key: key);

  @override
  _AbsencesdScreenState createState() => _AbsencesdScreenState();
}

class _AbsencesdScreenState extends State<AbsencesdScreen> {
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
    return SafeArea(
        child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
         appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
         child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(11, 11, 11, 11),
            child: Text(
              'الغيابات ',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(35, 50, 35, 90),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 258,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 6,
                                color: Color(0x33000000),
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(57),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 25, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.75,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC6AA72),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      'محاضرات الإثنين',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.65, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 40, 0, 0),
                                  child: Text(
                                    ' : اسم المادة ',
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontFamily: 'Tajawal',
                                        color: const Color(0xFF3F4343),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    height: 1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF707070),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.65, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    ' : التأخيرات ',
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontFamily: 'Tajawal',
                                        color: const Color(0xFF3F4343),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    height: 1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF707070),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.65, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    ' : الغيابات ',
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontFamily: 'Tajawal',
                                        color: const Color(0xFF3F4343),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    height: 1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF707070),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: const [
                  BottomBar(),
                  BottomColorContainer(),
                ],
              ),
            ],
          ),
        );
        } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
        }
        return Center(
        child: Center(child: CircularProgressIndicator()),
        );}
      ),),
    );

  }
}
