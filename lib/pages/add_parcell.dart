import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:st_courier/pages/home.dart';

class AddParcellPage extends StatefulWidget {
  const AddParcellPage({Key? key}) : super(key: key);

  @override
  State<AddParcellPage> createState() => _AddParcellPage();
}

class _AddParcellPage extends State<AddParcellPage>{

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
              colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
            ),
          ),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    margin: const EdgeInsets.only(
                      top: 18.0,
                      bottom: 18.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/user.png',
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.off(() => HomePage());
                    },
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.list_alt),
                    title: const Text('Parcel List'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.track_changes),
                    title: const Text('Order Tracking'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.area_chart),
                    title: const Text('Coverage Area'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.payment),
                    title: const Text('Payment Request List'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.payments),
                    title: const Text('Payment List'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.wheelchair_pickup),
                    title: const Text('Pickup Parcel List'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.assignment_return),
                    title: const Text('Return Parcel List'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.delivery_dining),
                    title: const Text('Delivery List'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.support),
                    title: const Text('Support'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
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
              title: const Text('ADD Parcell'),
              backgroundColor: Colors.blueGrey.shade500,
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
                    // children: [
                    //   Row(children: [
                    //     ClipOval(
                    //         child: Container(
                    //           width: 60,
                    //           height: 60,
                    //           decoration: BoxDecoration(
                    //               shape: BoxShape.circle,
                    //               border: Border.all(
                    //                 color:
                    //                 Colors.white60, // Adjust the border color
                    //                 width: 2.5, // Adjust the border width
                    //               ),
                    //               image: const DecorationImage(
                    //                 fit: BoxFit.cover,
                    //                 image: AssetImage("assets/images/user.png"),
                    //               )),
                    //         )),
                    //     const SizedBox(width: 10),
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width *
                    //           0.25, //solved by media query
                    //       child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             const Text("Md. Humayun",
                    //                 softWrap: true,
                    //                 style: TextStyle(
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.w500)),
                    //             const SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text("Balance 175",
                    //                 softWrap: true,
                    //                 style: TextStyle(fontStyle: FontStyle.italic )),
                    //             const SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text("01852148425",
                    //               softWrap: true,),
                    //           ]),
                    //     ),
                    //     const SizedBox(width: 20), // Add space between address and connection text
                    //     GestureDetector(
                    //       onTap: () {
                    //         print("Tapped for profile");
                    //       },
                    //       child: Container(
                    //         height: 35,
                    //         width: 120,
                    //         decoration: BoxDecoration(
                    //           color: Colors.green[900],
                    //           borderRadius: BorderRadius.circular(12),
                    //           border: Border.all(
                    //             color: Colors.brown.shade200,
                    //           ),
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             'View Profile',
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               color: Colors.brown[50],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ]),
                    // ],
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
                      height: 35,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'ADD PARCELL',
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
            ]
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