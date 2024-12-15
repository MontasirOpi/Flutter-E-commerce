import 'package:ecommerce/features/auth/ui/widgets/app_logo_widget.dart';

import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameEController = TextEditingController();
  final TextEditingController _mobileEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogoWidget(
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 16),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('Get stated with us with your details',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      )),
              const SizedBox(height: 24),
              _buildForm(),
              ElevatedButton(
                onPressed: () {
                  // if (_fromKey.currentState!.validate()) {}
                },
                child: const Text('Complete'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _fromKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameTEController,
            decoration: const InputDecoration(hintText: 'First Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your first name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameEController,
            decoration: const InputDecoration(hintText: 'Last Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your last name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileEController,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: const InputDecoration(hintText: 'Mobile'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your mobile number';
              }
              if(RegExp(r'^01[3-9]\d{8}$').hasMatch(value!)== false){
                 return 'Enter valid mobile number';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityTEController,
            decoration: const InputDecoration(hintText: 'City'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid city';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _shippingAddressTEController,
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Shipping Address'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid shipping address';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameEController.dispose();
    _mobileEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
    super.dispose();
  }
}
