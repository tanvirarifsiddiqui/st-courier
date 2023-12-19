import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:st_courier/pages/covarage_area.dart';
import 'package:st_courier/pages/delivery_list.dart';
import 'package:st_courier/pages/fragment_screens/cancel_parcel_page.dart';
import 'package:st_courier/pages/fragment_screens/delivery_complete_page.dart';
import 'package:st_courier/pages/fragment_screens/payment_complete_page.dart';
import 'package:st_courier/pages/fragment_screens/pending_delivery_page.dart';
import 'package:st_courier/pages/fragment_screens/pending_pickup_page.dart';
import 'package:st_courier/pages/fragment_screens/profile_page.dart';
import 'package:st_courier/pages/fragment_screens/return_complete_page.dart';
import 'package:st_courier/pages/fragment_screens/return_parcel_page.dart';
import 'package:st_courier/pages/fragment_screens/total_paid_amount_page.dart';
import 'package:st_courier/pages/parcel_list.dart';
import 'package:st_courier/pages/payment_list.dart';
import 'package:st_courier/pages/payment_request_list.dart';
import 'package:st_courier/pages/pick_up_parcel_list.dart';
import 'package:st_courier/pages/return_parcel_list.dart';
import 'package:st_courier/pages/support.dart';
import 'add_parcel.dart';
import 'order_tracking.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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
                  },
                  leading: Image.asset("assets/images/home.png",scale: 18,),
                  title: const Text('Home', style: TextStyle(color: Colors.black),),
                  tileColor: Colors.blue,
                ),
                const Divider(color: Colors.grey,),
                ListTile(
                  onTap: () {
                    Get.off(() => const AddParcelPage());
                  },
                  leading: Image.asset("assets/images/add_parcel_drawer.png",scale: 8,),
                  title: const Text('Add Parcel',),
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
              title: const Text('Dashboard'),
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
            body: ListView(padding: const EdgeInsets.all(10), children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      ClipOval(
                          child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  Colors.white60, // Adjust the border color
                              width: 2.5, // Adjust the border width
                            ),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/user.png"),
                            )),
                      )),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.34, //solved by media query
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Md. Tanvir",
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Balance 175",
                                  softWrap: true,
                                  style: TextStyle(fontStyle: FontStyle.italic )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("01794338046",
                                  softWrap: true,),
                            ]),
                      ),
                      // const SizedBox(width: 10), // Add space between address and connection text
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>ProfilePage());
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.blue.withOpacity(0.4),Colors.blueAccent.withOpacity(0.5), Colors.blue.withOpacity(0.4)],
                            ),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2), // changes the position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'View Profile',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 15,),
              const Center(child: Text(
                'Welcome To ST Courier',
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.grey, // Shadow color and opacity
                      offset: Offset(0, 1), // Shadow position (horizontal, vertical)
                      blurRadius: 5, // Shadow blur radius
                    ),
                  ],
                  fontSize: 26,
                  color: Colors.black,
                ),
              )),
              const SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                  Get.to(()=> AddParcelPage());
                },
                //Button
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.deepPurpleAccent.withOpacity(0.9), Colors.blue.shade900.withOpacity(0.5)],
                      ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // changes the position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Add Parcel',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildDashboardWidgets(),
            ]
            )
        )
    );
  }



  Widget _buildDashboardWidgets() {
    double cardWidth = MediaQuery.of(context).size.width * 0.28;
    double cardWidth2 = MediaQuery.of(context).size.width * 0.38;
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          //1st Tow Segments
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  Get.to(ParcelListPage());
                },
                  child: _cardModel('Total Parcel', "608","assets/images/totalpearcel.png",cardWidth)
              ),
              // const SizedBox(width: 16,),
      
              GestureDetector(
                  onTap: (){
                    Get.to(()=>const CanceledParcelScreen());
                  },
                  child: _cardModel('Cancel Parcel', "4","assets/images/cancelled.png",cardWidth)
              ),
              // const SizedBox(width: 16,),
      
              GestureDetector(
                  onTap: (){
                    Get.to(()=> PendingPickupScreen());
                  },
                  child: _cardModel('Pending Pickup', "5","assets/images/waitingpickup.png",cardWidth)),
              // const SizedBox(width: 12,),
      
            ],
          ),
      
          const SizedBox(
            height: 20,
          ),
      
          //2nd Tow Segments
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: (){
                    Get.to(()=>const PendingDeliveryScreen());
                  },
                  child: _cardModel( 'Pending Delivery', "558","assets/images/waitingpickup1.png",cardWidth)),
              // const SizedBox(width: 16,),
      
              GestureDetector(
                  onTap: (){
                    Get.to(()=>const DeliveryCompleteScreen());
                  },
                  child: _cardModel( 'Delivery Complete', "41","assets/images/deliverycomplete.png",cardWidth)),
              // const SizedBox(width: 16,),
      
              GestureDetector(
                  onTap: (){
                    Get.to(()=>PaymentCompleteScreen());
                  },
                  child: _cardModel( 'Payment Complete', "21","assets/images/paymentcomplete.png",cardWidth)),
              // const SizedBox(width: 12,),
      
            ],
          ),
      
          const SizedBox(
            height: 20,
          ),
      //3ed Tow Segments
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: (){
                    Get.to(()=>const ReturnParcelScreen());
                  },
                  child: _cardModel('Return Parcel', "10","assets/images/returnparcel.png",cardWidth)),
              // const SizedBox(width: 16,),
      
              GestureDetector(
                  onTap: (){
                    Get.to(()=>const ReturnCompleteScreen());
                  },
                  child: _cardModel('Return Complete', "11","assets/images/returncomplete.png",cardWidth)),
              // const SizedBox(width: 16,),
      
              GestureDetector(
                  onTap: (){
                    // Get.to(()=>ParcelListPage());
                  },
                  child: _cardModel( 'Payment in Progress', "0","assets/images/pendingamout.png",cardWidth)),
              // const SizedBox(width: 12,),
      
            ],
          ),
      
          const SizedBox(height: 20,),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: (){
                    // Get.to(()=>ParcelListPage());
                  },
                  child: _cardModel( 'Total Collect Amount', "31,551","assets/images/totalcollectamount.png",cardWidth2)),
      
              // const SizedBox(width: 16,),
              GestureDetector(
                  onTap: (){
                    Get.to(()=>const TotalPaymentScreen());
                  },
                  child: _cardModel( 'Total Paid Amount', "20,532","assets/images/cashondelivery.png",cardWidth2)),
              // const SizedBox(width: 12,),
      
            ],
          ),
          const SizedBox(height: 12,),
          // Add more widget boxes as needed
        ],
      ),
    );
  }

  Widget _cardModel(String operation, String number,String iconPath, double width){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 6,
      child: Container(
        height: 150,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.withOpacity(0.3),Colors.blueAccent.withOpacity(0.5), Colors.blue.withOpacity(0.2)],
              ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40, // Fixed height for the image
              width: 40, // Fixed width for the image
              child: Image.asset(iconPath),
            ),
            Text(
              operation,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3),
            Text(
              number,
              style: const TextStyle(
                fontSize: 22,
                // fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

          ],
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
