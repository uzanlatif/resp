import 'package:flutter/material.dart';
import 'package:genshin_responsi/view/weapons_page.dart';
import 'package:genshin_responsi/view/character_page.dart';

void main() {
  runApp(const MaterialApp(
    title: 'homepage',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://cdn.statically.io/img/www.acerid.com/f=auto%2Cq=80/wp-content/uploads/2021/05/thumbnail-Mengenal-Karakter-Genshin-Impact-yang-Paling-Tangguh.jpg'
            ), fit: BoxFit.cover,

          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>CharacterPage()));
                },
                child: Text('Characters'),
            ),
            SizedBox(height: 20,width: 1000,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>WeaponsPage()));
              },
              child: Text('Weapons'),
            ),
          ],
        ),
      )
    );
  }
}
