import 'package:flutter/material.dart';
import 'package:st_courier/Models/parcel_details_model.dart';
import 'package:st_courier/Models/parcel_list_model.dart';
import 'package:st_courier/Models/payment_model.dart';
import 'package:st_courier/objects/parcel_details_objects.dart';
import 'package:st_courier/objects/parcel_objects.dart';
import 'package:st_courier/objects/payment_objects.dart';

import '../../Models/card_row_model.dart';

class ProductDetailScreen extends StatelessWidget {
  int index;
  ProductDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Payment _currentProductPayment = payments[index];
    Parcel _currentParcel = parcels[index];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Coverage Area'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8B69FF),
                  Color(0xD0165985),
                ], // Your gradient colors here
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildCardRow('Invoice:', _currentProductPayment.paymentNo, Icons.confirmation_number),
                    buildCardRow('Total Payment Parcel:', _currentProductPayment.totalParcel, Icons.backpack),
                    buildCardRow('Total Payment Amount:', _currentProductPayment.amt, Icons.attach_money),
                    buildCardRow('Received Parcel:', _currentProductPayment.rcvParcel, Icons.local_shipping),
                    buildCardRow('Received Amount:', _currentProductPayment.rcvAmt, Icons.paid),
                    buildCardRow('Ststus:', _currentProductPayment.status, Icons.bar_chart),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                color: Colors.purple.shade50,
                margin: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 6),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.receipt,
                                    color: Color(0xFF8B69FF)),
                                const SizedBox(width: 10.0),
                                Text(
                                  _currentParcel.invoiceId,
                                  style: const TextStyle(
                                    fontSize: 16,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                            Text(payments[index].status,
                              style: TextStyle(color: Color(0xFF25009B)),)
                          ],
                        ),
                      ),
                      Table(
                        columnWidths: {
                          0: FlexColumnWidth(1), // Adjust column width as needed
                          1: FlexColumnWidth(1), // Adjust column width as needed
                        },
                        children: [
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("Name",style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(": ${_currentParcel.name}"),
                                    ],
                                  ),
                                ),
                                // columnSpan: 2,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.call,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("Phone",style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(": ${_currentParcel.phone}"),
                                    ],
                                  ),
                                ),
                                // columnSpan: 2,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.check_circle,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("Collected Amount",style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(": ${_currentParcel.amount}"),
                                    ],
                                  ),
                                ),
                                // columnSpan: 2,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.fitness_center,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("Weight Charge",style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(": ${_currentParcel.charge}"),
                                    ],
                                  ),
                                ),
                                // columnSpan: 2,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.account_balance_wallet,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("COD Charge",style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(": 0.0"),
                                    ],
                                  ),
                                ),
                                // columnSpan: 2,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.local_shipping,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("Delivery",style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(": 25.0"),
                                    ],
                                  ),
                                ),
                                // columnSpan: 2,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.paid,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("Amount",style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(": ${_currentProductPayment.rcvAmt}.0"),
                                    ],
                                  ),
                                ),
                                // columnSpan: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
