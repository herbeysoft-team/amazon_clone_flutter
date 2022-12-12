
import 'package:flutter/material.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';

enum Auth {
  signin,
  signup,
}
class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor:  GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth, 
                onChanged: (Auth? val) { 
                  setState(() {
                    _auth = val!;
                    
                  });
                 },

              ),
            ),
            if(_auth == Auth.signup)
              Form(
                key: _signUpFormKey,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Column(
                    children: [
                        CustomTextField(
                            controller: _nameController,
                            hintText: 'Name',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              //signUpUser();
                            }
                          },
                          )  
                    ],
                  ),
                ),
                ),
              
             ListTile(
              title: const Text(
                "Sign-In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor:  GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth, 
                onChanged: (Auth? val) { 
                  setState(() {
                    _auth = val!;
                  });
                 },

              ),
            )
          ],
        ),
      )),
    );
  }
}
