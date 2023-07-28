import 'package:flutter/material.dart';

class secondclass extends StatefulWidget {
  final String res;
  const secondclass({Key? key, required this.res}) : super(key: key);

  @override
  State<secondclass> createState() => _secondclassState();
}

class _secondclassState extends State<secondclass> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.res.toString()),
    );
  }
}
