import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart' deferred as app_localizations_af;
import 'app_localizations_ar.dart' deferred as app_localizations_ar;
import 'app_localizations_az.dart' deferred as app_localizations_az;
import 'app_localizations_be.dart' deferred as app_localizations_be;
import 'app_localizations_bg.dart' deferred as app_localizations_bg;
import 'app_localizations_bs.dart' deferred as app_localizations_bs;
import 'app_localizations_ca.dart' deferred as app_localizations_ca;
import 'app_localizations_cs.dart' deferred as app_localizations_cs;
import 'app_localizations_cy.dart' deferred as app_localizations_cy;
import 'app_localizations_da.dart' deferred as app_localizations_da;
import 'app_localizations_de.dart' deferred as app_localizations_de;
import 'app_localizations_dv.dart' deferred as app_localizations_dv;
import 'app_localizations_el.dart' deferred as app_localizations_el;
import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_eo.dart' deferred as app_localizations_eo;
import 'app_localizations_es.dart' deferred as app_localizations_es;
import 'app_localizations_et.dart' deferred as app_localizations_et;
import 'app_localizations_eu.dart' deferred as app_localizations_eu;
import 'app_localizations_fa.dart' deferred as app_localizations_fa;
import 'app_localizations_fi.dart' deferred as app_localizations_fi;
import 'app_localizations_fo.dart' deferred as app_localizations_fo;
import 'app_localizations_fr.dart' deferred as app_localizations_fr;
import 'app_localizations_gl.dart' deferred as app_localizations_gl;
import 'app_localizations_gu.dart' deferred as app_localizations_gu;
import 'app_localizations_he.dart' deferred as app_localizations_he;
import 'app_localizations_hi.dart' deferred as app_localizations_hi;
import 'app_localizations_hr.dart' deferred as app_localizations_hr;
import 'app_localizations_hu.dart' deferred as app_localizations_hu;
import 'app_localizations_hy.dart' deferred as app_localizations_hy;
import 'app_localizations_id.dart' deferred as app_localizations_id;
import 'app_localizations_is.dart' deferred as app_localizations_is;
import 'app_localizations_it.dart' deferred as app_localizations_it;
import 'app_localizations_ja.dart' deferred as app_localizations_ja;
import 'app_localizations_ka.dart' deferred as app_localizations_ka;
import 'app_localizations_kk.dart' deferred as app_localizations_kk;
import 'app_localizations_kn.dart' deferred as app_localizations_kn;
import 'app_localizations_ko.dart' deferred as app_localizations_ko;
import 'app_localizations_ky.dart' deferred as app_localizations_ky;
import 'app_localizations_lt.dart' deferred as app_localizations_lt;
import 'app_localizations_lv.dart' deferred as app_localizations_lv;
import 'app_localizations_mi.dart' deferred as app_localizations_mi;
import 'app_localizations_mk.dart' deferred as app_localizations_mk;
import 'app_localizations_mn.dart' deferred as app_localizations_mn;
import 'app_localizations_mr.dart' deferred as app_localizations_mr;
import 'app_localizations_ms.dart' deferred as app_localizations_ms;
import 'app_localizations_mt.dart' deferred as app_localizations_mt;
import 'app_localizations_nb.dart' deferred as app_localizations_nb;
import 'app_localizations_nl.dart' deferred as app_localizations_nl;
import 'app_localizations_nn.dart' deferred as app_localizations_nn;
import 'app_localizations_pa.dart' deferred as app_localizations_pa;
import 'app_localizations_pl.dart' deferred as app_localizations_pl;
import 'app_localizations_ps.dart' deferred as app_localizations_ps;
import 'app_localizations_pt.dart' deferred as app_localizations_pt;
import 'app_localizations_qu.dart' deferred as app_localizations_qu;
import 'app_localizations_ro.dart' deferred as app_localizations_ro;
import 'app_localizations_ru.dart' deferred as app_localizations_ru;
import 'app_localizations_sa.dart' deferred as app_localizations_sa;
import 'app_localizations_se.dart' deferred as app_localizations_se;
import 'app_localizations_sk.dart' deferred as app_localizations_sk;
import 'app_localizations_sl.dart' deferred as app_localizations_sl;
import 'app_localizations_sq.dart' deferred as app_localizations_sq;
import 'app_localizations_sr.dart' deferred as app_localizations_sr;
import 'app_localizations_sv.dart' deferred as app_localizations_sv;
import 'app_localizations_sw.dart' deferred as app_localizations_sw;
import 'app_localizations_syr.dart' deferred as app_localizations_syr;
import 'app_localizations_ta.dart' deferred as app_localizations_ta;
import 'app_localizations_te.dart' deferred as app_localizations_te;
import 'app_localizations_th.dart' deferred as app_localizations_th;
import 'app_localizations_tl.dart' deferred as app_localizations_tl;
import 'app_localizations_tn.dart' deferred as app_localizations_tn;
import 'app_localizations_tr.dart' deferred as app_localizations_tr;
import 'app_localizations_ts.dart' deferred as app_localizations_ts;
import 'app_localizations_tt.dart' deferred as app_localizations_tt;
import 'app_localizations_uk.dart' deferred as app_localizations_uk;
import 'app_localizations_ur.dart' deferred as app_localizations_ur;
import 'app_localizations_uz.dart' deferred as app_localizations_uz;
import 'app_localizations_vi.dart' deferred as app_localizations_vi;
import 'app_localizations_xh.dart' deferred as app_localizations_xh;
import 'app_localizations_zh.dart' deferred as app_localizations_zh;
import 'app_localizations_zu.dart' deferred as app_localizations_zu;

