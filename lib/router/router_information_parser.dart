import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator_application/router/app_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppPath> {
  @override
  RouteInformation restoreRouteInformation(AppPath path) {
    if (path.isUnknownPage) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/list');
    }

    return RouteInformation(location: '/');
  }

  @override
  Future<AppPath> parseRouteInformation(RouteInformation routeInformation) {
    Uri uri = Uri.parse(routeInformation.location ?? '');
    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture(AppPath.home());
    }
    return SynchronousFuture(AppPath.unknown());
  }
}
