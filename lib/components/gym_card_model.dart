import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gym_card_widget.dart' show GymCardWidget;
import 'package:flutter/material.dart';

class GymCardModel extends FlutterFlowModel<GymCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in gymCard widget.
  GymSubscriptionsRecord? gymSubInfo;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FacilitiesRecord? fitnessInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
