import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:myapp/src/common/config.dart';
import 'package:myapp/src/utils/dio_util/dio_cache_interceptors.dart';
import 'package:myapp/src/utils/dio_util/dio_interceptors.dart';
import 'package:myapp/src/utils/dio_util/dio_method.dart';
import 'package:myapp/src/utils/dio_util/dio_token_interceptors.dart';
import 'package:myapp/src/utils/dio_util/dio_transformer.dart';

class DioUtil {
  /// 连接超时时间
  static const int CONNECT_TIMEOUT = 6 * 1000;

  /// 响应超时时间
  static const int RECEIVE_TIMEOUT = 6 * 1000;

  /// 是否开启网络缓存,默认false
  static bool CACHE_ENABLE = false;

  /// 最大缓存时间(按秒), 默认缓存七天,可自行调节
  static int MAX_CACHE_AGE = 7 * 24 * 60 * 60;

  /// 最大缓存条数(默认一百条)
  static int MAX_CACHE_COUNT = 100;

  factory DioUtil() => _getInstance();
  static DioUtil get instance => _getInstance();
  static late DioUtil _instance = DioUtil._init();
  Dio get dio => _dio;

  /// 声明Dio变量
  late Dio _dio;

  /// 取消请求token
  CancelToken _cancelToken = CancelToken();

  DioUtil._init() {
    // if (dio == null) {
    /// 初始化基本选项
    BaseOptions options = BaseOptions(
      baseUrl: SERVER_API_URL,
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    /// 初始化dio
    _dio = Dio(options);

    /// 添加拦截器
    _dio.interceptors.add(DioInterceptors());

    /// 添加转换器
    _dio.transformer = DioTransformer();

    /// 刷新token拦截器(lock/unlock)
    // _dio.interceptors.add(DioTokenInterceptors());

    /// 添加缓存拦截器
    // _dio.interceptors.add(DioCacheInterceptors());
    // }
  }

  // 设置Http代理(设置即开启)
  void setProxy({required String proxyAddress, bool enable = false}) {
    if (enable) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.findProxy = (uri) {
          return proxyAddress;
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // 设置https证书校验
  void setHttpsCertificateVerification(
      {required String pem, bool enable = false}) {
    if (enable) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == pem) {
            // 验证证书
            return true;
          }
          return false;
        };
      };
    }
  }

  /// 开启日志打印
  void openLog() {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  static DioUtil _getInstance() {
    if (_instance == null) {
      DioUtil._init();
    }
    return _instance;
  }

  /// 请求类
  Future<T> request<T>(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? params,
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const _methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };

    options ??= Options(method: _methodValues[method]);
    try {
      Response response;
      response = await _dio.request(
        path,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
        // onSendProgress: onSendProgress,
        // onReceiveProgress: onReceiveProgress
      );
      print('response');
      print(response);

      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }

  /// 取消网络请求
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }
}
