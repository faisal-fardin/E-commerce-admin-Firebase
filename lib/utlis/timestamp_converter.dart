

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimeStampConverter extends JsonConverter<Timestamp, Timestamp>{
  const TimeStampConverter();
  @override
  Timestamp fromJson(Timestamp json) => json;

  @override
  Timestamp toJson(Timestamp object) => object;



}