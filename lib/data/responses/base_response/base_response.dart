import 'package:json_annotation/json_annotation.dart';

import '../../../app/functions.dart';
part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T, TRequest> {
  @JsonKey(name: "data")
  T? data;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "hasError")
  bool? hasError;
  @JsonKey(name: "errors")
  List<MessageData>? errors;

  TRequest? request;

  @JsonKey(name: "queryString")
  Map<String, dynamic>? queryString;

  BaseResponse(
      {required this.data,
      required this.status,
      required this.hasError,
      required this.errors,
      required this.queryString});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json,
          T Function(Object? json) fromJsonT,
          TRequest Function(Object? json) fromJsonTRequest) =>
      _$BaseResponseFromJson<T, TRequest>(json, fromJsonT, fromJsonTRequest);

  Map<String, dynamic> toJson() =>
      _$BaseResponseToJson(this, (d) => d, (d) => d);
}

@JsonSerializable()
class MessageData {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "message")
  String? message;

  MessageData({
    required this.type,
    required this.title,
    required this.message,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) =>
      _$MessageDataFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDataToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class PaginatedResponse<P> {
  @JsonKey(name: "data")
  P? data;
  @JsonKey(name: "pageLength")
  int? pageLength;
  @JsonKey(name: "pageNumber")
  int? pageNumber;
  @JsonKey(name: "totalEntityCount")
  int? totalEntityCount;
  @JsonKey(name: "totalPageCount")
  int? totalPageCount;

  PaginatedResponse({
    this.data,
    required this.pageLength,
    required this.pageNumber,
    required this.totalEntityCount,
    required this.totalPageCount,
  });

  factory PaginatedResponse.fromJson(
          Map<String, dynamic> json, P Function(Object? json) fromJsonP) =>
      _$PaginatedResponseFromJson<P>(json, fromJsonP);

  Map<String, dynamic> toJson() => _$PaginatedResponseToJson(this, (d) => d);
}

@JsonSerializable()
class BaseFilterRequest {
  @JsonKey(name: "pageCount")
  int? pageCount = 1;
  @JsonKey(name: "pageNo")
  int? pageNo = 1;
  @JsonKey(name: "pageSize")
  int? pageSize = 30;
  @JsonKey(name: "search")
  String? search = '';
  @JsonKey(name: "sortOrder")
  String? sortOrder = 'desc';
  @JsonKey(name: "sortBy")
  String? sortBy = '';
  @JsonKey(name: "filterBy")
  String? filterBy = '';

  BaseFilterRequest({
    this.pageCount,
    this.pageNo,
    this.pageSize = 30,
    this.search,
    this.sortOrder = 'desc',
    this.sortBy,
    this.filterBy,
  });

  factory BaseFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$BaseFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BaseFilterRequestToJson(this);
}

@JsonSerializable()
class SettingValueResponse {
  @JsonKey(name: "controlKey")
  String? controlKey;
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "valueType")
  SettingValueType? valueType;

  SettingValueResponse(this.controlKey, this.value, this.valueType);

  factory SettingValueResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingValueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SettingValueResponseToJson(this);
}

@JsonSerializable()
class ListIdNameModel {
  int? id;
  String? name;
  String? iconName;
  bool? isSelected;

  ListIdNameModel(this.id, this.name, this.iconName, this.isSelected);

  factory ListIdNameModel.fromJson(Map<String, dynamic> json) =>
      _$ListIdNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListIdNameModelToJson(this);
}
