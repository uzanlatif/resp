import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:genshin_responsi/model/character_model.dart';
import 'package:genshin_responsi/controller/request.dart';
// import 'package:url_launcher/url_launcher.dart';

class CharacterDetail extends StatefulWidget {
  final String name;
  final String image;
  const CharacterDetail({ Key? key,
    required this.name,
    required this.image
  }) : super(key: key);

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _detailBody()
    );
  }

  Widget _detailBody() {
    return Container(
      child: FutureBuilder(
        future:  DataSource.instance.loadCharacter(widget.name),
        builder: (BuildContext context,
            AsyncSnapshot<dynamic> snapshot,) {

          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            CharacterModel charModel = CharacterModel.fromJson(snapshot.data);
            return _buildSuccessSection(charModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(CharacterModel data){
    String nation = '${data.nation}'.toLowerCase();
    String elements = '${data.vision}'.toLowerCase();

    return Scaffold(
        body: Center(
            child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child:CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage('https://api.genshin.dev/characters/${widget.name}/gacha-splash'),
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                    Container(
                    width: 50,
                    height: 50,
                    child: Image.network('https://api.genshin.dev/nations/'+nation+'/icon'),
                  ),
          Container(
                    width: 50,
                    height: 50,
                    child: Image.network('https://api.genshin.dev/elements/'+elements+'/icon'),
                     ),
                    Text('${data.name}',
                    style: TextStyle(
                    fontSize: 18.0
                    )
                        ),
                      ],

                  ),


                  Text('${data.description}',
                      style: TextStyle(
                          fontSize: 18.0
                      )
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.network('https://api.genshin.dev/characters/${widget.name}/talent-na'),
                      ),
                      Text(data.skillTalents![0].description.toString()),
                    ]

                  )

                ]
            )
        )
    );
  }
}