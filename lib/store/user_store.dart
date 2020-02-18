import 'package:mobx/mobx.dart';
import 'package:pyco_test/api/api_response.dart';
import 'package:pyco_test/api/user_api.dart';
import 'package:pyco_test/helper/share_preferrence_helper.dart';
import 'package:pyco_test/model/user_model.dart';
import 'dart:convert';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  bool isShowLoading = false;

  @observable
  String title = '';
  String content = '';

  @observable
  ObservableList<User> listUsers = ObservableList<User>();

  @observable
  ObservableList<User> favoriteUsers = ObservableList<User>();

  @action
  getFavoriteUsers() async {
    String favoriteJson =
        await SharedPreferencesHelper.getStringValue('favorite');
    if (favoriteJson != null && favoriteJson.isNotEmpty) {
      List jsonList = jsonDecode(favoriteJson);
      if (jsonList != null) {
        parseJsonToListUser(jsonList);
      }
    }
  }

  @action
  parseJsonToListUser(List data) {
    print('-------------bugUserDAta $data');
    var users = data.map((item) {
      return User.fromLocalJson(item);
    }).toList();
    favoriteUsers.clear();
    favoriteUsers.addAll(users);
    print('-------------bugUserIIII ${users[0]}');
    print('-------------bugUser ${favoriteUsers[0].name.first}');
    return favoriteUsers;
  }

  @action
  addUserToFavourite(User user) async {
    favoriteUsers.add(user);
    saveFavoriteUsersToSharedPrefs();
  }

  saveFavoriteUsersToSharedPrefs() {
    StringBuffer usersData = StringBuffer();
    if (favoriteUsers != null) {
      favoriteUsers.forEach((user) {
        usersData.write(user.toJson());
      });
    }
    String usersString = jsonEncode(favoriteUsers.map((i) => i.toJson()).toList()).toString();

    SharedPreferencesHelper.saveStringValue('favorite', usersString);
  }

  @action
  getUsers() async {
    isShowLoading = true;
    UserApi userApi = UserApi();
    ApiResponse apiResponse = await userApi.getRandomUser();
    if (apiResponse.success) {
      listUsers.add(apiResponse.model);
      title = 'My name is';
      content = '${listUsers[0].name.first} ${listUsers[0].name.last}';
    }
    isShowLoading = false;
  }

  @action
  generateUser() async {
    isShowLoading = true;
    for (int i = 0; i < 2; i++) {
      await getUsers();
    }
    isShowLoading = false;
  }
}

/// Build (generate .g.dart) flutter packages pub run build_runner build
/// Watch (update .g.dart automatically) flutter packages pub run build_runner watch
/// Clean before updating: flutter packages pub run build_runner watch --delete-conflicting-outputs
///
