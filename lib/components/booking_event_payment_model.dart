import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'booking_event_payment_widget.dart' show BookingEventPaymentWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class BookingEventPaymentModel
    extends FlutterFlowModel<BookingEventPaymentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WalletRecord? walletInfo;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
