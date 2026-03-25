// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'screens/converter_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await MobileAds.instance.initialize();

  // Alle Flutter-Fehler an Crashlytics weiterleiten
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Dart-Fehler außerhalb des Flutter-Frameworks (z.B. in async code)
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  LicenseRegistry.addLicense(() async* {
    yield const LicenseEntryWithLineBreaks(
      ['FFmpeg', 'libx264 (via ffmpeg_kit_flutter_new)'],
      'GNU GENERAL PUBLIC LICENSE\n'
      'Version 3, 29 June 2007\n\n'
      'Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>\n'
      'Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.\n\n'
      'PREAMBLE\n\n'
      'The GNU General Public License is a free, copyleft license for software and other kinds of works.\n\n'
      'When we speak of free software, we are referring to freedom, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for them if you wish), that you receive source code or can get it if you want it, that you can change the software or use pieces of it in new free programs, and that you know you can do these things.\n\n'
      'To protect your rights, we need to prevent others from denying you these rights or asking you to surrender the rights. Therefore, you have certain responsibilities if you distribute copies of the software, or if you modify it: responsibilities to respect the freedom of others.\n\n'
      'For example, if you distribute copies of such a program, whether gratis or for a fee, you must pass on to the recipients the same freedoms that you received. You must make sure that they, too, receive or can get the source code. And you must show them these terms so they know their rights.\n\n'
      'Developers that use the GNU GPL protect your rights with two steps: (1) assert copyright on the software, and (2) offer you this License giving you legal permission to copy, distribute and/or modify it.\n\n'
      'TERMS AND CONDITIONS\n\n'
      '0. Definitions.\n\n'
      '"This License" refers to version 3 of the GNU General Public License.\n\n'
      '"The Program" refers to any copyrightable work licensed under this License.\n\n'
      '1. Source Code.\n\n'
      'The "source code" for a work means the preferred form of the work for making modifications to it. "Object code" means any non-source form of a work.\n\n'
      '2. Basic Permissions.\n\n'
      'All rights granted under this License are granted for the term of copyright on the Program, and are irrevocable provided the stated conditions are met. This License explicitly affirms your unlimited permission to run the unmodified Program.\n\n'
      '3. Protecting Users\' Legal Rights From Anti-Circumvention Law.\n\n'
      'No covered work shall be deemed part of an effective technological measure under any applicable law fulfilling obligations under article 11 of the WIPO copyright treaty.\n\n'
      '4. Conveying Verbatim Copies.\n\n'
      'You may convey verbatim copies of the Program\'s source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice.\n\n'
      '5. Conveying Modified Source Versions.\n\n'
      'You may convey a work based on the Program, or the modifications to produce it from the Program, in the form of source code under the terms of section 4, provided that you also meet all of these conditions: the work must carry prominent notices stating that you modified it, and giving a relevant date; the work must carry prominent notices stating that it is released under this License; you must license the entire work under this License to anyone who comes into possession of a copy.\n\n'
      '6. Conveying Non-Source Forms.\n\n'
      'You may convey a covered work in object code form under the terms of sections 4 and 5, provided that you also convey the machine-readable Corresponding Source under the terms of this License.\n\n'
      '7. Additional Terms.\n\n'
      '"Additional permissions" are terms that supplement the terms of this License by making exceptions from one or more of its conditions.\n\n'
      '8. Termination.\n\n'
      'You may not propagate or modify a covered work except as expressly provided under this License. Any attempt otherwise to propagate or modify it is void, and will automatically terminate your rights under this License.\n\n'
      '9. Acceptance Not Required for Having Copies.\n\n'
      'You are not required to accept this License in order to receive or run a copy of the Program.\n\n'
      '10. Automatic Licensing of Downstream Recipients.\n\n'
      'Each time you convey a covered work, the recipient automatically receives a license from the original licensors, to run, modify and propagate that work, subject to this License.\n\n'
      '11. Patents.\n\n'
      'A "contributor" is a copyright holder who authorizes use under this License of the Program or a work on which the Program is based.\n\n'
      '12. No Surrender of Others\' Freedom.\n\n'
      'If conditions are imposed on you that contradict the conditions of this License, they do not excuse you from the conditions of this License.\n\n'
      '15. Disclaimer of Warranty.\n\n'
      'THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. THE PROGRAM IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND.\n\n'
      '16. Limitation of Liability.\n\n'
      'IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW WILL ANY COPYRIGHT HOLDER BE LIABLE FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES.\n\n'
      'Full license text: https://www.gnu.org/licenses/gpl-3.0.html\n'
      'Source code: https://github.com/Androho24/SimpleVideoConverter',
    );
  });
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Video Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const VideoConverterApp(),
    );
  }
}
