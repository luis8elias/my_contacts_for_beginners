import 'dart:math';

import 'package:flutter/material.dart';
import '/data/my_contacts.dart';
import '/widgets/add_contact_bottom_sheet.dart';
import '/widgets/contact_tile.dart';


class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFEDEFF4),
      appBar: AppBar(
        title: const Text(
          'Contactos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              scaffoldKey.currentState!.showBottomSheet((context) =>  AddContactBottomSheet(
                saveAction: (contact) {
                  setState(() {
                    MyContacts.addContact(contact: contact);
                  });
                },
              ));
            },
            icon: const Icon(
              Icons.add_outlined,
            ),
            splashRadius: 20,
          ),
        ]
      ),
      body: SafeArea(
        child: MyContacts.getContacts().isEmpty ?
         const Center(
          child: Text('No hay contactos por mostrar'),
         )
        :
         SingleChildScrollView(
          child:  Padding(
            padding: const  EdgeInsets.all(10),
            child: Column(
              children: MyContacts.getContacts().map((contact) {
                final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                return ContactTile(
                  contact: contact,
                  color: color,
                  onPressed: (){
                    setState(() {
                      MyContacts.deleteCotact(id: contact.id);
                    });
                  }
                );
              }).toList()
            ),
          ),
        ),
      ),
    );
  }
}