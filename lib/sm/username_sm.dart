import 'package:day_3/provider/username.dart';
import 'package:day_3/sm/profil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsernameSM extends StatelessWidget {
  const UsernameSM({super.key});

  @override
  Widget build(BuildContext context) {
    //membuat variabel text controller
    TextEditingController tc = TextEditingController();
    //membuat variabel yang nantinya digunakan
    final uProvider = Provider.of<UsernameProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Using State Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //menampilkan inputan yang sudah diinputkan
            //Text("Kosong")
            //Mencetak data yang dikirim ke provide
            Consumer<UsernameProvider>(builder: (builder, uProvider, child) {
              return Text(uProvider.nama == null
                  ? "Selamat Datang"
                  : "Hallo ${uProvider.nama}");
              //return Text(uProvider.nama ?? "Kosong");
            }),
            TextField(
              controller: tc,
              decoration: InputDecoration(
                label: Text("Masukkan Nama"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                //onPressed: () => _setUsername(tc.text),
                onPressed: () {
                  //impor provider dengan menekan control+spasi
                  //mengirim nilai ke provider
                  uProvider.setUsername(tc.text);
                  print("Nama anda ${tc.text}");
                },
                child: Text("Submit")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                //onPressed: () => _setUsername(tc.text),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profil()),
                  );
                },
                child: Text("Pindah Halaman Profil")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                //onPressed: () => _setUsername(tc.text),
                onPressed: () {
                  //mengirim pesan ke kelas UsernameProvider di flashUsername
                  uProvider.flushUsername();
                  print("Nama Terhapus");
                },
                child: Text("Hapus"))
          ],
        ),
      ),
    );
  }
}
