import '/components/nav_bar_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'amenities_widget.dart' show AmenitiesWidget;
import 'package:flutter/material.dart';

class AmenitiesModel extends FlutterFlowModel<AmenitiesWidget> {
  ///  State fields for stateful widgets in this page.

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
