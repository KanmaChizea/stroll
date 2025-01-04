import 'package:flutter/material.dart';

class GlobalContext {
  static final GlobalContext _instance = GlobalContext._internal();

  BuildContext? _context;

  factory GlobalContext() {
    return _instance;
  }

  GlobalContext._internal();

  void setContext(BuildContext context) {
    _context = context;
  }

  BuildContext? get context => _context;
}
