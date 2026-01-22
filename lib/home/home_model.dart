import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FacilitiesRecord? fitnessInfo;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FacilitiesRecord? fitnessInfoCard;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  FacilitiesRecord? fitnessInfoButton;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  FacilitiesRecord? spaInfo;
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
