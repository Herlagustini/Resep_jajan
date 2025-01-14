import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api.dart';

class Tambahdata extends StatefulWidget {
  final VoidCallback onTambahdataAdded;

  Tambahdata({required this.onTambahdataAdded});

  @override
  _TambahdataState createState() => _TambahdataState();
}

class _TambahdataState extends State<Tambahdata> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _bahanController = TextEditingController();
  final TextEditingController _caraMasakController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {
      final newData = {
        "nama": _namaController.text,
        "deskripsi": _deskripsiController.text,
        "bahan": _bahanController.text.split(','), // Pisahkan bahan dengan koma
        "cara_membuat":
            _caraMasakController.text.split(','), // Sama dengan bahan
        "image": _imageController.text,
      };

      try {
        final response = await http.post(
          Uri.parse(BaseUrl.add),
          headers: {"Content-Type": "application/json"},
          body: json.encode(newData),
        );

        if (response.statusCode == 201) {
          widget.onTambahdataAdded();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data berhasil ditambahkan!')),
          );
          Navigator.pop(context);
        } else {
          throw Exception('Gagal menambahkan data');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Resep'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    const Center(
                      child: Text(
                        "Tambah Resep Baru",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Input Nama Resep
                    TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        labelText: 'Nama Resep',
                        prefixIcon: const Icon(Icons.food_bank),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Input Deskripsi
                    TextFormField(
                      controller: _deskripsiController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Deskripsi',
                        prefixIcon: const Icon(Icons.description),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Deskripsi tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Input Bahan
                    TextFormField(
                      controller: _bahanController,
                      decoration: InputDecoration(
                        labelText: 'Bahan (pisahkan dengan koma)',
                        prefixIcon: const Icon(Icons.list),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Bahan tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Input Cara Membuat
                    TextFormField(
                      controller: _caraMasakController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Cara Membuat (pisahkan dengan koma)',
                        prefixIcon: const Icon(Icons
                            .restaurant), // Ganti dengan ikon bawaan yang ada
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Cara Membuat tidak boleh kosong';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),
                    // Input URL Gambar
                    TextFormField(
                      controller: _imageController,
                      decoration: InputDecoration(
                        labelText: 'URL Gambar',
                        prefixIcon: const Icon(Icons.image),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'URL Gambar tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    // Tombol Simpan
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: _submitData,
                        icon: const Icon(Icons.save),
                        label: const Text('Simpan'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          backgroundColor: Colors.greenAccent,
                          textStyle: const TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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
}
