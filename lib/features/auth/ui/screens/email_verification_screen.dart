import 'package:ecommerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const String name = '/email-verification';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidget(),
                const SizedBox(height: 16),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('Please enter your email adderss',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        )),
                const SizedBox(height: 24),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your email address';
                      }
                      if (EmailValidator.validate(value!) == false) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    }),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // if (_fromKey.currentState!.validate()) {}
                    Navigator.pushNamed(context, OtpVerificationScreen.name);
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
