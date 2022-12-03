import 'package:untitled3/flutter_flow_icon_button.dart';
import 'package:untitled3/flutter_flow_theme.dart';
import 'package:untitled3/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/listpage.dart';
import 'package:untitled3/services/firebase_crud.dart';


//class AddPage extends StatefulWidget {
  //@override
  //State<StatefulWidget> createState() {
    // TODO: implement createState
    //return _AddPage();
 // }
//}

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
 @override
 _CreationWidgetState createState() => _CreationWidgetState();
}

class _CreationWidgetState extends State<AddPage> {
  TextEditingController textController1=TextEditingController();
  TextEditingController textController2=TextEditingController();
  TextEditingController textController3=TextEditingController();
  TextEditingController textController4=TextEditingController();
  double ratingBarValue=2;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Add Game',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(

        //////rnrgkjhdsfoijgsfg
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.94,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: textController1,
                          autofocus: true,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'URL image',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: TextFormField(
                            controller: textController2,
                            autofocus: true,
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'This field is required';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Game Title',
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        TextFormField(
                          controller: textController3,
                          autofocus: true,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Classification',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: textController4,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'This field is required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter game description...',
                                    hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        20, 32, 20, 12),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  textAlign: TextAlign.start,
                                  maxLines: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            RatingBar.builder(
              onRatingUpdate: (newValue) =>
                  setState(() => ratingBarValue = newValue),
              itemBuilder: (context, index) => Icon(
                Icons.star_rounded,
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
              direction: Axis.horizontal,
              initialRating: ratingBarValue = 3,
              unratedColor: const Color(0xFF9E9E9E),
              itemCount: 5,
              itemSize: 40,
              glowColor: FlutterFlowTheme.of(context).secondaryColor,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {





                    var response = await FirebaseCrud.addGame(
                        image: textController1.text,
                        name: textController2.text,
                        rated: textController3.text,
                        description: textController4.text);

                    if (response.code != 200) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(response.message.toString()),
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(response.message.toString()),
                            );
                          });

                  }
                },
                text: 'Set Game',
                options: FFButtonOptions(
                  width: 270,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  elevation: 3,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
