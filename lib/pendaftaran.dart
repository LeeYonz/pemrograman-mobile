import 'package:flutter/material.dart';
import 'package:aplikasi_pertukaran_pelajar/tampilan halaman.dart';

class PendaftaranPage extends StatefulWidget {
  const PendaftaranPage({Key? key}) : super(key: key);

  @override
  _PendaftaranPageState createState() => _PendaftaranPageState();
}

class _PendaftaranPageState extends State<PendaftaranPage> {
  late TextEditingController namaController, emailController, universitasController, nomorTeleponController;

  @override
  void initState() {
    namaController = TextEditingController();
    emailController = TextEditingController();
    universitasController = TextEditingController();
    nomorTeleponController = TextEditingController(); // inisialisasi nomorTeleponController
    super.initState();
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    universitasController.dispose();
    nomorTeleponController.dispose(); // dispose nomorTeleponController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendaftaran Pertukaran Mahasiswa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Formulir Pendaftaran',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField("Nama", namaController),
            SizedBox(height: 20),
            _buildTextField("Email", emailController),
            SizedBox(height: 20),
            _buildTextField("Universitas", universitasController),
            SizedBox(height: 20),
            _buildTextField("Nomor Telepon", nomorTeleponController), // tambahan untuk nomor telepon
            SizedBox(height: 20),
            _buildButton("Daftar", Colors.blue, () {
              _showDialog(context); // Panggil fungsi _showDialog() dengan context
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildButton(String text, Color color, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        minimumSize: Size(double.infinity, 0),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  // Fungsi untuk menampilkan pop-up
  void _showDialog(BuildContext context) {
    String nama = namaController.text;
    String email = emailController.text;
    String universitas = universitasController.text;
    String nomorTelepon = nomorTeleponController.text;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pendaftaran Berhasil"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Terima kasih atas pendaftarannya."),
              SizedBox(height: 10),
              Text("Berikut adalah informasi yang Anda daftarkan:"),
              SizedBox(height: 10),
              Text("Nama: $nama"),
              Text("Email: $email"),
              Text("Universitas: $universitas"),
              Text("Nomor Telepon: $nomorTelepon"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.push( // Navigasi ke halaman lain
                  context,
                  MaterialPageRoute(builder: (context) => TampilanHalaman()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
