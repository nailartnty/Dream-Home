import 'package:floapp/consts.dart';
import 'package:floapp/ui/home/catalogue_screen.dart';
import 'package:floapp/ui/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

// yang bisa berubah ubah
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // nyimpan data, ()
  int currentPage = 0; // var screen yang aktif
  final PageController _pageController = PageController(); // bawaan flutter buat pindah halaman
  // buat list lagi untuk product slider
  // List<String> product = List.generate(
  //   10, (index) => "Product ${index + 1}"
  //   );

  // dasar pengambilan data dari API 
  List<Map<String, String>> splashData = [
    { // 0 index
      "text": "Welcome to Flo Shop, Lets buy with ME!",
      "image": "assets/images/splash1.png"
    },
    { // 1
      "text": "We do sell a various product \n around Jakarta Metroppolitan",
      "image": "assets/images/splash2.png"
    },
    { // 2
      "text": "Lets make a bigger changes through \n a better commerce app!",
      "image": "assets/images/splash1.png"
    }
  ];

  @override
  // WIDGET EXTACT memisahkan widget dari logic
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea( // widget yang memastikan bahwa konten aplikasi tidak tumpang tindih dengan area sistem seperti notch, status bar, atau area navigasi.
        child: Column(
        children: [
          Expanded(
               // mengisi kekosongan yg ada
              flex: 3, // kasih jarak 3 row dan coloum
              child: SizedBox(
                  width: double.infinity, // biar widthnya ketengah dengan titik koordinat 0.0
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView.builder( 
                        
                        controller: _pageController,
                        // ANIMASI 3DOTS
                        onPageChanged: (value) { // argumen value itu mewakili int
                          // initial state METHOD for stateful behaviour
                          setState(() { // prubahan state
                            currentPage = value;
                          });
                        },
                        // untuk manggil widget
                        itemCount: splashData.length, // buat ngitung berapa banyak data yang ada di list
                        itemBuilder: (context, index) => SplashContent( // context untuk mempresentasikan hal sekarang  // index itu karena kita pakenya list // item builder jembatan antara ui dan data
                            // bang operator soalnya kita udah data kita gak bkal null
                            // tapi kalau casenya pake api kita pake default value karena maybe suatu saat datanya bkal null atau tdak
                            text: splashData[index]["text"]!,
                            image: splashData[index]["image"]!)),
                  ))
              ),

          Expanded(
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,  // untuk mengatur posisi widget
              children:  
                List.generate( // untuk membuat list
                  splashData.length,  // berapa banyak data yang ada di list
                  (index) => _dotsIndicator(index: index) // method ini untuk membuat indicator / buat ngasillin dots sesuai dengan yang ada pada datanya
                )
            )
          ),
            
          // BUTTON
          Padding( // ngasih jarak kanan kiri atas bawah
            padding: const EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding
            ), 
            // mengisi ruang yang kosong
            child: SizedBox( // ngebuat spasi
              width: double.infinity,  // buat widget nya ke tengah dengan titik koordinat 0.0
              // buttonnya
              child: ElevatedButton( // button yg paling normal / yang belum ada stylingnya
                style: ElevatedButton.styleFrom( // styleFrom digunakan untuk mengubah beberapa properti seperti warna, bayangan, bentuk, dan padding tombol.
                  backgroundColor: primaryColor
                ),

                onPressed: () {
                  if (currentPage == splashData.length -1) { // kalau page kita sekarang == panjang data dia bakal kurang // setiap kita mendefinisikan index nya dari 0, kita tambahin -1 aja soalnya kalau datanya udah banyak, kita gak usah itung datanya lagi
                    // kode yg digunakan untuk navigasi(berpindah) antar halaman
                    Navigator.push( // push itu menggantikan halaman
                      context, //  context itu untuk mengambil halaman yang sedang berjalan
                      MaterialPageRoute( 
                        builder: (context) => const CatalogueScreen()  // halaman yang akan dituju
                        )
                      );
                  } else { // kalau belum dihalaman terakhir dia bakal ke hal. berikutnya dengan transisi
                    _pageController.animateToPage( 
                      currentPage + 1, 
                      duration: animationDuration, 
                      // kyak transisi gitu 
                      curve: Curves.ease
                    );
                  }
                },
                child: Text(
                  currentPage == splashData.length - 1 ? "start" : "Next",  // kalau sudah dihalaman terakhir maka tulis start, kalau belum tulis next
                  style: const TextStyle(
                    color: Colors.white
                  ),
                )
              ),
            ),
          )
      ],
    ),
  ));
}

  // kode untuk logika indicator dots
  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      width: currentPage == index ? 20 : 10,  // kalau indexnya sama dengan currentpage maka lebarnya 20, sama dia bakal primary
      height: 10,
      duration: animationDuration,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(5),
        // kyak if else aja sih (kalau dia dihal sekarang sama dengan index yang sedang jalan dia true)
        color: currentPage == index ? primaryColor : secondaryColor,
      ),
    );
  }
}

// _methodNmae = method Extac
// MethodeName = Widget Extrac (memisahkan widget dari logic)
// _BodyState = Class
// PageView = buat geser2