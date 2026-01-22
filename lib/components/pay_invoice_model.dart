import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pay_invoice_widget.dart' show PayInvoiceWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PayInvoiceModel extends FlutterFlowModel<PayInvoiceWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WalletRecord? walletInfo;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
