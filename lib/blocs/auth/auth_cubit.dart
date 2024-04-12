import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutflix/contants.dart';
import 'package:flutflix/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Dio dio = Dio();

  AuthCubit() : super(AuthInitial());

  Future<void> register(
      String usernameController,
      String emailController,
      String phoneController,
      File? avatar,
      String passwordController,
      Function(User) callback) async {
    final username = usernameController;
    final email = emailController;
// final phone = phoneController;
    final password = passwordController;
    try {
      double phone = double.tryParse(phoneController as String) ?? 0.0;
      FormData formData = FormData.fromMap({
        'username': username,
        'email': email,
        'phone': phone,
        if (avatar != null)
          'avatar':
              await MultipartFile.fromFile(avatar.path, filename: 'avatar.jpg'),
        'password': password,
      });

      Response response =
          await dio.post('http://10.0.2.2:1000/api/register', data: formData);

      if (response.statusCode == 200) {
        User user = new User.fromJson(response.data);
        emit(AuthSuccess(user: user));
        callback.call(user); // Gọi callback nếu đăng ký thành công
      } else {
        emit(AuthError(error: 'Đăng ký thất bại'));
      }
    } catch (e) {
      emit(AuthError(error: 'Đã có lỗi khi đăng ký : $e'));
    }
  }

  Future<void> login(String emailController, String passwordController, Function(User) callback) async {
    final email = emailController;
    final password = passwordController;

    try {
      Response response = await dio.post('http://10.0.2.2:1000/api/login', data: {'email':email,'password':password});
      if (response.statusCode == 200) {
        print('Data === ${response.data}');
        User user = User.fromJson(response.data);
        emit(AuthSuccess(user: user));
        callback.call(user);
      } else {
        emit(AuthError(error: 'Đăng nhập thất bại'));
      }
    } catch (e) {
      emit(AuthError(error: 'Đã có lỗi xảy ra khi đăng nhập: $e'));
    }
  }

}
