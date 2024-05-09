import 'package:flutter/material.dart';
import 'package:aplikasi_pertukaran_pelajar/loginpage.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 18, 0, 119), Colors.white], // Gradien dari ungu ke putih
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: ListView(
              children: [
                _header(context),
                _buildSignUpForm(context),
                _loginInfo(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: null, // Hapus bottom bar
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Text(
          "Aplikasi Pertukaran Mahasiswa",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white), // Teks berwarna putih
        ),
        Text("Create Account", style: TextStyle(color: Colors.white)), // Teks berwarna putih
        Text("Enter details to get started", style: TextStyle(color: Colors.white)), // Teks berwarna putih
      ],
    );
  }

  Widget _buildSignUpForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField("Username", Icons.person, context),
            SizedBox(height: 10),
            _buildTextField("Email id", Icons.email_outlined, context),
            SizedBox(height: 10),
            _buildTextField("Password", Icons.password_outlined, context, isPassword: true),
            SizedBox(height: 10),
            _buildTextField("Retype Password", Icons.password_outlined, context, isPassword: true),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, BuildContext context, {bool isPassword = false}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
        filled: true,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))), // Teks berwarna putih
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginPage()));
          },
          child: Text("Login", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))), // Teks berwarna putih
        )
      ],
    );
  }
}
