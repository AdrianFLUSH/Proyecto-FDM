import 'package:untitled3/flutter_flow_icon_button.dart';
import 'package:untitled3/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'About US',
          style: FlutterFlowTheme.of(context).title2.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 22,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primaryBackground,
                  FlutterFlowTheme.of(context).secondaryColor,
                  FlutterFlowTheme.of(context).primaryBackground
                ],
                stops: const [0, 0.5, 1],
                begin: const AlignmentDirectional(0, -1),
                end: const AlignmentDirectional(0, 1),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/994/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/72/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Universidad Autónoma de San Luis Potosi\nFacultad de ingeniería\nFundamentos de desarrollo Móvil',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(),
                            child: Image.network(
                              'https://picsum.photos/seed/107/600',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Adrian Cázares',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Text(
                            '309071',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(),
                            child: Image.network(
                              'https://picsum.photos/seed/590/600',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Leonardo González',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Text(
                            '3080965',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}