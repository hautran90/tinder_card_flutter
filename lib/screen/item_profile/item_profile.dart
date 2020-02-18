import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pyco_test/helper/date_time_format_helper.dart';
import 'package:pyco_test/model/icon_model.dart';
import 'package:pyco_test/model/user_model.dart';
import 'package:pyco_test/theme/dimens.dart';

class ItemProfile extends StatefulWidget {
  final User user;

  const ItemProfile({Key key, this.user}) : super(key: key);

  @override
  _ItemProfileState createState() => _ItemProfileState();
}

class _ItemProfileState extends State<ItemProfile> {
  List<IconModel> listIcon = [];

  String title = '';
  String content = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  initData() {
    print('start');
    listIcon.add(IconModel(icon: Icons.cloud_circle, isSelected: true));
    listIcon.add(IconModel(icon: Icons.calendar_today, isSelected: false));
    listIcon.add(IconModel(icon: Icons.location_on, isSelected: false));
    listIcon.add(IconModel(icon: Icons.call, isSelected: false));
    listIcon.add(IconModel(icon: Icons.lock, isSelected: false));
  }

  @override
  Widget build(BuildContext context) {
    print(
        '------------DATARETURN ${widget.user.name.first} ${widget.user.name.last}');
    return Column(
      children: <Widget>[
        Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                buildAvatar(),
                buildItemInformation(),
                buildIcon(),
              ],
            )),
      ],
    );
  }

  buildAvatar() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.black38))),
              )
            ],
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            // The border you want
            border: new Border.all(
              width: 1.0,
              color: Colors.black12,
            ),
          ),
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width / 5,
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(Dimens.paddings['tiny']),
              child: ClipOval(
                  child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width / 2.0,
                height: MediaQuery.of(context).size.width / 2.0,
                fit: BoxFit.cover,
                imageUrl: widget.user.picture,
//               placeholder: (context, url) => LoadingIndicator(),
//                errorWidget: (context, url, error) =>
//                    Image.asset(Images.bgDefaultArticle),
              )),
            ),
          ),
        )
      ],
    );
  }

  buildItemInformation() {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimens.paddings['large'], bottom: Dimens.paddings['large']),
      child: Column(
        children: <Widget>[
          Text(
            title == '' ? 'My name is' : title,
            style: TextStyle(
                fontSize: Dimens.text['address'],
                fontWeight: FontWeight.bold,
                color: Colors.black38),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimens.paddings['small']),
            child: Text(
              content == ''
                  ? '${widget.user.name.first} ${widget.user.name.last}'
                  : content,
              style: TextStyle(
                  fontSize: Dimens.text['address_detail'],
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          )
        ],
      ),
    );
  }

  buildIcon() {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.paddings['small']),
      child: Column(
        children: <Widget>[
          Container(
            height: Dimens.container['container_icon'],
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listIcon.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onTapIcon(index);
                    },
                    child: buildItemIcon(listIcon[index]),
                  );
                }),
          ),
        ],
      ),
    );
  }

  buildItemIcon(IconModel icon) {
    return Padding(
      padding: EdgeInsets.only(left: Dimens.paddings['small']),
      child: Icon(
        icon.icon,
        color: icon.isSelected == false ? Colors.black26 : Colors.green,
        size: Dimens.icon['icon_step'],
      ),
    );
  }

  onTapIcon(int indexIcon) {
    if (indexIcon == 0) {
      title = 'My name is';
      content = '${widget.user.name.first} ${widget.user.name.last}';
    }
    if (indexIcon == 1) {
      title = 'Registered';
      content = DateTimeFormatHelper.formatTimestamp(
          int.parse(widget.user.registered));
    }
    if (indexIcon == 2) {
      title = 'My address is';
      content = widget.user.location.street;
    }
    if (indexIcon == 3) {
      title = 'My phone number is';
      content = widget.user.phone;
    }
    if (indexIcon == 4) {
      title = 'My password is';
      content = widget.user.password;
    }
    listIcon.forEach((element) => element.isSelected = false);
    listIcon[indexIcon].isSelected = true;
    setState(() {});
  }
}
