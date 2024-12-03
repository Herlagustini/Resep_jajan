import 'package:flutter/material.dart';
import 'package:resep_jajan_tradisional/resep.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resep Jajan Tradisional',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          headline6: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
          subtitle1: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Data dari mock API
  final List<Map<String, dynamic>> recipes = [
    {
      "id": 1,
      "nama": "Klepon",
      "deskripsi":
          "Klepon adalah kue tradisional berbentuk bola kecil yang terbuat dari tepung ketan.",
      "bahan": [
        "200 gram tepung ketan",
        "150 ml air hangat",
        "1/4 sendok teh garam",
        "Pewarna hijau (dari daun pandan/suji atau pewarna makanan)",
        "100 gram gula merah, serut halus",
        "100 gram kelapa parut, kukus sebentar dengan sedikit garam"
      ],
      "cara_masak": [
        "Campur tepung ketan dengan air hangat, garam, dan pewarna hijau. Uleni hingga kalis.",
        "Ambil sedikit adonan, pipihkan, dan isi dengan gula merah. Bentuk menjadi bola kecil.",
        "Didihkan air, masukkan bola-klepon, dan masak hingga mengapung.",
        "Angkat dan gulingkan klepon dalam kelapa parut. Sajikan."
      ],
      "image":
          "https://cdn0-production-images-kly.akamaized.net/4dOsAjpaOZumjoxquorYgM1AlWc=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3265521/original/082336300_1602549870-istock-1145447456-copy_ratio-16x9.jpg"
    },
    {
      "id": 2,
      "nama": "Lemper",
      "deskripsi":
          "Lempe adalah camilan tradisional dari Bugis yang dibuat dari beras ketan dan kelapa.",
      "bahan": [
        "500 gram beras ketan putih, cuci bersih",
        "200 ml santan kelapa",
        "1/4 sendok teh garam",
        "Daun pisang untuk membungkus"
      ],
      "cara_masak": [
        "Rendam beras ketan selama 2 jam, kemudian kukus setengah matang.",
        "Masak santan dengan garam, aduk hingga mendidih.",
        "Campur santan ke dalam beras ketan, kukus hingga matang.",
        "Bungkus ketan matang dengan daun pisang, gulung, dan tekan hingga padat."
      ],
      "image":
          "https://img.kurio.network/TZkctc5PdbjhiJntNHAd_G5byyI=/1200x675/filters:quality(80)/https://kurio-img.kurioapps.com/21/08/26/92556137-05a1-4291-9330-685d6848bc67.jpe"
    },
    {
      "id": 3,
      "nama": "Serabi",
      "deskripsi":
          "Serabi adalah jajanan tradisional berbahan dasar tepung beras yang dimasak di atas tungku kecil.",
      "bahan": [
        "250 gram tepung beras",
        "500 ml santan kelapa, hangatkan",
        "1/4 sendok teh garam",
        "2 sendok makan gula pasir",
        "Ragi instan (1/2 sendok teh)"
      ],
      "cara_masak": [
        "Campur tepung beras, ragi, gula, dan santan, aduk rata.",
        "Diamkan adonan selama 1 jam hingga mengembang.",
        "Tuang adonan ke cetakan serabi, masak hingga matang.",
        "Sajikan dengan kuah kinca dari gula merah."
      ],
      "image":
          "https://cdn0-production-images-kly.akamaized.net/omX-FHF1nVzk6qvvn4rrJY2YlW8=/0x91:999x654/469x260/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3526762/original/077142100_1627703602-shutterstock_1912795159.jpg"
    },
    {
      "id": 4,
      "nama": "Onde-Onde",
      "deskripsi":
          "Onde-onde adalah jajanan tradisional berbentuk bulat dengan isian kacang hijau, dilapisi wijen.",
      "bahan": [
        "200 gram tepung ketan",
        "50 gram tepung beras",
        "150 ml air hangat",
        "100 gram kacang hijau kupas, rebus dan haluskan",
        "100 gram gula pasir",
        "50 gram wijen putih"
      ],
      "cara_masak": [
        "Campur tepung ketan, tepung beras, dan air hangat hingga kalis.",
        "Bentuk adonan menjadi bulatan kecil, pipihkan, dan isi dengan kacang hijau.",
        "Bentuk kembali menjadi bulatan dan gulingkan dalam wijen.",
        "Goreng hingga matang dan berwarna keemasan."
      ],
      "image":
          "https://asset.kompas.com/crops/2yTHcIhrPnB-8VL_7yrMOwmLzl8=/0x22:750x522/1200x800/data/photo/2020/12/21/5fe033ae033c1.jpg"
    },
    {
      "id": 5,
      "nama": "Dadar Gulung",
      "deskripsi":
          "Dadar Gulung adalah jajanan tradisional berupa pancake tipis berisi kelapa parut dan gula merah.",
      "bahan": [
        "200 gram tepung terigu",
        "2 butir telur",
        "200 ml santan",
        "1/4 sendok teh garam",
        "Pewarna hijau (opsional)",
        "Kelapa parut kasar, kukus",
        "100 gram gula merah serut halus"
      ],
      "cara_masak": [
        "Campur tepung terigu, telur, santan, garam, dan pewarna (jika menggunakan). Aduk rata.",
        "Panaskan wajan datar, olesi dengan sedikit minyak, dan tuang adonan tipis-tipis.",
        "Masak hingga matang dan angkat.",
        "Isi dadar dengan kelapa parut dan gula merah, gulung dan sajikan."
      ],
      "image":
          "https://img.inews.co.id/media/620/files/inews_new/2020/08/26/resep_dadar_gulung_pandan.jpg"
    },
    {
      "id": 6,
      "nama": "Getuk",
      "deskripsi":
          "Getuk adalah jajanan tradisional Jawa yang terbuat dari singkong yang dihaluskan dan diberi gula merah.",
      "bahan": [
        "500 gram singkong, kukus",
        "150 gram gula merah serut",
        "1/4 sendok teh garam",
        "Kelapa parut kasar"
      ],
      "cara_masak": [
        "Haluskan singkong yang telah dikukus.",
        "Campurkan gula merah serut dan garam, aduk rata.",
        "Bentuk adonan menjadi bentuk sesuai selera, taburi kelapa parut di atasnya."
      ],
      "image":
          "https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/06/26/foto-content-39-Abram-Arifin-1-2702611120.png"
    },
    {
      "id": 7,
      "nama": "Kue Cucur",
      "deskripsi":
          "Kue Cucur adalah kue tradisional berbentuk bundar dengan tekstur kenyal dan rasa manis, terbuat dari tepung beras.",
      "bahan": [
        "250 gram tepung beras",
        "200 ml air",
        "150 gram gula merah serut",
        "1/4 sendok teh garam",
        "Minyak goreng"
      ],
      "cara_masak": [
        "Campurkan tepung beras, air, gula merah, dan garam, aduk rata.",
        "Panaskan minyak dalam wajan datar, tuang adonan sedikit-sedikit.",
        "Goreng hingga kue cucur mengembang dan berwarna kecoklatan."
      ],
      "image":
          "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1608381798/m9eo6wdury4naaqxpcxw.jpg"
    },
    {
      "id": 8,
      "nama": "Kue Lapis",
      "deskripsi":
          "Kue Lapis adalah kue tradisional yang terdiri dari lapisan warna-warni berbahan dasar tepung beras.",
      "bahan": [
        "250 gram tepung beras",
        "50 gram tepung tapioka",
        "200 ml santan",
        "200 gram gula pasir",
        "Pewarna makanan (merah, hijau, dll.)"
      ],
      "cara_masak": [
        "Campur tepung beras, tepung tapioka, santan, dan gula pasir. Aduk hingga gula larut.",
        "Bagi adonan menjadi beberapa bagian, tambahkan pewarna makanan ke masing-masing bagian.",
        "Tuang satu lapisan adonan ke loyang, kukus selama 5 menit, kemudian tambahkan lapisan berikutnya. Ulangi hingga habis.",
        "Kukus selama 20 menit hingga matang. Dinginkan, kemudian potong-potong dan sajikan."
      ],
      "image":
          "https://asset-2.tstatic.net/jambi/foto/bank/images/resep-kue-lapis.jpg"
    },
    {
      "id": 9,
      "nama": "Wajik",
      "deskripsi":
          "Wajik adalah kue tradisional yang dibuat dari beras ketan dan gula merah, dengan tekstur legit.",
      "bahan": [
        "500 gram beras ketan, rendam 2 jam",
        "250 gram gula merah",
        "200 ml santan",
        "1/4 sendok teh garam"
      ],
      "cara_masak": [
        "Kukus beras ketan hingga setengah matang.",
        "Masak santan, gula merah, dan garam hingga larut dan mendidih.",
        "Campur beras ketan ke dalam campuran gula merah, masak hingga meresap.",
        "Kukus kembali selama 30 menit hingga matang. Cetak di loyang, dinginkan, dan potong-potong."
      ],
      "image":
          "https://statik.tempo.co/data/2022/04/19/id_1104039/1104039_720.jpg"
    },
    {
      "id": 10,
      "nama": "Putu Ayu",
      "deskripsi":
          "Putu Ayu adalah kue basah dengan lapisan kelapa parut di atasnya, berbahan dasar tepung terigu.",
      "bahan": [
        "200 gram tepung terigu",
        "200 ml santan",
        "2 butir telur",
        "150 gram gula pasir",
        "1/4 sendok teh garam",
        "Kelapa parut, kukus dengan sedikit garam",
        "Pewarna hijau (opsional)"
      ],
      "cara_masak": [
        "Kocok telur dan gula hingga mengembang.",
        "Tambahkan tepung terigu dan santan secara bergantian, aduk hingga rata. Tambahkan pewarna hijau jika diinginkan.",
        "Masukkan kelapa parut ke dalam cetakan, tuang adonan di atasnya.",
        "Kukus selama 20 menit hingga matang. Sajikan."
      ],
      "image":
          "https://asset.kompas.com/crops/4aRibqAryAAhqPMmEeCHLGcg3GU=/44x2:621x386/1200x800/data/photo/2020/12/11/5fd32a67ca9db.jpg"
    }
  ];
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = recipes
        .where((recipe) =>
            recipe['nama'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text('Resep Jajan Tradisional'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Cari resep favorit Anda...",
                prefixIcon: const Icon(Icons.search, color: Colors.green),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailPage(recipe: recipe),
                    ),
                  ),
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.greenAccent,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          child: Image.network(
                            recipe['image'] ?? '',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image,
                                    size: 100, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe['nama'],
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  recipe['deskripsi'] ??
                                      'Deskripsi tidak tersedia.',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
