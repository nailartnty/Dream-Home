import 'package:floapp/consts.dart';
import 'package:floapp/ui/splash/components/body.dart';
import 'package:flutter/material.dart';

// somthing important
void main() {
  runApp(const FloApp());
}

// tdak akan berubah-ubah
class FloApp extends StatelessWidget {
  const FloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // disable banner

      // untuk mengetahui ini tuh app apa sih
      title: 'Finditior', //  judul aplikasi (yang biasa ada di bawah logo aplikasi dilayar hp)
      theme: ThemeData( // mengeset thema apakah dia dark atau light
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Muli', // negset fontnya
        visualDensity: VisualDensity.adaptivePlatformDensity, // buat dia responsive
        // kita bisa memodify text nya seperti apa
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: textColor
          ),
          
          bodySmall: TextStyle(
            color: textColor
          ),
        )
      ),
      home: const Body(),
    );
  }
}

// NOTE's

// _methodNmae = method Extac
// MethodeName = Widget Extrac (memisahkan widget dari logic)
// _BodyState = Class
// PageView = buat geser2
// color di dart pake ARGB
// textspan itu dipakai ketika kita ingin mengambil data dari api, dia lebih komplex dari text biasa (subclass dari RichText())
// karena const itu static (tidak berubah-ubah)
// kita pake string interpolition kalau kita mau panggil object dari model ke dalam string
// pake if else di statefull kita harus menginisialisasikan dlu pake setstate(), tapi kalau kita pake  stateless kita tidak perlu menginisialisasikan dlu pake setstate() tinggal pake if elsenya langsung
// Media Query itu buat kelas yang digunakan untuk membuat tata letak yang responsif.

