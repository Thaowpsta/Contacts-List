import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/contact_model.dart';
import '../providers/contact_provider.dart';

class EditContact extends StatelessWidget {

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();

  final String name, email, number;
  final int? index;

  final bool isEditing;

  EditContact({super.key, required this.isEditing, this.name = 'Name', this.email = 'Email', this.number = 'Number', this.index });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          isEditing ? 'Edit Contact' : 'Add Contact',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: name,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // Maintain rounded corners on focus
                  borderSide: BorderSide(
                    color: Colors.lightBlue.shade800,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: TextField(
              controller: numberController,
              decoration: InputDecoration(
                  labelText: number, border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                )
              ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.lightBlue.shade800,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: email,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  )
              ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.lightBlue.shade800,
                      width: 2.0,
                    ),
                  ),
              ),

            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
                onPressed: (){

              ContactModel contact = ContactModel(
                name,
                number,
                email,
              );

              if (isEditing && index != null) {
                Provider.of<ContactProvider>(context, listen: false)
                    .updateContact(index!, contact);
              } else {
                Provider.of<ContactProvider>(context, listen: false)
                    .addContact(contact);
              }

              Navigator.pop(context);
            },
                child: const Text('Save Contact')),
          )
        ],
      ),
    );
  }
}
