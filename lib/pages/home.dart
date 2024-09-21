import 'package:assignment18/data/contact_database.dart';
import 'package:assignment18/pages/edit_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/contact_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final contactDb = ContactDatabase();
    contactDb.loadData();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Contacts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: contactDb.contactList.length,
          itemBuilder: (context, index) {
            final contact = contactDb.contactList[index];
            final initial = contact.name.isNotEmpty
                ? contact.name[0].toUpperCase()
                : '?';

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
              child: Dismissible(
                key: Key(contactDb.contactList[index].name),
                direction: DismissDirection.endToStart,
                onDismissed: (direction){
                  Provider.of<ContactProvider>(context, listen: false).deleteContact(index);
                },
                child: GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditContact(isEditing: true, name: contact.name, number: contact.number, email: contact.email,)));},
                  child: Card(
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 20,
                            child: Text(
                              initial,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                contact.number,
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.pushNamed(context, '/addContact');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
