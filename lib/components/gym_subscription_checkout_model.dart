import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gym_subscription_checkout_widget.dart'
    show GymSubscriptionCheckoutWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class GymSubscriptionCheckoutModel
    extends FlutterFlowModel<GymSubscriptionCheckoutWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WalletRecord? walletInfo;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
