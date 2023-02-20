import 'package:flutter/material.dart';

class BottomColorContainer extends StatelessWidget {
  const BottomColorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.099,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3D9CA3), Color(0xFF004146), Color(0xFF0E676E)],
            stops: [0, 1, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, -1.6),
          child: Container(
            width: double.infinity,
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0xFF3D9CA3),
            ),
          ),
        ),
      ),
    );
  }
}
