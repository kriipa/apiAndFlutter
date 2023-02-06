// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['_id'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      profileId: json['profileId'] as int? ?? 0,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'profileId': instance.profileId,
      '_id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'address': instance.address,
    };
