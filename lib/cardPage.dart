import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  List<Map<String, String>> cardsData = [
    {
      'title': 'Palm Strike',
      'description':
          'A palm strike is a simple and effective self defense technique. Strike with the heel of your palm, aiming for the nose, chin, or throat of your attacker.',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvuewZFarWhrAl_FMMEOmYrshA1J1Flm7-Es6e1G460A&usqp=CAU&ec=48665698',
    },
    {
      'title': 'Eye Gouge',
      'description':
          'An eye gouge can quickly disable an attacker. Use your fingers to strike or dig into the eyes of your attacker.',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvuewZFarWhrAl_FMMEOmYrshA1J1Flm7-Es6e1G460A&usqp=CAU&ec=48665698',
    },
    {
      'title': 'Elbow Strike',
      'description':
          'An elbow strike can be a powerful technique. Use the point of your elbow to strike the attacker in sensitive areas like the nose, chin, or ribs.',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvuewZFarWhrAl_FMMEOmYrshA1J1Flm7-Es6e1G460A&usqp=CAU&ec=48665698',
    },
    {
      'title': 'Knee Strike',
      'description':
          'A knee strike is a powerful self defense technique. Strike the attacker with your knee, aiming for the groin, stomach, or head.',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvuewZFarWhrAl_FMMEOmYrshA1J1Flm7-Es6e1G460A&usqp=CAU&ec=48665698',
    },
    {
      'title': 'Front Kick',
      'description':
          'A front kick can create distance between you and the attacker. Use the ball of your foot to strike the attacker in the stomach or groin.',
      'image': 'https://example.com/front-kick.jpg',
    },
    {
      'title': 'Side Kick',
      'description':
          'A side kick can be a powerful self defense technique. Strike the attacker with the heel of your foot, aiming for the knees, stomach, or head.',
      'image': 'https://example.com/side-kick.jpg',
    },
    {
      'title': 'Bear Hug Escape',
      'description':
          'If an attacker tries to bear hug you, use your elbows to strike the attacker in the ribs or kidneys. Then, quickly twist your body and escape.',
      'image': 'https://example.com/bear-hug-escape.jpg',
    },
    {
      'title': 'Hair Pull Escape',
      'description':
          'If an attacker grabs your hair, use one hand to pull their hand away while striking with your other hand. Then, quickly turn and run.',
      'image': 'https://example.com/hair-pull-escape.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cards Demo'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cardsData
                  .map((data) => Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.network(data['image']!),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                data['title']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(data['description']!),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
