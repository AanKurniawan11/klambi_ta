import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';

class TextDetails extends StatelessWidget {
  const TextDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('1. Cara Memesan Baju'),
          _buildSubsectionTitle('a. Design Sendiri:'),
          _buildDetailsText(
              '- Pilih baju polosan, pilih ukuran, tambahkan ke keranjang, dan lanjut ke pembayaran.\n'
                  '- Isi alamat atau ganti alamat, lanjutkan hingga pembayaran selesai.\n'
                  '- Upload design sesuai template dan format PNG.\n'
                  '- Status pengiriman dapat dilihat pada menu History.'),
          _buildSubsectionTitle('b. Menggunakan Jasa:'),
          _buildDetailsText(
              '- Pilih produk “Baju Jasa Custom”.\n'
                  '- Lakukan pembayaran dan konsultasi design dengan admin melalui chat.\n'
                  '- Setelah deal, status pembelian masuk ke history.'),
          SizedBox(height: 20),
          _buildSectionTitle('2. Cara Me - Return Barang'),
          _buildDetailsText(
              '- Hubungi admin jika barang tidak sesuai dengan keinginan.\n'
                  '- Pastikan memiliki video unboxing yang jelas untuk klaim.\n'
                  '- Kirim kembali barang yang akan di-return sesuai instruksi admin.'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'General Sans',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: ColorValue.kSecondary,
        ),
      ),
    );
  }

  Widget _buildSubsectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'General Sans',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: ColorValue.kBlack,
        ),
      ),
    );
  }

  Widget _buildDetailsText(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'General Sans',
          fontSize: 16,
          color: ColorValue.kBlack,
        ),
      ),
    );
  }
}