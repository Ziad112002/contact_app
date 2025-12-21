import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class ContactModel extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String imagePath;

  ContactModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.imagePath,
  });
}