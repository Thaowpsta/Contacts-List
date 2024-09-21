
import 'package:hive_flutter/hive_flutter.dart';

part 'contact_model.g.dart';
@HiveType(typeId: 0)
class ContactModel extends HiveObject{

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String number;

  @HiveField(2)
  final String email;

  ContactModel(this.name, this.number, this.email);
}