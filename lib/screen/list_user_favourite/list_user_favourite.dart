import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pyco_test/store/user_store.dart';

class ListUserFavourite extends StatefulWidget {
  @override
  _ListUserFavouriteState createState() => _ListUserFavouriteState();
}

class _ListUserFavouriteState extends State<ListUserFavourite> {
  UserStore userStore = UserStore();

  @override
  void initState() {
    super.initState();
    userStore.getFavoriteUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User Favourite'),
      ),
      body: buildContent(),
    );
  }

  buildContent() {
    return Observer(
      builder: (_) {
        return ListView.builder(
            itemCount: userStore.favoriteUsers.length,
            itemBuilder: (context, index) {
              return userStore.favoriteUsers.length != 0
                  ? ListTile(
                      leading:
                          Image.network(userStore.favoriteUsers[index].picture),
                      title: Text(
                          '${userStore.favoriteUsers[index].name.first} ${userStore.favoriteUsers[index].name.last}'),
                      subtitle: Text('${userStore.favoriteUsers[index].email}'),
                    )
                  : Container();
            });
      },
    );
  }
}
