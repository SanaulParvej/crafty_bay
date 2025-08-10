import 'package:crafty_bay/core/ui/widget/snack_bar_message.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_request_model.dart';
import 'package:crafty_bay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/ui/widget/centered_circular_progress_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static final String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  AppLogo(
                    width: 90,
                    height: 90,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Register Account',
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Please enter your details to sign up',
                    style: textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (String? value) {
                      String emailValue = value ?? '';
                      if (EmailValidator.validate(emailValue) == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _firstNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Last Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _mobileTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Mobile'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 6) {
                        return 'Enter a valid password more than 6 letters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _cityTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'City'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid City';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _addressTEController,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Shipping Address'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your full address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  GetBuilder<SignUpController>(builder: (_) {
                    return Visibility(
                      visible: _signUpController.inProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapSignButton,
                        child: Text('Sign Up'),
                      ),
                    );
                  }),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                          onPressed: _onTapLoginButton, child: Text('Login')),
                    ],
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton() {
    Navigator.pop(context);
  }

  Future<void> _onTapSignButton() async {
    if (_formKey.currentState!.validate()) {
      final SignUpRequestModel model = SignUpRequestModel(
          email: _emailTEController.text.trim(),
          firstName: _firstNameTEController.text.trim(),
          lastName: _lastNameTEController.text.trim(),
          password: _passwordTEController.text,
          phone: _mobileTEController.text.trim(),
          city: _cityTEController.text.trim());
      final bool isSuccess = await _signUpController.signUp(model);
      if (isSuccess) {
        showSnackBarMessage(context, _signUpController.message!);
        Navigator.pushNamed(context, VerifyOtpScreen.name,
            arguments: _emailTEController.text.trim());
      } else {
        showSnackBarMessage(context, _signUpController.errorMessage!, true);
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    _cityTEController.dispose();
    _addressTEController.dispose();
    super.dispose();
  }
}
