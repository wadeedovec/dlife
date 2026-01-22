import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'wallet_old_widget.dart' show WalletOldWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class WalletOldModel extends FlutterFlowModel<WalletOldWidget> {
  ///  State fields for stateful widgets in this page.

  List<WalletRecord>? walletOldPreviousSnapshot;
  AudioPlayer? soundPlayer;
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
