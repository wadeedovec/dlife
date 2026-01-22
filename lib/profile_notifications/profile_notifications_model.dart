import '/components/nav_bar_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_notifications_widget.dart' show ProfileNotificationsWidget;
import 'package:flutter/material.dart';

class ProfileNotificationsModel
    extends FlutterFlowModel<ProfileNotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Switch widget.
  bool? switchValue5;
  // State field(s) for Switch widget.
  bool? switchValue6;
  // State field(s) for Switch widget.
  bool? switchValue7;
  // State field(s) for Switch widget.
  bool? switchValue8;
  // State field(s) for Switch widget.
  bool? switchValue9;
  // State field(s) for Switch widget.
  bool? switchValue10;
  // State field(s) for Switch widget.
  bool? switchValue11;
  // State field(s) for Switch widget.
  bool? switchValue12;
  // Model for TopBar component.
  late TopBarModel topBarModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    navBarModel.dispose();
  }
}
