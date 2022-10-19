import 'package:flutter/material.dart' show UniqueKey;
import '/models/contact.dart';

class MyContacts{

  static final _myContacts = [
    Contact(id: UniqueKey().toString(), name: 'Luis Elias', phone: '6331156042')
  ];

  static void deleteCotact({required String id}){
    _myContacts.removeWhere((element) => element.id == id);
  }

  static List<Contact> getContacts(){
    return _myContacts;
  }

  static void addContact({required Contact contact}){
    _myContacts.add(contact);
  }
  
}




