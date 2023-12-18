import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:st_courier/Models/card_row_model.dart';
import 'package:st_courier/pages/covarage_area.dart';
import 'package:st_courier/pages/delivery_list.dart';
import 'package:st_courier/pages/home.dart';
import 'package:st_courier/pages/order_tracking.dart';
import 'package:st_courier/pages/parcel_list.dart';
import 'package:st_courier/pages/payment_list.dart';
import 'package:st_courier/pages/payment_request_list.dart';
import 'package:st_courier/pages/pick_up_parcel_list.dart';
import 'package:st_courier/pages/return_parcel_list.dart';
import 'package:st_courier/pages/support.dart';

import '../Models/form_model.dart';

class AddParcelPage extends StatefulWidget {
  const AddParcelPage({Key? key}) : super(key: key);

  @override
  State<AddParcelPage> createState() => _AddParcelPage();
}

class _AddParcelPage extends State<AddParcelPage> {
  final _advancedDrawerController = AdvancedDrawerController();

  final _merchantOrderController = TextEditingController();
  final _pickupAddressController = TextEditingController();
  final _collectionAmountController = TextEditingController();
  final _productValueController = TextEditingController();
  final _productDesController = TextEditingController();
  final _remarksController = TextEditingController();
  final _customerNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _customerAddressController = TextEditingController();

