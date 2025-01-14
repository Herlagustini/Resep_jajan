import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api.dart'; // File ini berisi BaseUrl yang disesuaikan dengan kebutuhan
import 'resep.dart'; // Halaman daftar jajanan

class Buatakunbaru extends StatefulWidget {
  const Buatakunbaru({Key? key}) : super(key: key);

  @override
  State<Buatakunbaru> createState() => _BuatakunbaruState();
}

class _BuatakunbaruState extends State<Buatakunbaru> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  void _Buatakunbaru() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        alamatController.text.isNotEmpty &&
        imageController.text.isNotEmpty) {
      try {
        final response =
            await http.post(Uri.parse(BaseUrl.buatakunbaru), body: {
          'username': usernameController.text,
          'password': passwordController.text,
          'email': emailController.text,
          'alamat': alamatController.text,
          'image': imageController.text,
        });

        if (response.statusCode == 201) {
          final data = json.decode(response.body);
          if (data != null) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Berhasil"),
                content: const Text('Buatakunbaru Berhasil'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Tutup dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Resep(),
                        ),
                      ); // Pindah ke halaman daftar jajanan
                    },
                    child: const Text("Oke"),
                  ),
                ],
              ),
            );
          }
        } else {
          _showErrorDialog('Buatakunbaru Gagal');
        }
      } catch (e) {
        _showErrorDialog('Terjadi kesalahan. Coba lagi nanti.');
      }
    } else {
      _showErrorDialog('Semua field harus diisi.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Gagal"),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buatakunbaru',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 2,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Buat Akun Baru',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: usernameController,
                      label: 'Username',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: passwordController,
                      label: 'Password',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: emailController,
                      label: 'Email',
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: alamatController,
                      label: 'Alamat',
                      icon: Icons.location_on,
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: imageController,
                      label: 'Image URL',
                      icon: Icons.image,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: _Buatakunbaru,
                        icon: const Icon(Icons.person_add),
                        label: const Text('Buat Akun Baru'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
