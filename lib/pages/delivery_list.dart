import 'package:flutter/material.dart';

class DeliveryListPage extends StatefulWidget {
  const DeliveryListPage({Key? key}) : super(key: key);

  @override
  State<DeliveryListPage> createState() => _DeliveryListPage();
}

class _DeliveryListPage extends State<DeliveryListPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DeliveryListPage"),
      ),
      body: Text("DeliveryListPage"),
    );
  }


}