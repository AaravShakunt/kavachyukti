import 'package:flutter/material.dart';
import 'contactManager.dart';
import 'new_Contact.dart';
import 'contact_List.dart';
import 'main.dart';

class contactView extends StatefulWidget {
  final ContactManager CM;
  const contactView({Key? key, required this.CM}) : super(key: key);
  // late ContactManager CM;
  // contactView(this.CM);

  @override
  State<contactView> createState() => _contactViewState();
}

class _contactViewState extends State<contactView> {
  void _addNewTransaction(String name, String number) {
    final newTx = {
      "name": name,
      "number": number,
    };
    setState(
      () {
        widget.CM.add_Contact(name, number);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewContact(_addNewTransaction),
        ContactList(widget.CM),
      ],
    );
  }
}
