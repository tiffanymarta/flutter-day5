import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HobiPage extends StatefulWidget {
  const HobiPage({super.key});

  @override
  State<HobiPage> createState() => _HobiPageState();
}

class _HobiPageState extends State<HobiPage> {
  String _hobby = "";
  String _hobbykey = "hobby";

//ini adalah contoh asyncronous
  Future<void> _getHobby() async {
    //by default sharepreferences ini adalah future jadi harus di awake
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _hobby = prefs.getString(_hobbykey) ?? "No Hobby Set";
    });
    print(_hobby);
  }

  Future<void> _setHobby(String newHobby) async {
    //by default sharepreferences ini adalah future jadi harus di awake
    final prefs = await SharedPreferences.getInstance();
    //ketika diarahkan ke .setString ada future
    //maka harus ditambahkan await
    await prefs.setString(_hobbykey, newHobby);
    //untuk mendapatkan nilai dari gethobby
    _getHobby();
    print(_hobby);
  }

//clear hobby
  Future<void> __clearHobby() async {
    //by default sharepreferences ini adalah future jadi harus di awake
    final prefs = await SharedPreferences.getInstance();
    //ketika diarahkan ke .setString ada future
    //maka harus ditambahkan await
    await prefs.remove(_hobbykey);
    _getHobby();
    //print(_hobby);
  }

  @override
  void initState() {
    super.initState();
    _getHobby();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tc = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Local Storage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_hobby),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  _setHobby("Bersepeda");
                },
                child: Text("Set Hobi")),
            SizedBox(height: 10),
            TextField(
              controller: tc,
              decoration: InputDecoration(
                label: Text("Masukkan Hobby disini"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  _setHobby(tc.text);
                },
                child: Text("Submit")),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  __clearHobby();
                },
                child: Text("Hapus"))
          ],
        ),
      ),
    );
  }
}
