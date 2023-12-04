import 'package:flutter/material.dart';

class ParcelListPage extends StatefulWidget {
  const ParcelListPage({Key? key}) : super(key: key);

  @override
  State<ParcelListPage> createState() => _ParcelListPage();
}

class _ParcelListPage extends State<ParcelListPage>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("ParcelListPage"),
    );
  }


}