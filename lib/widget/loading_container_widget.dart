import 'package:flutter/material.dart';
import 'package:pyco_test/widget/loading_indicator.dart';

class LoadingContainer extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final bool isLoading;
  final double bgOpacity;
  final double paddingBottom;

  LoadingContainer(
      {@required this.child,
        this.backgroundColor,
        this.isLoading,
        this.paddingBottom,
        this.bgOpacity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        isLoading
            ? Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            color: backgroundColor != null
                ? backgroundColor
                : Colors.grey
                .withOpacity(bgOpacity != null ? bgOpacity : 0.7),
            child: Padding(
              padding:
              EdgeInsets.only(bottom: paddingBottom??0.0),
              child: Center(child: LoadingIndicator()),
            ))
            : Container()
      ],
    );
  }
}
