import 'package:chouxcream_app/screens/start/information/secondinfo.dart';
import 'package:flutter/material.dart';

class SecondInfoScreen extends StatefulWidget {
  const SecondInfoScreen({ Key? key }) : super(key: key);

  @override
  State<SecondInfoScreen> createState() => _SecondInfoScreenState();
}

class _SecondInfoScreenState extends State<SecondInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SecondInfoForm(),
    );
  }
}