import 'package:flutter/material.dart';
import 'package:aplikasi_pertukaran_pelajar/tampilan%20halaman.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 18, 0, 119), // Set background color to match sign up page
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Expanded(child: _buildInputFields())
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        color: Colors.white, // Set background color to white
      ),
      padding: const EdgeInsets.all(12), // Reduced padding here
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24), // Reduced height here
            Column(
              children: [
                _buildTextField("Enter email here", Icons.email, emailController),
                const SizedBox(height: 6), // Reduced height here
                _buildTextField("Password", Icons.lock, passwordController, isPass: true),
              ],
            ),
            const SizedBox(height: 24), // Reduced height here
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password",
                style: TextStyle(color: Colors.black), // Changed text color
              ),
            ),
            const SizedBox(height: 24), // Reduced height here
            _buildButton(
              "Login",
              Color.fromARGB(255, 83, 136, 235),
              () {
                // Lakukan autentikasi atau validasi login di sini
                // Setelah berhasil, navigasikan ke halaman beranda
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TampilanHalaman(), // Ganti HomePage dengan halaman beranda Anda
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, TextEditingController controller,
      {isPass = false}) {
    return Container(
      padding: const EdgeInsets.all(8), // Reduced padding here
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), // Match the border radius with the previous container
          topRight: Radius.circular(30), // Match the border radius with the previous container
          bottomLeft: Radius.circular(30), // Match the border radius with the previous container
          bottomRight: Radius.circular(30), // Match the border radius with the previous container
        ),
        border: Border.all(color: Colors.blue), // Tambahkan warna border
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue), // Tambahkan ikon dengan warna biru
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Color.fromARGB(255, 94, 94, 94)),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.black),
              obscureText: isPass,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      String buttonText, Color color, Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 2,
        backgroundColor: color,
        minimumSize: const Size.fromHeight(40),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
