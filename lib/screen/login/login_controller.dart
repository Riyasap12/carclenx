import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import 'package:carclenx/constant/request_status.dart';
import 'package:carclenx/screen/login/login_response_model.dart';
import 'package:carclenx/core/network/dio_provider.dart';


part 'login_state.dart';

final loginController =
StateNotifierProvider.autoDispose<LoginController, LoginControllerState>(
      (ref) => LoginController(ref.read(dioProvider), ref),
);

class LoginController extends StateNotifier<LoginControllerState> {
  final Dio _dio;
  final AutoDisposeStateNotifierProviderRef ref;

  LoginController(this._dio, this.ref)
      : super(const LoginState(RequestStatus.initial));

  Future<void> login(String phoneNumber) async {
    state = const LoginState(RequestStatus.requesting);
    Response<String> response;

    try {
      response = await _dio.post(
        'get-otp',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          responseType: ResponseType.json,
        ),
        data: jsonEncode({'phone': phoneNumber}),
      );

      final Map<String, dynamic> data =
      HashMap.from(json.decode(response.data!));

      final loginResponse = LoginResponseModel.fromJson(data);


      //
      state = LoginState(
        RequestStatus.success,
        response: loginResponse,
      );
    } catch (e) {
      state = LoginState(
        RequestStatus.error,
        exception: Exception('Something went wrong: $e}'),
      );
    }

    //print(response);
  }
}