import 'package:flutter/cupertino.dart';

import 'LoggedDrawer.dart';
import 'OfflineDrawer.dart';

class DrawerSel extends StatelessWidget {
  static bool get isUserLogged => false;

  @override
  Widget build(BuildContext context) {
    return isUserLogged ? LoggedDrawer() : OfflineDrawer();
  }
}
