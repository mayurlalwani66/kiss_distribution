import 'dart:io';

import 'package:dio/dio.dart';

import 'failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  BAD_CERTIFICATE,
  DEFAULT,
}

class ErrorHandler implements Exception {
  late final Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleDioError(error);
    } else if (error is SocketException) {
      failure = DataSource.NO_INTERNET_CONNECTION.getFailure();
    } else if (error is FormatException) {
      failure = Failure(ResponseCode.DEFAULT, "Bad response format");
    } else if (error is Failure) {
      failure = error;
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.NO_INTERNET_CONNECTION.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.BAD_CERTIFICATE.getFailure();
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final dynamic data = error.response?.data;

        String serverMessage = data is Map && data.containsKey('message')
            ? data['message'].toString()
            : ResponseMessage.DEFAULT;

        switch (statusCode) {
          case ResponseCode.BAD_REQUEST:
            return Failure(statusCode!, serverMessage);
          case ResponseCode.UNAUTHORISED:
            return Failure(statusCode!, serverMessage);
          case ResponseCode.FORBIDDEN:
            return Failure(statusCode!, serverMessage);
          case ResponseCode.NOT_FOUND:
            return Failure(statusCode!, serverMessage);
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return Failure(statusCode!, serverMessage);
          default:
            return Failure(statusCode ?? ResponseCode.DEFAULT, serverMessage);
        }
      case DioExceptionType.unknown:
        return DataSource.NO_INTERNET_CONNECTION.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.BAD_CERTIFICATE:
        return Failure(
            ResponseCode.BAD_CERTIFICATE, ResponseMessage.BAD_CERTIFICATE);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure user is not authorised
  static const int NOT_FOUND = 404; // failure, API URL is incorrect
  static const int INTERNAL_SERVER_ERROR = 500; // server-side error

  // Local status codes
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
  static const int BAD_CERTIFICATE = -8;
  static const int BAD_RESPONSE = -9;
}

class ResponseMessage {
  // API responses
  static const String SUCCESS = "Success";
  static const String NO_CONTENT = "Success with no content";
  static const String BAD_REQUEST = "Bad request, try again later";
  static const String FORBIDDEN = "Forbidden request, try again later";
  static const String UNAUTHORISED = "User is unauthorised, try again later";
  static const String NOT_FOUND = "URL is not found, try again later";
  static const String INTERNAL_SERVER_ERROR =
      "Something went wrong, try again later";

  // Local responses
  static const String DEFAULT = "Something went wrong, try again later";
  static const String CONNECT_TIMEOUT = "Timeout error, try again later";
  static const String CANCEL = "Request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT = "Timeout error, try again later";
  static const String SEND_TIMEOUT = "Timeout error, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";
  static const String BAD_CERTIFICATE =
      "Invalid SSL certificate, connection not secure";
}

class ApiInternalStatus {
  static const String SUCCESS = "Success";
  static const String FAILURE = "Fail";
}
