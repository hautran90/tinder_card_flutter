// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$isShowLoadingAtom = Atom(name: '_UserStore.isShowLoading');

  @override
  bool get isShowLoading {
    _$isShowLoadingAtom.context.enforceReadPolicy(_$isShowLoadingAtom);
    _$isShowLoadingAtom.reportObserved();
    return super.isShowLoading;
  }

  @override
  set isShowLoading(bool value) {
    _$isShowLoadingAtom.context.conditionallyRunInAction(() {
      super.isShowLoading = value;
      _$isShowLoadingAtom.reportChanged();
    }, _$isShowLoadingAtom, name: '${_$isShowLoadingAtom.name}_set');
  }

  final _$titleAtom = Atom(name: '_UserStore.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$listUsersAtom = Atom(name: '_UserStore.listUsers');

  @override
  ObservableList<User> get listUsers {
    _$listUsersAtom.context.enforceReadPolicy(_$listUsersAtom);
    _$listUsersAtom.reportObserved();
    return super.listUsers;
  }

  @override
  set listUsers(ObservableList<User> value) {
    _$listUsersAtom.context.conditionallyRunInAction(() {
      super.listUsers = value;
      _$listUsersAtom.reportChanged();
    }, _$listUsersAtom, name: '${_$listUsersAtom.name}_set');
  }

  final _$favoriteUsersAtom = Atom(name: '_UserStore.favoriteUsers');

  @override
  ObservableList<User> get favoriteUsers {
    _$favoriteUsersAtom.context.enforceReadPolicy(_$favoriteUsersAtom);
    _$favoriteUsersAtom.reportObserved();
    return super.favoriteUsers;
  }

  @override
  set favoriteUsers(ObservableList<User> value) {
    _$favoriteUsersAtom.context.conditionallyRunInAction(() {
      super.favoriteUsers = value;
      _$favoriteUsersAtom.reportChanged();
    }, _$favoriteUsersAtom, name: '${_$favoriteUsersAtom.name}_set');
  }

  final _$getFavoriteUsersAsyncAction = AsyncAction('getFavoriteUsers');

  @override
  Future getFavoriteUsers() {
    return _$getFavoriteUsersAsyncAction.run(() => super.getFavoriteUsers());
  }

  final _$addUserToFavouriteAsyncAction = AsyncAction('addUserToFavourite');

  @override
  Future addUserToFavourite(User user) {
    return _$addUserToFavouriteAsyncAction
        .run(() => super.addUserToFavourite(user));
  }

  final _$getUsersAsyncAction = AsyncAction('getUsers');

  @override
  Future getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  final _$generateUserAsyncAction = AsyncAction('generateUser');

  @override
  Future generateUser() {
    return _$generateUserAsyncAction.run(() => super.generateUser());
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  dynamic parseJsonToListUser(List<dynamic> data) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.parseJsonToListUser(data);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isShowLoading: ${isShowLoading.toString()},title: ${title.toString()},listUsers: ${listUsers.toString()},favoriteUsers: ${favoriteUsers.toString()}';
    return '{$string}';
  }
}
