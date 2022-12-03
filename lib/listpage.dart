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
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView(
                      children: snapshot.data!.docs.map((e) {
                        return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            margin: EdgeInsets.all(15),
                            elevation: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Column(
                                children: <Widget>[

                                  Image(
                                    image: NetworkImage(e['image']),

                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: <Widget>[
                                        Text('Titulo del Juego:' + e['name'],
                                            style: const TextStyle(fontSize: 14)),
                                        Text('Clasificacion:' +e['rated'],
                                            style: const TextStyle(fontSize: 12)),
                                        Text(e['description'],
                                            style: const TextStyle(fontSize: 14)),

                                      ],
                                    ),
                                  ),

                                  ButtonBar(
                                    alignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(5.0),
                                          primary: const Color.fromARGB(255, 143, 133, 226),
                                          textStyle: const TextStyle(fontSize: 20),
                                        ),
                                        child: const Text('Delete'),
                                        onPressed: () async {
                                          var response =
                                          await FirebaseCrud.deleteGame(docId: e.id);
                                          if (response.code != 200) {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content:
                                                    Text(response.message.toString()),
                                                  );
                                                });
                                          }
                                        },
                                      ),
                                    ],
                                  ),],
                              ),
                            ));
                      }).toList(),
                    ),
                  );
                }return Container();
              },
            ),
        );
  }
}