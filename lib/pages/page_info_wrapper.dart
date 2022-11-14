import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PageInfoWrapper extends PageRouteInfo {
 const PageInfoWrapper(super.name, this.child, {required super.path});
  final Widget child;

  Widget build(BuildContext context) {
    return child;
  }
}