import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_courier/pages/fragment_screens/product_details_page.dart';

import '../../objects/payment_objects.dart';

class TotalPaymentScreen extends StatelessWidget {
  const TotalPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment List'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8B69FF), Color(0xD0165985),], // Your gradient colors here
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: payments.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
              Get.to(()=>ProductDetailScreen(index: index));
            },
              child: Card(
                elevation: 4,
                color: Colors.purple.shade50,
                margin: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 8),
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
                                const Icon(Icons.confirmation_number,
                                    color: Color(0xFF8B69FF)),
                                const SizedBox(width: 10.0),
                                Text(
                                  payments[index].paymentNo,
                                  style: const TextStyle(
                                      color: Colors.red),
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
                          1: FlexColumnWidth(2), // Adjust column width as needed
                        },
                        children: [
                          TableRow(
                            children: [
                              const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.backpack,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("Parcel"),
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
                                      Text(": ${payments[index].totalParcel}"),
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
                                      Text("Rcv Parcel"),
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
                                      Text(": ${payments[index].rcvParcel}"),
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
                                      Icon(Icons.attach_money,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("Amt"),
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
                                      Text(": ${payments[index].amt}"),
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
                                      Text("Rcv Amt"),
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
                                      Text(": ${payments[index].rcvAmt}"),
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
                                      Icon(Icons.date_range,color: Color(0xFF8B69FF),), // Add your desired icon here
                                      SizedBox(width: 5), // Adjust spacing as needed
                                      Text("Date"),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(": ${payments[index].date}"),
                                ),
                              ),
                              // TableCell.empty(), // This cell is intentionally empty to create the merging effect
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
