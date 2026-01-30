import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:rfc/components/button.dart';
import 'package:rfc/components/textfield.dart';
import 'package:rfc/routes/routes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  final background = Colors.redAccent;
  final textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: background,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),

              Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Register to get started',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: textColor),
              ),

              const SizedBox(height: 40),

              CustomTextField(
                labelText: 'Full Name',
                hintText: 'Enter your name',
                controller: _nameController,
                prefixIcon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              CustomTextField(
                labelText: 'Email',
                hintText: 'Enter your email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              CustomTextField(
                labelText: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                prefixIcon: Icons.lock,
                isPasswordField: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              CustomTextField(
                labelText: 'Confirm Password',
                hintText: 'Re-enter password',
                controller: _confirmPasswordController,
                prefixIcon: Icons.lock_outline,
                isPasswordField: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 32),

              CustomButton(
                label: _isLoading ? 'Creating account...' : 'Register',
                isLoading: _isLoading,
                backgroundColor: textColor,
                textColor: Colors.black,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                  }
                },
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: textColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
