// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';

class ApiInterceptor extends Interceptor {
  int maxCharactersPerLine = 500;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (UserDetailsLocal.apiToken.isNotEmpty) {
      if (!options.headers.containsKey('authorization')) {
        options.headers
            .addAll({"Authorization": "Bearer ${UserDetailsLocal.apiToken}"});
      }

      // options.headers.addAll({"Authorization": "Bearer $s1"});
    }

    log("",
        name: 'API INTERCEPTOR',
        error:
            "!!!!!!!!!!!!!!!!!!!!!!!!!!!! REQUEST BEGIN !!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    log(
      "[${options.method}] ",
      name: 'REQUEST METHOD',
    );

    log(
      '',
      name: 'API',
      error: '${options.baseUrl}${options.path}',
    );

    options.headers.forEach((k, v) => log(
          '$k: $v',
          name: 'HEADERS',
        ));
    // ignore: unnecessary_null_comparison
    if (options.queryParameters != null) {
      options.queryParameters
          .forEach((k, v) => log('$k: $v', name: 'QUERY PARAMETERS'));
    }
    if (options.data != null) {
      try {
        FormData d = options.data;
        for (var element in d.fields) {
          log(
            '${element.key}:${element.value}',
            name: 'BODY',
          );
        }
      } catch (e) {
        log(
          "${options.data}",
          name: 'DATA',
        );
      }
    }
    log("",
        name: 'API INTERCEPTOR',
        error:
            "!!!!!!!!!!!!!!!!!!!!!!!!!!!! REQUEST END !!!!!!!!!!!!!!!!!!!!!!!!!!!!");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('',
        name: "API INTERCEPTOR",
        error:
            "________________________________________ RESPONSE BEGIN ________________________________________");
    log(
      " [${response.requestOptions.method}]",
      name: 'REQUEST METHOD',
    );
    log(
      "[${response.statusCode}]",
      name: 'STATUS CODE',
    );
    log(
      '',
      name: 'API ',
      error:
          "${response.requestOptions.baseUrl}${response.requestOptions.path}",
    );
    if (response.statusCode == 401) {
      // SharedPrefs.logOut();
      toastMessage('Unauthorized');
    }

    log(
      '''${response.data}''',
      name: 'RESPONSE DATA',
    );

    log('',
        name: 'API INTERCEPTOR',
        error:
            '________________________________________  RESPONSE END ________________________________________');

    // print('status code: ${response.statusCode}');
    // print('success response: ${response.data}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log(
      '',
      name: 'API INTERCEPTOR',
      error: "######################### ERROR BEGIN #########################",
    );

    if (err.response != null) {
      log(
        '',
        name: 'ERROR',
        error: err.error,
      );

      log(
        '',
        name: 'STATUS CODE',
        error: " ${err.response?.statusMessage ?? ''} ",
      );

      log(
        '',
        name: 'STATUS MESSAGE',
        error: " ${err.response?.statusMessage ?? ''} ",
      );

      log(
        '',
        name: 'RESPONSE DATA',
        error: err.response?.data,
      );

      String message = """
${err.error} 
ERROR MESSAGE: ${err.response?.statusMessage ?? ''}
""";
      toastMessage(message);

      if (err.response!.statusCode == 401) {
        // SharedPrefs.logOut();
      }
    } else {
      log(
        '',
        name: 'ERROR NULL RESPONSE',
        error: err,
      );
    }

    log("",
        name: 'API INTERCEPTOR',
        error: '######################### ERROR END #########################');

    super.onError(err, handler);
  }
}
