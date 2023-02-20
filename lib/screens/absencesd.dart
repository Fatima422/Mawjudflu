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
  FirebaseFirestore _store = FirebaseFirestore.instance;
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
            child: CustomAppBar(),
          ),
          body: Column(
          mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(),
                    StreamBuilder(
                        stream: _store
                            .collection("users")
                            .doc(user!.email)
                            .collection("Mycourse ")
                            .snapshots(),
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
                                    attendece: item['Absent'],
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
    ));
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
                'الغيابات',
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
  class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.course_name,
    required this.attendece,
  });
  final String course_name;
  final int attendece;

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

            Positioned(
              top: 10,
              right: 10,
              child: Text(
                course_name,
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
                '$attendece',
                style: TextStyle(color: Color(0xFF004146)),
                textAlign: TextAlign.right,
              ),
            ),
            Positioned(
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
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}