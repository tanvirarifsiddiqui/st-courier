import 'package:flutter/material.dart';
import 'package:st_courier/Models/parcel_details_model.dart';
import 'package:st_courier/objects/parcel_details_objects.dart';

import '../../Models/card_row_model.dart';

class ParcelDetailScreen extends StatelessWidget {
  int index;
  ParcelDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ParcelDetails _currentParcel = parcelDetailsList[index];

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
              Card(
                elevation: 4,
                color: Colors.purple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildCardRow('Invoice ID:', _currentParcel.invoiceId, Icons.bar_chart),
                      buildCardRow('Status:', _currentParcel.status, Icons.check_circle),
                      buildCardRow('Merchant Name:', _currentParcel.merchantName, Icons.person),
                      buildCardRow('Merchant Order ID:', _currentParcel.merchantOrderId, Icons.shopping_cart),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                elevation: 4,
                color: Colors.purple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildCardRow('Delivery District:', _currentParcel.deliveryDistrict, Icons.location_city),
                      buildCardRow('Delivery Area:', _currentParcel.deliveryArea, Icons.compass_calibration),
                      buildCardRow('Collect Amount:', _currentParcel.collectAmount, Icons.attach_money),
                      buildCardRow('Delivery Charge:', _currentParcel.deliveryCharge, Icons.local_shipping),
                      buildCardRow('COD Charge:', _currentParcel.codCharge, Icons.point_of_sale),
                      buildCardRow('Total Charge:', _currentParcel.totalCharge, Icons.calculate),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                elevation: 4,
                color: Colors.purple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildCardRow('Customer Name:', _currentParcel.customerName, Icons.person_outline),
                      buildCardRow('Customer Phone Number:', _currentParcel.customerPhoneNo, Icons.phone),
                      buildCardRow('Parcel Note:', _currentParcel.parcelNote, Icons.assignment),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Card(
                elevation: 4,
                color: Colors.purple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.home, color: Color(0xFF8B69FF)),
                          SizedBox(width: 10.0),
                          Text("Delivery Address:",style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Flexible(child: Text(_currentParcel.deliveryAddress)),
                       )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ));
  }
}
