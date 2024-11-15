import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auction_provider.dart'; // Pastikan untuk mengimpor AuctionProvider
import '../auction_detail_page.dart';

class MotorCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuctionProvider>(context);

    // Contoh data lelang untuk kategori Motor
    final List<Map<String, String>> filteredAuctions = [
      {
        'title': 'Yamaha R15',
        'description': 'Motor sport dengan performa tinggi.',
        'image': 'assets/images/motor/r15.png'
      },
      {
        'title': 'Honda CB150R',
        'description': 'Motor naked bike dengan desain yang agresif.',
        'image': 'assets/images/motor/cb150r.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori: Motor'),
      ),
      body: ListView.builder(
        itemCount: filteredAuctions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AuctionDetailPage(auction: filteredAuctions[index]),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.network(
                    filteredAuctions[index]['image']!,
                    width: 550.0,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      filteredAuctions[index]['title']!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(filteredAuctions[index]['description']!),
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
