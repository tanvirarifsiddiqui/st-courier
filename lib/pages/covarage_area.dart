import 'package:flutter/material.dart';

class CoverageAreaPage extends StatefulWidget {
  const CoverageAreaPage({Key? key}) : super(key: key);

  @override
  State<CoverageAreaPage> createState() => _CoverageAreaPage();
}

class _CoverageAreaPage extends State<CoverageAreaPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coverage Area Page"),
      ),
      body: Text("Coverage Area Page"),
    );
  }


}