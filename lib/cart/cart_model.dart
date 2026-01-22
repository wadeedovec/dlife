import '/backend/backend.dart';
import '/components/cart_qty_counter_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedMenuId;

  String? selectedMenuName;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Models for cartQtyCounter dynamic component.
  late FlutterFlowDynamicModels<CartQtyCounterModel> cartQtyCounterModels;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WalletRecord? walletInfo;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? orderInfo;
  AudioPlayer? soundPlayer;
  // Model for TopBar component.
  late TopBarModel topBarModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    cartQtyCounterModels =
        FlutterFlowDynamicModels(() => CartQtyCounterModel());
    topBarModel = createModel(context, () => TopBarModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    cartQtyCounterModels.dispose();
    topBarModel.dispose();
    navBarModel.dispose();
  }
}
