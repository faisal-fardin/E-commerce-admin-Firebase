// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddresModelImpl _$$AddresModelImplFromJson(Map<String, dynamic> json) =>
    _$AddresModelImpl(
      streetAddress: json['streetAddress'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
    );

Map<String, dynamic> _$$AddresModelImplToJson(_$AddresModelImpl instance) =>
    <String, dynamic>{
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'zipcode': instance.zipcode,
    };
