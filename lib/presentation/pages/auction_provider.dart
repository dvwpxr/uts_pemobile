import 'package:flutter/material.dart';

class AuctionProvider with ChangeNotifier {
  // Daftar lelang yang akan dikelola
  List<Map<String, String>> _auctions = [
    {
      'title': 'Lelang Mobil',
      'description': 'Mobil sedan dalam kondisi baik.',
      'image': 'assets/images/mobil.png'
    },
    {
      'title': 'Lelang Sepeda',
      'description': 'Sepeda gunung, jarang dipakai.',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Lelang Laptop',
      'description': 'Laptop gaming dengan spesifikasi tinggi.',
      'image': 'https://via.placeholder.com/150'
    },
  ];

  List<Map<String, String>> get auctions => _auctions;

  // Metode untuk menambah lelang baru (contoh)
  void addAuction(Map<String, String> auction) {
    _auctions.add(auction);
    notifyListeners();
  }
}
