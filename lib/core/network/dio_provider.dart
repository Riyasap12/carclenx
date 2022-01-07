import 'dart:developer';
import 'dart:io';

import 'package:carclenx/screen/login/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';


import 'package:carclenx/constant/config.dart';


final dioProvider = Provider<Dio>(
      (ref) => Dio(
    BaseOptions(
      baseUrl: Config.API_BASE_URL,
      connectTimeout: 60000,
      receiveTimeout: 60000,
    ),
  )
    ..interceptors.add(AppInterceptor()),
);


final navigatorKey = GlobalKey<NavigatorState>();

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    try {
      options.headers[HttpHeaders.acceptHeader] = "application/json";
      handler.next(options);
    } catch (e) {
      //print('AppInterceptor Error : ${e.toString()}');
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      Future.delayed(const Duration(milliseconds: 300), () {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(const SnackBar(content: Text("Session Expired"),));
      });
      navigatorKey.currentState!.push(MaterialPageRoute(builder: (BuildContext context) {
        return const LoginScreen();
      }));
    }

    handler.next(err);
  }
}
