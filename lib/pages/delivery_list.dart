import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:st_courier/objects/delivery_parcel_objects.dart';
import 'package:st_courier/pages/covarage_area.dart';
import 'package:st_courier/pages/home.dart';
import 'package:st_courier/pages/order_tracking.dart';
import 'package:st_courier/pages/parcel_list.dart';
import 'package:st_courier/pages/payment_list.dart';
import 'package:st_courier/pages/payment_request_list.dart';
import 'package:st_courier/pages/pick_up_parcel_list.dart';
import 'package:st_courier/pages/return_parcel_list.dart';
import 'package:st_courier/pages/support.dart';

import 'add_parcel.dart';

class DeliveryListPage extends StatefulWidget {
  const DeliveryListPage({Key? key}) : super(key: key);

  @override
  State<DeliveryListPage> createState() => _DeliveryListPage();
}

class _DeliveryListPage extends State<DeliveryListPage>{
  final _advancedDrawerController = AdvancedDrawerController();

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

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.blue.shade900.withOpacity(0.7)],
            ),
          ),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        openRatio: .70,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 0.0,
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        drawer: SafeArea(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: ListView(
              // physics: AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  margin: const EdgeInsets.only(
                    top: 18.0,
                    bottom: 18.0,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.off(() => HomePage());
                  },
                  leading: Image.asset("assets/images/home.png",scale: 18,),
                  title: const Text('Home',style: TextStyle(color: Colors.black)),
                ),
                Divider(color: Colors.grey,),
                ListTile(
                  onTap: () {
                    Get.off(() => const AddParcelPage());
                  },
                  leading: Image.asset("assets/images/add_parcel_drawer.png",scale: 8,),
                  title: const Text('Add Parcel'),
                ),
                ListTile(
                  onTap: () {
                    Get.off(() => const ParcelListPage());
                  },
                  leading: Image.asset("assets/images/total_parcel_drawer.png",scale: 8,),
                  title: const Text('Parcel List'),
                ),
                ListTile(
                  onTap: () {
                    Get.off(() => const OrderTrackingPage());
                  },
                  leading: Image.asset("assets/images/waitingdelivery.png",scale: 6,),
                  title: const Text('Order Tracking'),
                ),
                ListTile(
                  onTap: () {
                    Get.off(() => const CoverageAreaPage());
                  },
                  leading: Image.asset("assets/images/coverage.png",scale: 8,),
                  title: const Text('Coverage Area'),
                ),
                ListTile(
                  onTap: () {
                    Get.off(() => const PaymentRequestListPage());
                  },
                  leading: Image.asset("assets/images/payment.png",scale: 8,),
                  title: const Text('Payment Request List'),
                ),
                ListTile(
                  onTap: () {
                    Get.off(() => const PaymentListPage());
                  },
                  leading: Image.asset("assets/images/payment.png",scale: 8,),
                  title: const Text('Payment List'),
                ),
                ListTile(
                  onTap: () {
                    Get.off(() => const PickupParcelListPage());
                  },
                  leading: Image.asset("assets/images/pickup.png",scale: 8,),
                  title: const Text('Pickup Parcel List'),
                ),
                ListTile(
                  onTap: () {
                    Get.off(() => const ReturnParcelListPage());
                  },
                  leading: Image.asset("assets/images/returnnev.png",scale: 8,),
                  title: const Text('Return Parcel List'),
                ),
                ListTile(
                  onTap: () {
                  },
                  leading: Image.asset("assets/images/complete.png",scale: 8,),
                  title: const Text('Delivery List'),
                  tileColor: Colors.blue,
                ),
                ListTile(
                  onTap: () {
                    Get.off(() => const SupportPage());
                  },
                  leading: Image.asset("assets/images/support.png",scale: 8,),
                  title: const Text('Support'),
                ),
                Divider(color: Colors.grey.shade600,),
                ListTile(
                  onTap: () {},
                  leading: Image.asset("assets/images/logout.png",scale: 8,),
                  title: const Text('Logout',style: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.s,
                    children: [
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 16
                          ),
                          child: const Text('Developed By'),
                        ),
                      ),
                      Image(image: AssetImage('assets/images/stitbd.png'),width: 60,)
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16
                      ),
                      child: const Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Delivery Parcel List'),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF8B69FF), Color(0xD0165985),], // Your gradient colors here
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10),
              child: Column(
                children: [
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
                  const SizedBox(height: 5.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: deliveryParcelList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 6,
                          color: Colors.purple.shade50,
                          margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.receipt,
                                          color: Color(0xFF8B69FF)),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        deliveryParcelList[index].invoiceId,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFF1A0077)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(3), // Adjust column width as needed
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
                                                Icon(Icons.monetization_on,color: Color(0xFF8B69FF),), // Add your desired icon here
                                                SizedBox(width: 5), // Adjust spacing as needed
                                                Text("Total Collect Amount",style: TextStyle(fontSize: 16)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(": ${deliveryParcelList[index].totalCollectAmount}",style: const TextStyle(fontSize: 16)),
                                          ),
                                        ),
                                        // TableCell.empty(), // This cell is intentionally empty to create the merging effect
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        const TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.payment,color: Color(0xFF8B69FF),), // Add your desired icon here
                                                SizedBox(width: 5), // Adjust spacing as needed
                                                Text("COD Percent",style: TextStyle(fontSize: 16)),
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
                                                Text(": ${deliveryParcelList[index].cod} %",style: const TextStyle(fontSize: 16)),
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
                                                Icon(Icons.local_atm,color: Color(0xFF8B69FF),), // Add your desired icon here
                                                SizedBox(width: 5), // Adjust spacing as needed
                                                Text("COD Charge",style: TextStyle(fontSize: 16)),
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
                                                Text(": ${deliveryParcelList[index].codCharge}",style: const TextStyle(fontSize: 16)),
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
                                                Icon(Icons.local_post_office,color: Color(0xFF8B69FF),), // Add your desired icon here
                                                SizedBox(width: 5), // Adjust spacing as needed
                                                Text("Package",style: TextStyle(fontSize: 16)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(": ${deliveryParcelList[index].package}",style: const TextStyle(fontSize: 16)),
                                          ),
                                        ),
                                        // TableCell.empty(), // This cell is intentionally empty to create the merging effect
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
                                                Text("Delivery Charge",style: TextStyle(fontSize: 16)),
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
                                                Text(": ${deliveryParcelList[index].deliveryCharge}",style: const TextStyle(fontSize: 16)),
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
                                                Icon(Icons.undo,color: Color(0xFF8B69FF),), // Add your desired icon here
                                                SizedBox(width: 5), // Adjust spacing as needed
                                                Text("Return Charge",style: TextStyle(fontSize: 16)),
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
                                                Text(": ${deliveryParcelList[index].returnCharge}",style: const TextStyle(fontSize: 16)),
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
                                                Text("Customer Collect Amount",style: TextStyle(fontSize: 16),),
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
                                                Text(": ${deliveryParcelList[index].customerCollectAmount}",style: const TextStyle(fontSize: 16)),
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
                                                Icon(Icons.calculate,color: Color(0xFF8B69FF),), // Add your desired icon here
                                                SizedBox(width: 5), // Adjust spacing as needed
                                                Text("Total Charge",style: TextStyle(fontSize: 16)),
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
                                                Text(": ${deliveryParcelList[index].totalCharge}",style: const TextStyle(fontSize: 16)),
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
                                                Text("Paid Amount",style: TextStyle(fontSize: 16)),
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
                                                Text(": ${deliveryParcelList[index].paidAmount}",style: const TextStyle(fontSize: 16)),
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
                        );
                      },
                    ),
                  )

                ],
              ),
            )
        )
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }


}