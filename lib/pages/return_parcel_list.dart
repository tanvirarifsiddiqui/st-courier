import 'package:flutter/material.dart';

class ReturnParcelListPage extends StatefulWidget {
  const ReturnParcelListPage({Key? key}) : super(key: key);

  @override
  State<ReturnParcelListPage> createState() => _ReturnParcelListPage();
}

class _ReturnParcelListPage extends State<ReturnParcelListPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ReturnParcelListPage"),
      ),
      body: Text("ReturnParcelListPage"),
    );
  }


}