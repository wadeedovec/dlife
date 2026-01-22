import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_new_rental_widget.dart' show AddNewRentalWidget;
import 'package:flutter/material.dart';

class AddNewRentalModel extends FlutterFlowModel<AddNewRentalWidget> {
  ///  Local state fields for this component.

  String? selectedProjectId;

  DocumentReference? selectedProjectRef;

  DocumentReference? selectedBlockRef;

  DocumentReference? selectedPropertyRef;

  String? selectedBlockId;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ohubosyp' /* Property Name is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  ProjectsRecord? projectRef;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  BlocksRecord? blockRef;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  bool isDataUploading_uploadDataUmg = false;
  FFUploadedFile uploadedLocalFile_uploadDataUmg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataUmg = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MyPropertiesRecord? newProperty;

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
