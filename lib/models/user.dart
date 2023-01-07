import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject{
  @HiveField(0)
  String username;
  @HiveField(1)
  double total_amount;
  @HiveField(2)
  String pathImage_avatar;
  @HiveField(3)
  String bank_name;

  User(this.username, this.total_amount, this.pathImage_avatar,this.bank_name);

  void setUsername(String u)=> this.username=u;
  void setAmount(double t)=> this.total_amount=t;
  void setAvatar(String path)=> this.pathImage_avatar=path;
  void setBankName(String bankname)=> this.bank_name=bankname;
}