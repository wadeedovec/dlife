import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'secure_pay_model.dart';
export 'secure_pay_model.dart';

class SecurePayWidget extends StatefulWidget {
  const SecurePayWidget({
    super.key,
    required this.amount,
    required this.cardName,
    required this.cardNo,
    required this.cardCvv,
    required this.cardExpireMonth,
    required this.cardExpireYear,
    required this.ip,
    required this.userId,
    required this.walletId,
  });

  final double? amount;
  final String? cardName;
  final String? cardNo;
  final String? cardCvv;
  final String? cardExpireMonth;
  final String? cardExpireYear;
  final String? ip;
  final DocumentReference? userId;
  final DocumentReference? walletId;

  static String routeName = 'securePay';
  static String routePath = '/securePay';

  @override
  State<SecurePayWidget> createState() => _SecurePayWidgetState();
}

class _SecurePayWidgetState extends State<SecurePayWidget> {
  late SecurePayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecurePayModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget.amount == null) ||
          (widget.cardName == null || widget.cardName == '') ||
          (widget.cardNo == null || widget.cardNo == '') ||
          (widget.cardCvv == null || widget.cardCvv == '') ||
          (widget.cardExpireMonth == null || widget.cardExpireMonth == '') ||
          (widget.cardExpireYear == null || widget.cardExpireYear == '') ||
          (widget.ip == null || widget.ip == '')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Please fill up the checkout form correctly.',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );

        context.goNamed(WalletHomeWidget.routeName);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WalletRecord>(
      stream: WalletRecord.getDocument(widget.walletId!)
        ..listen((securePayWalletRecord) async {
          if (_model.securePayPreviousSnapshot != null &&
              !WalletRecordDocumentEquality().equals(
                  securePayWalletRecord, _model.securePayPreviousSnapshot)) {
            context.goNamed(
              WalletHomeWidget.routeName,
              queryParameters: {
                'successTopUp': serializeParam(
                  1,
                  ParamType.int,
                ),
                'price': serializeParam(
                  widget.amount,
                  ParamType.double,
                ),
                'dateTime': serializeParam(
                  getCurrentTimestamp,
                  ParamType.DateTime,
                ),
              }.withoutNulls,
            );

            safeSetState(() {});
          }
          _model.securePayPreviousSnapshot = securePayWalletRecord;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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

        final securePayWalletRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  'qrfqr9uo' /* 3d Secure */,
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
                      fontSize: 30.0,
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
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FlutterFlowWebView(
                            content:
                                'https://wadee.icard.cool/here.html?amount=${widget.amount?.toString()}&cardName=${widget.cardName}&cardNo=${widget.cardNo}&cardCvv=${widget.cardCvv}&cardExpireMonth=${widget.cardExpireMonth}&cardExpireYear=${widget.cardExpireYear}&userIp=${widget.ip}&userName=${currentUserDisplayName}&userEmail=${currentUserEmail}&userPhone=${currentPhoneNumber}&walletId=${widget.walletId?.id}&userId=${widget.userId?.id}',
                            bypass: false,
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            verticalScroll: false,
                            horizontalScroll: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
