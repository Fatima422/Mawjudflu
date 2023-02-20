import 'package:flutter/material.dart';
import 'package:mawjud_1/screens/absencesd.dart';
import 'package:mawjud_1/screens/dashboard.dart';
import 'package:mawjud_1/screens/login.dart';
import 'package:mawjud_1/screens/profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(40,30,40,30),//
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              blurRadius: 6,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(49),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
        child: Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3D9CA3), Color(0xFF004146)],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
            shape: BoxShape.circle,
          ),
          child: IconButton(
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Color(0xFF004146),
                    size: 25,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashbordScreen(),
                      ),
                    );
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: IconButton(
              icon: const Icon(
                Icons.person_outline,
                color: Color(0xFF004146),
                size: 25,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            )),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child:IconButton(
              icon: const Icon(
                Icons.rule,
                color: Color(0xFF004146),
                size: 25,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AbsencesdScreen(),
                  ),
                );
              },
            )),
            /*IconButton(
              icon: const Icon(
                Icons.calendar_today,
                color: Color(0xFF004146),
                size: 25,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScheduleeScreen(),
                  ),
                );
              },
            ),*/
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child:IconButton(
              icon: const Icon(
                Icons.logout,
                color: Color(0xFF004146),
                size: 25,
              ),
              onPressed: () async {
                // await FirebaseAuth.instance.signOut();
                await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) => const LoginScreen()), (route) => false);
              },
            ),
        ) ],
        ),
      ),
    );
  }
}
