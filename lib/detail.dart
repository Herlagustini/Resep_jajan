import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> recipe;

  const DetailPage({super.key, required this.recipe});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLiked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe['nama']),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe5f5e9), // Light greenish color
              Color(0xFFFDFBEF), // Soft cream color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Gambar Header
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20.0),
                    ),
                    child: Image.network(
                      widget.recipe['image'],
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.recipe['nama'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Tambahkan Icon Like dan Simpan
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Row(
                      children: [
                        // Icon Like
                        IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                        ),
                        // Icon Simpan
                        IconButton(
                          icon: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: isSaved ? Colors.yellow : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isSaved = !isSaved;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Deskripsi
                    Text(
                      widget.recipe['deskripsi'],
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                            height: 1.5,
                          ),
                    ),
                    const SizedBox(height: 24),
                    // Bahan-Bahan
                    ExpansionTile(
                      title: const Text(
                        "Bahan-Bahan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      initiallyExpanded: true,
                      children: widget.recipe['bahan']
                          .asMap()
                          .entries
                          .map<Widget>(
                            (entry) => ListTile(
                              leading: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.green,
                                child: Text(
                                  "${entry.key + 1}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              title: Text(
                                entry.value,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const Divider(thickness: 1),
                    // Cara Memasak
                    ExpansionTile(
                      title: const Text(
                        "Cara Memasak",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      initiallyExpanded: true,
                      children: widget.recipe['cara_masak']
                          .asMap()
                          .entries
                          .map<Widget>(
                            (entry) => ListTile(
                              leading: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.green,
                                child: Text(
                                  "${entry.key + 1}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              title: Text(
                                entry.value,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
