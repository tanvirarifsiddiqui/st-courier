import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:st_courier/pages/covarage_area.dart';
import 'package:st_courier/pages/delivery_list.dart';
import 'package:st_courier/pages/fragment_screens/parcel_details_page.dart';
import 'package:st_courier/pages/home.dart';
import 'package:st_courier/pages/order_tracking.dart';
import 'package:st_courier/pages/parcel_list.dart';
import 'package:st_courier/pages/payment_list.dart';
import 'package:st_courier/pages/payment_request_list.dart';
import 'package:st_courier/pages/pick_up_parcel_list.dart';
import 'package:st_courier/pages/support.dart';

import '../Models/card_row_model.dart';
import '../Models/parcel_list_model.dart';
import '../objects/parcel_objects.dart';
import 'add_parcel.dart';

class ReturnParcelListPage extends StatefulWidget {
  const ReturnParcelListPage({Key? key}) : super(key: key);

  @override
  State<ReturnParcelListPage> createState() => _ReturnParcelListPage();
}

class _ReturnParcelListPage extends State<ReturnParcelListPage>{
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

  // A function to apply the filters and return a filtered list of parcels
  List<Parcel> _applyFilters() {
    List<Parcel> filteredParcels = parcels;
    if (fromDate == null || toDate == null) {
      filteredParcels = filteredParcels
          .where((parcel) => parcel.status == "Return Completed")
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
                  },
                  leading: Image.asset("assets/images/returnnev.png",scale: 8,),
                  title: const Text('Return Parcel List'),
                  tileColor: Colors.blue,
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
              title: const Text('Return Parcel List'),
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
                                          colors: [Color(0xff6e44a8), Color(0xff006280), Color(0xff167091)],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.cyanAccent.withOpacity(0.8),
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
        )
    );
  }

  LinearGradient _getGradientForStatus(String status) {
    switch (status) {
      case 'Delivery Completed':
        return LinearGradient(
          colors: [Color(0xff6e44a8), Color(0xff1e7e6c), Color(0xff0b8371),],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
      case 'Delivery Processing':
        return LinearGradient(
          colors: [Color(0xff6e44a8), Color(0xffce5300), Color(0xffd28800)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
      case 'Delivery Cancelled':
        return LinearGradient(
          colors: [Color(0xff6e44a8), Color(0xffa60b2f),Color(0xffd70032),],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
      case 'Payment Done':
        return LinearGradient(
          colors: [Color(0xff6e44a8),Color(0xff0e800e), Color(0xff00cc00)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
      case 'Payment Pending':
        return LinearGradient(
          colors: [Color(0xff6e44a8), Color(0xffc0a40e), Color(0xffd7b900)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
      case 'Return Completed':
        return LinearGradient(
          colors: [Color(0xff6e44a8), Color(0xff006280), Color(0xff167091)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
      case 'Pickup Request':
        return LinearGradient(
          colors: [Color(0xff6e44a8), Color(0xff3a4aff), Color(0xff2b69e1)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
    // Add other cases for different statuses with their respective gradients
      default:
        return LinearGradient(
          colors: [Colors.grey, Color(0xE80A0A0A)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
    }
  }

  Color _getShadowColorForStatus(String status) {
    switch (status) {
      case 'Delivery Completed':
        return Colors.greenAccent.shade400.withOpacity(0.8);
      case 'Delivery Processing':
        return Colors.amber.shade700.withOpacity(0.8);
      case 'Delivery Cancelled':
        return Colors.redAccent.shade400.withOpacity(0.8);
      case 'Payment Done':
        return Colors.lightGreenAccent.shade400.withOpacity(0.8);
      case 'Payment Pending':
        return Colors.yellowAccent.shade400.withOpacity(0.8);
      case 'Return Completed':
        return Colors.cyanAccent.withOpacity(0.8);
      case 'Pickup Request':
        return Colors.blueAccent.shade400.withOpacity(0.8);

      default:
        return Colors.grey.shade400.withOpacity(0.8);
    }
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

}