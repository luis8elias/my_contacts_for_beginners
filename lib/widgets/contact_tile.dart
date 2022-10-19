import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '/models/contact.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.contact,
    required this.onPressed,
    required this.color
  });

  final Contact contact;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          contact.name[0],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      trailing: Row(
        mainAxisSize: 
        MainAxisSize.min,
        children: [
          IconButton(
            splashRadius: 20,
            onPressed: (){
              launchUrlString('tel: //${contact.phone}');
            },
            icon: const Icon(
              Icons.call_outlined,
              color: Colors.lightGreen,
            ),
          ),
           IconButton(
            splashRadius: 20,
            onPressed: onPressed,
            icon: const Icon(
              Icons.delete_outlined,
            ),
          ),
        ],
      ),
      title: Text(
        contact.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(contact.phone),
    );
  }
}