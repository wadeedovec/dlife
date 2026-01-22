import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_maintenance_request_widget.dart' show NewMaintenanceRequestWidget;
import 'package:flutter/material.dart';

class NewMaintenanceRequestModel
    extends FlutterFlowModel<NewMaintenanceRequestWidget> {
  ///  Local state fields for this component.

  String? selectedProjectId;

  DocumentReference? selectedProjectRef;

  DocumentReference? selectedBlockRef;

  DocumentReference? selectedPropertyRef;

  String? selectedBlockId;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  ProjectsRecord? projectRef;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rp5qxed6' /* Brief description of the issue... */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6ds53ejy' /* e.g., Kitchen sink, Bedroom wi... */,
      );
    }

    return null;
  }

  bool isDataUploading_uploadDataBj8OpenCamera = false;
  FFUploadedFile uploadedLocalFile_uploadDataBj8OpenCamera =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataBj8OpenCamera = '';

  bool isDataUploading_uploadDataUmgFileMaintenacne = false;
  FFUploadedFile uploadedLocalFile_uploadDataUmgFileMaintenacne =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataUmgFileMaintenacne = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MyPropertiesRecord? getMyProperty;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController3Validator = _textController3Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
