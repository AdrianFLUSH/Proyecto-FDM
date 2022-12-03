import 'package:untitled3/flutter_flow_theme.dart';
import 'package:untitled3/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/about.dart';
import 'package:untitled3/creation.dart';
import 'package:untitled3/gameinfo.dart';
import 'package:untitled3/services/firebase_crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ListpageWidget extends StatefulWidget {
  const ListpageWidget({Key? key}) : super(key: key);

  @override
  _ListpageWidgetState createState() => _ListpageWidgetState();
}

class _ListpageWidgetState extends State<ListpageWidget> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readGame();
  bool? switchValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context,MaterialPageRoute(builder: (context) => AddPage()));
        },
        backgroundColor: const Color(0xFF39D2C0),
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24,
        ),
      ),
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primaryBackground,
                FlutterFlowTheme.of(context).secondaryColor
              ],
              stops: const [0, 1],
              begin: const AlignmentDirectional(0, -1),
              end: const AlignmentDirectional(0, 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 35, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    'Account',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Dark theme',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Switch(
                        value: switchValue ??= false,
                        onChanged: (newValue) async {
                          setState(() => switchValue = newValue);// add ! to new value
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const AboutWidget()));
                    },
                    child: Text(
                      'About us',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    'Filtros',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                    },
                    child: Text(
                      'Log out',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.settings_outlined,
            color: Color(0xFF1F5750),
            size: 24,
          ),
        ),
        title: Text(
          'Proyecto Fire Base ඞ',
          style: FlutterFlowTheme.of(context).title1.override(
            fontFamily: 'Lexend Deca',
            color: const Color(0xFF090F13),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'My Games',
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Lexend Deca',
                      color: const Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            //////////////////////Juego como tal
    StreamBuilder(
    stream: collectionReference,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
        child: ListView(
            //padding:
            //EdgeInsets.zero,
            //primary: false,
            //shrinkWrap: true,
            //scrollDirection: Axis.vertical,
          children: snapshot.data!.docs.map((e) {
            return Card(
           child:Column(children: [
            Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
            child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.network(e['image']).image,
            ),
            boxShadow: const [
            BoxShadow(
            blurRadius: 3,
            color: Color(0x33000000),
            offset: Offset(0, 2),
            )
            ],
            borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
            child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            ),
            ),
            child: Padding(
            padding:
            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
            Expanded(
            child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
            InkWell(
            onTap: () async {
            Navigator.push(context, MaterialPageRoute(
            builder: (
            context) => const GameInfoWidget()));
            },
            child: Text(
              e['name'],
            style: FlutterFlowTheme
                .of(context)
                .title2
                .override(
            fontFamily: 'Lexend Deca',
            color: const Color(0xFF090F13),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            ),
            ),
            ),
            ],
            ),
            ),
            Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            FFButtonWidget(
            onPressed: () {
            print('Button-Reserve pressed ...');
            },
            text: 'Mark as played',
            options: FFButtonOptions(
            height: 40,
            color: const Color(0xFF39D2C0),
            textStyle: GoogleFonts.getFont(
            'Lexend Deca',
            color: Colors.white,
            fontSize: 14,
            ),
            elevation: 3,
            borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
            ),
            ),
            ),
            Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
            0, 5, 0, 0),
            child: Text(
              e['rated'] + e['description'],
            style: FlutterFlowTheme
                .of(context)
                .bodyText1,
            ),
            ),
            ],
            ),
            ],
            ),
            ),
            ),
            ),
            ),
            ),
            ]));
          }).toList(),
        ),
      );
    }return Container();
    },
    ),
          ],
        ),
      ),
    );
  }
}