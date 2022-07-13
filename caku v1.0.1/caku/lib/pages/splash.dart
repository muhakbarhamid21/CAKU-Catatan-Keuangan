// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:caku/controllers/db_helper.dart';
import 'package:caku/pages/add_name.dart';
import 'package:caku/pages/homepage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {

/*
Halo kakak reviewer. Semoga dibaca.
Kemarin saya sudah mengubah StategulWidget-nya jadi StatelessWidget.
Tapi setelah diubah, terdapat beberapa class atau function yang tidak mau jalan,
seperti pada getName() dan context pada Navigator.of(context).pushReplacement.
Maka yang terjadi program akan tetap stuck pada splash screen dan tidak bisa masuk ke dalam menu selanjutnya.
Sedangkan class atau function tersebut berfungsi untuk mengecek apakah variabel "name" sudah terisi atau belum.
Jika belum akan diminta untuk menginput variabel "name", jika sudah akan diarahkan ke Homepage.
Mohon izin untuk koreksi. Terima kasih.
 */

  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    getName();
  }

  Future getName() async {
    String? name = await dbHelper.getName();
    if (name != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AddName(),
        ),
      );
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      //
      // backgroundColor: Color(0xffe2e7ef),
      //
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(
              12.0,
            ),
          ),
          padding: EdgeInsets.all(
            16.0,
          ),
          child: Image.asset(
            "assets/caku.png",
            width: 64.0,
            height: 64.0,
          ),
        ),
      ),
    );
  }
}
