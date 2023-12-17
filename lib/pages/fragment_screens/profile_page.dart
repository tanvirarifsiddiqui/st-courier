import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_courier/pages/fragment_screens/update_password_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
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
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Container
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF8B69FF),
                      Color(0xD0165985),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  // borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile Picture with border
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Name
                    Text(
                      'Md. Tanvir Arif Siddiqui',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    // Phone Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone, size: 20, color: Color(0xFFFFFFFF)),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '01794338046',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Profile Information
              Card(
                color: Colors.purple.shade50,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile Information',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      // Use Table widget to create an invisible table
                      Table(
                        children: [
                          // The first row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Merchant Id',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': M-0001',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          // The second row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.business,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Company Name',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Click to Buy',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          // The third row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Email',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': merchant@gmail.com',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          // The fourth row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'COD Charge',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': 0',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          // The fifth row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.web,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Website/FB:',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Text(
                                'sites.google.com/diu.edu.bd/tanvir3687',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),

              // Pickup Information
              Card(
                color: Colors.purple.shade50,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pickup Information',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      // Use Table widget to create an invisible table
                      Table(
                        columnWidths: {
                          0: FlexColumnWidth(1), // Adjust column width as needed
                          1: FlexColumnWidth(2), // Adjust column width as needed
                        },
                        children: [
                          // The first row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Address:',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Flexible(
                                child: Text(
                                  'Level-2, 25/2 Lake Circus Rd, Dhaka 1205',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),

              // Payment Information
              Card(
                color: Colors.purple.shade50,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Information:',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      // Use Table widget to create an invisible table
                      Table(
                        columnWidths: {
                          0: FlexColumnWidth(3), // Adjust column width as needed
                          1: FlexColumnWidth(2), // Adjust column width as needed
                        },
                        children: [
                          // The first row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_balance,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Bank Name',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': 캐럴이 와요.',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          // The second row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_balance_wallet,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Flexible(
                                    child: Text(
                                      'Bank Account Number',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                              Flexible(
                                child: Text(
                                  ': 에릭이',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                          // The third row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_box,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Flexible(
                                    child: Text(
                                      'Bank Account Name',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                ': 사과를',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          // The fourth row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.contact_phone_rounded,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Bkash Number',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': 01794338046',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          // The fifth row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.contact_phone_rounded,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Nagad Number',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': 01794338046',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          // The sixth row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.contact_phone_rounded,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Rocket Number',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': 01794338046',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),

              // Delivery Charge
              Card(
                color: Colors.purple.shade50,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Charge',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      // Use Table widget to create an invisible table
                      Table(
                        children: [
                          // The first row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    '1. Dhaka Metro',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': ৳ 25',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          // The second row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    '2. Dhaka Sub',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': ৳ 25',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          // The third row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    '3. Outside Dhaka',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': ৳ 25',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(()=> const UpdatePasswordPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30,bottom: 30),
                      child: Container(
                        height: 45,
                        width: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.deepPurpleAccent.withOpacity(0.9), Colors.blue.shade900.withOpacity(0.5)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes the position of shadow
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Change Your Password',
                            style: TextStyle(
                              fontSize: 16,
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
        ),
      ),
    );
  }
}
