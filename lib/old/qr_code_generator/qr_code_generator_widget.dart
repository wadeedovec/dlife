import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'qr_code_generator_model.dart';
export 'qr_code_generator_model.dart';

class QrCodeGeneratorWidget extends StatefulWidget {
  const QrCodeGeneratorWidget({super.key});

  static String routeName = 'qrCodeGenerator';
  static String routePath = '/qrCodeGenerator';

  @override
  State<QrCodeGeneratorWidget> createState() => _QrCodeGeneratorWidgetState();
}

class _QrCodeGeneratorWidgetState extends State<QrCodeGeneratorWidget> {
  late QrCodeGeneratorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrCodeGeneratorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WalletRecord>>(
      stream: FFAppState().userWallet(
        requestFn: () => queryWalletRecord(
          queryBuilder: (walletRecord) => walletRecord.where(
            'user_wallet',
            isEqualTo: currentUserReference,
          ),
          singleRecord: true,
        ),
      )..listen((snapshot) {
          List<WalletRecord> qrCodeGeneratorWalletRecordList = snapshot;
          final qrCodeGeneratorWalletRecord =
              qrCodeGeneratorWalletRecordList.isNotEmpty
                  ? qrCodeGeneratorWalletRecordList.first
                  : null;
          if (_model.qrCodeGeneratorPreviousSnapshot != null &&
              !const ListEquality(WalletRecordDocumentEquality()).equals(
                  qrCodeGeneratorWalletRecordList,
                  _model.qrCodeGeneratorPreviousSnapshot)) {
            () async {
              unawaited(
                () async {}(),
              );

              safeSetState(() {});
            }();
          }
          _model.qrCodeGeneratorPreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF9FAFB),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<WalletRecord> qrCodeGeneratorWalletRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final qrCodeGeneratorWalletRecord =
            qrCodeGeneratorWalletRecordList.isNotEmpty
                ? qrCodeGeneratorWalletRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF9FAFB),
            appBar: AppBar(
              backgroundColor: Color(0xFFF9FAFB),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 20.0,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '84uravbg' /* QR Code  */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              toolbarHeight: 45.0,
              elevation: 1.0,
            ),
            body: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300.0,
                          height: 300.0,
                          child: custom_widgets.KaiQRCodeRenderWidget(
                            width: 300.0,
                            height: 300.0,
                            data: '${currentUserUid}',
                            cornersColor: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
