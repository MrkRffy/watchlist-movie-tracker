import 'package:flutter/cupertino.dart';

class ShowCardAnimation {
  int index, initialPage;
  PageController pageController;

  static const double fullScalePadding = 0;
  static const double minScalePadding = 50;
  static const double fullScaleOpacity = 1.0;
  static const double minScaleOpacity = 0.6;

  double padding = fullScalePadding;
  double opacity = fullScaleOpacity;

  ShowCardAnimation({this.pageController, this.initialPage, this.index}) {
    bool pageControllerReady = pageController.position.haveDimensions;

    if (pageControllerReady) {
      bool isNextPage = (index > pageController.page && index <= pageController.page + 1);
      bool isPreviousPage = (index <= pageController.page);

      if (isNextPage) {
        double pageScroll = pageController.page - int.parse(pageController.page.toString().split('.')[0]);
        this.padding = minScalePadding - (minScalePadding * (pageScroll));
        this.opacity = minScaleOpacity + (0.4 * pageScroll);
      } else {
        this.padding = isPreviousPage ? fullScalePadding : minScalePadding;
        this.opacity = isPreviousPage ? fullScaleOpacity : minScaleOpacity;
      }
    } else {
      this.padding = index == initialPage ? fullScalePadding : minScalePadding;
      this.opacity = index == initialPage ? fullScaleOpacity : minScaleOpacity;
    }
  }

  double get cardPadding => this.padding;
  double get cardOpacity => this.opacity;
}
