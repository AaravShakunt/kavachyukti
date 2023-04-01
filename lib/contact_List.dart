import 'package:flutter/material.dart';
import 'contactManager.dart';

class ContactList extends StatelessWidget {
  late final ContactManager CM;

  ContactList(this.CM);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: CM.data.map(
        (tx) {
          return Card(
              child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                child: Text(
                  "\$${tx["number"].toString()}",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx["name"].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 17,
                    ),
                  ),
                  // Text(
                  //   DateFormat.yMMMd().format(tx.date),
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //     fontSize: 13,
                  //   ),
                  // ),
                ],
              )
            ],
          ));
        },
      ).toList(),
    );
  }
}
