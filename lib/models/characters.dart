// ignore_for_file: non_constant_identifier_names

class Character {
  late int id;
  late String name;
  late String birthday;
  late List<String> occupation;
  late String img;
  late String status;
  late String nickName;
  late List<int> appearance;
  late String portrayed;
  late String category;
  late List better_call_saul_appearance;

  Character.fromJson(Map<String, dynamic> json) {
    id = json["char_id"];
    name = json['name'];
    occupation = json['occupation'];
    img = json['img'];
    status = json['status'];
    nickName = json['nickname'];
    appearance = json['appearance'];
    portrayed = json['portrayed'];
    category = json['category'];
    better_call_saul_appearance = json["better_call_saul_appearance"];
  }
}
