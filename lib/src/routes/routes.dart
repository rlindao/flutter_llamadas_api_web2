import 'package:flutter/material.dart';

import '../pages/HomePage.dart';


Map<String, WidgetBuilder> getRoutes(){
  return {
    'home': ( BuildContext context ) => HomePage()
  };
}