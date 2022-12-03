import 'package:untitled3/flutter_flow_icon_button.dart';
import 'package:untitled3/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GameInfoWidget extends StatefulWidget {
  const GameInfoWidget({Key? key}) : super(key: key);

  @override
  _GameInfoWidgetState createState() => _GameInfoWidgetState();
}

class _GameInfoWidgetState extends State<GameInfoWidget> {
  double? ratingBarValue;
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
          'Game Title',
          style: FlutterFlowTheme.of(context).title2.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 22,
          ),
        ),
        actions: [
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Text(
                'Played Status',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 350,
                      decoration: const BoxDecoration(),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/pt/0/0f/Legend_of_Zelda_Breath_of_the_Wild_capa.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 15),
                      child: Text(
                        'My rank',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: const Color(0xFF096497),
                        ),
                      ),
                    ),
                    RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          setState(() => ratingBarValue = newValue),
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                      ),
                      direction: Axis.horizontal,
                      initialRating: ratingBarValue ??= 5,
                      unratedColor: const Color(0xFF9E9E9E),
                      itemCount: 5,
                      itemSize: 40,
                      glowColor: FlutterFlowTheme.of(context).secondaryColor,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              'Clasificacion',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 150,
                          decoration: const BoxDecoration(),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              'A',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Poppins',
                                fontSize: 36,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur adipiscing elit, netus justo faucibus suscipit aenean luctus ridiculus fusce, fermentum sed arcu est feugiat iaculis. Potenti tempor donec conubia in etiam egestas mollis mus lectus lobortis malesuada, magna pulvinar montes leo hendrerit fermentum torquent pellentesque senectus ut purus, ultricies sollicitudin aptent pretium quam vitae proin ligula ad eleifend. ',
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(),
                        alignment:
                        const AlignmentDirectional(-0.050000000000000044, 0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}