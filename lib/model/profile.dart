import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'profile.g.dart';

@JsonSerializable()
@Entity()
class Profile {
  @Id(assignable: true)
  int profileId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? id;

  String? fname;
  String? lname;
  String? email;
  String? gender;
  String? phone;
  String? address;

  Profile(
      {this.id,
      this.fname,
      this.lname,
      this.email,
      this.gender,
      this.phone,
      this.address,
      this.profileId = 0});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
