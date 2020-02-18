import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:pyco_test/screen/item_profile/item_profile.dart';
import 'package:pyco_test/screen/list_user_favourite/list_user_favourite.dart';
import 'package:pyco_test/store/user_store.dart';
import 'package:pyco_test/theme/dimens.dart';
import 'package:pyco_test/widget/loading_container_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserStore userStore = UserStore();
  CardController controller;
  int indexIconOnTap = 0;

  @override
  void initState() {
    super.initState();
    userStore.generateUser().whenComplete(() {
      userStore.getFavoriteUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[buildAppbar(), buildContent()],
          ),
        ],
      )),
    );
  }

  buildAppbar() {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width / 4,
          color: Colors.black87,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black12,
        ),
      ],
    );
  }

  buildContent() {
    return Column(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: TinderSwapCard(
              orientation: AmassOrientation.BOTTOM,
              totalNum: 10000,
              swipeEdge: 4.0,
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              minHeight: MediaQuery.of(context).size.width * 0.6,
              cardBuilder: (context, index) => Observer(
                builder: (_) {
                  print('------------DATA------------$index');
                  return Card(
                      child: userStore.listUsers.length != 0
                          ? ItemProfile(user: userStore.listUsers[index],)
                          : Container());
                },
              ),
              cardController: controller = CardController(),
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                /// Get swiping card's alignment
                if (align.x < 0) {
                  //Card is LEFT swiping
                  userStore.getUsers();
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                  userStore.getUsers();
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                /// Get orientation & index of swiped card!
                if (orientation == CardSwipeOrientation.LEFT) {
                  print('inininini     $index');
                  setState(() {

                  });
                } else {
                  userStore.addUserToFavourite(userStore.listUsers[index]);
                  setState(() {

                  });
                }
              },
            )),
        Observer(
          builder: (_) {
            return LoadingContainer(
              child: Container(),
              backgroundColor: Colors.transparent,
              isLoading: userStore.isShowLoading,
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: Dimens.paddings['small']),
          child: GestureDetector(
            onTap: () {
              navigateListUserFavourite();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(builder: (_){
                  return Icon(
                    Icons.favorite,
                    color: userStore.favoriteUsers.length != 0 ? Colors.red : Colors.black26,
                    size: Dimens.icon['icon_step'],
                  );
                }),
                Observer(builder: (_){
                  return Text('+${userStore.favoriteUsers.length}');
                })
              ],
            ),
          ),
        )
      ],
    );
  }

//  updateContent(User user) {
//    if (indexIconOnTap == 0) {
//      content = '${user.name.first} ${user.name.last}';
//    }
//    if (indexIconOnTap == 1) {
//      content =
//          DateTimeFormatHelper.formatTimestamp(int.parse(user.registered));
//    }
//    if (indexIconOnTap == 2) {
//      content = user.location.street;
//    }
//    if (indexIconOnTap == 3) {
//      content = user.phone;
//    }
//    if (indexIconOnTap == 4) {
//      content = user.password;
//    }
//    setState(() {});
//  }

  void navigateListUserFavourite() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListUserFavourite()),
    );
  }
}
