import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:st_courier/pages/add_parcel.dart';
import 'package:st_courier/pages/covarage_area.dart';
import 'package:st_courier/pages/delivery_list.dart';
import 'package:st_courier/pages/home.dart';
import 'package:st_courier/pages/payment_list.dart';
import 'package:st_courier/pages/payment_request_list.dart';
import 'package:st_courier/pages/pick_up_parcel_list.dart';
import 'package:st_courier/pages/return_parcel_list.dart';
import 'package:st_courier/pages/support.dart';
import '../Models/parcel_list_model.dart';
import 'order_tracking.dart';

// A list of sample parcel objects
final List<Parcel> parcels = [
  Parcel(
    invoiceId: '23120901Z00H8',
    name: 'John Doe',
    phone: '1234567890',
    address: '123 Main Street',
    charge: 50.0,
    amount: 100.0,
    brief: 'Some brief description',
    status: 'Delivered',
  ),
  Parcel(
    invoiceId: '23120901Z00H9',
    name: 'Jane Doe',
    phone: '0987654321',
    address: '456 Main Street',
    charge: 40.0,
    amount: 80.0,
    brief: 'Some brief description',
    status: 'Pending',
  ),
  Parcel(
    invoiceId: '23120901Z00H10',
    name: 'Jack Doe',
    phone: '1122334455',
    address: '789 Main Street',
    charge: 60.0,
    amount: 120.0,
    brief: 'Some brief description',
    status: 'Cancelled',
  ),
];

class ParcelListPage extends StatefulWidget {
  const ParcelListPage({Key? key}) : super(key: key);

  @override
  State<ParcelListPage> createState() => _ParcelListPage();
}

class _ParcelListPage extends State<ParcelListPage>{
  final _advancedDrawerController = AdvancedDrawerController();

  ///redundable
  // A variable to store the selected parcel status
  String selectedStatus = 'All';

  // A list of possible parcel statuses
  final List<String> statuses = ['All', 'Delivered', 'Pending', 'Cancelled'];

  // A variable to store the invoice number filter
  String invoiceNo = '';

  // A variable to store the merchant order number filter
  String merchantOrderNo = '';

  // A variable to store the from date filter
  DateTime? fromDate;

  // A variable to store the to date filter
  DateTime? toDate;

  // A function to show a date picker dialog
  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  // A function to apply the filters and return a filtered list of parcels
  List<Parcel> _applyFilters() {
    List<Parcel> filteredParcels = parcels;
    if (selectedStatus != 'All') {
      filteredParcels = filteredParcels
          .where((parcel) => parcel.status == selectedStatus)
          .toList();
    }
    if (invoiceNo.isNotEmpty) {
      filteredParcels = filteredParcels
          .where((parcel) => parcel.invoiceId.contains(invoiceNo))
          .toList();
    }
    if (merchantOrderNo.isNotEmpty) {
      filteredParcels = filteredParcels
          .where((parcel) => parcel.brief.contains(merchantOrderNo))
          .toList();
    }
    if (fromDate != null) {
      filteredParcels = filteredParcels
          .where((parcel) =>
          DateTime.parse(parcel.invoiceId.substring(0, 8))
              .isAfter(fromDate!))
          .toList();
    }
    if (toDate != null) {
      filteredParcels = filteredParcels
          .where((parcel) =>
          DateTime.parse(parcel.invoiceId.substring(0, 8)).isBefore(toDate!))
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
          child: Container(
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

                    },
                    leading: Image.asset("assets/images/total_parcel_drawer.png",scale: 8,),
                    title: const Text('Parcel List'),
                    tileColor: Colors.blue,
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
                  const Spacer(),
                  DefaultTextStyle(
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
                ],
              ),
            ),
          ),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Parcel List'),
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
            body: Column(
              children: [
                // A dropdown to select the parcell status
                DropdownButton<String>(
                  value: selectedStatus,
                  items: statuses
                      .map((status) => DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value!;
                    });
                  },
                ),
                // A row to enter the invoice number and the merchant order number
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Invoice No',
                        ),
                        onChanged: (value) {
                          setState(() {
                            invoiceNo = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Merchant Order No',
                        ),
                        onChanged: (value) {
                          setState(() {
                            merchantOrderNo = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // A row to select the from date and the to date
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('From Date'),
                        subtitle: Text(fromDate == null
                            ? 'Not Selected'
                            : '${fromDate!.day}/${fromDate!.month}/${fromDate!.year}'),
                        onTap: () {
                          _selectDate(context, true);
                        },
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('To Date'),
                        subtitle: Text(toDate == null
                            ? 'Not Selected'
                            : '${toDate!.day}/${toDate!.month}/${toDate!.year}'),
                        onTap: () {
                          _selectDate(context, false);
                        },
                      ),
                    ),
                  ],
                ),
                // A button to apply the filters
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text('Filter'),
                ),
                // A list view to display the filtered parcels
                Expanded(
                  child: ListView.builder(
                    itemCount: _applyFilters().length,
                    itemBuilder: (context, index) {
                      final parcell = _applyFilters()[index];
                      return GestureDetector(
                        onTap: () {
                          // Do something when the card is tapped
                        },
                        child: Card(
                          // Use a slightly colorful card
                          color: Colors.purple[50],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Customer Invoice ID: ${parcell.invoiceId}'),
                                Text('Customer Name: ${parcell.name}'),
                                Text('Customer Phone Number: ${parcell.phone}'),
                                Text('Customer Address: ${parcell.address}'),
                                Text('Total Charge: ${parcell.charge}'),
                                Text('Total Collection Amount: ${parcell.amount}'),
                                Text('Parcel Brief: ${parcell.brief}'),
                                // Use a bordered text to display the status
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(parcell.status),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        )
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }


}