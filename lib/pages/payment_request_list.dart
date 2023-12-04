import 'package:flutter/material.dart';

class PaymentRequestListPage extends StatefulWidget {
  const PaymentRequestListPage({Key? key}) : super(key: key);

  @override
  State<PaymentRequestListPage> createState() => _PaymentRequestListPage();
}

class _PaymentRequestListPage extends State<PaymentRequestListPage>{
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