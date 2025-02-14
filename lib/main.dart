import 'package:day_3/page/beranda.dart';
import 'package:day_3/page/halaman_utama.dart';
import 'package:day_3/page/hobi.dart';
import 'package:day_3/page/login.dart';
import 'package:day_3/page/post_page.dart';
import 'package:day_3/page/provider.dart';
import 'package:day_3/provider/username.dart';
import 'package:day_3/sm/username.dart';
import 'package:day_3/sm/username_sm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//membungkus material App dengan provider
//untuk membuat variabel global
void main() {
  runApp(MultiProvider(
    providers: [
      //mendaftarkan provider yang sudah ada
      ChangeNotifierProvider(create: (context) => UsernameProvider()),
      ChangeNotifierProvider(create: (context) => PostProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //menentukan rute/link halaman. Digunakan ketika menggunakan PushNamed
        routes: {
          "/beranda": (context) => const Beranda(),
          "/username": (context) => const UsernamePage(),
          "/username_sm": (context) => const UsernameSM(),
          "/hobi": (context) => const HobiPage(),
          "/homescreen": (context) => const HomeScreen()
        },
        home: HalamanUtama());
  }
}