  @override
  void dispose() {
    _merchantOrderController.dispose();
    _pickupAddressController.dispose();
    _collectionAmountController.dispose();
    _productValueController.dispose();
    _productDesController.dispose();
    _remarksController.dispose();
    _customerNameController.dispose();
    _phoneNumberController.dispose();
    _customerAddressController.dispose();
    super.dispose();
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
                leading: Image.asset(
                  "assets/images/home.png",
                  scale: 18,
                ),
                title:
                    const Text('Home', style: TextStyle(color: Colors.black)),
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {},
                leading: Image.asset(
                  "assets/images/add_parcel_drawer.png",
                  scale: 8,
                ),
                title: const Text('Add Parcel'),
                tileColor: Colors.blue,
              ),
              ListTile(
                onTap: () {
                  Get.off(() => const ParcelListPage());
                },
                leading: Image.asset(
                  "assets/images/total_parcel_drawer.png",
                  scale: 8,
                ),
                title: const Text('Parcel List'),
              ),
              ListTile(
                onTap: () {
                  Get.off(() => const OrderTrackingPage());
                },
                leading: Image.asset(
                  "assets/images/waitingdelivery.png",
                  scale: 6,
                ),
                title: const Text('Order Tracking'),
              ),
              ListTile(
                onTap: () {
                  Get.off(() => const CoverageAreaPage());
                },
                leading: Image.asset(
                  "assets/images/coverage.png",
                  scale: 8,
                ),
                title: const Text('Coverage Area'),
              ),
              ListTile(
                onTap: () {
                  Get.off(() => const PaymentRequestListPage());
                },
                leading: Image.asset(
                  "assets/images/payment.png",
                  scale: 8,
                ),
                title: const Text('Payment Request List'),
              ),
              ListTile(
                onTap: () {
                  Get.off(() => const PaymentListPage());
                },
                leading: Image.asset(
                  "assets/images/payment.png",
                  scale: 8,
                ),
                title: const Text('Payment List'),
              ),
              ListTile(
                onTap: () {
                  Get.off(() => const PickupParcelListPage());
                },
                leading: Image.asset(
                  "assets/images/pickup.png",
                  scale: 8,
                ),
                title: const Text('Pickup Parcel List'),
              ),
              ListTile(
                onTap: () {
                  Get.off(() => const ReturnParcelListPage());
                },
                leading: Image.asset(
                  "assets/images/returnnev.png",
                  scale: 8,
                ),
                title: const Text('Return Parcel List'),
              ),
              ListTile(
                onTap: () {
                  Get.off(() => const DeliveryListPage());
                },
                leading: Image.asset(
                  "assets/images/complete.png",
                  scale: 8,
                ),
                title: const Text('Delivery List'),
              ),
              ListTile(
                onTap: () {
                  Get.off(() => const SupportPage());
                },
                leading: Image.asset(
                  "assets/images/support.png",
                  scale: 8,
                ),
                title: const Text('Support'),
              ),
              Divider(
                color: Colors.grey.shade600,
              ),
              ListTile(
                onTap: () {},
                leading: Image.asset(
                  "assets/images/logout.png",
                  scale: 8,
                ),
                title: const Text('Logout',
                    style: TextStyle(color: Colors.black)),
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
            title: const Text('Add Parcel'),
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
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                SizedBox(height: 5),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Address',
                    prefixIcon: Icon(Icons.location_on,
                        color: Colors.deepPurple.shade300),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple.shade300),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                  ),
                  items: ['Default Address', 'Other Address']
                      .map((address) => DropdownMenuItem(
                            value: address,
                            child: Text(address),
                          ))
                      .toList(),
                  onChanged: (value) {
                    // Handle dropdown value change todo
                  },
                ),
                const SizedBox(height: 10.0),
                MyTextField(
                  myController: _pickupAddressController,
                  fieldName: "Your Pickup Address",
                  myIcon: Icons.location_on_outlined,
                  prefixIconColor: Colors.deepPurple.shade300,
                ),
                const SizedBox(height: 10.0),
                Container(
                    child: Center(
                      child: Text(
                        "Customer Information",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.grey, // Shadow color and opacity
                              offset: Offset(0,
                                  1), // Shadow position (horizontal, vertical)
                              blurRadius: 5, // Shadow blur radius
                            ),
                          ],
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF8B69FF),
                          Color(0xD0165985),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    )),
                const SizedBox(height: 10.0),
                MyTextField(
                  myController: _customerNameController,
                  fieldName: "Customer Name",
                  myIcon: Icons.person,
                  prefixIconColor: Colors.deepPurple.shade300,
                ),
                const SizedBox(height: 10.0),
                MyTextField(
                  myController: _phoneNumberController,
                  fieldName: "Phone Number",
                  myIcon: Icons.phone,
                  prefixIconColor: Colors.deepPurple.shade300,
                ),
                const SizedBox(height: 10.0),
                MyTextField(
                  myController: _customerAddressController,
                  fieldName: "Customer Address",
                  myIcon: Icons.location_on,
                  prefixIconColor: Colors.deepPurple.shade300,
                ),
                const SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'District',
                    prefixIcon: Icon(Icons.location_city,
                        color: Colors.deepPurple.shade300),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple.shade300),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                  ),
                  items: ["Dhaka", "Rajshahi"]
                      .map((district) => DropdownMenuItem(
                            value: district,
                            child: Text(district),
                          ))
                      .toList(),
                  onChanged: (value) {
                    // Handle dropdown value change
                  },
                ),
                const SizedBox(height: 10.0),
                Container(
                    child: Center(
                      child: Text(
                        "Parcel Information",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.grey, // Shadow color and opacity
                              offset: Offset(0,
                                  1), // Shadow position (horizontal, vertical)
                              blurRadius: 5, // Shadow blur radius
                            ),
                          ],
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF8B69FF),
                          Color(0xD0165985),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    )),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _merchantOrderController,
                        decoration: InputDecoration(
                          labelText: 'Merchant Order No',
                          labelStyle: const TextStyle(color: Colors.deepPurple),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        controller: _collectionAmountController,
                        decoration: InputDecoration(
                          labelText: 'Collection Amount',
                          labelStyle: const TextStyle(color: Colors.deepPurple),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'WeightPackage',
                    prefixIcon: Icon(Icons.fitness_center,
                        color: Colors.deepPurple.shade300),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple.shade300),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                  ),
                  items: [
                    '0.5 Kg',
                    '1 Kg',
                    // Add other weight options here
                  ]
                      .map((weight) => DropdownMenuItem(
                            value: weight,
                            child: Text(weight),
                          ))
                      .toList(),
                  onChanged: (value) {
                    // Handle weight dropdown value change
                  },
                ),
                const SizedBox(height: 10.0),
                MyTextField(
                  myController: _productValueController,
                  fieldName: "Product Value",
                  myIcon: Icons.monetization_on,
                  prefixIconColor: Colors.deepPurple.shade300,
                ),
                const SizedBox(height: 10.0),
                MyTextField(
                  myController: _productDesController,
                  fieldName: "Enter Product Description",
                  myIcon: Icons.description,
                  prefixIconColor: Colors.deepPurple.shade300,
                ),
                const SizedBox(height: 10.0),
                MyTextField(
                  myController: _remarksController,
                  fieldName: "Remarks",
                  myIcon: Icons.note,
                  prefixIconColor: Colors.deepPurple.shade300,
                ),
                const SizedBox(height: 20.0),
              Card(
                elevation: 4,
                color: Colors.purple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildCardRow('Collection Amount:', '0.0 Tk', Icons.attach_money),
                      buildCardRow('Weight Charge:', '0.0 Tk', Icons.fitness_center),
                      buildCardRow('Delivery Charge:', '0.0 Tk', Icons.local_shipping),
                      buildCardRow('COD Charge:', '0.0 Tk', Icons.payment),
                      Divider(),
                      buildCardRow('Total Charge:', '0.0 Tk', Icons.calculate),
                    ],
                  ),
                ),
              ),


                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    // Get.to(()=> AddParcellPage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Container(
                          height: 45,
                          width: 250,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.deepPurpleAccent.withOpacity(0.9),
                                Colors.blue.shade900.withOpacity(0.5)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes the position of shadow
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }



}

