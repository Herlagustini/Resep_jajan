import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgLink =
        "https://stickershop.line-scdn.net/stickershop/v1/product/26714426/LINEStorePC/main.png?v=1";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 8,
      ),
      body: Container(
        color: Colors.teal.shade900,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Foto Profil Diklik")),
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(imgLink),
                    backgroundColor: Colors.teal.shade100,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Herla Gustini",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const Text(
                "22TI006",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  ProfileCard(
                    icon: Icons.location_on,
                    title: "Alamat",
                    subtitle: "Pujut, Lombok Tengah",
                  ),
                  ProfileCard(
                    icon: Icons.class_,
                    title: "Kelas",
                    subtitle: "TIA 1",
                  ),
                  ProfileCard(
                    icon: Icons.school,
                    title: "Prodi",
                    subtitle: "Teknik Informatika",
                  ),
                  ProfileCard(
                    icon: Icons.calendar_today,
                    title: "Semester",
                    subtitle: "5",
                  ),
                  ProfileCard(
                    icon: Icons.phone,
                    title: "WhatsApp",
                    subtitle: "081913089634",
                  ),
                  ProfileCard(
                    icon: Icons.facebook,
                    title: "Facebook",
                    subtitle: "gusti herla kusuma",
                  ),
                  ProfileCard(
                    icon: Icons.camera_alt,
                    title: "Instagram",
                    subtitle: "@gustiher",
                  ),
                  ProfileCard(
                    icon: Icons.music_note,
                    title: "TikTok",
                    subtitle: "@gustiherla",
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  "Terima kasih telah berkunjung. Selamat menikmati dan kunjungi kembali!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 36),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
