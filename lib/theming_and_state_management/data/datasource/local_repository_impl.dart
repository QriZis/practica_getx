import 'package:flutter/material.dart';
import 'package:tutorial/theming_and_state_management/domain/model/user.dart';
import 'package:tutorial/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = 'TOKEN';
const _pref_user_name = 'USERNAME';
const _pref_name = 'NAME';
const _pref_image = 'IMAGE';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token) ?? '';
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.getString(_pref_user_name) ?? '';
    final name = sharedPreferences.getString(_pref_name) ?? '';
    final image = sharedPreferences.getString(_pref_image) ?? '';

    final user = User(
      username: username,
      name: name,
      image: image,
    );
    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_user_name, user.name);
    sharedPreferences.setString(_pref_name, user.name);
    sharedPreferences.setString(_pref_image, user.image);
    return user;
  }
}
