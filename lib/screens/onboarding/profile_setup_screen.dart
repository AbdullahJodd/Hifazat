import 'package:flutter/material.dart';
import '../../services/user_service.dart';
import '../../widgets/background_wrapper.dart';
import '../../utils/app_routes.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _city = TextEditingController();

  String gender = 'Female';
  bool loading = false;

  final UserService _userService = UserService();

  Future<void> submit() async {
    setState(() => loading = true);

    await _userService.saveProfile(
      name: _name.text.trim(),
      age: int.parse(_age.text.trim()),
      gender: gender,
      city: _city.text.trim(),
    );

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
          (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWrapper(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                const Text(
                  'Tell us about you',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),

                TextField(
                  controller: _name,
                  decoration: const InputDecoration(labelText: 'Full Name', filled: true),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: _age,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Age', filled: true),
                ),
                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  value: gender,
                  decoration: const InputDecoration(labelText: 'Gender', filled: true),
                  items: const [
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Other', child: Text('Other')),
                  ],
                  onChanged: (v) => setState(() => gender = v!),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: _city,
                  decoration: const InputDecoration(labelText: 'City', filled: true),
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: loading ? null : submit,
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}