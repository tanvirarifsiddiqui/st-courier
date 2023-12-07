import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:st_courier/pages/covarage_area.dart';
import 'package:st_courier/pages/delivery_list.dart';
import 'package:st_courier/pages/parcel_list.dart';
import 'package:st_courier/pages/payment_list.dart';
import 'package:st_courier/pages/payment_request_list.dart';
import 'package:st_courier/pages/pick_up_parcel_list.dart';
import 'package:st_courier/pages/return_parcel_list.dart';
import 'package:st_courier/pages/support.dart';
import 'add_parcell.dart';
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
                    },
                    leading: Image.asset("assets/images/home.png",scale: 18,),
                    title: const Text('Home', style: TextStyle(color: Colors.black),),
                    tileColor: Colors.blue,
                  ),
                  const Divider(color: Colors.grey,),
                  ListTile(
                    onTap: () {
                      Get.off(() => const AddParcellPage());
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
              //profile image
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Container(
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
                              0.25, //solved by media query
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Md. Humayun",
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
                                Text("01852148425",
                                    softWrap: true,),
                              ]),
                        ),
                        const SizedBox(width: 20), // Add space between address and connection text
                        GestureDetector(
                          onTap: () {
                            print("Tapped for profile");
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.brown.shade800,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'View Profile',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.brown[50],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 15,),
              const Center(child: Text("Welcome To ST Courier", style: TextStyle(fontSize: 26),)),
              const SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                  print("Tapped for Parcell");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.deepPurpleAccent.withOpacity(0.9), Colors.blue.shade900.withOpacity(0.5)],
                      ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'Add Parcel',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildPrayerTimeWidgets(),
            ]
            )
        )
    );
  }



  Widget _buildPrayerTimeWidgets() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        //1st Tow Segments
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _cardModel(Icon(Icons.card_giftcard,color: Colors.white), 'Total Parcel', "608"),
            const SizedBox(width: 12,),

            _cardModel(Icon(Icons.cancel,color: Colors.white), 'Cancel Parcel', "4"),
            const SizedBox(width: 12,),

            _cardModel(Icon(Icons.pending_actions,color: Colors.white), 'Pending Pickup', "5"),
            // const SizedBox(width: 12,),

          ],
        ),

        const SizedBox(
          height: 12,
        ),

        //2nd Tow Segments
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _cardModel(Icon(Icons.fire_truck,color: Colors.white), 'Pending Delivery', "558"),
            const SizedBox(width: 12,),

            _cardModel(Icon(Icons.done,color: Colors.white), 'Delivery Complete', "41"),
            const SizedBox(width: 12,),

            _cardModel(Icon(Icons.payments_rounded,color: Colors.white), 'Payment Complete', "21"),
            // const SizedBox(width: 12,),

          ],
        ),

        const SizedBox(
          height: 12,
        ),
//3ed Tow Segments
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _cardModel(Icon(Icons.card_giftcard,color: Colors.white), 'Return Parcel', "10"),
            const SizedBox(width: 12,),

            _cardModel(Icon(Icons.assignment_returned_rounded,color: Colors.white), 'Return Complete', "41"),
            const SizedBox(width: 12,),

            _cardModel(Icon(Icons.payment,color: Colors.white,), 'Payment in Progress', "0"),
            // const SizedBox(width: 12,),

          ],
        ),

        const SizedBox(height: 12,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _cardModel(Icon(Icons.auto_awesome_mosaic_outlined,color: Colors.white,), 'Total Collect Amount', "31,551"),
            const SizedBox(width: 29,),

            _cardModel(Icon(Icons.paid,color: Colors.white), 'Total Paid Amount', "20,532"),
            // const SizedBox(width: 12,),

          ],
        ),
        const SizedBox(height: 12,),
        // Add more widget boxes as needed
      ],
    );
  }

  Widget _cardModel(Icon icon, String operation, String number){
    return Flexible(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurpleAccent.withOpacity(0.9), Colors.blue.withOpacity(0.3)],
                ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          child: Column(
            children: [
              Image.asset("assets/images/coverage.png",scale: 6,),
              // icon,
              const Divider(
                color: Colors.black,
              ),
              Text(
                operation,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  // color: Colors.white,
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              Text(
                number,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),

            ],
          ),
        ));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
