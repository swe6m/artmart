
import 'package:flutter/material.dart';

void main() {
  runApp(ArtMartApp());
}

class ArtMartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtMart',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: ArtGalleryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ArtGalleryPage extends StatelessWidget {
  final List<Map<String, String>> artworks = [
    {
      "title": "اللوحة الذهبية",
      "price": "1500 ريال",
      "image": "https://i.imgur.com/1YcO6S2.jpeg",
    },
    {
      "title": "زخارف عربية",
      "price": "2000 ريال",
      "image": "https://i.imgur.com/dwYv4IV.jpeg",
    },
    {
      "title": "الخيال الشرقي",
      "price": "1850 ريال",
      "image": "https://i.imgur.com/8XBN0Du.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("معرض اللوحات الفنية")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: artworks.length,
        itemBuilder: (context, index) {
          final art = artworks[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ArtDetailsPage(artwork: art),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      art['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(art['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(art['price']!, style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ArtDetailsPage extends StatelessWidget {
  final Map<String, String> artwork;

  ArtDetailsPage({required this.artwork});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(artwork['title']!)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              artwork['image']!,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(artwork['title']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(artwork['price']!, style: TextStyle(fontSize: 20, color: Colors.indigo)),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("اتصل بالبائع"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
