// import 'package:furniturezoid/model/furniture.dart';
// import 'package:furniturezoid/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
part 'user.g.dart';

@Entity()
@JsonSerializable()
class User {
  @Id(assignable: true)
  int umId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? userId;
  String? fname;
  String? lname;
  String? gender;
  String? email;
  String? image;
  String? password;
  String? passwordConfirmation;

  User(
      { this.userId,
      this.fname,
      this.lname,
      this.gender,
      this.email,
      this.image,
      this.password,
      this.passwordConfirmation,
      this.umId = 0});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> tojson() => _$UserToJson(this);
}




// // flutter pub run build_runner build  --delete-conflicting-outputs

// @JsonSerializable()
// @Entity()
// class User {
//   @Id(assignable: true)
//   int uId;

//   @Unique()
//   @Index()
//   @JsonKey(name: '_id')
//   String? id;
//   String? fname;
//   String? lname;
//   String? email;
//   String? gender;
//   String? phone;
//   String? address;
//   String? password;

//   @JsonKey(name: 'profile')
//     Profile? profile;
//   // final furniture = ToOne<Furniture>();

//   User(this.fname, this.lname, this.email, this.gender, this.password,
//       {this.uId = 0});
// }

// import 'package:furniturezoid/model/profile.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:objectbox/objectbox.dart';

// part 'user.g.dart';

// @JsonSerializable()
// @Entity()
// class User {
//   @Id(assignable: true)
//   int? uid;

//   @Unique()
//   @Index()
//   @JsonKey(name: '_id')
//   String? id;
//   String? email;
//   String? password;
//   String? role;

//   @JsonKey(name: 'profile')
//   Profile? profile;

//   final userprofile = ToOne<Profile>();

//   User({
//     this.id,
//     this.email,
//     this.password,
//     this.role,
//     this.profile,
//     this.uid = 0,
//   });
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//   Map<String, dynamic> tojson() => _$UserToJson(this);
// }
