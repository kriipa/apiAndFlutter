// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['_id'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['passwordConfirmation'] as String?,
      umId: json['umId'] as int? ?? 0,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'umId': instance.umId,
      '_id': instance.userId,
      'fname': instance.fname,
      'lname': instance.lname,
      'gender': instance.gender,
      'email': instance.email,
      'image': instance.image,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
    };
