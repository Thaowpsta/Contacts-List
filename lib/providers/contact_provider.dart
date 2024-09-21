import 'package:assignment18/data/models/contact_model.dart';
import 'package:flutter/cupertino.dart';

import '../data/contact_database.dart';

class ContactProvider with ChangeNotifier{

  final _contactDb = ContactDatabase();

  List get contactList => _contactDb.contactList;

  void loadData(){
    _contactDb.loadData();
    notifyListeners();
  }

  void addContact(ContactModel contact){
    _contactDb.addContact(contact);
    notifyListeners();
  }

  void updateContact(int index, ContactModel contact){
    _contactDb.updateContact(index, contact);
    notifyListeners();
  }

  void deleteContact(int index){
    _contactDb.deleteContact(index);
    notifyListeners();
  }

}