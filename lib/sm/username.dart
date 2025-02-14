import 'package:flutter/material.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UsernamePage> {
  String? _nama;

  //buat fungsi untuk menyimpan nilai yang dimasukkan.
  //Parameter tidak harus sama dengan nama variabel yang dibuat
  //fungsi ini akan digunakan pada fungsi button
  void _setUsername(String? input) {
    //setiap setState() maka otomatis akan direfresh
    setState(() {
      _nama = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    //membuat variabel text controller
    TextEditingController tc = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("No State Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //menampilkan inputan yang sudah diinputkan
            Text(_nama ?? "Kosong"),
            TextField(
              controller: tc,
              decoration: InputDecoration(
                label: Text("Masukkan Nama"),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
                //onPressed: () => _setUsername(tc.text),
                onPressed: () {
                  //print(tc.text);
                  return _setUsername(tc.text);
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
