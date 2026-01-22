import '/components/nav_bar_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_event_widget.dart' show BookEventWidget;
import 'package:flutter/material.dart';

class BookEventModel extends FlutterFlowModel<BookEventWidget> {
  ///  Local state fields for this page.

  List<String> formEntries = [];
  void addToFormEntries(String item) => formEntries.add(item);
  void removeFromFormEntries(String item) => formEntries.remove(item);
  void removeAtIndexFromFormEntries(int index) => formEntries.removeAt(index);
  void insertAtIndexInFormEntries(int index, String item) =>
      formEntries.insert(index, item);
  void updateFormEntriesAtIndex(int index, Function(String) updateFn) =>
      formEntries[index] = updateFn(formEntries[index]);

  int? previousFormCount = 1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for CountController widget.
  int? countControllerValue;
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
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    topBarModel.dispose();
    navBarModel.dispose();
  }
}
