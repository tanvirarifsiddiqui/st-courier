import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_courier/pages/fragment_screens/parcel_details_page.dart';

import '../../Models/card_row_model.dart';
import '../../Models/parcel_list_model.dart';
import '../../objects/parcel_objects.dart';

class PendingDeliveryScreen extends StatefulWidget {
  const PendingDeliveryScreen({super.key});

  @override
  State<PendingDeliveryScreen> createState() => _PendingDeliveryScreenState();
}

class _PendingDeliveryScreenState extends State<PendingDeliveryScreen> {
  // A variable to store the from date filter
  DateTime? fromDate;

  // A variable to store the to date filter
  DateTime? toDate;

  // A function to show Form and date picker dialog
  Widget _buildDateField(String labelText, DateTime? dateValue, bool isFrom) {
    return Expanded(
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.deepPurple),
          border: const OutlineInputBorder(),
          prefixIcon: Icon(Icons.calendar_month,
              size: 24, color: Colors.deepPurple.shade300),
        ),
        style: const TextStyle(color: Colors.deepPurple),
        controller: TextEditingController(
          text: dateValue == null
              ? ''
              : '${dateValue.day}/${dateValue.month}/${dateValue.year}',
        ),
        onTap: () async {
          // This will prevent the keyboard from appearing when tapping the text field
          FocusScope.of(context).requestFocus(new FocusNode());
          // Your existing logic here...
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
          );
          if (selectedDate != null) {
            setState(() {
              if (isFrom) {
                fromDate = selectedDate;
              } else {
                toDate = selectedDate;
              }
            });
          }
        },
      ),
    );
  }

  // A function to apply the filters and return a filtered list of parcels
  List<Parcel> _applyFilters() {
    List<Parcel> filteredParcels = parcels;
    if (fromDate == null || toDate == null) {
      filteredParcels = filteredParcels
          .where((parcel) => parcel.status == "Delivery Processing")
          .toList();
    }
    if (fromDate != null) {
      filteredParcels = filteredParcels
          .where((parcel) => DateTime.parse(parcel.invoiceId.substring(0, 8))
          .isAfter(fromDate!))
          .toList();
    }
    if (toDate != null) {
      filteredParcels = filteredParcels
          .where((parcel) => DateTime.parse(parcel.invoiceId.substring(0, 8))
          .isBefore(toDate!))
          .toList();
    }
    return filteredParcels;
  }
  @override
  Widget build(BuildContext context) {

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
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12, // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 3), // Offset
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                      colors: [Color(0xFF8B69FF), Color(0xD0165985)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: ExpansionTile(
                    collapsedIconColor: Colors.white,
                    iconColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    leading: const Icon(Icons.filter_list, color: Colors.white),
                    title: const Center(
                      child: Text(
                        'Filter',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.purple.shade50),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              // A row to select the from date and the to date
                              Row(
                                children: [
                                  _buildDateField(
                                    'From Date',
                                    fromDate,
                                    true,
                                  ),
                                  const SizedBox(width: 10.0),
                                  _buildDateField(
                                    'To Date',
                                    toDate,
                                    false,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // A list view to display the filtered parcels
              Expanded(
                child: ListView.builder(
                  itemCount: _applyFilters().length,
                  itemBuilder: (context, index) {
                    final parcel = _applyFilters()[index];
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
                                  child: Text(parcel.brief,),
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
        ),
    );
  }
}
