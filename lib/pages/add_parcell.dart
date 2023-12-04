import 'package:flutter/material.dart';

class AddParcellPage extends StatefulWidget {
  const AddParcellPage({Key? key}) : super(key: key);

  @override
  State<AddParcellPage> createState() => _AddParcellPage();
}

class _AddParcellPage extends State<AddParcellPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add_Parcell"),
      ),
      body: Text("AddParcellPage"),
    );
  }


}