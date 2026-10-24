import 'package:flutter/material.dart';
import 'package:pml/data/barang.dart';
import 'package:pml/domain/barang.dart';
import 'package:pml/widgets/item_barang_widget.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  // Variabel untuk menampung hasil filter pencarian
  List<Barang> _hasilPencarian = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Awal buka, tampilkan semua barang
    _hasilPencarian = list_barang;
  }

  // Fungsi untuk memfilter daftar barang berdasarkan input pencarian
  void _cariBarang(String query) {
    setState(() {
      if (query.isEmpty) {
        _hasilPencarian = list_barang;
      } else {
        _hasilPencarian = list_barang
            .where((barang) =>
                barang.nama_barang.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marketplace"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Kotak Pencarian (Search Bar) di atas
            TextField(
              controller: _searchController,
              onChanged: _cariBarang,
              decoration: InputDecoration(
                hintText: "Cari kebutuhan dapur atau buah...",
                prefixIcon: const Icon(Icons.search, color: Colors.blue),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _cariBarang('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Grid Produk Kotak-kotak
            Expanded(
              child: _hasilPencarian.isEmpty
                  ? const Center(
                      child: Text(
                        "Barang tidak ditemukan",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : GridView.builder(
                      itemCount: _hasilPencarian.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 kolom grid
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final barang = _hasilPencarian[index];
                        return ItemBarangWidget(barang: barang);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}