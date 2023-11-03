// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddresModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  String get streetAddress => throw _privateConstructorUsedError;
  set streetAddress(String value) => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  set city(String value) => throw _privateConstructorUsedError;
  String get zipcode => throw _privateConstructorUsedError;
  set zipcode(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call({String streetAddress, String city, String zipcode});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streetAddress = null,
    Object? city = null,
    Object? zipcode = null,
  }) {
    return _then(_value.copyWith(
      streetAddress: null == streetAddress
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddresModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddresModelImplCopyWith(
          _$AddresModelImpl value, $Res Function(_$AddresModelImpl) then) =
      __$$AddresModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String streetAddress, String city, String zipcode});
}

/// @nodoc
class __$$AddresModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddresModelImpl>
    implements _$$AddresModelImplCopyWith<$Res> {
  __$$AddresModelImplCopyWithImpl(
      _$AddresModelImpl _value, $Res Function(_$AddresModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streetAddress = null,
    Object? city = null,
    Object? zipcode = null,
  }) {
    return _then(_$AddresModelImpl(
      streetAddress: null == streetAddress
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddresModelImpl implements _AddresModel {
  _$AddresModelImpl(
      {required this.streetAddress, required this.city, required this.zipcode});

  factory _$AddresModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddresModelImplFromJson(json);

  @override
  String streetAddress;
  @override
  String city;
  @override
  String zipcode;

  @override
  String toString() {
    return 'AddressModel(streetAddress: $streetAddress, city: $city, zipcode: $zipcode)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddresModelImplCopyWith<_$AddresModelImpl> get copyWith =>
      __$$AddresModelImplCopyWithImpl<_$AddresModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddresModelImplToJson(
      this,
    );
  }
}

abstract class _AddresModel implements AddressModel {
  factory _AddresModel(
      {required String streetAddress,
      required String city,
      required String zipcode}) = _$AddresModelImpl;

  factory _AddresModel.fromJson(Map<String, dynamic> json) =
      _$AddresModelImpl.fromJson;

  @override
  String get streetAddress;
  set streetAddress(String value);
  @override
  String get city;
  set city(String value);
  @override
  String get zipcode;
  set zipcode(String value);
  @override
  @JsonKey(ignore: true)
  _$$AddresModelImplCopyWith<_$AddresModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
