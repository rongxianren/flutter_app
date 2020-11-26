// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:country_code_picker/country_localizations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       supportedLocales: [
//         Locale('en'),
//         Locale('it'),
//         Locale('fr'),
//         Locale('es'),
//         Locale('de'),
//         Locale('pt'),
//         Locale('ko'),
//       ],
//       localizationsDelegates: [
//         CountryLocalizations.delegate,
//       ],
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: const Text('CountryPicker Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               CountryCodePicker(
//                 onChanged: print,
//                 // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                 initialSelection: 'IT',
//                 favorite: ['+39', 'FR'],
//                 countryFilter: ['IT', 'FR'],
//                 showFlagDialog: false,
//                 comparator: (a, b) => b.name.compareTo(a.name),
//                 //Get the country information relevant to the initial selection
//                 onInit: (code) => print("on init ${code.name} ${code.dialCode} ${code.name}"),
//               ),
//               SizedBox(
//                 width: 400,
//                 height: 60,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CountryCodePicker(
//                     onChanged: print,
//                     hideMainText: true,
//                     showFlagMain: true,
//                     showFlag: false,
//                     initialSelection: 'TF',
//                     hideSearch: true,
//                     showCountryOnly: true,
//                     showOnlyCountryWhenClosed: true,
//                     alignLeft: true,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 400,
//                 height: 60,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CountryCodePicker(
//                     onChanged: (e) => print(e.toLongString()),
//                     initialSelection: 'TF',
//                     showCountryOnly: true,
//                     showOnlyCountryWhenClosed: true,
//                     favorite: ['+39', 'FR'],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 100,
//                 height: 60,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CountryCodePicker(
//                     enabled: false,
//                     onChanged: (c) => c.name,
//                     initialSelection: 'TF',
//                     showCountryOnly: true,
//                     showOnlyCountryWhenClosed: true,
//                     favorite: ['+39', 'FR'],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/stateful_widget/ExampleEnter.dart';
import 'package:flutter_app/widgetExample/WidgetExample.dart';
import 'package:flutter_app/widget_listviewExample/ListViewLoadMore.dart';
import 'animationExample/AnimationTest.dart';
import 'channelExample/MethodChannel.dart';
import 'example1/FirstSimpleApp.dart';
import 'example2/LakeExample.dart';

void main() => runApp(EnterWidget());

final _biggerFont = const TextStyle(fontSize: 18.0);

class EnterWidget extends StatelessWidget {
  Map<String, Widget> widgetsMap = HashMap();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Enter',
      home: Builder(
          builder: (context) => Center(
                child: createItemList(context),
              )),
    );
  }

  Widget createItemList(BuildContext context) {
    widgetsMap.putIfAbsent('FirstSimpleApp', () => FirstSimpleApp());
    widgetsMap.putIfAbsent('LayoutSimpleApp', () => LayoutApp());
    widgetsMap['StateManagerment'] = StatefulWidgetLayout();
    widgetsMap['MethodChannel'] = ChannelWidget();
    widgetsMap['WidgetExample'] = WidgetExample();
    widgetsMap['ListViewLoadMore'] = ListViewWidget();
    widgetsMap['PainterContainer'] = PainterContainer();

    return Scaffold(
      appBar: AppBar(
        title: Text('Fluter Demo Enter'),
      ),
      body: ListView.builder(
          itemCount: widgetsMap.keys.length,
          itemBuilder: (BuildContext context, int index) {
            return getItem(widgetsMap.values.elementAt(index), context,
                widgetsMap.keys.elementAt(index));
          }),
    );
  }

  Widget getItem(Widget item, BuildContext context, String itemContent) {
    return Container(
      constraints: BoxConstraints.expand(height: 50.0),
      child: RaisedButton(
        onPressed: () {
          navigation(item, context);
        },
        child: Text(
          itemContent,
          style: _biggerFont,
        ),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }

  navigation(Widget widget, BuildContext buildContext) {
    Navigator.of(buildContext).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
