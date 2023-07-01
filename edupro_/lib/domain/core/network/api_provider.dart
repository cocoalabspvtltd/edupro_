import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/core/network/api_interceptor.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';

class ApiProvider {
  Dio? _dio;

  //todo change to live base url

  static String baseUrl = 'https://pgsedu.com/EduPro/index.php/';

  //static String baseUrl = 'https://9a6a-117-201-131-18.ngrok.io/';

  ApiProvider() {
    BaseOptions options;
    options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 10000,
      connectTimeout: 10000,
    );

    _dio = Dio(options);
    _dio!.interceptors.add(ApiInterceptor());
  }

  Dio getJsonInstance() {
    _dio!.options.headers.addAll({"Content-Type": "application/json"});
    return _dio!;
  }

  Dio getMultipartInstance() {
    _dio!.options.headers.addAll({"Content-Type": "multipart/form-data"});
    return _dio!;
  }

  Dio getJsonInstanceAuth() {
    _dio!.options.headers.addAll({
      "authorization": "Bearer  ${UserDetailsLocal.apiToken}",
    });
    return _dio!;
  }

  // Dio downloadFile() {
  //   _dio!.options.headers.addAll({"content-type": "application/json"});
  // }
}
