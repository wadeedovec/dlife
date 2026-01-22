import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_qty_counter_model.dart';
export 'cart_qty_counter_model.dart';

class CartQtyCounterWidget extends StatefulWidget {
  const CartQtyCounterWidget({
    super.key,
    required this.getProduct,
  });

  final dynamic getProduct;

  @override
  State<CartQtyCounterWidget> createState() => _CartQtyCounterWidgetState();
}

class _CartQtyCounterWidgetState extends State<CartQtyCounterWidget> {
  late CartQtyCounterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartQtyCounterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 96.0,
      height: 20.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        shape: BoxShape.rectangle,
      ),
      child: FlutterFlowCountController(
        decrementIconBuilder: (enabled) => Icon(
          Icons.remove_rounded,
          color: enabled
              ? FlutterFlowTheme.of(context).primaryText
              : FlutterFlowTheme.of(context).alternate,
          size: 16.0,
        ),
        incrementIconBuilder: (enabled) => Icon(
          Icons.add_rounded,
          color: enabled
              ? FlutterFlowTheme.of(context).primaryText
              : FlutterFlowTheme.of(context).alternate,
          size: 16.0,
        ),
        countBuilder: (count) => Text(
          count.toString(),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
              ),
        ),
        count: _model.countControllerValue ??= getJsonField(
          widget.getProduct,
          r'''$.quantity''',
        ),
        updateCount: (count) async {
          safeSetState(() => _model.countControllerValue = count);
          FFAppState().cartItems = functions
              .updateCartQuantity(
                  getJsonField(
                    widget.getProduct,
                    r'''$.product_id''',
                  ).toString(),
                  _model.countControllerValue!,
                  FFAppState().cartItems.toList())
              .toList()
              .cast<dynamic>();
          _model.updatePage(() {});
        },
        stepSize: 1,
        minimum: 0,
        contentPadding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      ),
    );
  }
}