/// Callers can lookup localized strings with an instance of GTKLocalizations
/// returned by `GTKLocalizations.of(context)`.
///
/// Applications need to include `GTKLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: GTKLocalizations.localizationsDelegates,
///   supportedLocales: GTKLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the GTKLocalizations.supportedLocales
/// property.
abstract class GTKLocalizations {
  GTKLocalizations(final String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale);

  final String localeName;

  static GTKLocalizations of(final BuildContext context) =>
      Localizations.of<GTKLocalizations>(context, GTKLocalizations)!;

  static const LocalizationsDelegate<GTKLocalizations> delegate =
      _GTKLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('af'),
    Locale('ar'),
    Locale('az'),
    Locale('be'),
    Locale('bg'),
    Locale('bs'),
    Locale('ca'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('dv'),
    Locale('el'),
    Locale('en'),
    Locale('eo'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fo'),
    Locale('fr'),
    Locale('gl'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('hy'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('kn'),
    Locale('ko'),
    Locale('ky'),
    Locale('lt'),
    Locale('lv'),
    Locale('mi'),
    Locale('mk'),
    Locale('mn'),
    Locale('mr'),
    Locale('ms'),
    Locale('mt'),
    Locale('nb'),
    Locale('nl'),
    Locale('nn'),
    Locale('pa'),
    Locale('pl'),
    Locale('ps'),
    Locale('pt'),
    Locale('qu'),
    Locale('ro'),
    Locale('ru'),
    Locale('sa'),
    Locale('se'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sr'),
    Locale('sv'),
    Locale('sw'),
    Locale('syr'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tl'),
    Locale('tn'),
    Locale('tr'),
    Locale('ts'),
    Locale('tt'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vi'),
    Locale('xh'),
    Locale('zh'),
    Locale('zu')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'GTK'**
  String get appName;

  /// Minimize button label.
  ///
  /// In en, this message translates to:
  /// **'Minimize'**
  String get minimize;

  /// Maximize button label.
  ///
  /// In en, this message translates to:
  /// **'Maximize'**
  String get maximize;

  /// Unmaximize button label.
  ///
  /// In en, this message translates to:
  /// **'Unmaximize'**
  String get unmaximize;
}

class _GTKLocalizationsDelegate
    extends LocalizationsDelegate<GTKLocalizations> {
  const _GTKLocalizationsDelegate();

  @override
  Future<GTKLocalizations> load(final Locale locale) =>
      lookupGTKLocalizations(locale);

  @override
  bool isSupported(final Locale locale) => <String>[
        'af',
        'ar',
        'az',
        'be',
        'bg',
        'bs',
        'ca',
        'cs',
        'cy',
        'da',
        'de',
        'dv',
        'el',
        'en',
        'eo',
        'es',
        'et',
        'eu',
        'fa',
        'fi',
        'fo',
        'fr',
        'gl',
        'gu',
        'he',
        'hi',
        'hr',
        'hu',
        'hy',
        'id',
        'is',
        'it',
        'ja',
        'ka',
        'kk',
        'kn',
        'ko',
        'ky',
        'lt',
        'lv',
        'mi',
        'mk',
        'mn',
        'mr',
        'ms',
        'mt',
        'nb',
        'nl',
        'nn',
        'pa',
        'pl',
        'ps',
        'pt',
        'qu',
        'ro',
        'ru',
        'sa',
        'se',
        'sk',
        'sl',
        'sq',
        'sr',
        'sv',
        'sw',
        'syr',
        'ta',
        'te',
        'th',
        'tl',
        'tn',
        'tr',
        'ts',
        'tt',
        'uk',
        'ur',
        'uz',
        'vi',
        'xh',
        'zh',
        'zu'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(final _GTKLocalizationsDelegate old) => false;
}

Future<GTKLocalizations> lookupGTKLocalizations(final Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return app_localizations_af
          .loadLibrary()
          .then((final dynamic _) => app_localizations_af.GTKLocalizationsAf());
    case 'ar':
      return app_localizations_ar
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ar.GTKLocalizationsAr());
    case 'az':
      return app_localizations_az
          .loadLibrary()
          .then((final dynamic _) => app_localizations_az.GTKLocalizationsAz());
    case 'be':
      return app_localizations_be
          .loadLibrary()
          .then((final dynamic _) => app_localizations_be.GTKLocalizationsBe());
    case 'bg':
      return app_localizations_bg
          .loadLibrary()
          .then((final dynamic _) => app_localizations_bg.GTKLocalizationsBg());
    case 'bs':
      return app_localizations_bs
          .loadLibrary()
          .then((final dynamic _) => app_localizations_bs.GTKLocalizationsBs());
    case 'ca':
      return app_localizations_ca
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ca.GTKLocalizationsCa());
    case 'cs':
      return app_localizations_cs
          .loadLibrary()
          .then((final dynamic _) => app_localizations_cs.GTKLocalizationsCs());
    case 'cy':
      return app_localizations_cy
          .loadLibrary()
          .then((final dynamic _) => app_localizations_cy.GTKLocalizationsCy());
    case 'da':
      return app_localizations_da
          .loadLibrary()
          .then((final dynamic _) => app_localizations_da.GTKLocalizationsDa());
    case 'de':
      return app_localizations_de
          .loadLibrary()
          .then((final dynamic _) => app_localizations_de.GTKLocalizationsDe());
    case 'dv':
      return app_localizations_dv
          .loadLibrary()
          .then((final dynamic _) => app_localizations_dv.GTKLocalizationsDv());
    case 'el':
      return app_localizations_el
          .loadLibrary()
          .then((final dynamic _) => app_localizations_el.GTKLocalizationsEl());
    case 'en':
      return app_localizations_en
          .loadLibrary()
          .then((final dynamic _) => app_localizations_en.GTKLocalizationsEn());
    case 'eo':
      return app_localizations_eo
          .loadLibrary()
          .then((final dynamic _) => app_localizations_eo.GTKLocalizationsEo());
    case 'es':
      return app_localizations_es
          .loadLibrary()
          .then((final dynamic _) => app_localizations_es.GTKLocalizationsEs());
    case 'et':
      return app_localizations_et
          .loadLibrary()
          .then((final dynamic _) => app_localizations_et.GTKLocalizationsEt());
    case 'eu':
      return app_localizations_eu
          .loadLibrary()
          .then((final dynamic _) => app_localizations_eu.GTKLocalizationsEu());
    case 'fa':
      return app_localizations_fa
          .loadLibrary()
          .then((final dynamic _) => app_localizations_fa.GTKLocalizationsFa());
    case 'fi':
      return app_localizations_fi
          .loadLibrary()
          .then((final dynamic _) => app_localizations_fi.GTKLocalizationsFi());
    case 'fo':
      return app_localizations_fo
          .loadLibrary()
          .then((final dynamic _) => app_localizations_fo.GTKLocalizationsFo());
    case 'fr':
      return app_localizations_fr
          .loadLibrary()
          .then((final dynamic _) => app_localizations_fr.GTKLocalizationsFr());
    case 'gl':
      return app_localizations_gl
          .loadLibrary()
          .then((final dynamic _) => app_localizations_gl.GTKLocalizationsGl());
    case 'gu':
      return app_localizations_gu
          .loadLibrary()
          .then((final dynamic _) => app_localizations_gu.GTKLocalizationsGu());
    case 'he':
      return app_localizations_he
          .loadLibrary()
          .then((final dynamic _) => app_localizations_he.GTKLocalizationsHe());
    case 'hi':
      return app_localizations_hi
          .loadLibrary()
          .then((final dynamic _) => app_localizations_hi.GTKLocalizationsHi());
    case 'hr':
      return app_localizations_hr
          .loadLibrary()
          .then((final dynamic _) => app_localizations_hr.GTKLocalizationsHr());
    case 'hu':
      return app_localizations_hu
          .loadLibrary()
          .then((final dynamic _) => app_localizations_hu.GTKLocalizationsHu());
    case 'hy':
      return app_localizations_hy
          .loadLibrary()
          .then((final dynamic _) => app_localizations_hy.GTKLocalizationsHy());
    case 'id':
      return app_localizations_id
          .loadLibrary()
          .then((final dynamic _) => app_localizations_id.GTKLocalizationsId());
    case 'is':
      return app_localizations_is
          .loadLibrary()
          .then((final dynamic _) => app_localizations_is.GTKLocalizationsIs());
    case 'it':
      return app_localizations_it
          .loadLibrary()
          .then((final dynamic _) => app_localizations_it.GTKLocalizationsIt());
    case 'ja':
      return app_localizations_ja
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ja.GTKLocalizationsJa());
    case 'ka':
      return app_localizations_ka
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ka.GTKLocalizationsKa());
    case 'kk':
      return app_localizations_kk
          .loadLibrary()
          .then((final dynamic _) => app_localizations_kk.GTKLocalizationsKk());
    case 'kn':
      return app_localizations_kn
          .loadLibrary()
          .then((final dynamic _) => app_localizations_kn.GTKLocalizationsKn());
    case 'ko':
      return app_localizations_ko
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ko.GTKLocalizationsKo());
    case 'ky':
      return app_localizations_ky
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ky.GTKLocalizationsKy());
    case 'lt':
      return app_localizations_lt
          .loadLibrary()
          .then((final dynamic _) => app_localizations_lt.GTKLocalizationsLt());
    case 'lv':
      return app_localizations_lv
          .loadLibrary()
          .then((final dynamic _) => app_localizations_lv.GTKLocalizationsLv());
    case 'mi':
      return app_localizations_mi
          .loadLibrary()
          .then((final dynamic _) => app_localizations_mi.GTKLocalizationsMi());
    case 'mk':
      return app_localizations_mk
          .loadLibrary()
          .then((final dynamic _) => app_localizations_mk.GTKLocalizationsMk());
    case 'mn':
      return app_localizations_mn
          .loadLibrary()
          .then((final dynamic _) => app_localizations_mn.GTKLocalizationsMn());
    case 'mr':
      return app_localizations_mr
          .loadLibrary()
          .then((final dynamic _) => app_localizations_mr.GTKLocalizationsMr());
    case 'ms':
      return app_localizations_ms
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ms.GTKLocalizationsMs());
    case 'mt':
      return app_localizations_mt
          .loadLibrary()
          .then((final dynamic _) => app_localizations_mt.GTKLocalizationsMt());
    case 'nb':
      return app_localizations_nb
          .loadLibrary()
          .then((final dynamic _) => app_localizations_nb.GTKLocalizationsNb());
    case 'nl':
      return app_localizations_nl
          .loadLibrary()
          .then((final dynamic _) => app_localizations_nl.GTKLocalizationsNl());
    case 'nn':
      return app_localizations_nn
          .loadLibrary()
          .then((final dynamic _) => app_localizations_nn.GTKLocalizationsNn());
    case 'pa':
      return app_localizations_pa
          .loadLibrary()
          .then((final dynamic _) => app_localizations_pa.GTKLocalizationsPa());
    case 'pl':
      return app_localizations_pl
          .loadLibrary()
          .then((final dynamic _) => app_localizations_pl.GTKLocalizationsPl());
    case 'ps':
      return app_localizations_ps
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ps.GTKLocalizationsPs());
    case 'pt':
      return app_localizations_pt
          .loadLibrary()
          .then((final dynamic _) => app_localizations_pt.GTKLocalizationsPt());
    case 'qu':
      return app_localizations_qu
          .loadLibrary()
          .then((final dynamic _) => app_localizations_qu.GTKLocalizationsQu());
    case 'ro':
      return app_localizations_ro
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ro.GTKLocalizationsRo());
    case 'ru':
      return app_localizations_ru
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ru.GTKLocalizationsRu());
    case 'sa':
      return app_localizations_sa
          .loadLibrary()
          .then((final dynamic _) => app_localizations_sa.GTKLocalizationsSa());
    case 'se':
      return app_localizations_se
          .loadLibrary()
          .then((final dynamic _) => app_localizations_se.GTKLocalizationsSe());
    case 'sk':
      return app_localizations_sk
          .loadLibrary()
          .then((final dynamic _) => app_localizations_sk.GTKLocalizationsSk());
    case 'sl':
      return app_localizations_sl
          .loadLibrary()
          .then((final dynamic _) => app_localizations_sl.GTKLocalizationsSl());
    case 'sq':
      return app_localizations_sq
          .loadLibrary()
          .then((final dynamic _) => app_localizations_sq.GTKLocalizationsSq());
    case 'sr':
      return app_localizations_sr
          .loadLibrary()
          .then((final dynamic _) => app_localizations_sr.GTKLocalizationsSr());
    case 'sv':
      return app_localizations_sv
          .loadLibrary()
          .then((final dynamic _) => app_localizations_sv.GTKLocalizationsSv());
    case 'sw':
      return app_localizations_sw
          .loadLibrary()
          .then((final dynamic _) => app_localizations_sw.GTKLocalizationsSw());
    case 'syr':
      return app_localizations_syr.loadLibrary().then(
            (final dynamic _) => app_localizations_syr.GTKLocalizationsSyr(),
          );
    case 'ta':
      return app_localizations_ta
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ta.GTKLocalizationsTa());
    case 'te':
      return app_localizations_te
          .loadLibrary()
          .then((final dynamic _) => app_localizations_te.GTKLocalizationsTe());
    case 'th':
      return app_localizations_th
          .loadLibrary()
          .then((final dynamic _) => app_localizations_th.GTKLocalizationsTh());
    case 'tl':
      return app_localizations_tl
          .loadLibrary()
          .then((final dynamic _) => app_localizations_tl.GTKLocalizationsTl());
    case 'tn':
      return app_localizations_tn
          .loadLibrary()
          .then((final dynamic _) => app_localizations_tn.GTKLocalizationsTn());
    case 'tr':
      return app_localizations_tr
          .loadLibrary()
          .then((final dynamic _) => app_localizations_tr.GTKLocalizationsTr());
    case 'ts':
      return app_localizations_ts
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ts.GTKLocalizationsTs());
    case 'tt':
      return app_localizations_tt
          .loadLibrary()
          .then((final dynamic _) => app_localizations_tt.GTKLocalizationsTt());
    case 'uk':
      return app_localizations_uk
          .loadLibrary()
          .then((final dynamic _) => app_localizations_uk.GTKLocalizationsUk());
    case 'ur':
      return app_localizations_ur
          .loadLibrary()
          .then((final dynamic _) => app_localizations_ur.GTKLocalizationsUr());
    case 'uz':
      return app_localizations_uz
          .loadLibrary()
          .then((final dynamic _) => app_localizations_uz.GTKLocalizationsUz());
    case 'vi':
      return app_localizations_vi
          .loadLibrary()
          .then((final dynamic _) => app_localizations_vi.GTKLocalizationsVi());
    case 'xh':
      return app_localizations_xh
          .loadLibrary()
          .then((final dynamic _) => app_localizations_xh.GTKLocalizationsXh());
    case 'zh':
      return app_localizations_zh
          .loadLibrary()
          .then((final dynamic _) => app_localizations_zh.GTKLocalizationsZh());
    case 'zu':
      return app_localizations_zu
          .loadLibrary()
          .then((final dynamic _) => app_localizations_zu.GTKLocalizationsZu());
  }

  throw FlutterError(
      'GTKLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
