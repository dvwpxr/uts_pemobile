import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auction_provider.dart';
import 'category/car_category_page.dart';
import 'category/motor_category_page.dart';
import 'category/jewelry_category_page.dart';
import 'category/property_category_page.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auctionProvider = Provider.of<AuctionProvider>(context);
    final auctions = auctionProvider.auctions;

    // Contoh data rekomendasi pelelangan
    final recommendedAuctions = [
      {
        'title': 'Perhiasan',
        'description': 'Cincin Berlian asli 1 karat.',
        'image': 'assets/images/perhiasan/berlian.png',
        'category': 'Perhiasan'
      },
      {
        'title': 'Mobil',
        'description': 'Mobil Mewah Hanya Untuk Kolektor dan Surat lengkap.',
        'image': 'assets/images/mobil/mobil.png',
        'category': 'Mobil'
      },
      {
        'title': 'Motor',
        'description': 'Motor R15 Mesin Masih baguss kilometer rendah',
        'image': 'assets/images/motor/r15.png',
        'category': 'Motor'
      },
    ];

    // Contoh kategori pelelangan
    final categories = [
      'Mobil',
      'Motor',
      'Perhiasan',
      'Properti',
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Rekomendasi Pelelangan
            Text(
              'Rekomendasi Pelelangan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 300, // Tinggi untuk bagian rekomendasi
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedAuctions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Aksi saat item direkomendasikan ditekan
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              recommendedAuctions[index]['image']!,
                              width: 350,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              recommendedAuctions[index]['title']!,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              recommendedAuctions[index]['description']!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Bagian Kategori Lelang
            Text(
              'Kategori Lelang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueAccent,
                  child: InkWell(
                    onTap: () {
                      // Navigasi ke halaman kategori yang sesuai
                      switch (categories[index]) {
                        case 'Mobil':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarCategoryPage(),
                            ),
                          );
                          break;
                        case 'Motor':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MotorCategoryPage(),
                            ),
                          );
                          break;
                        case 'Perhiasan':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JewelryCategoryPage(),
                            ),
                          );
                          break;
                        case 'Properti':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PropertyCategoryPage(),
                            ),
                          );
                          break;
                      }
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categories[index],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
