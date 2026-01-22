import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'spa_subscription_checkout_widget.dart'
    show SpaSubscriptionCheckoutWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SpaSubscriptionCheckoutModel
    extends FlutterFlowModel<SpaSubscriptionCheckoutWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WalletRecord? walletInfo;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpaSubscriptionsRecord? newSubs;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
