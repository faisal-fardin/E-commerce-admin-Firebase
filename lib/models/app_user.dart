
import 'package:adminapps/models/address_model.dart';
import 'package:adminapps/utlis/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_user.freezed.dart';
part 'app_user.g.dart';


@unfreezed
class AppUser with _$AppUser {
  @JsonSerializable(explicitToJson: true)
  factory AppUser({
    required String id,
    required String email,
    @TimeStampConverter() required Timestamp userCreationTime,
    AddressModel? userAddress,
    String? displayName,
    String? phoneNumber,
    String? photoUrl,

 }) = _AppUser;

  factory AppUser.fromJson(Map<String,dynamic> json) =>
      _$AppUserFromJson(json);

}