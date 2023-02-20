import 'package:flutter/material.dart';

void main() => runApp(const CourseDialog());

class CourseDialog extends StatelessWidget {
  const CourseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('AlertDialog Sample')),
        body: const Center(
          child: DialogExample(),
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'map'),
              child: const Text('map'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'indoor'),
              child: const Text('indoor'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}