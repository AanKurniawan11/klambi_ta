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
          Text(
            '1. Cara Memesan Baju',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: ColorValue.kSecondary,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'a. Design Sendiri:',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: ColorValue.kBlack,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '- Pertama pilih baju polosan yang anda inginkan sesuai dengan kategori.\n'
                '\n'
                '- Lalu pilih ukuran baju dan klik “tambah ke keranjang”.\n'
                '\n'
                '- Pergi ke Menu Profile lalu ke “Keranjang Saya”\n'
                '\n'
                '- Klik “Bayar”.\n'
                '\n'
                '- Jika sudah pernah mengisi alamat langsung bisa ke menu pembayaran dan jika ingin mengganti alamat bisa mengganti ke Menu Tentang Akun.\n'
                '\n'
                '- Jika belum isi alamat anda sesuai dengan lokasi rumah anda (Bisa lihat melalui Gmaps).\n'
                '\n'
                '- Lanjut ke proses pembayaran sampai pembayaran selesai.\n'
                '\n'
                '- Saat pembayaran sudah selesai akan diarahkan ke halaman Upload Design.\n'
                '\n'
                '- Upload Design Baju anda sesuai dengan template yang kami sediakan lalu Upload Design menggunakan format *PNG.\n'
                '\n'
                '- Pemesanan selesai dilakukan dan akan langsung kami proses.\n'
                '\n'
                '- Anda Bisa melihat status pengiriman pada menu History.\n'
                '\n'
                '- Paket sudah sampai dan KLambi anda siap dipamerkan.\n',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontSize: 16,
              color: ColorValue.kBlack,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'b. Menggunakan Jasa:',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: ColorValue.kBlack,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '- Pertama pilih produk yang berjudul “Baju Jasa Custom”.\n'
                '\n'
                '- Lalu lakukan langkah pembayara sama seperti design sendiri.\n'
                '\n'
                '- Pergi ke Menu Profile lalu ke “Keranjang Saya”\n'
                '\n'
                '- Jika sudah membayar maka pengguna akan diarahkan ke halaman chat admin KLambi.\n'
                '\n'
                '- Konsultasikan design yang anda inginkan bersama dengan admin.\n'
                '\n'
                '- Jika sudah deal maka baju akan diproses dan status masuk ke history pembelian.\n'
                '\n'
                '- Paket sudah sampai dan KLambi anda siap dipamerkan.\n',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontSize: 16,
              color: ColorValue.kBlack,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '2. Cara Me - Return Barang',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: ColorValue.kSecondary,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '- Jika paket KLambi anda sampai dan tidak sesuai dengan yang anda inginkan maka langsung pergi ke chat admin.\n'
                '\n'
                '- Komunikasi dengan admin dan pastikan anda mempunyai Video Unboxing Barang Yang Jelas.\n'
                '\n'
                '- Lalu admin akan memproses retur barang.\n'
                '\n'
                '- Jika sudah di ACC oleh admin silahkan anda membungkus dengan baik barang yang akan di retur dan jangan lupa menuliskan alamat yang sudah diberikan oleh admin.\n'
                '\n'
                '- pergi ke kurir terdekat untuk mengirim kembali barang yang akan di retur (biaya pengiriman retur ditanggung oleh pembeli).\n'
                '\n'
                '- Jika sudah deal maka baju akan diproses dan status masuk ke history pembelian.\n'
                '\n'
                '- Barang berhasil di retur dan uang akan dikembalikan setelah paket sudah sampai dan sama seperti video unboxing.\n',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontSize: 16,
              color: ColorValue.kBlack,
            ),
          ),
        ],
      ),
    );
  }
}