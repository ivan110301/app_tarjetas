import 'package:app_tarjetas/contact_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TemplateGalleryApp());
}

class TemplateGalleryApp extends StatelessWidget {
  const TemplateGalleryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Esta línea oculta el banner de "debug"
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff23202a),
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple[400],
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Color.fromARGB(179, 255, 255, 255),
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.grey[800]),
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      home: const ContactListPage(),
    );
  }
}
