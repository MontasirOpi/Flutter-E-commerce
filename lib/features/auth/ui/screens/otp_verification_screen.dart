import 'dart:async';
import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/app_constants.dart';
import 'package:ecommerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce/features/auth/ui/widgets/app_logo_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInsec.obs;
  late Timer timer;
  final RxBool _enableResentCodeButton = false.obs;

  @override
  void initState() {
    super.initState();
    _startResentCodeTimer();
  }

  void _startResentCodeTimer() {
    _enableResentCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInsec;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _remainingTime.value--;

      if (_remainingTime.value == 0) {
        t.cancel();
        _enableResentCodeButton.value = true;
      }
    });
  }

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
                  'Enter OPT Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('A 4 digit otp has been sent to your email',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        )),
                const SizedBox(height: 24),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      // selectedFillColor: Colors.green,
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8)),
                  keyboardType: TextInputType.number,
                  appContext: context,
                  controller: _otpTEController,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // if (_fromKey.currentState!.validate()) {}
                    Navigator.pushNamed(context, CompleteProfileScreen.name);
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 24),
                Obx(() => Visibility(
                      visible: !_enableResentCodeButton.value,
                      child: RichText(
                        text: TextSpan(
                          text: 'This code will be expire in ',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          children: [
                            TextSpan(
                                text: '$_remainingTime s',
                                style: const TextStyle(
                                    color: AppColors.themeColor)),
                          ],
                        ),
                      ),
                    )),
                Obx(
                  () => Visibility(
                    visible: _enableResentCodeButton.value,
                    child: TextButton(
                      onPressed: () {
                        _startResentCodeTimer();
                      },
                      child: const Text('Resend Code'),
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

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
