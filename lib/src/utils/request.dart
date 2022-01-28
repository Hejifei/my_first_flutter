import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/src/common/config.dart';
import 'package:myapp/src/utils/index.dart';

const DEFAULT_CONNECT_TIMEOUT_MILLI_SECOND = 10000; //  连接超时时间
const DEFAULT_RECEIVE_TIMEOUT_MILLI_SECOND = 5000; //  接受超时时间

class Request {
  static final Request _instance = Request._internal();
  factory Request() => _instance;

  late Dio dio;
  CancelToken cancelToken = CancelToken();

  Request._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: SERVER_API_URL,
      connectTimeout: DEFAULT_CONNECT_TIMEOUT_MILLI_SECOND,
      receiveTimeout: DEFAULT_RECEIVE_TIMEOUT_MILLI_SECOND,
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    print(dio);
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers = getRequestHeader();
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      var responseString = response.toString();
      var responseMap = jsonDecode(responseString);
      var code = responseMap['code'];
      var msg = responseMap['msg'];
      print(msg);
      print('response--------');
      if (code != 0) {
        throw ErrorEntity(code: code, message: msg);
      }
      // 在返回响应数据之前做一些预处理
      return handler.next(response);
    }, onError: (DioError e, handler) {
      ErrorEntity error =
          (e is ErrorEntity ? e : createErrorEntity(e)) as ErrorEntity;
      // EasyLoading.showInfo(error.message.toString());

      switch (error.code) {
        case 401:
          logout();
          break;
        default:
      }
      return handler.next(error as DioError);
    }));
  }

  get message => null;

  Map<String, dynamic> getRequestHeader() {
    var headers;
    String? token = getUserToken();
    headers = {
      'token': token ??
          jsonEncode({
            "uid": "",
            "timestamp": 0,
            "token": "",
            "client": "web",
            "version": "",
            "language": "zh",
          }),
    };
    return headers;
  }

  getResponseData(Response<dynamic> response) {
    var responseString = response.toString();
    var data = jsonDecode(responseString)['data'];
    return data;
  }

  /// restful get 操作
  get(String path, {dynamic params, Options? options}) async {
    var response = await dio.get(path,
        queryParameters: params, options: options, cancelToken: cancelToken);
    return getResponseData(response);
  }

  doRequest() async {}

  Future post(String path, {dynamic params, Options? options}) async {
    var response = await dio.post(path,
        data: params, options: options, cancelToken: cancelToken);
    return getResponseData(response);
  }

  Future put(String path, {dynamic params, Options? options}) async {
    var response = await dio.put(path,
        data: params, options: options, cancelToken: cancelToken);
    return getResponseData(response);
  }

  Future patch(String path, {dynamic params, Options? options}) async {
    var response = await dio.patch(path,
        data: params, options: options, cancelToken: cancelToken);
    return getResponseData(response);
  }

  Future delete(String path, {dynamic params, Options? options}) async {
    var response = await dio.delete(path,
        data: params, options: options, cancelToken: cancelToken);
    return getResponseData(response);
  }

  Future postForm(String path, {dynamic params, Options? options}) async {
    var response = await dio.post(path,
        data: FormData.fromMap(params),
        options: options,
        cancelToken: cancelToken);
    return getResponseData(response);
  }

  /*
   * error统一处理
   */
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return ErrorEntity(code: -1, message: "请求取消");
        }
      case DioErrorType.connectTimeout:
        {
          return ErrorEntity(code: -1, message: "连接超时");
        }
      case DioErrorType.sendTimeout:
        {
          return ErrorEntity(code: -1, message: "请求超时");
        }

      case DioErrorType.receiveTimeout:
        {
          return ErrorEntity(code: -1, message: "响应超时");
        }
      case DioErrorType.response:
        {
          try {
            int? errCode = error.response?.statusCode;
            if (errCode == null) {
              return ErrorEntity(code: -2, message: error.message);
            }
            switch (errCode) {
              case 400:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ?? "请求语法错误");
                }

              case 401:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ?? "没有权限");
                }

              case 403:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ?? "服务器拒绝执行");
                }
              case 404:
                {
                  return ErrorEntity(code: errCode, message: "无法连接服务器");
                }
              case 405:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ?? "请求方法被禁止");
                }
              case 500:
                {
                  return ErrorEntity(code: errCode, message: "服务器内部错误");
                }
              case 502:
                {
                  return ErrorEntity(code: errCode, message: "无效的请求");
                }
              case 503:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.data['message'] ?? "服务器挂了");
                }
              case 505:
                {
                  return ErrorEntity(
                      code: errCode,
                      message:
                          error.response?.data['message'] ?? "不支持HTTP协议请求");
                }
              default:
                {
                  return ErrorEntity(
                      code: errCode, message: error.response?.data['message']);
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code;
  String? message;
  ErrorEntity({required this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    // return "Exception: code $code, $message";
    return "$message|";
  }
}
