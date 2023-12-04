import 'package:flutter/material.dart';

class PickupParcelListPage extends StatefulWidget {
  const PickupParcelListPage({Key? key}) : super(key: key);

  @override
  State<PickupParcelListPage> createState() => _PickupParcelListPage();
}

class _PickupParcelListPage extends State<PickupParcelListPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PickupParcelListPage"),
      ),
      body: Text("PickupParcelListPage"),
    );
  }


}