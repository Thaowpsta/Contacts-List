
import 'package:assignment18/data/models/contact_model.dart';
import 'package:hive_flutter/adapters.dart';

class ContactDatabase{

  final _contactBox = Hive.box<ContactModel>('contact_box');
  List<ContactModel> contactList = [];

  void loadData(){
    contactList = _contactBox.values.toList();
  }

  void addContact(ContactModel contact){
    _contactBox.add(contact);
    loadData();
  }

  void updateContact(int index, ContactModel contact){
    _contactBox.putAt(index, contact);
    loadData();
  }

  void getInitial(ContactModel contact){
    contact.name[0];
  }

  void deleteContact(int index) {
    _contactBox.deleteAt(index);
    loadData();
  }

}