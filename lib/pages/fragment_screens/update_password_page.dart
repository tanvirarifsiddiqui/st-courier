import 'package:flutter/material.dart';
import 'package:st_courier/Models/form_model.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  _UpdatePasswordPageState createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  // Define the controllers for the text fields
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Define the form key for validating the input
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Define a method to update the password
  void _updatePassword() {
    // Validate the input and proceed if no errors
    if (_formKey.currentState!.validate()) {
      // Get the values from the text fields
      String currentPassword = _currentPasswordController.text;
      String newPassword = _newPasswordController.text;
      String confirmPassword = _confirmPasswordController.text;

      // Check if the new password and confirm password match
      if (newPassword == confirmPassword) {
        // TODO: Implement the logic to update the password using currentPassword and newPassword
        // For example, you can use Firebase Authentication to update the password
        // See this web search result for more details [^1^][1]
        print('Password updated successfully');
      } else {
        // Show an error message if the passwords do not match
        print('The new password and confirm password do not match');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Display a lock image as an asset
                Image.asset(
                  'assets/images/padlock.png',
                  height: 200,
                  width: 200,
                ),
                Text("Change Password",style: TextStyle(fontSize: 22),),
                SizedBox(height: 10,),
                // Display a card with the input fields and the button
                Card(
                  color: Colors.purple.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Display a text field for the current password
                        MyTextField(
                          myController: _currentPasswordController,
                          fieldName: "Current Password",
                          myIcon: Icons.lock_open,
                          prefixIconColor: Colors.deepPurple.shade300,
                        ),
                        SizedBox(height: 10,),
                        // Display a text field for the new password
                        MyTextField(
                          myController: _newPasswordController,
                          fieldName: "New Password",
                          myIcon: Icons.lock_open,
                          prefixIconColor: Colors.deepPurple.shade300,
                        ),
                        SizedBox(height: 10,),
                        // Display a text field for the confirm password
                        MyTextField(
                          myController: _confirmPasswordController,
                          fieldName: "Confirm Password",
                          myIcon: Icons.lock_open,
                          prefixIconColor: Colors.deepPurple.shade300,
                        ),
                        SizedBox(height: 10,),
                        // Display a button to update the password
                        GestureDetector(
                          onTap: () {
                            _updatePassword();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                                      'Update Password',
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
