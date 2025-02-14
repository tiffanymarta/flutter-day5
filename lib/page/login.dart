import 'package:day_3/page/beranda.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          //Membuat posisi widget berada di tengah
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text("Halaman Login"),

            ElevatedButton(
                onPressed: () {
                  //jika menggunakan push
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => Beranda()));
                  Navigator.pushNamed(context, "/beranda");
                },
                child: Text("Ke Halaman Beranda"))
          ],
        ),
      ),
    );
  }
}
