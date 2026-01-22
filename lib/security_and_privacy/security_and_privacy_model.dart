import '/components/nav_bar_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'security_and_privacy_widget.dart' show SecurityAndPrivacyWidget;
import 'package:flutter/material.dart';

class SecurityAndPrivacyModel
    extends FlutterFlowModel<SecurityAndPrivacyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
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
