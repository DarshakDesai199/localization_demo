import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_demo/constatnt/language.dart';
import 'package:localization_demo/main.dart';

import 'constatnt/language_constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
        },
      );
    }
  }

  // dynamic dropdownvalue ;

  // List of items in our dropdown menu
  var items = ['English', 'Hindi', 'Arbi', 'France'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.homePage,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton(
                icon: Icon(Icons.language, color: Colors.white),
                underline: SizedBox(),
                items: Language.languageList().map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Row(
                      children: [
                        Text(items.flag, textScaleFactor: 1.5),
                        Text(items.name),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (newValue) async {
                  setState(() {});
                  if (newValue != null) {
                    Locale _locale = await setLocale(newValue.languageCode);
                    // MyApp.setLocale(context, Locale(newValue.languageCode, ''));
                    MyApp.setLocale(context, _locale);
                  }
                },
              ),
            )
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text("Calender")),
            Text(
              "",
              // AppLocalizations.of(context)!.helloWorld,
              textScaleFactor: 1.5,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              translation(context).name,
              // AppLocalizations.of(context)!.name,
              textScaleFactor: 1.5,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              translation(context).email,

              // AppLocalizations.of(context)!.email,
              textScaleFactor: 1.5,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              translation(context).dateOfBirth,

              // AppLocalizations.of(context)!.dateOfBirth,
              textScaleFactor: 1.5,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              translation(context).personalInformation,

              // AppLocalizations.of(context)!.personalInformation,
              textScaleFactor: 1.5,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              translation(context).aboutUs,
              // AppLocalizations.of(context)!.aboutUs,
              textScaleFactor: 1.5,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              AppLocalizations.of(context)!.changeLanguage,
              textScaleFactor: 1.5,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              translation(context).about,
              // AppLocalizations.of(context)!.about,
              textScaleFactor: 1.5,
            ),
          ]),
        ),
      ),
    );
  }
}
