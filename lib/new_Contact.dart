import 'package:flutter/material.dart';
import 'contactView.dart';
import 'contactManager.dart';

class NewContact extends StatelessWidget {
  final nameController = TextEditingController();
  final Function addTx;
  final numberController = TextEditingController();

  NewContact(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Contact Number'),
              // onChanged: (val) {
              //   amountInput = val;
              // },
              controller: numberController,
            ),
            TextButton(
              onPressed: () {
                addTx(
                  nameController.text,
                  numberController.text,
                );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
