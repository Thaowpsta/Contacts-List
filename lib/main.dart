import 'package:assignment18/data/models/contact_model.dart';
import 'package:assignment18/pages/edit_contact.dart';
import 'package:assignment18/pages/home.dart';
import 'package:assignment18/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ContactModelAdapter());
  await Hive.openBox<ContactModel>('contact_box');
  runApp(ChangeNotifierProvider(create: (context) => ContactProvider(), child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {
        '/editContact' : (context) => EditContact(isEditing: true,),
        '/addContact' : (context) => EditContact(isEditing: false,)
      },
    );
  }
}

