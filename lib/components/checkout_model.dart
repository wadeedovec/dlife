import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (userIp)] action in checkout widget.
  ApiCallResponse? userIP;
  // State field(s) for amountTop widget.
  FocusNode? amountTopFocusNode;
  TextEditingController? amountTopTextController;
  String? Function(BuildContext, String?)? amountTopTextControllerValidator;
  String? _amountTopTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ggpp7a03' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for cardNumber widget.
  FocusNode? cardNumberFocusNode;
  TextEditingController? cardNumberTextController;
  String? Function(BuildContext, String?)? cardNumberTextControllerValidator;
  String? _cardNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sp43eipo' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for cardName widget.
  FocusNode? cardNameFocusNode;
  TextEditingController? cardNameTextController;
  String? Function(BuildContext, String?)? cardNameTextControllerValidator;
  String? _cardNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rlc8hjc1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for cvv widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvTextController;
  late MaskTextInputFormatter cvvMask;
  String? Function(BuildContext, String?)? cvvTextControllerValidator;
  String? _cvvTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dk0jqeuo' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for expM widget.
  FocusNode? expMFocusNode;
  TextEditingController? expMTextController;
  late MaskTextInputFormatter expMMask;
  String? Function(BuildContext, String?)? expMTextControllerValidator;
  String? _expMTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'medgscms' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for expY widget.
  FocusNode? expYFocusNode;
  TextEditingController? expYTextController;
  late MaskTextInputFormatter expYMask;
  String? Function(BuildContext, String?)? expYTextControllerValidator;
  String? _expYTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7i604nhl' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (userIp)] action in Button widget.
  ApiCallResponse? userIp;

  @override
  void initState(BuildContext context) {
    amountTopTextControllerValidator = _amountTopTextControllerValidator;
    cardNumberTextControllerValidator = _cardNumberTextControllerValidator;
    cardNameTextControllerValidator = _cardNameTextControllerValidator;
    cvvTextControllerValidator = _cvvTextControllerValidator;
    expMTextControllerValidator = _expMTextControllerValidator;
    expYTextControllerValidator = _expYTextControllerValidator;
  }

  @override
  void dispose() {
    amountTopFocusNode?.dispose();
    amountTopTextController?.dispose();

    cardNumberFocusNode?.dispose();
    cardNumberTextController?.dispose();

    cardNameFocusNode?.dispose();
    cardNameTextController?.dispose();

    cvvFocusNode?.dispose();
    cvvTextController?.dispose();

    expMFocusNode?.dispose();
    expMTextController?.dispose();

    expYFocusNode?.dispose();
    expYTextController?.dispose();
  }
}
