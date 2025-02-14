import 'package:flutter/material.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //jika menggunakan push
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => Beranda()));
                  Navigator.pushNamed(context, "/beranda");
                },
                child: Text("Ke Halaman Berada")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/username_sm");
                },
                child: Text("Ke Halaman Username")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/hobi");
                },
                child: Text("Ke Halaman Hobi")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/homescreen");
                },
                child: Text("Ke Halaman HomeScreen")),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
