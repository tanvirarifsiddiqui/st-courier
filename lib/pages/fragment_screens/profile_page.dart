import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        Icon(Icons.phone,size: 20, color: Color(0xFFFFFFFF)),
                        SizedBox(width: 3,),
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
              SizedBox(height: 12),

              // Profile Information
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        // Remove the border from the table
                        border: TableBorder.all(
                          color: Colors.transparent,
                        ),
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
                                    'Name',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Name',
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
                                    Icons.email,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Email',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Email',
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
                                    Icons.phone,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Phone Number',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          // The fourth row of the table
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
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Company Name',
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
                                    'Website/FB',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Website/FB',
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
              SizedBox(height: 2.0),

              // Pickup Information
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        // Remove the border from the table
                        border: TableBorder.all(
                          color: Colors.transparent,
                        ),
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
                                    'Address',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Address',
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
              SizedBox(height: 2.0),

              // Payment Information
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Information',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      // Use Table widget to create an invisible table
                      Table(
                        // Remove the border from the table
                        border: TableBorder.all(
                          color: Colors.transparent,
                        ),
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
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Bank Name',
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
                                    Icons.account_balance_wallet,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Flexible(
                                    child: Text(
                                      'Bank Account Number',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                              Flexible(
                                child: Text(
                                  ': Your Account Number',
                                  style: TextStyle(fontSize: 16.0),
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
                                  Text(
                                    'Bank Account Name',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Account Name',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          // The fourth row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone_android,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Bkash Number',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Bkash Number',
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
                                    Icons.phone_android,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Nagad Number',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Nagad Number',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          // The sixth row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone_android,
                                    color: Color(0xFF8B69FF),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Rocket Number',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                ': Your Rocket Number',
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
              SizedBox(height: 2.0),

              // Delivery Charge
              Card(
                elevation: 5.0,
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
                        // Remove the border from the table
                        border: TableBorder.all(
                          color: Colors.transparent,
                        ),
                        children: [
                          // The first row of the table
                          TableRow(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_shipping,
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
                                ': 25 Tk',
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
                                    Icons.local_shipping,
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
                                ': 25 Tk',
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
                                    Icons.local_shipping,
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
                                ': 25 Tk',
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



            ],
          ),
        ),
      ),
    );
  }

}
