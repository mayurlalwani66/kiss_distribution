// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T, TRequest> _$BaseResponseFromJson<T, TRequest>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  TRequest Function(Object? json) fromJsonTRequest,
) =>
    BaseResponse<T, TRequest>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      status: json['status'] as String?,
      hasError: json['hasError'] as bool?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => MessageData.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryString: json['queryString'] as Map<String, dynamic>?,
    )..request = _$nullableGenericFromJson(json['request'], fromJsonTRequest);

Map<String, dynamic> _$BaseResponseToJson<T, TRequest>(
  BaseResponse<T, TRequest> instance,
  Object? Function(T value) toJsonT,
  Object? Function(TRequest value) toJsonTRequest,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'status': instance.status,
      'hasError': instance.hasError,
      'errors': instance.errors,
      'request': _$nullableGenericToJson(instance.request, toJsonTRequest),
      'queryString': instance.queryString,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

MessageData _$MessageDataFromJson(Map<String, dynamic> json) => MessageData(
      type: json['type'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MessageDataToJson(MessageData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
    };

PaginatedResponse<P> _$PaginatedResponseFromJson<P>(
  Map<String, dynamic> json,
  P Function(Object? json) fromJsonP,
) =>
    PaginatedResponse<P>(
      data: _$nullableGenericFromJson(json['data'], fromJsonP),
      pageLength: (json['pageLength'] as num?)?.toInt(),
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      totalEntityCount: (json['totalEntityCount'] as num?)?.toInt(),
      totalPageCount: (json['totalPageCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginatedResponseToJson<P>(
  PaginatedResponse<P> instance,
  Object? Function(P value) toJsonP,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonP),
      'pageLength': instance.pageLength,
      'pageNumber': instance.pageNumber,
      'totalEntityCount': instance.totalEntityCount,
      'totalPageCount': instance.totalPageCount,
    };

BaseFilterRequest _$BaseFilterRequestFromJson(Map<String, dynamic> json) =>
    BaseFilterRequest(
      pageCount: (json['pageCount'] as num?)?.toInt(),
      pageNo: (json['pageNo'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 30,
      search: json['search'] as String?,
      sortOrder: json['sortOrder'] as String? ?? 'desc',
      sortBy: json['sortBy'] as String?,
      filterBy: json['filterBy'] as String?,
    );

Map<String, dynamic> _$BaseFilterRequestToJson(BaseFilterRequest instance) =>
    <String, dynamic>{
      'pageCount': instance.pageCount,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'search': instance.search,
      'sortOrder': instance.sortOrder,
      'sortBy': instance.sortBy,
      'filterBy': instance.filterBy,
    };

SettingValueResponse _$SettingValueResponseFromJson(
        Map<String, dynamic> json) =>
    SettingValueResponse(
      json['controlKey'] as String?,
      json['value'] as String?,
      $enumDecodeNullable(_$SettingValueTypeEnumMap, json['valueType']),
    );

Map<String, dynamic> _$SettingValueResponseToJson(
        SettingValueResponse instance) =>
    <String, dynamic>{
      'controlKey': instance.controlKey,
      'value': instance.value,
      'valueType': _$SettingValueTypeEnumMap[instance.valueType],
    };

const _$SettingValueTypeEnumMap = {
  SettingValueType.string: 'string',
  SettingValueType.number: 'number',
  SettingValueType.boolean: 'boolean',
  SettingValueType.date: 'date',
  SettingValueType.Null: 'Null',
  SettingValueType.nan: 'nan',
  SettingValueType.array: 'array',
  SettingValueType.object: 'object',
  SettingValueType.undefined: 'undefined',
};

ListIdNameModel _$ListIdNameModelFromJson(Map<String, dynamic> json) =>
    ListIdNameModel(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['iconName'] as String?,
      json['isSelected'] as bool?,
    );

Map<String, dynamic> _$ListIdNameModelToJson(ListIdNameModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconName': instance.iconName,
      'isSelected': instance.isSelected,
    };
