import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:st_courier/pages/covarage_area.dart';
import 'package:st_courier/pages/delivery_list.dart';
import 'package:st_courier/pages/fragment_screens/product_details_page.dart';
import 'package:st_courier/pages/home.dart';
import 'package:st_courier/pages/order_tracking.dart';
import 'package:st_courier/pages/parcel_list.dart';
import 'package:st_courier/pages/payment_request_list.dart';
import 'package:st_courier/pages/pick_up_parcel_list.dart';
import 'package:st_courier/pages/return_parcel_list.dart';
import 'package:st_courier/pages/support.dart';

import '../objects/payment_objects.dart';
import 'add_parcel.dart';

class PaymentListPage extends StatefulWidget {
  const PaymentListPage({Key? key}) : super(key: key);

  @override
  State<PaymentListPage> createState() => _PaymentListPage();
}

class _PaymentListPage extends State<PaymentListPage>{
  final _advancedDrawerController = AdvancedDrawerController();
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
                  width: 120.0,
                  height: 120.0,
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
                  },
                  leading: Image.asset("assets/images/payment.png",scale: 8,),
                  title: const Text('Payment List'),
                  tileColor: Colors.blue,
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
                    Get.off(() => const DeliveryListPage());
                  },
                  leading: Image.asset("assets/images/complete.png",scale: 8,),
                  title: const Text('Delivery List'),
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
            body: ListView.builder(
              itemCount: payments.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Get.to(ProductDetailScreen(index: index));
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
            )
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

}