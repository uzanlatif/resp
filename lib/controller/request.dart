import 'package:genshin_responsi/controller/baseNetwork.dart';
import 'package:genshin_responsi/model/character_model.dart';
import 'package:genshin_responsi/model/weapons_model.dart';

class DataSource {
  static DataSource instance = DataSource();

  //request for weapons
  Future<Map<String, dynamic>> loadWeapons(name) {
    return BaseNetwork.get("weapons/${name}");
  }
  //request for character
  Future<Map<String, dynamic>> loadCharacter(name) {
    return BaseNetwork.get("characters/${name}");
  }

}