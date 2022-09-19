import 'package:animesee/services/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoggedDrawer.dart';
import 'OfflineDrawer.dart';

class DrawerSel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return (auth.user == null) ? OfflineDrawer() : LoggedDrawer();
  }
}
