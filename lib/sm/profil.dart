import 'package:day_3/provider/username.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Profil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Menerima inputan yang dikirim dan disimpan di provider
            Consumer<UsernameProvider>(builder: (builder, uProvider, child) {
              return Text(uProvider.nama ?? "Profil");
              //return Text(uProvider.nama ?? "Kosong");
            }),
          ],
        ),
      ),
    );
  }
}
