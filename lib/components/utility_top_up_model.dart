import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'utility_top_up_widget.dart' show UtilityTopUpWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class UtilityTopUpModel extends FlutterFlowModel<UtilityTopUpWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4epmnwbf' /* Enter amount is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WalletRecord? walletInfo;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MyPropertiesRecord? myPropertyInfo;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoicesRecord? newSubs;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
