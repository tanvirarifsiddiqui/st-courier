import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_courier/pages/fragment_screens/parcel_details_page.dart';

import '../../Models/card_row_model.dart';
import '../../Models/parcel_list_model.dart';
import '../../objects/parcel_objects.dart';

class PendingDeliveryScreen extends StatelessWidget {
  const PendingDeliveryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    List<Parcel> _canceledParcels = parcels
        .where((parcel) => parcel.status == "Delivery Processing")
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Waiting Delivery Parcel'),
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
        body: Container(
          padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10),
          child: Column(
            children: [
              const SizedBox(height: 5.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _canceledParcels.length,
                  itemBuilder: (context, index) {
                    final parcel = _canceledParcels[index];
                    return GestureDetector(
                        onTap: () {
                          Get.to(()=>ParcelDetailScreen(index: index));
                        },
                        child: Card(
                          color: Colors.purple[50],
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.receipt,
                                            color: Color(0xFF8B69FF)),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          parcel.invoiceId,
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        PopupMenuButton<String>(
                                          icon: Icon(Icons.more_vert),
                                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                            const PopupMenuItem<String>(
                                              value: 'Track Parcel',
                                              child: Text('Track Parcel'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'Hold Parcel',
                                              child: Text('Hold Parcel'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'Cancel Parcel',
                                              child: Text('Cancel Parcel'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'Play Parcel',
                                              child: Text('Play Parcel'),
                                            ),
                                          ],
                                          onSelected: (String value) {
                                            // Handle operations based on value
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person,
                                          color: Color(0xFF8B69FF)),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        parcel.name,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.call,
                                          color: Color(0xFF8B69FF)),
                                      const SizedBox(width: 10.0),
                                      Text(parcel.phone),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.house,
                                          color: Color(0xFF8B69FF)),
                                      const SizedBox(width: 10.0),
                                      Flexible(child: Text(parcel.address))
                                    ],
                                  ),
                                ),

                                buildCardRow("Total Charge:",
                                    "${parcel.charge}", Icons.attach_money),
                                buildCardRow("Total Collection Amount:",
                                    "${parcel.amount}", Icons.calculate),
                                const Row(
                                  children: [
                                    Icon(Icons.assignment, color: Color(0xFF8B69FF)),
                                    SizedBox(width: 10.0),
                                    Text("Parcel Brief:",),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Flexible(child: Text(parcel.brief,)),
                                ),

                                // Container at the bottom with dynamic design
                                Container(
                                  margin: const EdgeInsets.only(top: 16.0),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xff6e44a8), Color(0xffce5300), Color(0xffd28800)],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.amber.shade700.withOpacity(0.8),
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      parcel.status,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )

                    );
                  },
                ),
              ),

            ],
          ),
        )
    );
  }
}
