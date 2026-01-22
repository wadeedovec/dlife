import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tr', 'ru', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? trText = '',
    String? ruText = '',
    String? deText = '',
  }) =>
      [enText, trText, ruText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // securePay
  {
    'qrfqr9uo': {
      'en': '3d Secure',
      'de': '3D Sicher',
      'ru': '3D-безопасность',
      'tr': '3D Güvenli',
    },
    '68gft94o': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // home
  {
    '9pwju4s4': {
      'en': 'Order Progress',
      'de': 'Bestellfortschritt',
      'ru': 'Ход выполнения заказа',
      'tr': 'Sipariş İlerlemesi',
    },
    '95ff5zuv': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'amsk3583': {
      'en': 'Portfolio Overview',
      'de': 'Portfolioübersicht',
      'ru': 'Обзор портфолио',
      'tr': 'Portföy Genel Bakışı',
    },
    'dar0n2qx': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'f4cxu8e3': {
      'en': 'View All',
      'de': 'Alle',
      'ru': 'Просмотреть все',
      'tr': 'Tümünü Görüntüle',
    },
    'm856z3mm': {
      'en': 'Portfolio Overview',
      'de': 'Portfolioübersicht',
      'ru': 'Обзор портфолио',
      'tr': 'Portföy Genel Bakışı',
    },
    '8v7gae2w': {
      'en': 'No Properties',
      'de': 'Keine Eigenschaften',
      'ru': 'Нет свойств',
      'tr': 'Hiçbir Özellik',
    },
    'p8lrtgj7': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'wcxatcbc': {
      'en': '₺0',
      'de': '₺0',
      'ru': '₺0',
      'tr': '₺0',
    },
    'kt0emzbh': {
      'en': 'Add Property',
      'de': 'Eigenschaft hinzufügen',
      'ru': 'Добавить недвижимость',
      'tr': 'Özellik Ekle',
    },
    'xpxr3kac': {
      'en': 'No Invoices',
      'de': 'Keine Rechnungen',
      'ru': 'Никаких счетов-фактур',
      'tr': 'Fatura Yok',
    },
    'flb3nxd3': {
      'en': 'Current Rental',
      'de': 'Aktuelle Miete',
      'ru': 'Текущая аренда',
      'tr': 'Mevcut Kiralama',
    },
    'r66lfnhu': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'zjzpf76n': {
      'en': 'Pay Dues',
      'de': 'Beiträge zahlen',
      'ru': 'Платить взносы',
      'tr': 'Aidatları Öde',
    },
    'ijtw63na': {
      'en': 'Current Rental',
      'de': 'Aktuelle Miete',
      'ru': 'Текущая аренда',
      'tr': 'Mevcut Kiralama',
    },
    '8s5xi03m': {
      'en': 'No Rental',
      'de': 'Keine Vermietung',
      'ru': 'Нет аренды',
      'tr': 'Kiralama Yok',
    },
    'wo4aquqs': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    '8qqgpnyk': {
      'en': '₺0',
      'de': '₺0',
      'ru': '₺0',
      'tr': '₺0',
    },
    'gzxcfmvf': {
      'en': 'Add Rental',
      'de': 'Miete hinzufügen',
      'ru': 'Добавить аренду',
      'tr': 'Kiralık Ekle',
    },
    'rbif2fd0': {
      'en': 'No Invoices',
      'de': 'Keine Rechnungen',
      'ru': 'Никаких счетов-фактур',
      'tr': 'Fatura Yok',
    },
    'y70oux54': {
      'en': 'Gym Membership',
      'de': 'Fitnessstudio-Mitgliedschaft',
      'ru': 'Членство в спортзале',
      'tr': 'Spor salonu üyeliği',
    },
    'fvot85v7': {
      'en': 'Days Remaining',
      'de': 'Verbleibende Tage',
      'ru': 'Осталось дней',
      'tr': 'Kalan Günler',
    },
    '6xehg6t5': {
      'en': 'QR Access',
      'de': 'QR-Zugriff',
      'ru': 'QR-доступ',
      'tr': 'QR Erişimi',
    },
    'sxlrhsbg': {
      'en': 'Expires ',
      'de': 'Läuft ab',
      'ru': 'Истекает',
      'tr': 'Sona eriyor',
    },
    'qfhcr0iu': {
      'en': 'Gym Membership',
      'de': 'Fitnessstudio-Mitgliedschaft',
      'ru': 'Членство в спортзале',
      'tr': 'Spor salonu üyeliği',
    },
    'jnmc7ngy': {
      'en': 'Expired/Inactive',
      'de': 'Abgelaufen/Inaktiv',
      'ru': 'Истек срок действия/Неактивен',
      'tr': 'Süresi Dolmuş/Etkin Değil',
    },
    'jb9fub2s': {
      'en': 'Days Remaining',
      'de': 'Verbleibende Tage',
      'ru': 'Осталось дней',
      'tr': 'Kalan Günler',
    },
    'akp73ba9': {
      'en': '- -',
      'de': '- -',
      'ru': '- -',
      'tr': '- -',
    },
    '6tmjf7w8': {
      'en': 'Subscribe',
      'de': 'Abonnieren',
      'ru': 'Подписаться',
      'tr': 'Abone',
    },
    'wmjwyzjf': {
      'en': 'Expires ',
      'de': 'Läuft ab',
      'ru': 'Истекает',
      'tr': 'Sona eriyor',
    },
    '1ud5jy15': {
      'en': '- -',
      'de': '- -',
      'ru': '- -',
      'tr': '- -',
    },
    'a055pnlf': {
      'en': 'Gym Membership',
      'de': 'Fitnessstudio-Mitgliedschaft',
      'ru': 'Членство в спортзале',
      'tr': 'Spor salonu üyeliği',
    },
    '3hfbph9z': {
      'en': 'Days Remaining',
      'de': 'Verbleibende Tage',
      'ru': 'Осталось дней',
      'tr': 'Kalan Günler',
    },
    'hjefp7ls': {
      'en': 'QR Access',
      'de': 'QR-Zugriff',
      'ru': 'QR-доступ',
      'tr': 'QR Erişimi',
    },
    'hmtmezqu': {
      'en': 'Expires ',
      'de': 'Läuft ab',
      'ru': 'Истекает',
      'tr': 'Sona eriyor',
    },
    'f185yvaz': {
      'en': 'Gym Membership',
      'de': 'Fitnessstudio-Mitgliedschaft',
      'ru': 'Членство в спортзале',
      'tr': 'Spor salonu üyeliği',
    },
    'mj8xjw5a': {
      'en': 'Expired/Inactive',
      'de': 'Abgelaufen/Inaktiv',
      'ru': 'Истек срок действия/Неактивен',
      'tr': 'Süresi Dolmuş/Etkin Değil',
    },
    '3qt337tf': {
      'en': 'Days Remaining',
      'de': 'Verbleibende Tage',
      'ru': 'Осталось дней',
      'tr': 'Kalan Günler',
    },
    'qzi26boh': {
      'en': '- -',
      'de': '- -',
      'ru': '- -',
      'tr': '- -',
    },
    'ns4qityt': {
      'en': 'Subscribe',
      'de': 'Abonnieren',
      'ru': 'Подписаться',
      'tr': 'Abone',
    },
    'yavntyac': {
      'en': 'Expires ',
      'de': 'Läuft ab',
      'ru': 'Истекает',
      'tr': 'Sona eriyor',
    },
    '1t6wwoty': {
      'en': '- -',
      'de': '- -',
      'ru': '- -',
      'tr': '- -',
    },
    '78y9ddkx': {
      'en': 'Portfolio Overview',
      'de': 'Portfolioübersicht',
      'ru': 'Обзор портфолио',
      'tr': 'Portföy Genel Bakışı',
    },
    '5ld5kptn': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'do9ah5ph': {
      'en': 'View All',
      'de': 'Alle',
      'ru': 'Просмотреть все',
      'tr': 'Tümünü Görüntüle',
    },
    'sjyw6nf4': {
      'en': 'Portfolio Overview',
      'de': 'Portfolioübersicht',
      'ru': 'Обзор портфолио',
      'tr': 'Portföy Genel Bakışı',
    },
    'qgbx5jp9': {
      'en': 'No Properties',
      'de': 'Keine Eigenschaften',
      'ru': 'Нет свойств',
      'tr': 'Hiçbir Özellik',
    },
    'xdw6ul4a': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'sog4lq63': {
      'en': '₺0',
      'de': '₺0',
      'ru': '₺0',
      'tr': '₺0',
    },
    'df0gi7jh': {
      'en': 'Add Property',
      'de': 'Eigenschaft hinzufügen',
      'ru': 'Добавить недвижимость',
      'tr': 'Özellik Ekle',
    },
    '7asx914x': {
      'en': 'No Invoices',
      'de': 'Keine Rechnungen',
      'ru': 'Никаких счетов-фактур',
      'tr': 'Fatura Yok',
    },
    'vbaph7es': {
      'en': 'Current Rental',
      'de': 'Aktuelle Miete',
      'ru': 'Текущая аренда',
      'tr': 'Mevcut Kiralama',
    },
    '7ef6ezlj': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'gumm77za': {
      'en': 'Pay Dues',
      'de': 'Beiträge zahlen',
      'ru': 'Платить взносы',
      'tr': 'Aidatları Öde',
    },
    'us769tdi': {
      'en': 'View',
      'de': 'Sicht',
      'ru': 'Вид',
      'tr': 'Görüş',
    },
    'pizrtkug': {
      'en': 'Current Rental',
      'de': 'Aktuelle Miete',
      'ru': 'Текущая аренда',
      'tr': 'Mevcut Kiralama',
    },
    'w2xoc9jc': {
      'en': 'No Rental',
      'de': 'Keine Vermietung',
      'ru': 'Нет аренды',
      'tr': 'Kiralama Yok',
    },
    '1j1bhwsi': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'qrav07z7': {
      'en': '₺0',
      'de': '₺0',
      'ru': '₺0',
      'tr': '₺0',
    },
    'hal8p0wc': {
      'en': 'Add Rental',
      'de': 'Miete hinzufügen',
      'ru': 'Добавить аренду',
      'tr': 'Kiralık Ekle',
    },
    'q1jeld9x': {
      'en': 'No Invoices',
      'de': 'Keine Rechnungen',
      'ru': 'Никаких счетов-фактур',
      'tr': 'Fatura Yok',
    },
    'uwbzo22g': {
      'en': 'Upcoming Events',
      'de': 'Kommende Veranstaltungen',
      'ru': 'Предстоящие события',
      'tr': 'Yaklaşan Etkinlikler',
    },
    '32f3ape8': {
      'en': 'This Week',
      'de': 'Diese Woche',
      'ru': 'На этой неделе',
      'tr': 'Bu hafta',
    },
    'v4mcmcaa': {
      'en': 'Overdue',
      'de': 'Überfällig',
      'ru': 'Просроченный',
      'tr': 'Gecikmiş',
    },
    '8sm7l93c': {
      'en': 'Invoice',
      'de': 'Rechnung',
      'ru': 'Счет',
      'tr': 'Fatura',
    },
    'v39f6ysg': {
      'en': 'Wallet',
      'de': 'Geldbörse',
      'ru': 'Кошелек',
      'tr': 'Cüzdan',
    },
    '0obqqe97': {
      'en': 'Balance',
      'de': 'Gleichgewicht',
      'ru': 'Баланс',
      'tr': 'Denge',
    },
    '95uvqqj6': {
      'en': 'Premium Amenities',
      'de': 'Premium-Annehmlichkeiten',
      'ru': 'Премиум-удобства',
      'tr': 'Premium Olanaklar',
    },
    'jbhoo4at': {
      'en': 'Fitness Center',
      'de': 'Fitnesscenter',
      'ru': 'Фитнес-центр',
      'tr': 'Fitness Merkezi',
    },
    'sv765a6a': {
      'en': 'Restaurants',
      'de': 'Restaurants',
      'ru': 'Рестораны',
      'tr': 'Restoranlar',
    },
    'js8shonz': {
      'en': 'Heaven Spa',
      'de': 'Heaven Spa',
      'ru': 'Небесный Спа',
      'tr': 'Cennet Spa',
    },
    'ou61ynoi': {
      'en': 'Bars & Lounges',
      'de': 'Bars und Lounges',
      'ru': 'Бары и залы',
      'tr': 'Barlar ve Dinlenme Salonları',
    },
    'f40xq7md': {
      'en': 'Hotels & Resorts',
      'de': 'Hotels & Resorts',
      'ru': 'Отели и курорты',
      'tr': 'Oteller ve Tatil Köyleri',
    },
    'j3xz4fpv': {
      'en': 'Quick Actions',
      'de': 'Schnellaktionen',
      'ru': 'Быстрые действия',
      'tr': 'Hızlı İşlemler',
    },
    'r6v0pbol': {
      'en': 'Book Classes',
      'de': 'Kurse buchen',
      'ru': 'Занятия по книгам',
      'tr': 'Kitap Sınıfları',
    },
    '1qszg50h': {
      'en': 'Invoices & Dues',
      'de': 'Rechnungen und Gebühren',
      'ru': 'Счета и платежи',
      'tr': 'Faturalar ve Aidatlar',
    },
    'jgxswic7': {
      'en': 'Events & Reservations',
      'de': 'Veranstaltungen und Reservierungen',
      'ru': 'События и бронирования',
      'tr': 'Etkinlikler ve Rezervasyonlar',
    },
    's4fpt8tk': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // profile
  {
    'dhyunxw3': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'ru': 'Настройки',
      'tr': 'Ayarlar',
    },
    'z9iyx2mc': {
      'en': 'Edit Profile',
      'de': 'Profil bearbeiten',
      'ru': 'Редактировать профиль',
      'tr': 'Profili Düzenle',
    },
    'f9aefcia': {
      'en': 'Change Role',
      'de': 'Rolle ändern',
      'ru': 'Изменить роль',
      'tr': 'Rol Değiştir',
    },
    '2ejf6v6i': {
      'en': 'Notification Settings',
      'de': 'Benachrichtigungseinstellungen',
      'ru': 'Настройки уведомлений',
      'tr': 'Bildirim Ayarları',
    },
    'wn69pzxf': {
      'en': 'Security & Privacy',
      'de': 'Sicherheit und Datenschutz',
      'ru': 'Безопасность и конфиденциальность',
      'tr': 'Güvenlik ve Gizlilik',
    },
    'bygzjtgl': {
      'en': 'Help & Support',
      'de': 'Hilfe & Support',
      'ru': 'Помощь и поддержка',
      'tr': 'Yardım ve Destek',
    },
    'e6ow4zvq': {
      'en': 'Change Language',
      'de': 'Sprache ändern',
      'ru': 'Изменить язык',
      'tr': 'Dili değiştir',
    },
    'c9diyu6r': {
      'en': 'Sign Out',
      'de': 'Abmelden',
      'ru': 'Выход',
      'tr': 'Oturumu Kapat',
    },
    'uafefthm': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // walletOld
  {
    'lkn7w0iz': {
      'en': 'CARD HOLDER',
      'de': 'KARTENHALTER',
      'ru': 'ДЕРЖАТЕЛЬ КАРТЫ',
      'tr': 'KART SAHİBİ',
    },
    'gh854dha': {
      'en': 'Current Balance',
      'de': 'Aktueller Kontostand',
      'ru': 'Текущий баланс',
      'tr': 'Cari Bakiye',
    },
    'mvugl143': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'z23561ae': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // qrCodeGenerator
  {
    '84uravbg': {
      'en': 'QR Code ',
      'de': 'QR-Code',
      'ru': 'QR-код',
      'tr': 'QR Kodu',
    },
    'xdozeil6': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // resetPassword
  {
    'h6hzgysj': {
      'en': 'Back',
      'de': 'Zurück',
      'ru': 'Назад',
      'tr': 'Geri',
    },
    '9epbumab': {
      'en': 'Forgot Password',
      'de': 'Passwort vergessen',
      'ru': 'Забыли пароль',
      'tr': 'Parolanızı mı unuttunuz',
    },
    '9iesw4g1': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'de':
          'Wir senden Ihnen eine E-Mail mit einem Link zum Zurücksetzen Ihres Passworts. Geben Sie unten bitte die mit Ihrem Konto verknüpfte E-Mail-Adresse ein.',
      'ru':
          'Мы отправим вам письмо со ссылкой для сброса пароля. Введите ниже адрес электронной почты, связанный с вашей учетной записью.',
      'tr':
          'Şifrenizi sıfırlamanız için bir bağlantı içeren bir e-posta göndereceğiz. Lütfen aşağıya hesabınızla ilişkili e-postayı girin.',
    },
    '0zac8dtf': {
      'en': 'Your email address...',
      'de': 'Ihre E-Mail-Adresse...',
      'ru': 'Ваш электронный адрес...',
      'tr': 'E-posta adresiniz...',
    },
    '191qt173': {
      'en': 'Enter your email...',
      'de': 'Geben Sie Ihre E-Mail-Adresse ein...',
      'ru': 'Введите свой адрес электронной почты...',
      'tr': 'E-postanızı girin...',
    },
    'ia41vsld': {
      'en': 'Send Link',
      'de': 'Link senden',
      'ru': 'Отправить ссылку',
      'tr': 'Bağlantıyı Gönder',
    },
    'i6tno9jl': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // cart
  {
    'yf6uwt0y': {
      'en': 'Order Items',
      'de': 'Bestellpositionen',
      'ru': 'Заказать товары',
      'tr': 'Sipariş Öğeleri',
    },
    'tveeno6j': {
      'en': 'Empty Cart',
      'de': 'Leerer Warenkorb',
      'ru': 'Пустая корзина',
      'tr': 'Boş Sepet',
    },
    'xbgij3p0': {
      'en':
          'It appears your cart is empty. Please add items to your cart to be able to checkout.',
      'de':
          'Ihr Warenkorb scheint leer zu sein. Bitte fügen Sie Artikel in Ihren Warenkorb, um zur Kasse gehen zu können.',
      'ru':
          'Кажется, ваша корзина пуста. Пожалуйста, добавьте товары в корзину, чтобы оформить заказ.',
      'tr':
          'Sepetiniz boş görünüyor. Lütfen ödeme yapabilmek için sepetinize ürün ekleyin.',
    },
    'tnbqyxq1': {
      'en': 'Table Selection',
      'de': 'Tabellenauswahl',
      'ru': 'Выбор таблицы',
      'tr': 'Tablo Seçimi',
    },
    'sbumdbzq': {
      'en': 'Select...',
      'de': 'Wählen...',
      'ru': 'Выбирать...',
      'tr': 'Seçme...',
    },
    'yhfvle6d': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'zqdfy7l3': {
      'en': 'A1',
      'de': 'A1',
      'ru': 'А1',
      'tr': 'A1',
    },
    'm3jxgp02': {
      'en': 'A2',
      'de': 'A2',
      'ru': 'А2',
      'tr': 'A2',
    },
    'hadb1jsx': {
      'en': 'B1',
      'de': 'B1',
      'ru': 'В1',
      'tr': 'B1',
    },
    'wl1cs8s7': {
      'en': 'Select your preferred dining location',
      'de': 'Wählen Sie Ihren bevorzugten Speiseort',
      'ru': 'Выберите предпочитаемое место для обеда',
      'tr': 'Tercih ettiğiniz yemek mekanını seçin',
    },
    'bt6az7jf': {
      'en': 'Order Summary',
      'de': 'Bestellübersicht',
      'ru': 'Резюме заказа',
      'tr': 'Sipariş Özeti',
    },
    'c9lomyd1': {
      'en': 'Subtotal',
      'de': 'Zwischensumme',
      'ru': 'Промежуточный итог',
      'tr': 'Ara toplam',
    },
    '10wqc1oe': {
      'en': 'Service Charge (10%)',
      'de': 'Servicegebühr (10%)',
      'ru': 'Плата за обслуживание (10%)',
      'tr': 'Hizmet Bedeli (%10)',
    },
    'xp5uu9jy': {
      'en': '₺ 0.00',
      'de': '₺ 0,00',
      'ru': '₺ 0.00',
      'tr': '₺ 0,00',
    },
    'flhn61um': {
      'en': 'Discount ',
      'de': 'Rabatt',
      'ru': 'Скидка',
      'tr': 'İndirim',
    },
    's7umhzbh': {
      'en': 'Total',
      'de': 'Gesamt',
      'ru': 'Общий',
      'tr': 'Toplam',
    },
    'ctb3vp7c': {
      'en': 'Estimated preparation time: 15-20 minutes',
      'de': 'Geschätzte Vorbereitungszeit: 15-20 Minuten',
      'ru': 'Расчетное время приготовления: 15-20 минут.',
      'tr': 'Tahmini hazırlanma süresi: 15-20 dakika',
    },
    '660oq8u1': {
      'en': 'Döveç Wallet',
      'de': 'Döveç Geldbörse',
      'ru': 'Кошелек Döveç',
      'tr': 'Döveç Cüzdan',
    },
    'ufxqn9l3': {
      'en': 'Balance: ',
      'de': 'Gleichgewicht:',
      'ru': 'Баланс:',
      'tr': 'Denge:',
    },
    'hp7g5vud': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'eqgvwm92': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // amenities
  {
    '6k1anc59': {
      'en': 'Premium Facilities',
      'de': 'Premium-Einrichtungen',
      'ru': 'Премиум-услуги',
      'tr': 'Premium Tesisler',
    },
    'kwzcmrpg': {
      'en': 'World-class amenities at your doorstep',
      'de': 'Weltklasse-Annehmlichkeiten direkt vor Ihrer Haustür',
      'ru': 'Удобства мирового класса у вашего порога',
      'tr': 'Dünya standartlarında olanaklar kapınızda',
    },
    '2knig7vw': {
      'en': 'All Available',
      'de': 'Alle verfügbar',
      'ru': 'Все Доступно',
      'tr': 'Tüm Mevcut',
    },
    'on7wctcq': {
      'en': 'Our Premium Amenities',
      'de': 'Unsere Premium-Annehmlichkeiten',
      'ru': 'Наши премиум-услуги',
      'tr': 'Premium İmkanlarımız',
    },
    'iu8sc9qx': {
      'en': 'Open',
      'de': 'Offen',
      'ru': 'Открыть',
      'tr': 'Açık',
    },
    'uythsu7x': {
      'en': 'Closed',
      'de': 'Geschlossen',
      'ru': 'Закрыто',
      'tr': 'Kapalı',
    },
    'dzwi9j32': {
      'en': 'Explore & Join',
      'de': 'Entdecken & Mitmachen',
      'ru': 'Исследуйте и присоединяйтесь',
      'tr': 'Keşfet ve Katıl',
    },
    'idragq3m': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
  },
  // projects
  {
    'ydzdwxat': {
      'en': 'Active Projects',
      'de': 'Aktive Projekte',
      'ru': 'Активные проекты',
      'tr': 'Aktif Projeler',
    },
    'jdcrkfve': {
      'en': 'Premium developments under construction',
      'de': 'Premium-Projekte im Bau',
      'ru': 'Строящиеся элитные объекты',
      'tr': 'İnşaat halindeki premium gelişmeler',
    },
    '0bqlocqu': {
      'en': 'Total Projects',
      'de': 'Projekte insgesamt',
      'ru': 'Всего проектов',
      'tr': 'Toplam Projeler',
    },
    'x9otjbam': {
      'en': 'Avg. Progress',
      'de': 'Durchschnittlicher Fortschritt',
      'ru': 'Средний прогресс',
      'tr': 'Ort. İlerleme',
    },
    '05o5dgzl': {
      'en': 'Ongoing',
      'de': 'Laufend',
      'ru': 'Непрерывный',
      'tr': 'Devam eden',
    },
    'kqu5lwn2': {
      'en': 'Completed',
      'de': 'Vollendet',
      'ru': 'Завершенный',
      'tr': 'Tamamlanmış',
    },
    '9a4dt15j': {
      'en': 'Ongoing',
      'de': 'Laufend',
      'ru': 'Непрерывный',
      'tr': 'Devam eden',
    },
    '5p8yk9md': {
      'en': 'Under Construction',
      'de': 'Im Bau',
      'ru': 'В разработке',
      'tr': 'Yapım halinde',
    },
    '4kbhqm5h': {
      'en': 'Key Features:',
      'de': 'Hauptmerkmale:',
      'ru': 'Основные характеристики:',
      'tr': 'Temel Özellikler:',
    },
    'skncpu2w': {
      'en': 'Beachfront Location',
      'de': 'Lage direkt am Strand',
      'ru': 'Расположение на берегу моря',
      'tr': 'Sahil Konumu',
    },
    'agox3p4q': {
      'en': 'Beachfront Location',
      'de': 'Lage direkt am Strand',
      'ru': 'Расположение на берегу моря',
      'tr': 'Sahil Konumu',
    },
    'h16zm079': {
      'en': 'Beachfront Location',
      'de': 'Lage direkt am Strand',
      'ru': 'Расположение на берегу моря',
      'tr': 'Sahil Konumu',
    },
    'z3e0otsa': {
      'en': 'Construction Progress',
      'de': 'Baufortschritt',
      'ru': 'Ход строительства',
      'tr': 'İnşaat İlerlemesi',
    },
    'g3eiduzq': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'afh1rh4m': {
      'en': 'Details',
      'de': 'Details',
      'ru': 'Подробности',
      'tr': 'Detaylar',
    },
    'tus8fjwe': {
      'en': 'Location',
      'de': 'Standort',
      'ru': 'Расположение',
      'tr': 'Konum',
    },
    'by1ywtm3': {
      'en': 'Website',
      'de': 'Webseite',
      'ru': 'Веб-сайт',
      'tr': 'Web sitesi',
    },
    'fwm1rz3i': {
      'en': 'Completed',
      'de': 'Vollendet',
      'ru': 'Завершенный',
      'tr': 'Tamamlanmış',
    },
    'v068hnah': {
      'en': 'Key Features:',
      'de': 'Hauptmerkmale:',
      'ru': 'Основные характеристики:',
      'tr': 'Temel Özellikler:',
    },
    '9o7mjstt': {
      'en': 'Construction Progress',
      'de': 'Baufortschritt',
      'ru': 'Ход строительства',
      'tr': 'İnşaat İlerlemesi',
    },
    '2tzz07vh': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'wmxt4lsh': {
      'en': 'Details',
      'de': 'Details',
      'ru': 'Подробности',
      'tr': 'Detaylar',
    },
    'ms8vm4hu': {
      'en': 'Location',
      'de': 'Standort',
      'ru': 'Расположение',
      'tr': 'Konum',
    },
    'nipjb7rw': {
      'en': 'Website',
      'de': 'Webseite',
      'ru': 'Веб-сайт',
      'tr': 'Web sitesi',
    },
    'ssy8b808': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
  },
  // fitnessDetails
  {
    'axamd7h0': {
      'en': 'Current Membership',
      'de': 'Aktuelle Mitgliedschaft',
      'ru': 'Действующее членство',
      'tr': 'Mevcut Üyelik',
    },
    'wd58fqy9': {
      'en': 'Valid Until',
      'de': 'Gültig bis',
      'ru': 'Действительно до',
      'tr': 'Geçerlilik Tarihi',
    },
    'drv334cm': {
      'en': 'Entry QR',
      'de': 'Zugangscode',
      'ru': 'QR-код для входа',
      'tr': 'Giriş QR kodu',
    },
    'jrhg3kso': {
      'en': 'Current Membership',
      'de': 'Aktuelle Mitgliedschaft',
      'ru': 'Действующее членство',
      'tr': 'Mevcut Üyelik',
    },
    'st4h6f6p': {
      'en': 'No Active Membership',
      'de': 'Keine aktive Mitgliedschaft',
      'ru': 'Нет активного членства',
      'tr': 'Aktif Üyelik Yok',
    },
    '6t0ujyg0': {
      'en': 'Valid Until',
      'de': 'Gültig bis',
      'ru': 'Действительно до',
      'tr': 'Geçerlilik Tarihi',
    },
    'pvuyzr0p': {
      'en': '- -',
      'de': '- -',
      'ru': '- -',
      'tr': '- -',
    },
    '0oslomqe': {
      'en': 'Discount: ',
      'de': 'Rabatt:',
      'ru': 'Скидка:',
      'tr': 'İndirim:',
    },
    '9yuuwzfa': {
      'en': 'Membership',
      'de': 'Mitgliedschaft',
      'ru': 'Членство',
      'tr': 'Üyelik',
    },
    '28brd2dd': {
      'en': 'Membership',
      'de': 'Mitgliedschaft',
      'ru': 'Членство',
      'tr': 'Üyelik',
    },
    'zf60o1f7': {
      'en': 'Memberships',
      'de': 'Mitgliedschaften',
      'ru': 'Членство',
      'tr': 'Üyelikler',
    },
    'kdw3i5f4': {
      'en': 'Subscribe',
      'de': 'Abonnieren',
      'ru': 'Подписаться',
      'tr': 'Abone',
    },
    'zo9n7uny': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
  },
  // spaDetails
  {
    '197g75te': {
      'en': 'Spa Information',
      'de': 'Spa-Informationen',
      'ru': 'Информация о спа',
      'tr': 'Spa Bilgileri',
    },
    'djdj7o6y': {
      'en': 'Advance booking recommended',
      'de': 'Voranmeldung empfohlen',
      'ru': 'Рекомендуется предварительное бронирование.',
      'tr': 'Önceden rezervasyon yapılması önerilir',
    },
    '7p6sy2ft': {
      'en': 'Discount: ',
      'de': 'Rabatt:',
      'ru': 'Скидка:',
      'tr': 'İndirim:',
    },
    '4h4luv11': {
      'en': 'Packages',
      'de': 'Pakete',
      'ru': 'Пакеты',
      'tr': 'Paketler',
    },
    '5go5kood': {
      'en': 'Services',
      'de': 'Leistungen',
      'ru': 'Услуги',
      'tr': 'Hizmetler',
    },
    'uq7s05e3': {
      'en': 'Bookings',
      'de': 'Buchungen',
      'ru': 'Бронирование',
      'tr': 'Rezervasyonlar',
    },
    'vbqgac0d': {
      'en': 'Packages',
      'de': 'Pakete',
      'ru': 'Пакеты',
      'tr': 'Paketler',
    },
    'gxpsvebt': {
      'en': 'Last Month',
      'de': 'Letzter Monat',
      'ru': 'Прошлый месяц',
      'tr': 'Geçen ay',
    },
    'o84mnaqp': {
      'en': 'Last Month',
      'de': 'Letzter Monat',
      'ru': 'Прошлый месяц',
      'tr': 'Geçen ay',
    },
    'u871umk6': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'fim14zop': {
      'en': 'Last Month',
      'de': 'Letzter Monat',
      'ru': 'Прошлый месяц',
      'tr': 'Geçen ay',
    },
    'ie2y22h1': {
      'en': 'Last 3 Months',
      'de': 'Letzte 3 Monate',
      'ru': 'Последние 3 месяца',
      'tr': 'Son 3 Ay',
    },
    '34m4pb4k': {
      'en': 'Last 6 Months',
      'de': 'Letzte 6 Monate',
      'ru': 'Последние 6 месяцев',
      'tr': 'Son 6 Ay',
    },
    'b41t88t0': {
      'en': 'Last 12 Months',
      'de': 'Letzte 12 Monate',
      'ru': 'Последние 12 месяцев',
      'tr': 'Son 12 Ay',
    },
    '7njk5czm': {
      'en': 'All Time',
      'de': 'Alle Zeiten',
      'ru': 'Все время',
      'tr': 'Tüm Zamanlar',
    },
    'i4yo0fln': {
      'en': 'Includes:',
      'de': 'Beinhaltet:',
      'ru': 'Включает в себя:',
      'tr': 'Şunları içerir:',
    },
    'f09u44u7': {
      'en': 'Book Package',
      'de': 'Paket buchen',
      'ru': 'Пакет книг',
      'tr': 'Kitap Paketi',
    },
    'fnlvt8ij': {
      'en': 'Book Massage',
      'de': 'Massage buchen',
      'ru': 'Заказать массаж',
      'tr': 'Kitap Masajı',
    },
    '33z5uilt': {
      'en': 'Date: ',
      'de': 'Datum:',
      'ru': 'Дата:',
      'tr': 'Tarih:',
    },
    '6ii3efgs': {
      'en': 'Book Again',
      'de': 'Nochmals buchen',
      'ru': 'Забронировать снова',
      'tr': 'Tekrar Rezervasyon Yap',
    },
    'uze1fgpb': {
      'en': 'Date: ',
      'de': 'Datum:',
      'ru': 'Дата:',
      'tr': 'Tarih:',
    },
    '24hjj5x1': {
      'en': 'Book Again',
      'de': 'Nochmals buchen',
      'ru': 'Забронировать снова',
      'tr': 'Tekrar Rezervasyon Yap',
    },
    'xwe6qswn': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
  },
  // restaurantDetails
  {
    'fo1653pd': {
      'en': 'Discount: ',
      'de': 'Rabatt:',
      'ru': 'Скидка:',
      'tr': 'İndirim:',
    },
    'edx8329v': {
      'en': 'Happy Hour',
      'de': 'Happy Hour',
      'ru': 'Счастливый час',
      'tr': 'Mutlu Saat',
    },
    '2mv8jr7h': {
      'en': 'Special',
      'de': 'Besonders',
      'ru': 'Особенный',
      'tr': 'Özel',
    },
    's308dzbv': {
      'en': '5:00 PM - 7:00 PM',
      'de': '17:00 - 19:00 Uhr',
      'ru': '17:00 - 19:00',
      'tr': '17:00 - 19:00',
    },
    '5ruhvid3': {
      'en': '25% off drinks',
      'de': '25 % Rabatt auf Getränke',
      'ru': '25% скидка на напитки',
      'tr': 'İçeceklerde %25 indirim',
    },
    'xxbd5lfz': {
      'en': 'Sunday Brunch',
      'de': 'Sonntagsbrunch',
      'ru': 'Воскресный бранч',
      'tr': 'Pazar Brunch\'ı',
    },
    'ih4dwrfs': {
      'en': 'Special',
      'de': 'Besonders',
      'ru': 'Особенный',
      'tr': 'Özel',
    },
    '79kqc849': {
      'en': '10:00 AM - 3:00 PM',
      'de': '10:00 - 15:00 Uhr',
      'ru': '10:00 - 15:00',
      'tr': '10:00 - 15:00',
    },
    'l8unfjrw': {
      'en': 'Special brunch menu',
      'de': 'Spezielles Brunch-Menü',
      'ru': 'Специальное меню бранча',
      'tr': 'Özel brunch menüsü',
    },
    '0qkoo2rb': {
      'en': 'Date Night',
      'de': 'Verabredung am Abend',
      'ru': 'Свидание ночью',
      'tr': 'Randevu Gecesi',
    },
    '8xrdbfcb': {
      'en': 'Special',
      'de': 'Besonders',
      'ru': 'Особенный',
      'tr': 'Özel',
    },
    'qsvlzurv': {
      'en': 'Fridays',
      'de': 'Freitags',
      'ru': 'пятницы',
      'tr': 'Cuma günleri',
    },
    '41jghnnr': {
      'en': 'Complimentary dessert for couples',
      'de': 'Kostenloses Dessert für Paare',
      'ru': 'Бесплатный десерт для пар',
      'tr': 'Çiftlere özel ücretsiz tatlı',
    },
    'iw985y84': {
      'en': 'Wine Tasting Evening',
      'de': 'Weinprobe am Abend',
      'ru': 'Вечер дегустации вин',
      'tr': 'Şarap Tadım Akşamı',
    },
    'g7l7bu7a': {
      'en': 'May 25, 2025',
      'de': '25. Mai 2025',
      'ru': '25 мая 2025 г.',
      'tr': '25 Mayıs 2025',
    },
    '2w9660dt': {
      'en': 'Curated wine selection with sommelier',
      'de': 'Kuratierte Weinauswahl mit Sommelier',
      'ru': 'Тщательно подобранный выбор вин с сомелье',
      'tr': 'Sommelier eşliğinde özenle seçilmiş şarap seçkisi',
    },
    'i16mdniq': {
      'en': 'Chef\'s Table Experience',
      'de': 'Chef\'s Table-Erlebnis',
      'ru': 'Опыт работы за столом шеф-повара',
      'tr': 'Şefin Masası Deneyimi',
    },
    'evorbtfd': {
      'en': 'May 30, 2025',
      'de': '30. Mai 2025',
      'ru': '30 мая 2025 г.',
      'tr': '30 Mayıs 2025',
    },
    'c0iak54x': {
      'en': 'Exclusive 7-course tasting menu',
      'de': 'Exklusives 7-Gänge-Degustationsmenü',
      'ru': 'Эксклюзивное дегустационное меню из 7 блюд',
      'tr': 'Özel 7 servislik tadım menüsü',
    },
    'gz83yz4b': {
      'en': 'Live Jazz Night',
      'de': 'Live-Jazz-Nacht',
      'ru': 'Ночь живого джаза',
      'tr': 'Canlı Caz Gecesi',
    },
    'v7f2jmb2': {
      'en': 'June 5, 2025',
      'de': '5. Juni 2025',
      'ru': '5 июня 2025 г.',
      'tr': '5 Haziran 2025',
    },
    'nzana36q': {
      'en': 'Live music with dinner service',
      'de': 'Live-Musik mit Abendessen',
      'ru': 'Живая музыка во время ужина',
      'tr': 'Akşam yemeği servisiyle canlı müzik',
    },
    '5k21bpca': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // properties
  {
    'mp9lerei': {
      'en': 'Portfolio Summary',
      'de': 'Portfolio-Zusammenfassung',
      'ru': 'Резюме портфолио',
      'tr': 'Portföy Özeti',
    },
    '3dwj90bu': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'tzej4osp': {
      'en': 'Number of Invoices',
      'de': 'Anzahl der Rechnungen',
      'ru': 'Количество счетов-фактур',
      'tr': 'Fatura Sayısı',
    },
    '94h5ur4x': {
      'en': 'Urgent Actions',
      'de': 'Dringende Maßnahmen',
      'ru': 'Срочные действия',
      'tr': 'Acil Eylemler',
    },
    't26csw6s': {
      'en': 'Overdue',
      'de': 'Überfällig',
      'ru': 'Просроченный',
      'tr': 'Gecikmiş',
    },
    'a3eo3xv9': {
      'en': 'Total Properties',
      'de': 'Gesamteigenschaften',
      'ru': 'Всего объектов недвижимости',
      'tr': 'Toplam Özellikler',
    },
    'mj4xm7dj': {
      'en': 'Active',
      'de': 'Aktiv',
      'ru': 'Активный',
      'tr': 'Aktif',
    },
    'hn21awc8': {
      'en': 'Need Assistance?',
      'de': 'Benötigen Sie Hilfe?',
      'ru': 'Нужна помощь?',
      'tr': 'Yardıma mı ihtiyacınız var?',
    },
    'xn4tfg6z': {
      'en': 'Submit a maintenance request for your property.',
      'de': 'Senden Sie eine Wartungsanfrage für Ihr Eigentum.',
      'ru': 'Подайте заявку на техническое обслуживание вашего объекта.',
      'tr': 'Mülkünüz için bakım talebinde bulunun.',
    },
    'vqjgcbm0': {
      'en': 'Request',
      'de': 'Anfrage',
      'ru': 'Запрос',
      'tr': 'Rica etmek',
    },
    'vig6bwb2': {
      'en': 'View Requests',
      'de': 'Anfragen anzeigen',
      'ru': 'Просмотреть запросы',
      'tr': 'İstekleri Görüntüle',
    },
    '7g1tlnpe': {
      'en': 'Property List',
      'de': 'Immobilienliste',
      'ru': 'Список недвижимости',
      'tr': 'Emlak Listesi',
    },
    'o9c0agra': {
      'en': 'Occupied',
      'de': 'Besetzt',
      'ru': 'Занятый',
      'tr': 'Dolu',
    },
    'br3hjdrr': {
      'en': 'Overdue',
      'de': 'Überfällig',
      'ru': 'Просроченный',
      'tr': 'Gecikmiş',
    },
    '7w6z5ijd': {
      'en': 'Due',
      'de': 'Fällig',
      'ru': 'Должный',
      'tr': 'Vadesi dolmuş',
    },
    '7fi893mr': {
      'en': 'No Dues',
      'de': 'Keine Gebühren',
      'ru': 'Никаких взносов',
      'tr': 'Aidat Yok',
    },
    'hemw1b0e': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'elekfyk5': {
      'en': 'Pending Dues:',
      'de': 'Ausstehende Beiträge:',
      'ru': 'Ожидаемые взносы:',
      'tr': 'Bekleyen Borçlar:',
    },
    'qq5axv5g': {
      'en': 'Next Due:',
      'de': 'Nächster Fälligkeitstag:',
      'ru': 'Следующий срок:',
      'tr': 'Sonraki Teslim Tarihi:',
    },
    'g7ssnxam': {
      'en': 'Dec 15, 2025',
      'de': '15. Mai 2025',
      'ru': '15 мая 2025 г.',
      'tr': '15 Mayıs 2025',
    },
    '014fdf95': {
      'en': 'View Details',
      'de': 'Details anzeigen',
      'ru': 'Посмотреть подробности',
      'tr': 'Ayrıntıları Görüntüle',
    },
    'znz01qhg': {
      'en': 'Pay Dues',
      'de': 'Beiträge zahlen',
      'ru': 'Платить взносы',
      'tr': 'Aidatları Öde',
    },
    'ogu388ns': {
      'en': 'View Details',
      'de': 'Details anzeigen',
      'ru': 'Посмотреть подробности',
      'tr': 'Ayrıntıları Görüntüle',
    },
    'javtjxu2': {
      'en': 'Pending Verification',
      'de': 'Ausstehende Überprüfung',
      'ru': 'Ожидается проверка',
      'tr': 'Bekleyen Doğrulama',
    },
    '67c1810z': {
      'en': 'Pending',
      'de': 'Ausstehend',
      'ru': 'В ожидании',
      'tr': 'Askıda olması',
    },
    'uxzkg90j': {
      'en': 'Under Review',
      'de': 'Unter Prüfung',
      'ru': 'На рассмотрении',
      'tr': 'İnceleniyor',
    },
    'taty6sz5': {
      'en': 'Apartment • Sakarya, Turkey',
      'de': 'Wohnung • Sakarya, Türkei',
      'ru': 'Квартира • Сакарья, Турция',
      'tr': 'Daire • Sakarya, Türkiye',
    },
    'zflairin': {
      'en': 'Submitted:',
      'de': 'Eingereicht:',
      'ru': 'Поданный:',
      'tr': 'Gönderildi:',
    },
    '3by53spn': {
      'en': 'Status:',
      'de': 'Status:',
      'ru': 'Статус:',
      'tr': 'Durum:',
    },
    'nkut2oog': {
      'en':
          'Your property is being reviewed. You\'ll be notified once verification is complete.',
      'de':
          'Ihre Immobilie wird geprüft. Sie werden benachrichtigt, sobald die Überprüfung abgeschlossen ist.',
      'ru':
          'Ваша недвижимость проверяется. Вы будете уведомлены, как только проверка будет завершена.',
      'tr':
          'Mülkünüz inceleniyor. Doğrulama tamamlandığında bilgilendirileceksiniz.',
    },
    '7jori2v5': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
  },
  // walletHome
  {
    'o3pun9ly': {
      'en': 'Current Balance',
      'de': 'Aktueller Kontostand',
      'ru': 'Текущий баланс',
      'tr': 'Cari Bakiye',
    },
    'dsrwdcjf': {
      'en': 'Available to spend',
      'de': 'Verfügbar zum Ausgeben',
      'ru': 'Доступно для трат',
      'tr': 'Harcamaya müsait',
    },
    'ldchek6o': {
      'en': 'Pay QR',
      'de': 'QR bezahlen',
      'ru': 'Оплатить QR-код',
      'tr': 'QR öde',
    },
    'pl6le1c5': {
      'en': 'Wallet',
      'de': 'Geldbörse',
      'ru': 'Кошелек',
      'tr': 'Cüzdan',
    },
    'zdq3aovd': {
      'en': 'Transactions',
      'de': 'Transaktionen',
      'ru': 'Транзакции',
      'tr': 'İşlemler',
    },
    'a02m25qf': {
      'en': 'Wallet',
      'de': 'Geldbörse',
      'ru': 'Кошелек',
      'tr': 'Cüzdan',
    },
    'luqntasw': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'hx1zjk6k': {
      'en': 'Scan & Pay',
      'de': 'Scannen und bezahlen',
      'ru': 'Сканировать и платить',
      'tr': 'Tara ve Öde',
    },
    'bsn3urzw': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    'cl3wnmxt': {
      'en': 'Income - ',
      'de': 'Einkommen -',
      'ru': 'Доход -',
      'tr': 'Gelir -',
    },
    '3f651bjh': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'so075o4z': {
      'en': 'Refund',
      'de': 'Erstattung',
      'ru': 'Возвращать деньги',
      'tr': 'Geri ödemek',
    },
    '865yh62e': {
      'en': 'Payment - ',
      'de': 'Zahlung -',
      'ru': 'Оплата -',
      'tr': 'Ödeme -',
    },
    'bdy1n86g': {
      'en': 'Heaven SPA',
      'de': 'Heaven SPA',
      'ru': 'Небесный СПА',
      'tr': 'Cennet SPA',
    },
    'glknchz1': {
      'en': 'Döveç Fitness',
      'de': 'Döveç Fitness',
      'ru': 'Фитнес-центр Döveç',
      'tr': 'Döveç Fitness',
    },
    'h9vwvqg3': {
      'en': 'Restaurant',
      'de': 'Restaurant',
      'ru': 'Ресторан',
      'tr': 'Restoran',
    },
    'e154xjrm': {
      'en': 'Lounge & Bar',
      'de': 'Lounge & Bar',
      'ru': 'Лаунж и бар',
      'tr': 'Salon & Bar',
    },
    'v2gqyvf8': {
      'en': 'Maintenance',
      'de': 'Wartung',
      'ru': 'Обслуживание',
      'tr': 'Bakım',
    },
    'kieoeghw': {
      'en': 'Hotel & Resort',
      'de': 'Hotel & Resort',
      'ru': 'Отель и курорт',
      'tr': 'Otel & Tatil Köyü',
    },
    '4nbe2ar9': {
      'en': 'Other',
      'de': 'Andere',
      'ru': 'Другой',
      'tr': 'Diğer',
    },
    'yekc9xv9': {
      'en': 'Invoice - ',
      'de': 'Rechnung -',
      'ru': 'Счет -',
      'tr': 'Fatura -',
    },
    'zaxssjaa': {
      'en': ' - ',
      'de': '-',
      'ru': '-',
      'tr': '-',
    },
    'qghj8r3e': {
      'en': 'Income - ',
      'de': 'Einkommen -',
      'ru': 'Доход -',
      'tr': 'Gelir -',
    },
    '3etvdaqr': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'rj3todrs': {
      'en': 'Refund',
      'de': 'Erstattung',
      'ru': 'Возвращать деньги',
      'tr': 'Geri ödemek',
    },
    'pc9ou0k4': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // rental
  {
    'whacohtj': {
      'en': 'Pending Verification',
      'de': 'Ausstehende Überprüfung',
      'ru': 'Ожидается проверка',
      'tr': 'Bekleyen Doğrulama',
    },
    'piggeive': {
      'en': 'Current Home',
      'de': 'Aktuelles Zuhause',
      'ru': 'Текущий дом',
      'tr': 'Mevcut Ev',
    },
    'zkpkasn2': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'nkozy754': {
      'en': 'Rent',
      'de': 'Mieten',
      'ru': 'Арендовать',
      'tr': 'Kira',
    },
    'vm6cmvlq': {
      'en': 'Lease Expires',
      'de': 'Mietvertrag läuft ab',
      'ru': 'Срок аренды истекает',
      'tr': 'Kira süresi doluyor',
    },
    'lo43rtko': {
      'en': 'View Lease',
      'de': 'Mietvertrag ansehen',
      'ru': 'Посмотреть аренду',
      'tr': 'Kiralamayı Görüntüle',
    },
    '3w52sv2j': {
      'en': 'Need Assistance?',
      'de': 'Benötigen Sie Hilfe?',
      'ru': 'Нужна помощь?',
      'tr': 'Yardıma mı ihtiyacınız var?',
    },
    'mf4ksbzv': {
      'en': 'Submit a maintenance request for your property.',
      'de': 'Senden Sie eine Wartungsanfrage für Ihr Eigentum.',
      'ru': 'Подайте заявку на техническое обслуживание вашего объекта.',
      'tr': 'Mülkünüz için bakım talebinde bulunun.',
    },
    '8woqafqv': {
      'en': 'Request',
      'de': 'Anfrage',
      'ru': 'Запрос',
      'tr': 'Rica etmek',
    },
    'm9rs0gan': {
      'en': 'View Requests',
      'de': 'Anfragen anzeigen',
      'ru': 'Просмотреть запросы',
      'tr': 'İstekleri Görüntüle',
    },
    'hft243wx': {
      'en': 'Current Bills',
      'de': 'Aktuelle Rechnungen',
      'ru': 'Текущие счета',
      'tr': 'Mevcut Faturalar',
    },
    'qjtsi3dc': {
      'en': 'Completed Bills',
      'de': 'Abgeschlossene Rechnungen',
      'ru': 'Завершенные счета',
      'tr': 'Tamamlanmış Faturalar',
    },
    'jrshxwy9': {
      'en': 'Current Bills',
      'de': 'Aktuelle Rechnungen',
      'ru': 'Текущие счета',
      'tr': 'Güncel Faturalar',
    },
    'kxzvc2hp': {
      'en': 'pending',
      'de': 'ausstehend',
      'ru': 'в ожидании',
      'tr': 'askıda olması',
    },
    'qvon43fo': {
      'en': 'Pay Now',
      'de': 'Jetzt bezahlen',
      'ru': 'Оплатить сейчас',
      'tr': 'Şimdi Öde',
    },
    'q9vql4tu': {
      'en': 'Details',
      'de': 'Details',
      'ru': 'Подробности',
      'tr': 'Detaylar',
    },
    'z1ak8334': {
      'en': 'Paid',
      'de': 'Bezahlt',
      'ru': 'Оплаченный',
      'tr': 'Paralı',
    },
    '937t7ivl': {
      'en': 'Download Receipt',
      'de': 'Beleg herunterladen',
      'ru': 'Скачать квитанцию',
      'tr': 'Makbuz İndir',
    },
    '0tt682af': {
      'en': 'View Details',
      'de': 'Details anzeigen',
      'ru': 'Посмотреть подробности',
      'tr': 'Ayrıntıları Görüntüle',
    },
    's9jdbtub': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
  },
  // resortDetail
  {
    'k0wvnill': {
      'en': 'Luxury Resort Experience',
      'de': 'Luxuriöses Resort-Erlebnis',
      'ru': 'Роскошный курортный отдых',
      'tr': 'Lüks Tatil Köyü Deneyimi',
    },
    'vm42z22h': {
      'en': 'Premium accommodations with world-class amenities',
      'de': 'Erstklassige Unterkünfte mit erstklassigen Annehmlichkeiten',
      'ru': 'Премиальное размещение с удобствами мирового класса',
      'tr':
          'Dünya standartlarında olanaklara sahip birinci sınıf konaklama birimleri',
    },
    'v4xgmpf2': {
      'en': 'Check-in',
      'de': 'Einchecken',
      'ru': 'Регистрироваться',
      'tr': 'Giriş',
    },
    '78blmi2m': {
      'en': 'Dec 31, 2025',
      'de': '31. Dez. 2025',
      'ru': '31 декабря 2025 г.',
      'tr': '31 Aralık 2025',
    },
    '3iztn67d': {
      'en': 'Check-out',
      'de': 'Kasse',
      'ru': 'Проверить',
      'tr': 'Çıkış yapmak',
    },
    '3y00c2n6': {
      'en': '12:00 PM',
      'de': '12:00 Uhr',
      'ru': '12:00 PM',
      'tr': '12:00 ÖS',
    },
    '56seg2ka': {
      'en': 'Discount: ',
      'de': 'Rabatt:',
      'ru': 'Скидка:',
      'tr': 'İndirim:',
    },
    'as7mg8sy': {
      'en': 'Rooms',
      'de': 'Zimmer',
      'ru': 'Комнаты',
      'tr': 'Odalar',
    },
    'y7uutkv4': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
    'aejaazzo': {
      'en': 'Book Now',
      'de': 'Jetzt buchen',
      'ru': 'Забронировать сейчас',
      'tr': 'Şimdi Rezervasyon Yapın',
    },
    '4jv20l15': {
      'en': 'Rooms',
      'de': 'Zimmer',
      'ru': 'Комнаты',
      'tr': 'Odalar',
    },
    '55wulw8q': {
      'en': 'Standard Room',
      'de': 'Standardzimmer',
      'ru': 'Стандартный номер',
      'tr': 'Standart Oda',
    },
    'ngcmzrim': {
      'en': '₺350',
      'de': '350 ₺',
      'ru': '₺350',
      'tr': '₺350',
    },
    've6dbiqp': {
      'en': '/night',
      'de': '/Nacht',
      'ru': '/ночь',
      'tr': '/gece',
    },
    '30egtquy': {
      'en': 'Comfortable room with modern amenities',
      'de': 'Komfortables Zimmer mit modernen Annehmlichkeiten',
      'ru': 'Комфортабельный номер с современными удобствами',
      'tr': 'Modern olanaklara sahip konforlu oda',
    },
    'irmg1hqs': {
      'en': 'Capacity:',
      'de': 'Kapazität:',
      'ru': 'Емкость:',
      'tr': 'Kapasite:',
    },
    'gmpm2p0j': {
      'en': '2 guests',
      'de': '2 Gäste',
      'ru': '2 гостя',
      'tr': '2 misafir',
    },
    '6l9i00w0': {
      'en': 'Size:',
      'de': 'Größe:',
      'ru': 'Размер:',
      'tr': 'Boyut:',
    },
    'ekshreyd': {
      'en': '25 m²',
      'de': '25 m²',
      'ru': '25 м²',
      'tr': '25 m²',
    },
    'srpe4ixy': {
      'en': 'Amenities:',
      'de': 'Ausstattung:',
      'ru': 'Удобства:',
      'tr': 'Olanaklar:',
    },
    'dsg30m47': {
      'en': 'Free WiFi',
      'de': 'Kostenloses WLAN',
      'ru': 'Бесплатный Wi-Fi',
      'tr': 'Ücretsiz WiFi',
    },
    'tthxs5xz': {
      'en': 'Air Conditioning',
      'de': 'Klimaanlage',
      'ru': 'Кондиционер',
      'tr': 'Klima',
    },
    'tt10b14d': {
      'en': 'Mini Bar',
      'de': 'Minibar',
      'ru': 'Мини-бар',
      'tr': 'Minibar',
    },
    'rex7ive5': {
      'en': 'City View',
      'de': 'Stadtblick',
      'ru': 'Вид на город',
      'tr': 'Şehir Manzarası',
    },
    'k2kqqg1q': {
      'en': 'Reserve Room',
      'de': 'Zimmer reservieren',
      'ru': 'Зарезервировать номер',
      'tr': 'Rezerv Oda',
    },
    'd7ttxe8h': {
      'en': 'Swimming Pool',
      'de': 'Schwimmbad',
      'ru': 'Бассейн',
      'tr': 'Yüzme havuzu',
    },
    '8ua4i80h': {
      'en': 'Olympic-size pool with poolside service',
      'de': 'Olympisches Schwimmbecken mit Poolservice',
      'ru': 'Бассейн олимпийского размера с обслуживанием у бассейна',
      'tr': 'Havuz başı hizmeti olan olimpik havuz',
    },
    '3thxnyit': {
      'en': 'Spa & Wellness',
      'de': 'Spa & Wellness',
      'ru': 'Спа и оздоровление',
      'tr': 'Spa & Sağlık',
    },
    'kkkykjcr': {
      'en': 'Full-service spa and fitness center',
      'de': 'Spa und Fitnesscenter mit umfassendem Serviceangebot',
      'ru': 'Спа-центр с полным спектром услуг и фитнес-центр',
      'tr': 'Tam hizmet veren spa ve fitness merkezi',
    },
    'tmnui7zi': {
      'en': 'Booking Details',
      'de': 'Buchungsdetails',
      'ru': 'Подробности бронирования',
      'tr': 'Rezervasyon Detayları',
    },
    'dxudraa0': {
      'en': 'Select your dates and preferences',
      'de': 'Wählen Sie Ihre Daten und Präferenzen',
      'ru': 'Выберите даты и предпочтения',
      'tr': 'Tarihlerinizi ve tercihlerinizi seçin',
    },
    'u1ld77o2': {
      'en': 'Check-in Date',
      'de': 'Check-in-Datum',
      'ru': 'Дата заезда',
      'tr': 'Giriş Tarihi',
    },
    'c5xlfoem': {
      'en': 'Check-out Date',
      'de': 'Abreisedatum',
      'ru': 'Дата выезда',
      'tr': 'Çıkış Tarihi',
    },
    's9xjugvo': {
      'en': 'Room Type',
      'de': 'Zimmertyp',
      'ru': 'Тип комнаты',
      'tr': 'Oda Tipi',
    },
    'az0r21gl': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'wv3obvj9': {
      'en': 'Standard Room',
      'de': 'Standardzimmer',
      'ru': 'Стандартный номер',
      'tr': 'Standart Oda',
    },
    '7f5wlv32': {
      'en': 'Guests',
      'de': 'Gäste',
      'ru': 'Гости',
      'tr': 'Misafirler',
    },
    'ukhy4pq1': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'e3povezy': {
      'en': 'Option 1',
      'de': 'Option 1',
      'ru': 'Вариант 1',
      'tr': 'Seçenek 1',
    },
    'odogl5fl': {
      'en': 'Option 2',
      'de': 'Option 2',
      'ru': 'Вариант 2',
      'tr': 'Seçenek 2',
    },
    '57cz2hrd': {
      'en': 'Option 3',
      'de': 'Option 3',
      'ru': 'Вариант 3',
      'tr': 'Seçenek 3',
    },
    'qs9pr1oq': {
      'en': 'Book Now',
      'de': 'Jetzt buchen',
      'ru': 'Забронировать сейчас',
      'tr': 'Şimdi Rezervasyon Yapın',
    },
    '8ceuqwt3': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
  },
  // restaurants
  {
    'ceurhbv2': {
      'en': 'Choose Your Restaurant',
      'de': 'Wählen Sie Ihr Restaurant',
      'ru': 'Выберите свой ресторан',
      'tr': 'Restoranınızı Seçin',
    },
    'i9nxzvtd': {
      'en': '2 Open Now',
      'de': '2 Jetzt geöffnet',
      'ru': '2 Открыть сейчас',
      'tr': '2 Şimdi Açık',
    },
    'fcujsvzc': {
      'en': 'Open',
      'de': 'Offen',
      'ru': 'Открыть',
      'tr': 'Açık',
    },
    'wzkjv9e3': {
      'en': 'Mediterranean & Turkish • \$\$\$',
      'de': 'Mediterran und Türkisch • \$\$\$',
      'ru': 'Средиземноморская и турецкая • \$\$\$',
      'tr': 'Akdeniz & Türk • \$\$\$',
    },
    'ryx0h6bd': {
      'en': '12:00 PM - 11:00 PM',
      'de': '12:00 - 23:00 Uhr',
      'ru': '12:00 - 23:00',
      'tr': '12:00 - 23:00',
    },
    '8ar0qoxv': {
      'en': 'Mediterranean Cuisine',
      'de': 'Mediterrane Küche',
      'ru': 'Средиземноморская кухня',
      'tr': 'Akdeniz Mutfağı',
    },
    'yh67ued6': {
      'en': 'Turkish Delights',
      'de': 'Türkische Köstlichkeiten',
      'ru': 'Турецкие деликатесы',
      'tr': 'Türk Lokumları',
    },
    'pcgbsjbj': {
      'en': 'Seafood',
      'de': 'Meeresfrüchte',
      'ru': 'Морепродукты',
      'tr': 'Deniz ürünleri',
    },
    'yhy8xck8': {
      'en': 'View Restaurant',
      'de': 'Restaurant ansehen',
      'ru': 'Посмотреть ресторан',
      'tr': 'Restoranı Görüntüle',
    },
    '80pw9u9l': {
      'en': 'Order History',
      'de': 'Bestellverlauf',
      'ru': 'История заказов',
      'tr': 'Sipariş Geçmişi',
    },
    'q2u4epjy': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
  },
  // orderConfirmed
  {
    'tcejxc13': {
      'en': 'Order Confirmed!',
      'de': 'Bestellung bestätigt!',
      'ru': 'Заказ подтвержден!',
      'tr': 'Siparişiniz Onaylandı!',
    },
    'zrh0gzmy': {
      'en': 'Your order has been sent to the kitchen',
      'de': 'Ihre Bestellung wurde an die Küche gesendet',
      'ru': 'Ваш заказ отправлен на кухню.',
      'tr': 'Siparişiniz mutfağa gönderildi',
    },
    'v0piglre': {
      'en': 'Order Status',
      'de': 'Bestellstatus',
      'ru': 'Статус заказа',
      'tr': 'Sipariş Durumu',
    },
    'ipmxyk0d': {
      'en': 'Order Received',
      'de': 'Bestellung erhalten',
      'ru': 'Заказ получен',
      'tr': 'Sipariş Alındı',
    },
    'k6wtv9d0': {
      'en': 'Your order is confirmed',
      'de': 'Ihre Bestellung wurde bestätigt',
      'ru': 'Ваш заказ подтвержден',
      'tr': 'Siparişiniz onaylandı',
    },
    'p6rxegc1': {
      'en': 'Completed',
      'de': 'Vollendet',
      'ru': 'Завершенный',
      'tr': 'Tamamlanmış',
    },
    'h3qp83wo': {
      'en': 'Preparing',
      'de': 'Vorbereitung',
      'ru': 'Подготовка',
      'tr': 'Hazırlanıyor',
    },
    'ufmwjd23': {
      'en': 'Estimated time: 15-20 minutes',
      'de': 'Geschätzte Zeit: 15-20 Minuten',
      'ru': 'Расчетное время: 15-20 минут.',
      'tr': 'Tahmini süre: 15-20 dakika',
    },
    '8tw1fmtz': {
      'en': 'In Progress',
      'de': 'Im Gange',
      'ru': 'В ходе выполнения',
      'tr': 'Devam etmekte',
    },
    'fnxd90pp': {
      'en': 'Table Location',
      'de': 'Tabellenstandort',
      'ru': 'Расположение таблицы',
      'tr': 'Tablo Konumu',
    },
    'pst146re': {
      'en': 'Order Summary',
      'de': 'Bestellübersicht',
      'ru': 'Резюме заказа',
      'tr': 'Sipariş Özeti',
    },
    'xgqw8n1t': {
      'en': 'Empty Cart',
      'de': 'Leerer Warenkorb',
      'ru': 'Пустая корзина',
      'tr': 'Boş Sepet',
    },
    '7kpy6s5l': {
      'en':
          'It appears your cart is empty. Please add items to your cart to be able to checkout.',
      'de':
          'Ihr Warenkorb scheint leer zu sein. Bitte fügen Sie Artikel in Ihren Warenkorb, um zur Kasse gehen zu können.',
      'ru':
          'Кажется, ваша корзина пуста. Пожалуйста, добавьте товары в корзину, чтобы оформить заказ.',
      'tr':
          'Sepetiniz boş görünüyor. Lütfen ödeme yapabilmek için sepetinize ürün ekleyin.',
    },
    'qlp5smci': {
      'en': 'Subtotal',
      'de': 'Zwischensumme',
      'ru': 'Промежуточный итог',
      'tr': 'Ara toplam',
    },
    '28fto4tn': {
      'en': 'Service Charge',
      'de': 'Bedienungsgeld',
      'ru': 'Плата за обслуживание',
      'tr': 'Servis ücreti',
    },
    'feead1os': {
      'en': '₺ 0.00',
      'de': '₺ 0,00',
      'ru': '₺ 0.00',
      'tr': '₺ 0,00',
    },
    'jwaop7xk': {
      'en': 'Discount ',
      'de': 'Rabatt',
      'ru': 'Скидка',
      'tr': 'İndirim',
    },
    'tb223n49': {
      'en': 'Total Paid',
      'de': 'Gesamtbetrag bezahlt',
      'ru': 'Всего оплачено',
      'tr': 'Toplam Ödenen',
    },
    'u5i0dr3a': {
      'en': 'Payment Method',
      'de': 'Zahlungsmethode',
      'ru': 'Способ оплаты',
      'tr': 'Ödeme yöntemi',
    },
    'werrq8bu': {
      'en': 'Döveç Wallet - Paid Succesfully',
      'de': 'Döveç Wallet – Erfolgreich bezahlt',
      'ru': 'Кошелек Döveç - успешно оплачен',
      'tr': 'Döveç Cüzdan - Başarıyla Ödendi',
    },
    '1vkm2mhn': {
      'en': 'Restaurant Information',
      'de': 'Restaurantinformationen',
      'ru': 'Информация о ресторане',
      'tr': 'Restoran Bilgileri',
    },
    'cgrxlbik': {
      'en': 'Share',
      'de': 'Aktie',
      'ru': 'Делиться',
      'tr': 'Paylaşmak',
    },
    'si41upem': {
      'en': 'Receipt',
      'de': 'Quittung',
      'ru': 'Квитанция',
      'tr': 'Fiş',
    },
    'ifiovkeu': {
      'en': 'Go to Home',
      'de': 'Gehe zur Startseite',
      'ru': 'Перейти на главную',
      'tr': 'Ana Sayfaya Git',
    },
    'xu6r3bmq': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // orderHistory
  {
    'dagic0p2': {
      'en': 'Total Orders',
      'de': 'Gesamtbestellungen',
      'ru': 'Всего заказов',
      'tr': 'Toplam Siparişler',
    },
    '7fl5h9v4': {
      'en': '1',
      'de': '1',
      'ru': '1',
      'tr': '1',
    },
    'tu8ofzzb': {
      'en': 'Completed Orders',
      'de': 'Abgeschlossene Bestellungen',
      'ru': 'Выполненные заказы',
      'tr': 'Tamamlanan Siparişler',
    },
    'b3kjaato': {
      'en': 'Total Spent',
      'de': 'Gesamtausgaben',
      'ru': 'Всего потрачено',
      'tr': 'Toplam Harcama',
    },
    '2qgpiw9q': {
      'en': 'All time',
      'de': 'Alle Zeiten',
      'ru': 'Все время',
      'tr': 'Tüm zamanlar',
    },
    'z1uywz3b': {
      'en': 'Filters',
      'de': 'Filter',
      'ru': 'Фильтры',
      'tr': 'Filtreler',
    },
    'kv0o3lvv': {
      'en': 'Filter by Type',
      'de': 'Filtern nach Typ',
      'ru': 'Фильтр по типу',
      'tr': 'Türe Göre Filtrele',
    },
    'n1t68osu': {
      'en': 'All Places',
      'de': 'Alle Orte',
      'ru': 'Все места',
      'tr': 'Tüm Yerler',
    },
    '8a2vxv4l': {
      'en': 'All Places',
      'de': 'Alle Orte',
      'ru': 'Все места',
      'tr': 'Tüm Yerler',
    },
    'nmr7qltb': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'r9cgcsko': {
      'en': 'All Places',
      'de': 'Alle Orte',
      'ru': 'Все места',
      'tr': 'Tüm Yerler',
    },
    'zo8q6dqs': {
      'en': 'Restaurants',
      'de': 'Restaurants',
      'ru': 'Рестораны',
      'tr': 'Restoranlar',
    },
    'pe3i3hdi': {
      'en': 'Bars',
      'de': 'Barren',
      'ru': 'Бары',
      'tr': 'Barlar',
    },
    'o4dexaqk': {
      'en': 'Lounges',
      'de': 'Lounges',
      'ru': 'Гостиные',
      'tr': 'Salonlar',
    },
    'n5umz6ft': {
      'en': 'Sort by',
      'de': 'Sortieren nach',
      'ru': 'Сортировать по',
      'tr': 'Göre sırala',
    },
    'nnoz5kyw': {
      'en': 'Newest First',
      'de': 'Neueste zuerst',
      'ru': 'Сначала самые новые',
      'tr': 'En Yeniler Önce',
    },
    'bwb82ldm': {
      'en': 'Newest First',
      'de': 'Neueste zuerst',
      'ru': 'Сначала самые новые',
      'tr': 'En Yeniler Önce',
    },
    'w3f3ctlk': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'pkw9vx0w': {
      'en': 'Newest First',
      'de': 'Neueste zuerst',
      'ru': 'Сначала самые новые',
      'tr': 'En Yeniler Önce',
    },
    'edon54gb': {
      'en': 'Oldest First',
      'de': 'Älteste zuerst',
      'ru': 'Сначала самые старые',
      'tr': 'En eskiden başlayarak',
    },
    '99kiz16a': {
      'en': 'Highest Amount',
      'de': 'Höchster Betrag',
      'ru': 'Наибольшая сумма',
      'tr': 'En Yüksek Miktar',
    },
    'zuoswglx': {
      'en': 'Lowest Amount',
      'de': 'Niedrigster Betrag',
      'ru': 'Наименьшая сумма',
      'tr': 'En Düşük Miktar',
    },
    '9bssos2p': {
      'en': 'Items Ordered:',
      'de': 'Bestellte Artikel:',
      'ru': 'Заказанные товары:',
      'tr': 'Sipariş Edilen Ürünler:',
    },
    '77rlah5f': {
      'en': 'Empty Cart',
      'de': 'Leerer Warenkorb',
      'ru': 'Пустая корзина',
      'tr': 'Boş Sepet',
    },
    'lla7o6cz': {
      'en':
          'It appears your cart is empty. Please add items to your cart to be able to checkout.',
      'de':
          'Ihr Warenkorb scheint leer zu sein. Bitte fügen Sie Artikel in Ihren Warenkorb, um zur Kasse gehen zu können.',
      'ru':
          'Кажется, ваша корзина пуста. Пожалуйста, добавьте товары в корзину, чтобы оформить заказ.',
      'tr':
          'Sepetiniz boş görünüyor. Lütfen ödeme yapabilmek için sepetinize ürün ekleyin.',
    },
    'sgqqd0ur': {
      'en': 'Paid via Dovec Wallet',
      'de': 'Bezahlt über Dovec Wallet',
      'ru': 'Оплачено через Dovec Wallet',
      'tr': 'Dovec Cüzdanı ile ödendi',
    },
    'b6p5hfin': {
      'en': 'Items Ordered:',
      'de': 'Bestellte Artikel:',
      'ru': 'Заказанные товары:',
      'tr': 'Sipariş Edilen Ürünler:',
    },
    'sdcf6jlp': {
      'en': 'Empty Cart',
      'de': 'Leerer Warenkorb',
      'ru': 'Пустая корзина',
      'tr': 'Boş Sepet',
    },
    'u5ivv31f': {
      'en':
          'It appears your cart is empty. Please add items to your cart to be able to checkout.',
      'de':
          'Ihr Warenkorb scheint leer zu sein. Bitte fügen Sie Artikel in Ihren Warenkorb, um zur Kasse gehen zu können.',
      'ru':
          'Кажется, ваша корзина пуста. Пожалуйста, добавьте товары в корзину, чтобы оформить заказ.',
      'tr':
          'Sepetiniz boş görünüyor. Lütfen ödeme yapabilmek için sepetinize ürün ekleyin.',
    },
    'x5zerdkf': {
      'en': 'Paid via Dovec Wallet',
      'de': 'Bezahlt über Dovec Wallet',
      'ru': 'Оплачено через Dovec Wallet',
      'tr': 'Dovec Cüzdanı ile ödendi',
    },
    '8zyi15lv': {
      'en': 'Items Ordered:',
      'de': 'Bestellte Artikel:',
      'ru': 'Заказанные товары:',
      'tr': 'Sipariş Edilen Ürünler:',
    },
    'q5ki91bd': {
      'en': 'Empty Cart',
      'de': 'Leerer Warenkorb',
      'ru': 'Пустая корзина',
      'tr': 'Boş Sepet',
    },
    'rev881n5': {
      'en':
          'It appears your cart is empty. Please add items to your cart to be able to checkout.',
      'de':
          'Ihr Warenkorb scheint leer zu sein. Bitte fügen Sie Artikel in Ihren Warenkorb, um zur Kasse gehen zu können.',
      'ru':
          'Кажется, ваша корзина пуста. Пожалуйста, добавьте товары в корзину, чтобы оформить заказ.',
      'tr':
          'Sepetiniz boş görünüyor. Lütfen ödeme yapabilmek için sepetinize ürün ekleyin.',
    },
    '5e871t6v': {
      'en': 'Paid via Dovec Wallet',
      'de': 'Bezahlt über Dovec Wallet',
      'ru': 'Оплачено через Dovec Wallet',
      'tr': 'Dovec Cüzdanı ile ödendi',
    },
    'ix9mceul': {
      'en': 'Items Ordered:',
      'de': 'Bestellte Artikel:',
      'ru': 'Заказанные товары:',
      'tr': 'Sipariş Edilen Ürünler:',
    },
    'cj3ulx16': {
      'en': 'Empty Cart',
      'de': 'Leerer Warenkorb',
      'ru': 'Пустая корзина',
      'tr': 'Boş Sepet',
    },
    't585urfu': {
      'en':
          'It appears your cart is empty. Please add items to your cart to be able to checkout.',
      'de':
          'Ihr Warenkorb scheint leer zu sein. Bitte fügen Sie Artikel in Ihren Warenkorb, um zur Kasse gehen zu können.',
      'ru':
          'Кажется, ваша корзина пуста. Пожалуйста, добавьте товары в корзину, чтобы оформить заказ.',
      'tr':
          'Sepetiniz boş görünüyor. Lütfen ödeme yapabilmek için sepetinize ürün ekleyin.',
    },
    'l43876o7': {
      'en': 'Paid via Dovec Wallet',
      'de': 'Bezahlt über Dovec Wallet',
      'ru': 'Оплачено через Dovec Wallet',
      'tr': 'Dovec Cüzdanı ile ödendi',
    },
    'iow8qyff': {
      'en': 'Items Ordered:',
      'de': 'Bestellte Artikel:',
      'ru': 'Заказанные товары:',
      'tr': 'Sipariş Edilen Ürünler:',
    },
    'npmd7857': {
      'en': 'Empty Cart',
      'de': 'Leerer Warenkorb',
      'ru': 'Пустая корзина',
      'tr': 'Boş Sepet',
    },
    'lhs83jlp': {
      'en':
          'It appears your cart is empty. Please add items to your cart to be able to checkout.',
      'de':
          'Ihr Warenkorb scheint leer zu sein. Bitte fügen Sie Artikel in Ihren Warenkorb, um zur Kasse gehen zu können.',
      'ru':
          'Кажется, ваша корзина пуста. Пожалуйста, добавьте товары в корзину, чтобы оформить заказ.',
      'tr':
          'Sepetiniz boş görünüyor. Lütfen ödeme yapabilmek için sepetinize ürün ekleyin.',
    },
    'wg9hp0ed': {
      'en': 'Paid via Dovec Wallet',
      'de': 'Bezahlt über Dovec Wallet',
      'ru': 'Оплачено через Dovec Wallet',
      'tr': 'Dovec Cüzdanı ile ödendi',
    },
    'h8elkfml': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // loungeBar
  {
    'se5y2ghy': {
      'en': 'Choose Your Venue',
      'de': 'Wählen Sie Ihren Veranstaltungsort',
      'ru': 'Выберите место проведения',
      'tr': 'Mekanınızı Seçin',
    },
    'y3td3fsc': {
      'en': '2 Open Now',
      'de': '2 Jetzt geöffnet',
      'ru': '2 Открыть сейчас',
      'tr': '2 Şimdi Açık',
    },
    'layh2yc6': {
      'en': 'Open',
      'de': 'Offen',
      'ru': 'Открыть',
      'tr': 'Açık',
    },
    'uh3ptg39': {
      'en': 'Mediterranean & Turkish • \$\$\$',
      'de': 'Mediterran und Türkisch • \$\$\$',
      'ru': 'Средиземноморская и турецкая • \$\$\$',
      'tr': 'Akdeniz & Türk • \$\$\$',
    },
    'm26ig9dk': {
      'en': 'Mediterranean Cuisine',
      'de': 'Mediterrane Küche',
      'ru': 'Средиземноморская кухня',
      'tr': 'Akdeniz Mutfağı',
    },
    'kvdo19zg': {
      'en': 'Turkish Delights',
      'de': 'Türkische Köstlichkeiten',
      'ru': 'Турецкие деликатесы',
      'tr': 'Türk Lokumları',
    },
    '1d9vxssh': {
      'en': 'Seafood',
      'de': 'Meeresfrüchte',
      'ru': 'Морепродукты',
      'tr': 'Deniz ürünleri',
    },
    'm132dbl8': {
      'en': 'View',
      'de': 'Sicht',
      'ru': 'Вид',
      'tr': 'Görüş',
    },
    'sgbrc8h4': {
      'en': 'Order History',
      'de': 'Bestellverlauf',
      'ru': 'История заказов',
      'tr': 'Sipariş Geçmişi',
    },
    'eccyjcup': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
  },
  // hotelsAndResorts
  {
    'pc7a92ip': {
      'en': 'Choose Your Destination',
      'de': 'Wählen Sie Ihr Reiseziel',
      'ru': 'Выберите пункт назначения',
      'tr': 'Hedefinizi Seçin',
    },
    'viqok70x': {
      'en': '2 Open Now',
      'de': '2 Jetzt geöffnet',
      'ru': '2 Открыть сейчас',
      'tr': '2 Şimdi Açık',
    },
    'j1qske82': {
      'en': 'Open',
      'de': 'Offen',
      'ru': 'Открыть',
      'tr': 'Açık',
    },
    'sasl2wsv': {
      'en': 'Mediterranean & Turkish • \$\$\$',
      'de': 'Mediterran und Türkisch • \$\$\$',
      'ru': 'Средиземноморская и турецкая • \$\$\$',
      'tr': 'Akdeniz & Türk • \$\$\$',
    },
    'zaor8i62': {
      'en': '12:00 PM - 11:00 PM',
      'de': '12:00 - 23:00 Uhr',
      'ru': '12:00 - 23:00',
      'tr': '12:00 - 23:00',
    },
    '1s7942ha': {
      'en': 'View & Book',
      'de': 'Ansehen & Buchen',
      'ru': 'Посмотреть и забронировать',
      'tr': 'Görüntüle ve Rezervasyon Yap',
    },
    'cjvmetmy': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
  },
  // loungeBarDetails
  {
    'zs7j7ogn': {
      'en': 'Multiple large screens for sports',
      'de': 'Mehrere Großbildschirme für Sportübertragungen',
      'ru': 'Несколько больших экранов для просмотра спортивных трансляций.',
      'tr': 'Spor karşılaşmaları için çok sayıda büyük ekran.',
    },
    '7rjz0m6b': {
      'en': 'Discount: ',
      'de': 'Rabatt:',
      'ru': 'Скидка:',
      'tr': 'İndirim:',
    },
    'wedncnkp': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // projectDetail
  {
    'sppx61ut': {
      'en': 'Under Construction',
      'de': 'Im Bau',
      'ru': 'В разработке',
      'tr': 'Yapım halinde',
    },
    'e20h849l': {
      'en': 'Completed',
      'de': 'Vollendet',
      'ru': 'Завершенный',
      'tr': 'Tamamlanmış',
    },
    'qkx8rtye': {
      'en': 'Total Units',
      'de': 'Einheiten gesamt',
      'ru': 'Всего единиц',
      'tr': 'Toplam Birimler',
    },
    '213v4st4': {
      'en': 'Price Range',
      'de': 'Preisklasse',
      'ru': 'Диапазон цен',
      'tr': 'Fiyat Aralığı',
    },
    'qn8xkvfb': {
      'en': 'Construction Progress',
      'de': 'Baufortschritt',
      'ru': 'Ход строительства',
      'tr': 'İnşaat İlerlemesi',
    },
    '9lkhnjpw': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '9k6o8d3w': {
      'en': 'View Location',
      'de': 'Standort anzeigen',
      'ru': 'Посмотреть местоположение',
      'tr': 'Konumu Görüntüle',
    },
    'hu2rhnwn': {
      'en': 'Visit Website',
      'de': 'Website besuchen',
      'ru': 'Посетить веб-сайт',
      'tr': 'Web Sitesini Ziyaret Edin',
    },
    'a2om0nlg': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
    'myzkrbw9': {
      'en': 'Gallery',
      'de': 'Galerie',
      'ru': 'Галерея',
      'tr': 'Galeri',
    },
    'umqs4ikg': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
    '4q6h3v7g': {
      'en': 'Project Amenities',
      'de': 'Projektausstattung',
      'ru': 'Удобства проекта',
      'tr': 'Projenin Olanakları',
    },
    'z10cb0zv': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
  },
  // editProfile
  {
    '1ng53yqc': {
      'en': 'Profile Photo',
      'de': 'Profilfoto',
      'ru': 'Фото профиля',
      'tr': 'Profil Fotoğrafı',
    },
    'w67zfqvs': {
      'en': 'Tap the camera icon to change your photo',
      'de': 'Tippen Sie auf das Kamerasymbol, um Ihr Foto zu ändern',
      'ru': 'Нажмите на значок камеры, чтобы изменить фотографию.',
      'tr': 'Fotoğrafınızı değiştirmek için kamera simgesine dokunun',
    },
    'ey9r07e1': {
      'en': 'Personal Information',
      'de': 'Persönliche Informationen',
      'ru': 'Персональная информация',
      'tr': 'Kişisel Bilgiler',
    },
    'hl9ctsc8': {
      'en': 'Update your personal details',
      'de': 'Aktualisieren Sie Ihre persönlichen Daten',
      'ru': 'Обновите ваши личные данные',
      'tr': 'Kişisel bilgilerinizi güncelleyin',
    },
    'qh8i3u8t': {
      'en': 'First Name',
      'de': 'Vorname',
      'ru': 'Имя',
      'tr': 'İlk adı',
    },
    '6vlkoltn': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'rhzicume': {
      'en': 'Last Name',
      'de': 'Nachname',
      'ru': 'Фамилия',
      'tr': 'Soy isim',
    },
    '1m0llgn4': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'z4yrjjun': {
      'en': 'Email',
      'de': 'E-Mail',
      'ru': 'Электронная почта',
      'tr': 'E-posta',
    },
    'snpu0fhb': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'hsbldy30': {
      'en': 'Phone Number',
      'de': 'Telefonnummer',
      'ru': 'Номер телефона',
      'tr': 'Telefon Numarası',
    },
    '7arh6eyu': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'r5f0ssap': {
      'en': 'Address',
      'de': 'Adresse',
      'ru': 'Адрес',
      'tr': 'Adres',
    },
    's6gs9nz0': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'y9hsxw2e': {
      'en': 'First Name is required',
      'de': 'Vorname ist erforderlich',
      'ru': 'Имя обязательно',
      'tr': 'Ad gereklidir',
    },
    'wfdwp4on': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'ph0snpne': {
      'en': 'Last Name is required',
      'de': 'Nachname ist erforderlich',
      'ru': 'Фамилия обязательна',
      'tr': 'Soyadı gereklidir',
    },
    'ljkkmtkm': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'nrflrlka': {
      'en': 'Email is required',
      'de': 'E-Mail ist erforderlich',
      'ru': 'Требуется адрес электронной почты',
      'tr': 'E-posta gereklidir',
    },
    'qx182u2t': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'vh5or3a0': {
      'en': 'Phone Number is required',
      'de': 'Telefonnummer ist erforderlich',
      'ru': 'Номер телефона обязателен',
      'tr': 'Telefon Numarası gereklidir',
    },
    '6yihfdx1': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'd13d3rot': {
      'en': 'Address is required',
      'de': 'Adresse ist erforderlich',
      'ru': 'Адрес обязателен',
      'tr': 'Adres gerekli',
    },
    'jx27h4ao': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'dypx7rjq': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    'dtt1q1s3': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
      'ru': 'Сохранить изменения',
      'tr': 'Değişiklikleri Kaydet',
    },
    'b8q74qkd': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // profileNotifications
  {
    'bj25gddh': {
      'en': 'Delivery Methods',
      'de': 'Liefermethoden',
      'ru': 'Способы доставки',
      'tr': 'Teslimat Yöntemleri',
    },
    'anjah5dr': {
      'en': 'Choose how you want to receive notifications',
      'de': 'Wählen Sie, wie Sie Benachrichtigungen erhalten möchten',
      'ru': 'Выберите, как вы хотите получать уведомления',
      'tr': 'Bildirimleri nasıl almak istediğinizi seçin',
    },
    '6iohsaf4': {
      'en': 'Push Notifications',
      'de': 'Push-Benachrichtigungen',
      'ru': 'Push-уведомления',
      'tr': 'Anlık Bildirimler',
    },
    'ba9qo2vd': {
      'en': 'Receive notifications on your device',
      'de': 'Erhalten Sie Benachrichtigungen auf Ihrem Gerät',
      'ru': 'Получайте уведомления на свое устройство',
      'tr': 'Cihazınızda bildirimler alın',
    },
    'cuzdyic4': {
      'en': 'Email Notifications',
      'de': 'E-Mail-Benachrichtigungen',
      'ru': 'Уведомления по электронной почте',
      'tr': 'E-posta Bildirimleri',
    },
    'n1yt3hai': {
      'en': 'Get updates via email',
      'de': 'Erhalten Sie Updates per E-Mail',
      'ru': 'Получайте обновления по электронной почте',
      'tr': 'E-posta yoluyla güncellemeleri alın',
    },
    'yger2kld': {
      'en': 'SMS Notifications',
      'de': 'SMS-Benachrichtigungen',
      'ru': 'СМС-уведомления',
      'tr': 'SMS Bildirimleri',
    },
    'q46aspz0': {
      'en': 'Receive text messages for urgent alerts',
      'de': 'Erhalten Sie Textnachrichten für dringende Alarme',
      'ru': 'Получайте текстовые сообщения для срочных оповещений',
      'tr': 'Acil uyarılar için kısa mesaj alın',
    },
    'ar0whaft': {
      'en': 'Financial Notifications',
      'de': 'Finanzielle Mitteilungen',
      'ru': 'Финансовые уведомления',
      'tr': 'Finansal Bildirimler',
    },
    '6hu80tvq': {
      'en': 'Stay updated on payments and bills',
      'de': 'Bleiben Sie über Zahlungen und Rechnungen auf dem Laufenden',
      'ru': 'Будьте в курсе платежей и счетов',
      'tr': 'Ödemeler ve faturalar hakkında güncel kalın',
    },
    '3e73w78i': {
      'en': 'Payment Reminders',
      'de': 'Zahlungserinnerungen',
      'ru': 'Напоминания об оплате',
      'tr': 'Ödeme Hatırlatmaları',
    },
    '9cysty9h': {
      'en': 'Get reminded about due payments',
      'de': 'Lassen Sie sich an fällige Zahlungen erinnern',
      'ru': 'Получайте напоминания о подлежащих оплате платежах',
      'tr': 'Vadesi gelen ödemeler hakkında hatırlatma alın',
    },
    'gh9jghxi': {
      'en': 'Bill Alerts',
      'de': 'Rechnungsbenachrichtigungen',
      'ru': 'Оповещения о счетах',
      'tr': 'Fatura Uyarıları',
    },
    '5hfa4m8f': {
      'en': 'New bills and payment confirmations',
      'de': 'Neue Rechnungen und Zahlungsbestätigungen',
      'ru': 'Новые счета и подтверждения платежей',
      'tr': 'Yeni faturalar ve ödeme onayları',
    },
    '4pkhzajc': {
      'en': 'Monthly Reports',
      'de': 'Monatsberichte',
      'ru': 'Ежемесячные отчеты',
      'tr': 'Aylık Raporlar',
    },
    'd8lo3ubm': {
      'en': 'Summary of your financial activity',
      'de': 'Zusammenfassung Ihrer Finanzaktivitäten',
      'ru': 'Резюме вашей финансовой деятельности',
      'tr': 'Finansal faaliyetlerinizin özeti',
    },
    'iwrgfuye': {
      'en': 'Property & Services',
      'de': 'Immobilien & Dienstleistungen',
      'ru': 'Недвижимость и услуги',
      'tr': 'Emlak ve Hizmetler',
    },
    '3tikohjq': {
      'en': 'Updates about your property and amenities',
      'de': 'Updates zu Ihrem Eigentum und Ihren Annehmlichkeiten',
      'ru': 'Обновления о вашей собственности и удобствах',
      'tr': 'Mülkünüz ve olanaklarınız hakkında güncellemeler',
    },
    'g8k0zha8': {
      'en': 'Maintenance Updates',
      'de': 'Wartungsupdates',
      'ru': 'Обновления по техническому обслуживанию',
      'tr': 'Bakım Güncellemeleri',
    },
    'uxuuekr9': {
      'en': 'Status updates on maintenance requests',
      'de': 'Statusaktualisierungen zu Wartungsanfragen',
      'ru': 'Обновления статуса заявок на техническое обслуживание',
      'tr': 'Bakım taleplerine ilişkin durum güncellemeleri',
    },
    'gm2oqfm0': {
      'en': 'Event Notifications',
      'de': 'Ereignisbenachrichtigungen',
      'ru': 'Уведомления о событиях',
      'tr': 'Etkinlik Bildirimleri',
    },
    '60j2czjf': {
      'en': 'Community events and amenity updates',
      'de': 'Community-Events und Annehmlichkeiten-Updates',
      'ru': 'Общественные мероприятия и обновления удобств',
      'tr': 'Topluluk etkinlikleri ve olanak güncellemeleri',
    },
    '1qyqrf3d': {
      'en': 'Emergency Alerts',
      'de': 'Notfallwarnungen',
      'ru': 'Экстренные оповещения',
      'tr': 'Acil Durum Uyarıları',
    },
    'wprh9hds': {
      'en': 'Critical safety and security notifications',
      'de': 'Kritische Sicherheitsbenachrichtigungen',
      'ru': 'Критические уведомления по вопросам безопасности',
      'tr': 'Kritik güvenlik ve emniyet bildirimleri',
    },
    'gha26uzy': {
      'en': 'Timing & Preferences',
      'de': 'Zeitpunkt und Präferenzen',
      'ru': 'Время и предпочтения',
      'tr': 'Zamanlama ve Tercihler',
    },
    'anofoejb': {
      'en': 'Control when you receive notifications',
      'de': 'Steuern Sie, wann Sie Benachrichtigungen erhalten',
      'ru': 'Контролируйте, когда вы получаете уведомления',
      'tr': 'Bildirimleri ne zaman alacağınızı kontrol edin',
    },
    '7oq3c9uj': {
      'en': 'Quiet Hours (10 PM - 8 AM)',
      'de': 'Ruhezeiten (22:00–8:00 Uhr)',
      'ru': 'Тихие часы (22:00 - 08:00)',
      'tr': 'Sessiz Saatler (22:00 - 08:00)',
    },
    'r206i7ic': {
      'en': 'Reduce notifications during night hours',
      'de': 'Reduzieren Sie Benachrichtigungen während der Nachtstunden',
      'ru': 'Уменьшите количество уведомлений в ночное время',
      'tr': 'Gece saatlerinde bildirimleri azaltın',
    },
    '6b7xetop': {
      'en': 'Do Not Disturb',
      'de': 'Bitte nicht stören',
      'ru': 'Просьба не беспокоить',
      'tr': 'Rahatsız etmeyin',
    },
    '707keyrr': {
      'en': 'Temporarily pause all notifications',
      'de': 'Alle Benachrichtigungen vorübergehend pausieren',
      'ru': 'Временно приостановить все уведомления',
      'tr': 'Tüm bildirimleri geçici olarak duraklat',
    },
    '1x2hvb55': {
      'en': 'Marketing Emails',
      'de': 'Marketing-E-Mails',
      'ru': 'Маркетинговые электронные письма',
      'tr': 'Pazarlama E-postaları',
    },
    'itwaglpu': {
      'en': 'Promotional content and special offers',
      'de': 'Werbeinhalte und Sonderangebote',
      'ru': 'Рекламный контент и специальные предложения',
      'tr': 'Promosyon içerikleri ve özel teklifler',
    },
    'uvf9ejw5': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // securityAndPrivacy
  {
    '20lb4tk5': {
      'en': 'Password & Access',
      'de': 'Passwort & Zugang',
      'ru': 'Пароль и доступ',
      'tr': 'Şifre ve Erişim',
    },
    'c1o3mlxa': {
      'en': 'Manage your password and account access',
      'de': 'Verwalten Sie Ihr Passwort und Ihren Kontozugriff',
      'ru': 'Управляйте своим паролем и доступом к учетной записи',
      'tr': 'Şifrenizi ve hesap erişiminizi yönetin',
    },
    'zxlb0b97': {
      'en': 'Change Password',
      'de': 'Kennwort ändern',
      'ru': 'Изменить пароль',
      'tr': 'Şifre değiştir',
    },
    'd7jyeuu0': {
      'en': 'Privacy Settings',
      'de': 'Privatsphäre Einstellungen',
      'ru': 'Настройки конфиденциальности',
      'tr': 'Gizlilik Ayarları',
    },
    'xpxw3r50': {
      'en': 'Control how your data is used and shared',
      'de':
          'Kontrollieren Sie, wie Ihre Daten verwendet und weitergegeben werden',
      'ru': 'Контролируйте, как используются и передаются ваши данные',
      'tr': 'Verilerinizin nasıl kullanıldığını ve paylaşıldığını kontrol edin',
    },
    'fyais7ns': {
      'en': 'Location Tracking',
      'de': 'Standortverfolgung',
      'ru': 'Отслеживание местоположения',
      'tr': 'Konum Takibi',
    },
    'ms3txbrv': {
      'en': 'Allow location-based features',
      'de': 'Standortbasierte Funktionen zulassen',
      'ru': 'Разрешить функции, основанные на местоположении',
      'tr': 'Konum tabanlı özelliklere izin ver',
    },
    'vsqwbdwy': {
      'en': 'Data Management',
      'de': 'Datenmanagement',
      'ru': 'Управление данными',
      'tr': 'Veri Yönetimi',
    },
    'u55kd5i8': {
      'en': 'Download or delete your personal data',
      'de': 'Laden Sie Ihre persönlichen Daten herunter oder löschen Sie sie',
      'ru': 'Загрузите или удалите ваши персональные данные',
      'tr': 'Kişisel verilerinizi indirin veya silin',
    },
    'xsmtp1ws': {
      'en': 'Privacy Policy',
      'de': 'Datenschutzrichtlinie',
      'ru': 'политика конфиденциальности',
      'tr': 'Gizlilik Politikası',
    },
    '8eat60xa': {
      'en': 'Terms of Service',
      'de': 'Servicebedingungen',
      'ru': 'Условия обслуживания',
      'tr': 'Hizmet Şartları',
    },
    'b2thxzyy': {
      'en': 'Delete Account',
      'de': 'Konto löschen',
      'ru': 'Удалить аккаунт',
      'tr': 'Hesabı Sil',
    },
    'dlaui5yx': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // privacyPolicy
  {
    'szx5vsg6': {
      'en': '1. Overview',
      'de': '1. Übersicht',
      'ru': '1. Обзор',
      'tr': '1. Genel Bakış',
    },
    'umhgjevs': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    '503qf3rc': {
      'en': '2. Information Collected',
      'de': '2. Erfasste Informationen',
      'ru': '2. Собранная информация',
      'tr': '2. Toplanan Bilgiler',
    },
    '2477ww5u': {
      'en': 'We may collect the following types of personal information:',
      'de': 'Wir können die folgenden Arten personenbezogener Daten erfassen:',
      'ru': 'Мы можем собирать следующие типы личной информации:',
      'tr': 'Aşağıdaki türde kişisel bilgileri toplayabiliriz:',
    },
    'oydah20m': {
      'en': ' • Contact information such as name, email address, phone number',
      'de': '• Kontaktinformationen wie Name, E-Mail-Adresse, Telefonnummer',
      'ru':
          '• Контактная информация, такая как имя, адрес электронной почты, номер телефона',
      'tr': '• Ad, e-posta adresi, telefon numarası gibi iletişim bilgileri',
    },
    'yupyn8og': {
      'en':
          '• Technical data such as IP address, browser type, device information',
      'de':
          '• Technische Daten wie IP-Adresse, Browsertyp, Geräteinformationen',
      'ru':
          '• Технические данные, такие как IP-адрес, тип браузера, информация об устройстве',
      'tr': '• IP adresi, tarayıcı türü, cihaz bilgileri gibi teknik veriler',
    },
    'n8gvxnoi': {
      'en':
          '• Usage data about how you use our website\nMarketing preferences and communication options',
      'de':
          '• Nutzungsdaten über Ihre Nutzung unserer Website\nMarketingpräferenzen und Kommunikationsmöglichkeiten',
      'ru':
          '• Данные об использовании того, как вы используете наш веб-сайт \nМаркетинговые предпочтения и варианты связи',
      'tr':
          '• Web sitemizi nasıl kullandığınıza ilişkin kullanım verileri\nPazarlama tercihleri ve iletişim seçenekleri',
    },
    'an0os9bz': {
      'en': '3. Use of Information',
      'de': '3. Verwendung von Informationen',
      'ru': '3. Использование информации',
      'tr': '3. Bilgilerin Kullanımı',
    },
    '1glu1q2a': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    'wlud3a5c': {
      'en': '4. Protection of Information',
      'de': '4. Schutz von Informationen',
      'ru': '4. Защита информации',
      'tr': '4. Bilgilerin Korunması',
    },
    '9f8gnui3': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    'ajrvw5il': {
      'en': '5. Cookies and Tracking',
      'de': '5. Cookies und Tracking',
      'ru': '5. Файлы cookie и отслеживание',
      'tr': '5. Çerezler ve İzleme',
    },
    'menrr6u0': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    '1l6zla3u': {
      'en': '6. Your Rights',
      'de': '6. Ihre Rechte',
      'ru': '6. Ваши права',
      'tr': '6. Haklarınız',
    },
    'cuayey2x': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    'wkigom48': {
      'en': '7. Contact',
      'de': '7. Kontakt',
      'ru': '7. Контакты',
      'tr': '7. İletişim',
    },
    'r1tz0hb3': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    'rz5plzcr': {
      'en': '8. Updates',
      'de': '8. Aktualisierungen',
      'ru': '8. Обновления',
      'tr': '8. Güncellemeler',
    },
    'kxi1eexg': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    '4z5qgc76': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // termsAndServices
  {
    'v3x6ys3h': {
      'en': '1. Accepted Terms',
      'de': '1. Akzeptierte Bedingungen',
      'ru': '1. Принятые условия',
      'tr': '1. Kabul Edilen Şartlar',
    },
    'k99bky57': {
      'en':
          'By using this website, you accept these terms of use. If you do not accept these terms, please do not use our site.\n\nDOVEC GROUP reserves the right to change these terms at any time. Changes take effect as soon as they are published on the websit',
      'de':
          'Mit der Nutzung dieser Website akzeptieren Sie diese Nutzungsbedingungen. Sollten Sie diese Bedingungen nicht akzeptieren, bitten wir Sie, unsere Website nicht zu nutzen.\n\nDie DOVEC GROUP behält sich das Recht vor, diese Bedingungen jederzeit zu ändern. Änderungen treten mit ihrer Veröffentlichung auf der Website in Kraft.',
      'ru':
          'Используя этот сайт, вы принимаете эти условия использования. Если вы не принимаете эти условия, пожалуйста, не используйте наш сайт. \n\nDOVEC GROUP оставляет за собой право изменять эти условия в любое время. Изменения вступают в силу, как только они публикуются на сайте',
      'tr':
          'Bu web sitesini kullanarak, bu kullanım koşullarını kabul etmiş olursunuz. Bu koşulları kabul etmiyorsanız, lütfen sitemizi kullanmayın. \n\nDOVEC GROUP, bu koşulları istediği zaman değiştirme hakkını saklı tutar. Değişiklikler, web sitesinde yayınlanır yayınlanmaz yürürlüğe girer.',
    },
    'sul9ygmp': {
      'en': '2. Service Usage',
      'de': '2. Servicenutzung',
      'ru': '2. Использование услуг',
      'tr': '2. Hizmet Kullanımı',
    },
    'a3ynis0j': {
      'en': 'When using our website:',
      'de': 'Bei der Nutzung unserer Website:',
      'ru': 'При использовании нашего сайта:',
      'tr': 'Web sitemizi kullanırken:',
    },
    'ev9z7ld8': {
      'en':
          ' • You must comply with all local, national and international laws',
      'de':
          '• Sie müssen alle lokalen, nationalen und internationalen Gesetze einhalten',
      'ru':
          '• Вы должны соблюдать все местные, национальные и международные законы.',
      'tr': '• Tüm yerel, ulusal ve uluslararası yasalara uymalısınız.',
    },
    'dj5vi22u': {
      'en': '• You must not violate the rights of others',
      'de': '• Sie dürfen die Rechte anderer nicht verletzen',
      'ru': '• Вы не должны нарушать права других.',
      'tr': '• Başkalarının haklarını ihlal etmemelisiniz',
    },
    'lucoe699': {
      'en': '• You must not engage in activities that damage our systems',
      'de':
          '• Sie dürfen keine Aktivitäten durchführen, die unsere Systeme beschädigen',
      'ru':
          '• Вы не должны заниматься деятельностью, которая наносит ущерб нашим системам.',
      'tr': '• Sistemlerimize zarar verecek faaliyetlerde bulunmamalısınız.',
    },
    'ri8lztxp': {
      'en': '• You must not abuse our services',
      'de': '• Sie dürfen unsere Dienste nicht missbrauchen',
      'ru': '• Вы не должны злоупотреблять нашими услугами.',
      'tr': '• Hizmetlerimizi kötüye kullanmamalısınız',
    },
    'hiogaqfe': {
      'en': '3. Intellectual Property Rights',
      'de': '3. Geistige Eigentumsrechte',
      'ru': '3. Права интеллектуальной собственности',
      'tr': '3. Fikri Mülkiyet Hakları',
    },
    'b5oy2vj2': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    'ykayby1d': {
      'en': '4. Protection of Information',
      'de': '4. Schutz von Informationen',
      'ru': '4. Защита информации',
      'tr': '4. Bilgilerin Korunması',
    },
    '27thn7ic': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    'xw8oudih': {
      'en': '5. Cookies and Tracking',
      'de': '5. Cookies und Tracking',
      'ru': '5. Файлы cookie и отслеживание',
      'tr': '5. Çerezler ve İzleme',
    },
    'j2jod6j7': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    'zxjorjgk': {
      'en': '6. Your Rights',
      'de': '6. Ihre Rechte',
      'ru': '6. Ваши права',
      'tr': '6. Haklarınız',
    },
    'nw4nr1ks': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    '01jeox8k': {
      'en': '7. Contact',
      'de': '7. Kontakt',
      'ru': '7. Контакты',
      'tr': '7. İletişim',
    },
    '1r139q8r': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    'f0h5ymtb': {
      'en': '8. Updates',
      'de': '8. Aktualisierungen',
      'ru': '8. Обновления',
      'tr': '8. Güncellemeler',
    },
    '26r5jtqo': {
      'en':
          'This Privacy Policy explains how information collected during your use of the website managed by DOVEC GROUP (\"we\", \"our\" or \"Company\") is used and protected.\n\nThis policy outlines what information we collect, how we use and protect this information, and your privacy rights.',
      'de':
          'Diese Datenschutzrichtlinie erläutert, wie die während Ihrer Nutzung der von der DOVEC GROUP („wir“, „unser“ oder „Unternehmen“) verwalteten Website erhobenen Daten verwendet und geschützt werden.\n\nDiese Richtlinie beschreibt, welche Daten wir erheben, wie wir diese Daten verwenden und schützen und welche Datenschutzrechte Sie haben.',
      'ru':
          'В этой Политике конфиденциальности объясняется, как используется и защищается информация, собранная во время вашего использования веб-сайта, управляемого DOVEC GROUP («мы», «наш» или «Компания»). \n\nВ этой политике описывается, какую информацию мы собираем, как мы используем и защищаем эту информацию, а также ваши права на конфиденциальность.',
      'tr':
          'Bu Gizlilik Politikası, DOVEC GROUP (\"biz\", \"bizim\" veya \"Şirket\") tarafından yönetilen web sitesini kullanımınız sırasında toplanan bilgilerin nasıl kullanıldığını ve korunduğunu açıklar. \n\nBu politika, hangi bilgileri topladığımızı, bu bilgileri nasıl kullandığımızı ve koruduğumuzu ve gizlilik haklarınızı ana hatlarıyla belirtir.',
    },
    '6319h8ci': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // helpAndSupport
  {
    'zb16njdi': {
      'en': 'Contact Support',
      'de': 'Support kontaktieren',
      'ru': 'Связаться со службой поддержки',
      'tr': 'Destek ile İletişime Geçin',
    },
    'z7xuwgz1': {
      'en': 'Get in touch with our support team',
      'de': 'Kontaktieren Sie unser Support-Team',
      'ru': 'Свяжитесь с нашей службой поддержки',
      'tr': 'Destek ekibimizle iletişime geçin',
    },
    '2fkfqp5y': {
      'en': 'Call Support: +90 533 123 45 67 89',
      'de': 'Telefonischer Support: +90 533 123 45 67 89',
      'ru': 'Позвоните в службу поддержки: +90 533 123 45 67 89',
      'tr': 'Çağrı Desteği: +90 533 123 45 67 89',
    },
    'feysrq0r': {
      'en': 'Email: support@dlife.com',
      'de': 'E-Mail: support@dlife.com',
      'ru': 'Электронная почта: support@dlife.com',
      'tr': 'E-posta: support@dlife.com',
    },
    '9nm2896f': {
      'en': 'F.A.Qs',
      'de': 'Häufig gestellte Fragen',
      'ru': 'Ч.А.В.',
      'tr': 'S.S.S.',
    },
    'trx83mru': {
      'en': 'Quick answers to common questions',
      'de': 'Schnelle Antworten auf häufig gestellte Fragen',
      'ru': 'Быстрые ответы на распространенные вопросы',
      'tr': 'Sık sorulan sorulara hızlı yanıtlar',
    },
    'xetvrhj4': {
      'en': 'How do I pay my bills?',
      'de': 'Wie bezahle ich meine Rechnungen?',
      'ru': 'Как мне оплатить счета?',
      'tr': 'Faturalarımı nasıl öderim?',
    },
    'r1eaymhh': {
      'en':
          'You can pay bills through the Bills section using your wallet or credit card.',
      'de':
          'Sie können Rechnungen im Abschnitt „Rechnungen“ mit Ihrem Portemonnaie oder Ihrer Kreditkarte bezahlen.',
      'ru':
          'Вы можете оплатить счета через раздел «Счета», используя свой кошелек или кредитную карту.',
      'tr':
          'Faturalarınızı Faturalar bölümünden cüzdanınız veya kredi kartınızı kullanarak ödeyebilirsiniz.',
    },
    'k32vcqdp': {
      'en': 'How do I book amenities?',
      'de': 'Wie buche ich Annehmlichkeiten?',
      'ru': 'Как забронировать удобства?',
      'tr': 'Tesislerden nasıl rezervasyon yapabilirim?',
    },
    'ag0n5um0': {
      'en': 'Go to Amenities section and select the facility you want to book',
      'de':
          'Gehen Sie zum Abschnitt „Ausstattung“ und wählen Sie die Einrichtung aus, die Sie buchen möchten',
      'ru':
          'Перейдите в раздел «Удобства» и выберите объект, который вы хотите забронировать.',
      'tr':
          'İmkanlar bölümüne gidin ve rezervasyon yaptırmak istediğiniz tesisi seçin',
    },
    'dqfnu3xz': {
      'en': 'How do I submit a maintenance request?',
      'de': 'Wie reiche ich eine Wartungsanfrage ein?',
      'ru': 'Как подать заявку на техническое обслуживание?',
      'tr': 'Bakım talebinde nasıl bulunabilirim?',
    },
    '4jnxhg7j': {
      'en': 'Use the Maintenance section to submit and track your requests.',
      'de':
          'Verwenden Sie den Abschnitt „Wartung“, um Ihre Anfragen zu übermitteln und zu verfolgen.',
      'ru':
          'Используйте раздел «Обслуживание» для отправки и отслеживания ваших запросов.',
      'tr':
          'Taleplerinizi göndermek ve takip etmek için Bakım bölümünü kullanın.',
    },
    '81vyd9ip': {
      'en': 'How do I top up my wallet?',
      'de': 'Wie lade ich mein Wallet auf?',
      'ru': 'Как пополнить свой кошелек?',
      'tr': 'Cüzdanıma nasıl para yükleyebilirim?',
    },
    'w3apfbah': {
      'en': 'Go to Wallet section and tap \'Top Up\' to add funds.',
      'de':
          'Gehen Sie zum Bereich „Wallet“ und tippen Sie auf „Aufladen“, um Guthaben hinzuzufügen.',
      'ru':
          'Перейдите в раздел «Кошелек» и нажмите «Пополнить», чтобы добавить средства.',
      'tr':
          'Cüzdan bölümüne gidin ve para yüklemek için \'Para Yükle\'ye dokunun.',
    },
    's5ptw6v5': {
      'en': 'How do I change my notification settings?',
      'de': 'Wie ändere ich meine Benachrichtigungseinstellungen?',
      'ru': 'Как изменить настройки уведомлений?',
      'tr': 'Bildirim ayarlarımı nasıl değiştirebilirim?',
    },
    'v4sv7v3n': {
      'en':
          'Go to Profile > Notification Settings to customize your preferences.',
      'de':
          'Gehen Sie zu Profil > Benachrichtigungseinstellungen, um Ihre Einstellungen anzupassen.',
      'ru':
          'Перейдите в раздел Профиль > Настройки уведомлений, чтобы настроить свои предпочтения.',
      'tr':
          'Tercihlerinizi özelleştirmek için Profil > Bildirim Ayarları\'na gidin.',
    },
    '9gg8p71r': {
      'en': 'App Information',
      'de': 'App-Informationen',
      'ru': 'Информация о приложении',
      'tr': 'Uygulama Bilgileri',
    },
    'w8fzg1fv': {
      'en': 'Version and legal information',
      'de': 'Version und rechtliche Hinweise',
      'ru': 'Версия и юридическая информация',
      'tr': 'Sürüm ve yasal bilgiler',
    },
    'qf4adh9h': {
      'en': 'App Version',
      'de': 'App-Version',
      'ru': 'Версия приложения',
      'tr': 'Uygulama Sürümü',
    },
    'eouxucuq': {
      'en': '1.2.3',
      'de': '1.2.3',
      'ru': '1.2.3',
      'tr': '1.2.3',
    },
    '7hoh644a': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // maintenance
  {
    'cltmrzcz': {
      'en': 'Maintenance Overview',
      'de': 'Wartungsübersicht',
      'ru': 'Обзор технического обслуживания',
      'tr': 'Bakım Genel Bakışı',
    },
    '5srqa9sx': {
      'en': 'Scheduled',
      'de': 'Geplant',
      'ru': 'Запланировано',
      'tr': 'Planlanmış',
    },
    'fcrqboga': {
      'en': 'In Progress',
      'de': 'Im Gange',
      'ru': 'В ходе выполнения',
      'tr': 'Devam etmekte',
    },
    'c87slh3w': {
      'en': 'Completed',
      'de': 'Vollendet',
      'ru': 'Завершенный',
      'tr': 'Tamamlanmış',
    },
    '4rqu5e86': {
      'en': 'All Requests',
      'de': 'Alle Anfragen',
      'ru': 'Все запросы',
      'tr': 'Tüm İstekler',
    },
    'zzh9te4e': {
      'en': 'Scheduled',
      'de': 'Geplant',
      'ru': 'Запланировано',
      'tr': 'Planlanmış',
    },
    'g7jctnuj': {
      'en': 'Pending',
      'de': 'Ausstehend',
      'ru': 'В ожидании',
      'tr': 'Askıda olması',
    },
    'xb525p1v': {
      'en': 'Completed',
      'de': 'Vollendet',
      'ru': 'Завершенный',
      'tr': 'Tamamlanmış',
    },
    'm7o9z507': {
      'en': 'Date:',
      'de': 'Datum:',
      'ru': 'Дата:',
      'tr': 'Tarih:',
    },
    '18v76lup': {
      'en': 'Priority:',
      'de': 'Priorität:',
      'ru': 'Приоритет:',
      'tr': 'Öncelik:',
    },
    '2k6q1k0i': {
      'en': 'View Details',
      'de': 'Details anzeigen',
      'ru': 'Посмотреть подробности',
      'tr': 'Ayrıntıları Görüntüle',
    },
    'eqk8rrh0': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
  },
  // maintenanceDetails
  {
    'bjrfdefg': {
      'en': 'Scheduled',
      'de': 'Geplant',
      'ru': 'Запланировано',
      'tr': 'Planlanmış',
    },
    'ob9ouea7': {
      'en': 'Priority',
      'de': 'Priorität',
      'ru': 'Приоритет',
      'tr': 'Öncelik',
    },
    'izwnesva': {
      'en': 'Estimated Cost',
      'de': 'Geschätzte Kosten',
      'ru': 'Предполагаемая стоимость',
      'tr': 'Tahmini Maliyet',
    },
    's01opwoa': {
      'en': 'Schedule Information',
      'de': 'Fahrplaninformationen',
      'ru': 'Информация о расписании',
      'tr': 'Program Bilgileri',
    },
    'uz81j40b': {
      'en': 'Scheduled Date',
      'de': 'Geplantes Datum',
      'ru': 'Запланированная дата',
      'tr': 'Planlanan Tarih',
    },
    'pdsf9ejp': {
      'en': 'May 20, 2025',
      'de': '20. Mai 2025',
      'ru': '20 мая 2025 г.',
      'tr': '20 Mayıs 2025',
    },
    'enncprsf': {
      'en': 'Assigned To',
      'de': 'Zugewiesen an',
      'ru': 'Назначено',
      'tr': 'Atanan',
    },
    '4umwkjb1': {
      'en': 'Duration',
      'de': 'Dauer',
      'ru': 'Продолжительность',
      'tr': 'Süre',
    },
    '99zc2r4w': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
  },
  // propertyDetail
  {
    'oj44tgb8': {
      'en': 'Property Details',
      'de': 'Details der Immobilie',
      'ru': 'Подробности о недвижимости',
      'tr': 'Emlak Detayları',
    },
    'gxspli3p': {
      'en': 'Address:',
      'de': 'Adresse:',
      'ru': 'Адрес:',
      'tr': 'Adres:',
    },
    '00uaczbh': {
      'en': 'Type:',
      'de': 'Typ:',
      'ru': 'Тип:',
      'tr': 'Tip:',
    },
    'yhdoopka': {
      'en': 'Status:',
      'de': 'Status:',
      'ru': 'Статус:',
      'tr': 'Durum:',
    },
    'ovjhedum': {
      'en': 'Occupied',
      'de': 'Besetzt',
      'ru': 'Занятый',
      'tr': 'Dolu',
    },
    'mlq6copl': {
      'en': 'Pending Dues:',
      'de': 'Ausstehende Beiträge:',
      'ru': 'Ожидаемые взносы:',
      'tr': 'Bekleyen Borçlar:',
    },
    'qlcb9e3o': {
      'en': 'Utility Top Up',
      'de': 'Aufladen des Versorgungsunternehmens',
      'ru': 'Пополнение коммунальных услуг',
      'tr': 'Yardımcı Program Üstü',
    },
    'sr9hfl0a': {
      'en': 'Invoices',
      'de': 'Rechnungen',
      'ru': 'Счета-фактуры',
      'tr': 'Faturalar',
    },
    'vbnhdirh': {
      'en': 'Documents',
      'de': 'Unterlagen',
      'ru': 'Документы',
      'tr': 'Belgeler',
    },
    '214siykw': {
      'en': 'Maintenance',
      'de': 'Wartung',
      'ru': 'Обслуживание',
      'tr': 'Bakım',
    },
    'ful63gzj': {
      'en': 'Invoices',
      'de': 'Rechnungen',
      'ru': 'Счета-фактуры',
      'tr': 'Faturalar',
    },
    'ccs2uwew': {
      'en': 'Unpaid',
      'de': 'Unbezahlt',
      'ru': 'Неоплаченный',
      'tr': 'Ödenmemiş',
    },
    'ksx6sk3r': {
      'en': 'overdue',
      'de': 'überfällig',
      'ru': 'просроченный',
      'tr': 'gecikmiş',
    },
    'k761uhaw': {
      'en': 'Paid',
      'de': 'Bezahlt',
      'ru': 'Оплаченный',
      'tr': 'Paralı',
    },
    '4t8raikv': {
      'en': 'Amount:',
      'de': 'Menge:',
      'ru': 'Количество:',
      'tr': 'Miktar:',
    },
    'bj5xn73p': {
      'en': 'Pay Now',
      'de': 'Jetzt bezahlen',
      'ru': 'Оплатить сейчас',
      'tr': 'Şimdi Öde',
    },
    'wmezq7do': {
      'en': 'View Document',
      'de': 'Dokument anzeigen',
      'ru': 'Просмотреть документ',
      'tr': 'Belgeyi Görüntüle',
    },
    'f0l6shf6': {
      'en': 'Scheduled',
      'de': 'Geplant',
      'ru': 'Запланировано',
      'tr': 'Planlanmış',
    },
    '8mpbowl4': {
      'en': 'pending',
      'de': 'ausstehend',
      'ru': 'в ожидании',
      'tr': 'askıda olması',
    },
    'jzkzv8dc': {
      'en': 'In Progress',
      'de': 'Im Gange',
      'ru': 'В ходе выполнения',
      'tr': 'Devam etmekte',
    },
    '4ev4ty0a': {
      'en': 'Resolved',
      'de': 'Gelöst',
      'ru': 'Решено',
      'tr': 'Çözüldü',
    },
    'f5123ylb': {
      'en': 'Rejected',
      'de': 'Abgelehnt',
      'ru': 'Отклоненный',
      'tr': 'Reddedilmiş',
    },
    'fomjgtq0': {
      'en': 'View Details',
      'de': 'Details anzeigen',
      'ru': 'Посмотреть подробности',
      'tr': 'Ayrıntıları Görüntüle',
    },
    '1q8d90hz': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
  },
  // login
  {
    '7pcxlbjx': {
      'en': 'Welcome to Döveç Life',
      'de': 'Willkommen bei Döveç Life',
      'ru': 'Добро пожаловать в Döveç Life',
      'tr': 'Döveç Life\'a Hoş Geldiniz',
    },
    'ib1ccsuq': {
      'en': 'Sign in to access your property and amenities',
      'de':
          'Melden Sie sich an, um auf Ihr Anwesen und Ihre Annehmlichkeiten zuzugreifen',
      'ru': 'Войдите, чтобы получить доступ к вашей собственности и удобствам',
      'tr': 'Mülkünüze ve olanaklarınıza erişmek için oturum açın',
    },
    'g8d0wjox': {
      'en': 'Email',
      'de': 'E-Mail',
      'ru': 'Электронная почта',
      'tr': 'E-posta',
    },
    'yc2qlu1o': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': 'E-posta',
    },
    '9o3itynv': {
      'en': 'name@example.com',
      'de': 'name@beispiel.com',
      'ru': 'имя@example.com',
      'tr': 'isim@example.com',
    },
    'ls9izdfi': {
      'en': 'Password',
      'de': 'Passwort',
      'ru': 'Пароль',
      'tr': 'Şifre',
    },
    'r0po5oj3': {
      'en': 'Forgot password?',
      'de': 'Passwort vergessen?',
      'ru': 'Забыли пароль?',
      'tr': 'Parolanızı mı unuttunuz?',
    },
    'w4ncsw2c': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': 'Şifre',
    },
    '45mbv5p0': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'ru': 'Войти',
      'tr': 'Oturum aç',
    },
    'h8iljmso': {
      'en': 'Google',
      'de': 'Google',
      'ru': 'Google',
      'tr': 'Google',
    },
    'uvhdvqlz': {
      'en': 'Apple',
      'de': 'Apfel',
      'ru': 'Яблоко',
      'tr': 'Elma',
    },
    '1udzpt4e': {
      'en': 'Don\'t have an account?',
      'de': 'Sie haben noch kein Konto?',
      'ru': 'У вас нет учетной записи?',
      'tr': 'Hesabınız yok mu?',
    },
    '58w15sv5': {
      'en': ' Sign up',
      'de': 'Melden Sie sich an',
      'ru': 'Зарегистрироваться',
      'tr': 'Üye olmak',
    },
    '4cbicjx9': {
      'en': 'Email',
      'de': 'E-Mail',
      'ru': 'Электронная почта',
      'tr': 'E-posta',
    },
    'uxsirdp6': {
      'en': 'Change Language',
      'de': 'Sprache ändern',
      'ru': 'Изменить язык',
      'tr': 'Dili değiştir',
    },
    'hdgky3p1': {
      'en': 'e-mail is required',
      'de': 'E-Mail ist erforderlich',
      'ru': 'требуется электронная почта',
      'tr': 'e-posta gereklidir',
    },
    'roifhiwz': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '5c8xs5ml': {
      'en': 'password is required',
      'de': 'Passwort erforderlich',
      'ru': 'требуется пароль',
      'tr': 'şifre gerekli',
    },
    '28d7a1j3': {
      'en': 'Minimum 8 characters',
      'de': 'Mindestens 8 Zeichen',
      'ru': 'Минимум 8 символов',
      'tr': 'Minimum 8 karakter',
    },
    'yfqkhiz9': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'n0jcaxem': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // register
  {
    'mld6xdui': {
      'en': 'Create an account',
      'de': 'Ein Konto erstellen',
      'ru': 'Завести аккаунт',
      'tr': 'Bir hesap oluşturun',
    },
    'mdknhj03': {
      'en': 'Enter your details to get started with Döveç Life',
      'de': 'Geben Sie Ihre Daten ein, um mit Döveç Life zu beginnen',
      'ru': 'Введите свои данные, чтобы начать работу с Döveç Life',
      'tr': 'Döveç Life\'a başlamak için bilgilerinizi girin',
    },
    'kk8qr8gi': {
      'en': 'First Name',
      'de': 'Vorname',
      'ru': 'Имя',
      'tr': 'İlk adı',
    },
    '30eb6csx': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': 'E-posta',
    },
    'z76k5yik': {
      'en': 'Last Name',
      'de': 'Nachname',
      'ru': 'Фамилия',
      'tr': 'Soy isim',
    },
    'a6xuyxrw': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': 'E-posta',
    },
    'gayx0enp': {
      'en': 'Email',
      'de': 'E-Mail',
      'ru': 'Электронная почта',
      'tr': 'E-posta',
    },
    'hhxy2hvf': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': 'E-posta',
    },
    '5zmygweo': {
      'en': 'name@example.com',
      'de': 'name@beispiel.com',
      'ru': 'имя@example.com',
      'tr': 'isim@example.com',
    },
    '4tmgulkd': {
      'en': 'Password',
      'de': 'Passwort',
      'ru': 'Пароль',
      'tr': 'Şifre',
    },
    'p6tj44kj': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': 'Şifre',
    },
    'fkhvulu4': {
      'en': 'Confirm Password',
      'de': 'Passwort bestätigen',
      'ru': 'Подтвердите пароль',
      'tr': 'Şifreyi Onayla',
    },
    'afpo80lz': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': 'Şifre',
    },
    'ulnm8vjc': {
      'en': 'I agree to ',
      'de': 'Ich stimme zu',
      'ru': 'Я согласен',
      'tr': 'Kabul ediyorum',
    },
    'cm86833j': {
      'en': 'Terms of Service',
      'de': 'Servicebedingungen',
      'ru': 'Условия обслуживания',
      'tr': 'Hizmet Şartları',
    },
    'wwifhffv': {
      'en': ' and ',
      'de': 'Und',
      'ru': 'и',
      'tr': 'Ve',
    },
    'ziofjvdq': {
      'en': 'Privacy Policy',
      'de': 'Datenschutzrichtlinie',
      'ru': 'политика конфиденциальности',
      'tr': 'Gizlilik Politikası',
    },
    '0yxhclqk': {
      'en': 'I agree to the Terms of Service and Privacy Policy',
      'de':
          'Ich stimme den Servicebedingungen und der Datenschutzrichtlinie zu',
      'ru':
          'Я согласен с Условиями обслуживания и Политикой конфиденциальности',
      'tr': 'Hizmet Şartları ve Gizlilik Politikası\'nı kabul ediyorum',
    },
    '00vibqt9': {
      'en': 'Create account',
      'de': 'Benutzerkonto erstellen',
      'ru': 'Зарегистрироваться',
      'tr': 'Hesap oluşturmak',
    },
    '7rsc55pb': {
      'en': 'Already have an account?',
      'de': 'Hast du schon ein Konto?',
      'ru': 'У вас уже есть аккаунт?',
      'tr': 'Zaten bir hesabınız var mı?',
    },
    '3n6jdemg': {
      'en': ' Sign in',
      'de': 'anmelden',
      'ru': 'Войти',
      'tr': 'Giriş yap',
    },
    'qs4wlm9z': {
      'en': 'Email',
      'de': 'E-Mail',
      'ru': 'Электронная почта',
      'tr': 'E-posta',
    },
    'f00jwrdg': {
      'en': 'Change Language',
      'de': 'Sprache ändern',
      'ru': 'Изменить язык',
      'tr': 'Dili değiştir',
    },
    'oa1u868j': {
      'en': 'First Name is required',
      'de': 'Vorname ist erforderlich',
      'ru': 'Имя обязательно',
      'tr': 'Ad gereklidir',
    },
    '8gul4vg9': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '43iy0wzu': {
      'en': 'Last Name is required',
      'de': 'Nachname ist erforderlich',
      'ru': 'Фамилия обязательна',
      'tr': 'Soyadı gereklidir',
    },
    '3l18nke9': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '0w7x0tyx': {
      'en': 'E-mail is required',
      'de': 'E-Mail ist erforderlich',
      'ru': 'Требуется электронная почта',
      'tr': 'E-posta gereklidir',
    },
    '8i6fy00c': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'gx4x0ty4': {
      'en': 'Password is required',
      'de': 'Passwort erforderlich',
      'ru': 'Требуется пароль',
      'tr': 'Şifre gerekli',
    },
    'j2r428cm': {
      'en': 'Minimum 8 characters',
      'de': 'Mindestens 8 Zeichen',
      'ru': 'Минимум 8 символов',
      'tr': 'Minimum 8 karakter',
    },
    '451g582q': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '0wp71d93': {
      'en': 'Confirm password is required',
      'de': 'Bestätigung des Passworts ist erforderlich',
      'ru': 'Подтвердите пароль. Требуется',
      'tr': 'Şifreyi onaylamanız gerekiyor',
    },
    '38wruatw': {
      'en': 'Minimum 8 characters',
      'de': 'Mindestens 8 Zeichen',
      'ru': 'Минимум 8 символов',
      'tr': 'Minimum 8 karakter',
    },
    '5giyhcw4': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '563fzpft': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // createProfile
  {
    'ashjynnp': {
      'en': 'Profile Photo',
      'de': 'Profilfoto',
      'ru': 'Фото профиля',
      'tr': 'Profil Fotoğrafı',
    },
    '2efrawcq': {
      'en': 'Tap the camera icon to change your photo',
      'de': 'Tippen Sie auf das Kamerasymbol, um Ihr Foto zu ändern',
      'ru': 'Нажмите на значок камеры, чтобы изменить фотографию.',
      'tr': 'Fotoğrafınızı değiştirmek için kamera simgesine dokunun',
    },
    'h5uzma8f': {
      'en': 'Personal Information',
      'de': 'Persönliche Informationen',
      'ru': 'Персональная информация',
      'tr': 'Kişisel Bilgiler',
    },
    'ade2a2zb': {
      'en': 'Update your personal details',
      'de': 'Aktualisieren Sie Ihre persönlichen Daten',
      'ru': 'Обновите ваши личные данные',
      'tr': 'Kişisel bilgilerinizi güncelleyin',
    },
    '3pqfrdde': {
      'en': 'Phone Number  (Optional)',
      'de': 'Telefonnummer',
      'ru': 'Номер телефона',
      'tr': 'Telefon Numarası',
    },
    'motp85gb': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '63bfj59u': {
      'en': '+90 533 123 45 67',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'sqz2shee': {
      'en': 'Date of birth (Optional)',
      'de': 'Geburtsdatum',
      'ru': 'Дата рождения',
      'tr': 'Doğum tarihi',
    },
    'kozgcfj9': {
      'en': 'Address  (Optional)',
      'de': 'Adresse',
      'ru': 'Адрес',
      'tr': 'Adres',
    },
    'wn6kw3n4': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '7s7ughdt': {
      'en': 'Phone Number is required',
      'de': 'Telefonnummer ist erforderlich',
      'ru': 'Номер телефона обязателен',
      'tr': 'Telefon Numarası gereklidir',
    },
    'rwsfy1ue': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'iwag8xul': {
      'en': 'Address is required',
      'de': 'Adresse ist erforderlich',
      'ru': 'Адрес обязателен',
      'tr': 'Adres gerekli',
    },
    'cg0c4e4y': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'rpfxzb8l': {
      'en': 'Skip',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    '64iiafnb': {
      'en': 'Save Changes',
      'de': 'Änderungen speichern',
      'ru': 'Сохранить изменения',
      'tr': 'Değişiklikleri Kaydet',
    },
    '8pjs4jnu': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // selectRole
  {
    'opm3xewp': {
      'en': 'Select Your Role',
      'de': 'Wählen Sie Ihre Rolle',
      'ru': 'Выберите свою роль',
      'tr': 'Rolünüzü Seçin',
    },
    'bl67eypf': {
      'en': 'Choose how you want to use the Döveç app',
      'de': 'Wählen Sie, wie Sie die Döveç-App verwenden möchten',
      'ru': 'Выберите, как вы хотите использовать приложение Döveç',
      'tr': 'Döveç uygulamasını nasıl kullanmak istediğinizi seçin',
    },
    '0nh4uw8l': {
      'en': 'Property Owner',
      'de': 'Eigentümer',
      'ru': 'Владелец недвижимости',
      'tr': 'Emlak Sahibi',
    },
    'h4v5mk1u': {
      'en':
          'Manage your properties, track income, and handle maintenance requests',
      'de':
          'Verwalten Sie Ihre Immobilien, verfolgen Sie Einnahmen und bearbeiten Sie Wartungsanfragen',
      'ru':
          'Управляйте своей недвижимостью, отслеживайте доход и обрабатывайте заявки на техническое обслуживание',
      'tr':
          'Emlaklarınızı yönetin, geliri takip edin ve bakım taleplerini karşılayın',
    },
    '3xn1ljtt': {
      'en': 'Tenant',
      'de': 'Mieter',
      'ru': 'Жилец',
      'tr': 'Kiracı',
    },
    '1eo3y5rw': {
      'en': 'Pay bills, submit maintenance requests, and access amenities',
      'de':
          'Bezahlen Sie Rechnungen, reichen Sie Wartungsanfragen ein und greifen Sie auf Annehmlichkeiten zu',
      'ru':
          'Оплачивайте счета, подавайте заявки на техническое обслуживание и пользуйтесь удобствами',
      'tr': 'Faturaları ödeyin, bakım taleplerini iletin ve olanaklara erişin',
    },
    'z5e4mfeq': {
      'en': 'Employee',
      'de': 'Mitarbeiter',
      'ru': 'Сотрудник',
      'tr': 'Çalışan',
    },
    't4lnv4mu': {
      'en': 'Get rewards, discounts, and coupons',
      'de': 'Erhalten Sie Prämien, Rabatte und Gutscheine',
      'ru': 'Получайте вознаграждения, скидки и купоны',
      'tr': 'Ödüller, indirimler ve kuponlar kazanın',
    },
    '4kf3qfup': {
      'en': 'Guest / Registered User',
      'de': 'Gast / Registrierter Benutzer',
      'ru': 'Гость / Зарегистрированный пользователь',
      'tr': 'Misafir / Kayıtlı Kullanıcı',
    },
    'om44qy0m': {
      'en': 'Access Döveç amenities like gyms and restaurants',
      'de':
          'Zugang zu Döveç-Annehmlichkeiten wie Fitnessstudios und Restaurants',
      'ru': 'Доступ к удобствам Дёвеча, таким как тренажерные залы и рестораны',
      'tr': 'Spor salonları ve restoranlar gibi Döveç olanaklarına erişin',
    },
    'gecj6xlh': {
      'en': 'You can change your role later in settings',
      'de': 'Sie können Ihre Rolle später in den Einstellungen ändern',
      'ru': 'Вы можете изменить свою роль позже в настройках.',
      'tr': 'Rolünüzü daha sonra ayarlardan değiştirebilirsiniz',
    },
    'xvn77pnq': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // notifications
  {
    'wnulgf28': {
      'en': 'Mark All as Read',
      'de': 'Alle als gelesen markieren',
      'ru': 'Отметить все как прочитанное',
      'tr': 'Tümünü Okundu Olarak İşaretle',
    },
    '2wydw8xs': {
      'en': 'Bill Due Reminder',
      'de': 'Erinnerung an fällige Rechnungen',
      'ru': 'Напоминание о необходимости оплаты счета',
      'tr': 'Fatura Vadesi Hatırlatıcısı',
    },
    'zl8s4a5s': {
      'en': 'New',
      'de': 'Neu',
      'ru': 'Новый',
      'tr': 'Yeni',
    },
    '91yrrfkk': {
      'en': 'Your maintenance fee of \$250 is due in 3 days.',
      'de': 'Ihre Wartungsgebühr in Höhe von 250 \$ ist in 3 Tagen fällig.',
      'ru':
          'Плата за обслуживание в размере 250 долларов США должна быть оплачена в течение 3 дней.',
      'tr': '250\$ tutarındaki bakım ücretiniz 3 gün içinde ödenecektir.',
    },
    'ce9dbmw5': {
      'en': '2 hours ago',
      'de': 'vor 2 Stunden',
      'ru': '2 часа назад',
      'tr': '2 saat önce',
    },
    '1q6xgps6': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // events
  {
    'zy5ao98z': {
      'en': 'Events',
      'de': 'Veranstaltungen',
      'ru': 'События',
      'tr': 'Olaylar',
    },
    'y4rprtl7': {
      'en': 'Active',
      'de': 'Aktiv',
      'ru': 'Активный',
      'tr': 'Aktif',
    },
    'dwnt8vzu': {
      'en': 'History',
      'de': 'Geschichte',
      'ru': 'История',
      'tr': 'Tarih',
    },
    'e76zkpkn': {
      'en': 'Events',
      'de': 'Veranstaltungen',
      'ru': 'События',
      'tr': 'Olaylar',
    },
    'y6mun4sb': {
      'en': 'Upcoming Events',
      'de': 'Kommende Veranstaltungen',
      'ru': 'Предстоящие события',
      'tr': 'Yaklaşan Etkinlikler',
    },
    'x6jdi1i2': {
      'en': 'My Bookings',
      'de': 'Meine Buchungen',
      'ru': 'Мои бронирования',
      'tr': 'Rezervasyonlarım',
    },
    'wtbotq24': {
      'en': 'Attended Events',
      'de': 'Besuchte Veranstaltungen',
      'ru': 'Посещенные мероприятия',
      'tr': 'Katıldığım Etkinlikler',
    },
    'p7o9h7hq': {
      'en': 'Featured',
      'de': 'Empfohlen',
      'ru': 'Избранное',
      'tr': 'Öne çıkan',
    },
    '4sli24ub': {
      'en': 'Social',
      'de': 'Sozial',
      'ru': 'Социальный',
      'tr': 'Sosyal',
    },
    'mp3tgocw': {
      'en': 'Book Event',
      'de': 'Veranstaltung buchen',
      'ru': 'Книга Событие',
      'tr': 'Kitap Etkinliği',
    },
    'q90gnq0s': {
      'en': 'Confirmed',
      'de': 'Bestätigt',
      'ru': 'Подтвержденный',
      'tr': 'Onaylandı',
    },
    'wd3q8hop': {
      'en': 'Cancel Reservation',
      'de': 'Reservierung stornieren',
      'ru': 'Отменить бронирование',
      'tr': 'Rezervasyonu İptal Et',
    },
    'o677vp2q': {
      'en': 'Completed',
      'de': 'Vollendet',
      'ru': 'Завершенный',
      'tr': 'Tamamlanmış',
    },
    'ejlut533': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
  },
  // invoicesAndDues
  {
    'vsbezlt2': {
      'en': 'Invoice Summary',
      'de': 'Rechnungsübersicht',
      'ru': 'Резюме счета-фактуры',
      'tr': 'Fatura Özeti',
    },
    '21bthkdl': {
      'en': 'Total Pending',
      'de': 'Gesamtbetrag ausstehend',
      'ru': 'Всего в ожидании',
      'tr': 'Toplam Bekleyen',
    },
    'lisvaffg': {
      'en': 'Pending Count',
      'de': 'Ausstehende Anzahl',
      'ru': 'Ожидается количество',
      'tr': 'Bekleyen Sayım',
    },
    'ttejxx9m': {
      'en': 'Filter by Period',
      'de': 'Filtern nach Zeitraum',
      'ru': 'Фильтр по периоду',
      'tr': 'Döneme Göre Filtrele',
    },
    'qzgwu9zh': {
      'en': 'Last Month',
      'de': 'Letzter Monat',
      'ru': 'Прошлый месяц',
      'tr': 'Geçen ay',
    },
    'rni8c1ys': {
      'en': 'Last Month',
      'de': 'Letzter Monat',
      'ru': 'Прошлый месяц',
      'tr': 'Geçen ay',
    },
    'b0qyzhak': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    '9mxb7ilm': {
      'en': 'Last Month',
      'de': 'Letzter Monat',
      'ru': 'Прошлый месяц',
      'tr': 'Geçen ay',
    },
    '02demprj': {
      'en': 'Last 3 Months',
      'de': 'Letzte 3 Monate',
      'ru': 'Последние 3 месяца',
      'tr': 'Son 3 Ay',
    },
    'v1rx40ks': {
      'en': 'Last 6 Months',
      'de': 'Letzte 6 Monate',
      'ru': 'Последние 6 месяцев',
      'tr': 'Son 6 Ay',
    },
    'g2ex4cdy': {
      'en': 'Last 12 Months',
      'de': 'Letzte 12 Monate',
      'ru': 'Последние 12 месяцев',
      'tr': 'Son 12 Ay',
    },
    '3fzjpjcd': {
      'en': 'All Time',
      'de': 'Alle Zeiten',
      'ru': 'Все время',
      'tr': 'Tüm Zamanlar',
    },
    '3i5w3bxh': {
      'en': 'Due/Overdue',
      'de': 'Fällig/Überfällig',
      'ru': 'Должен/просрочен',
      'tr': 'Vadesi geçmiş/Gecikmiş',
    },
    '5kxn5d7m': {
      'en': 'Paid',
      'de': 'Bezahlt',
      'ru': 'Оплаченный',
      'tr': 'Paralı',
    },
    'j5bdh0hy': {
      'en': 'Due/Overdue',
      'de': 'Fällig/Überfällig',
      'ru': 'Должен/просрочен',
      'tr': 'Vadesi geçmiş/Gecikmiş',
    },
    '8ged1src': {
      'en': 'overdue',
      'de': 'überfällig',
      'ru': 'просроченный',
      'tr': 'gecikmiş',
    },
    'il147fl4': {
      'en': 'Due',
      'de': 'Fällig',
      'ru': 'Должный',
      'tr': 'Vadesi dolmuş',
    },
    'n5027o0u': {
      'en': 'Amount:',
      'de': 'Menge:',
      'ru': 'Количество:',
      'tr': 'Miktar:',
    },
    'y0ucxz3z': {
      'en': 'Due Date:',
      'de': 'Fälligkeitsdatum:',
      'ru': 'Срок оплаты:',
      'tr': 'Bitiş tarihi:',
    },
    'p98gy08t': {
      'en': 'View',
      'de': 'Sicht',
      'ru': 'Вид',
      'tr': 'Görüş',
    },
    '27y122gi': {
      'en': 'Pay Now',
      'de': 'Jetzt bezahlen',
      'ru': 'Оплатить сейчас',
      'tr': 'Şimdi Öde',
    },
    '0ocgo2la': {
      'en': 'Paid',
      'de': 'Bezahlt',
      'ru': 'Оплаченный',
      'tr': 'Paralı',
    },
    'pui21a36': {
      'en': 'Amount:',
      'de': 'Menge:',
      'ru': 'Количество:',
      'tr': 'Miktar:',
    },
    'q9x8t3ql': {
      'en': 'Paid Date:',
      'de': 'Zahlungsdatum:',
      'ru': 'Дата оплаты:',
      'tr': 'Ödeme Tarihi:',
    },
    'dt1m5btp': {
      'en': 'View',
      'de': 'Sicht',
      'ru': 'Вид',
      'tr': 'Görüş',
    },
    'rsoctvrb': {
      'en': 'Download',
      'de': 'Herunterladen',
      'ru': 'Скачать',
      'tr': 'İndirmek',
    },
    'qcrhic01': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
  },
  // invoiceDetails
  {
    'cvrqvif7': {
      'en': 'overdue',
      'de': 'überfällig',
      'ru': 'просроченный',
      'tr': 'gecikmiş',
    },
    '7z4x448u': {
      'en': 'Due',
      'de': 'Fällig',
      'ru': 'Должный',
      'tr': 'Vadesi dolmuş',
    },
    'gf3t4cl4': {
      'en': 'Paid',
      'de': 'Bezahlt',
      'ru': 'Оплаченный',
      'tr': 'Paralı',
    },
    '7pmm4dgm': {
      'en': 'Total Amount:',
      'de': 'Gesamtbetrag:',
      'ru': 'Общая сумма:',
      'tr': 'Toplam Tutar:',
    },
    'ly8byaqn': {
      'en': 'Due Date:',
      'de': 'Fälligkeitsdatum:',
      'ru': 'Срок оплаты:',
      'tr': 'Bitiş tarihi:',
    },
    'imbjkdhg': {
      'en': 'Invoice Breakdown',
      'de': 'Rechnungsaufschlüsselung',
      'ru': 'Разбивка счета-фактуры',
      'tr': 'Fatura Ayrıntısı',
    },
    'd4z5mpka': {
      'en': 'Total Amount:',
      'de': 'Gesamtbetrag:',
      'ru': 'Общая сумма:',
      'tr': 'Toplam Tutar:',
    },
    '69x7nnl7': {
      'en': 'Security Services:',
      'de': 'Sicherheitsdienste:',
      'ru': 'Службы безопасности:',
      'tr': 'Güvenlik Hizmetleri:',
    },
    'etbfs690': {
      'en': '0',
      'de': '0',
      'ru': '0',
      'tr': '0',
    },
    '7sdqzzqf': {
      'en': 'Common Area Utilities:',
      'de': 'Dienstprogramme im Gemeinschaftsbereich:',
      'ru': 'Коммунальные услуги:',
      'tr': 'Ortak Alan Hizmetleri:',
    },
    'nbbsoua3': {
      'en': '0',
      'de': '0',
      'ru': '0',
      'tr': '0',
    },
    'f059cm5x': {
      'en': 'Management Fee:',
      'de': 'Verwaltungsgebühr:',
      'ru': 'Комиссия за управление:',
      'tr': 'Yönetim Ücreti:',
    },
    'iuln34ve': {
      'en': '0',
      'de': '0',
      'ru': '0',
      'tr': '0',
    },
    'iw7m3igl': {
      'en': 'Total:',
      'de': 'Gesamt:',
      'ru': 'Общий:',
      'tr': 'Toplam:',
    },
    'ewu2sou6': {
      'en': 'Pay Now',
      'de': 'Jetzt bezahlen',
      'ru': 'Оплатить сейчас',
      'tr': 'Şimdi Öde',
    },
    'qb4vmsp4': {
      'en': 'Download Invoice',
      'de': 'Rechnung herunterladen',
      'ru': 'Скачать счет-фактуру',
      'tr': 'Fatura İndir',
    },
    '7rdsnu6b': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
  },
  // bookEvent
  {
    '24j9i9m0': {
      'en': 'Featured',
      'de': 'Empfohlen',
      'ru': 'Избранное',
      'tr': 'Öne çıkan',
    },
    'upozubre': {
      'en': 'Social',
      'de': 'Sozial',
      'ru': 'Социальный',
      'tr': 'Sosyal',
    },
    'l3pcj4wp': {
      'en': 'Booking Details',
      'de': 'Buchungsdetails',
      'ru': 'Подробности бронирования',
      'tr': 'Rezervasyon Detayları',
    },
    'r3nu7jl0': {
      'en': 'Please confirm your information below',
      'de': 'Bitte bestätigen Sie Ihre Angaben unten',
      'ru': 'Пожалуйста, подтвердите вашу информацию ниже',
      'tr': 'Lütfen aşağıdaki bilgilerinizi doğrulayın',
    },
    'wgerzsc9': {
      'en': 'First Name',
      'de': 'Vorname',
      'ru': 'Имя',
      'tr': 'İlk adı',
    },
    's025mj63': {
      'en': 'TextField',
      'de': 'Textfeld',
      'ru': 'Текстовое поле',
      'tr': 'Metin Alanı',
    },
    '32fcusb5': {
      'en': 'Last Name',
      'de': 'Nachname',
      'ru': 'Фамилия',
      'tr': 'Soy isim',
    },
    'eccyr8y0': {
      'en': 'Email',
      'de': 'E-Mail',
      'ru': 'Электронная почта',
      'tr': 'E-posta',
    },
    'sfejzos7': {
      'en': 'Phone Number',
      'de': 'Telefonnummer',
      'ru': 'Номер телефона',
      'tr': 'Telefon Numarası',
    },
    'zmgtsukb': {
      'en': 'Number of People',
      'de': 'Personenanzahl',
      'ru': 'Количество людей',
      'tr': 'Kişi Sayısı',
    },
    'atfpph9q': {
      'en': 'Additional Guests',
      'de': 'Zusätzliche Gäste',
      'ru': 'Дополнительные гости',
      'tr': 'Ek Misafirler',
    },
    'xvwte81j': {
      'en': 'Event Requirements',
      'de': 'Veranstaltungsanforderungen',
      'ru': 'Требования к мероприятию',
      'tr': 'Etkinlik Gereksinimleri',
    },
    '287r971n': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
  },
  // rewards
  {
    'asmtzbij': {
      'en': 'Active',
      'de': 'Aktiv',
      'ru': 'Активный',
      'tr': 'Aktif',
    },
    '0sepxecz': {
      'en': 'Benefits',
      'de': 'Vorteile',
      'ru': 'Преимущества',
      'tr': 'Faydalar',
    },
    'ggyli8qq': {
      'en': 'Terms & Conditions:',
      'de': 'Allgemeine Geschäftsbedingungen:',
      'ru': 'Условия и положения:',
      'tr': 'Şartlar ve Koşullar:',
    },
    'eh9o8ql3': {
      'en': 'Discount:',
      'de': 'Rabatt:',
      'ru': 'Скидка:',
      'tr': 'İndirim:',
    },
    '97h5bhls': {
      'en': 'Redeem',
      'de': 'Tilgen',
      'ru': 'Выкупать',
      'tr': 'Kurtarmak',
    },
    '9tf7e7uc': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
  },
  // more
  {
    'kl4hsf9t': {
      'en': 'Property Owner',
      'de': 'Eigentümer',
      'ru': 'Владелец недвижимости',
      'tr': 'Emlak Sahibi',
    },
    'm6w5kfl6': {
      'en': 'More Pages',
      'de': 'Weitere Seiten',
      'ru': 'Больше страниц',
      'tr': 'Daha Fazla Sayfa',
    },
    '9di5hx5e': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
    '0m4a9i0w': {
      'en': 'My Properties',
      'de': 'Meine Immobilien',
      'ru': 'Мои свойства',
      'tr': 'Benim Özelliklerim',
    },
    'n39bgx2n': {
      'en': 'My Rentals',
      'de': 'Meine Mietobjekte',
      'ru': 'Мои аренды',
      'tr': 'Kiralıklarım',
    },
    'tms3sq5w': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'ru': 'Настройки',
      'tr': 'Ayarlar',
    },
    'aad7cmyw': {
      'en': 'Edit Profile',
      'de': 'Profil bearbeiten',
      'ru': 'Редактировать профиль',
      'tr': 'Profili Düzenle',
    },
    'tpgtkmm9': {
      'en': 'Change Role',
      'de': 'Rolle ändern',
      'ru': 'Изменить роль',
      'tr': 'Rol Değiştir',
    },
    '5kxstabu': {
      'en': 'Notification Settings',
      'de': 'Benachrichtigungseinstellungen',
      'ru': 'Настройки уведомлений',
      'tr': 'Bildirim Ayarları',
    },
    'yyjdb8c0': {
      'en': 'Security & Privacy',
      'de': 'Sicherheit und Datenschutz',
      'ru': 'Безопасность и конфиденциальность',
      'tr': 'Güvenlik ve Gizlilik',
    },
    'dxmmug3e': {
      'en': 'Help & Support',
      'de': 'Hilfe & Support',
      'ru': 'Помощь и поддержка',
      'tr': 'Yardım ve Destek',
    },
    'jsny5jcr': {
      'en': 'Change Language',
      'de': 'Sprache ändern',
      'ru': 'Изменить язык',
      'tr': 'Dili değiştir',
    },
    'uznwl4y0': {
      'en': 'Sign Out',
      'de': 'Abmelden',
      'ru': 'Выход',
      'tr': 'Oturumu Kapat',
    },
    'dagrpsjv': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // comingSoon
  {
    'ls0o7q6q': {
      'en': 'Coming Soon!',
      'de': 'Demnächst verfügbar!',
      'ru': 'Вскоре!',
      'tr': 'Yakında gelecek!',
    },
    'iv6ssesg': {
      'en': 'We\'re working hard to bring you something amazing. Stay tuned!',
      'de':
          'Wir arbeiten hart daran, Ihnen etwas Großartiges zu bieten. Bleiben Sie dran!',
      'ru':
          'Мы усердно работаем, чтобы предложить вам что-то потрясающее. Оставайтесь с нами!',
      'tr':
          'Size harika bir şey sunmak için çok çalışıyoruz. Bizi izlemeye devam edin!',
    },
    '18ozkap0': {
      'en': 'Go to Home',
      'de': 'Gehe zur Startseite',
      'ru': 'Перейти на главную',
      'tr': 'Ana Sayfaya Git',
    },
    'dkt48w00': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // createAccountQ
  {
    '01cmjw6e': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
  },
  // selectRoleSettings
  {
    'eemnmt63': {
      'en': 'Select Your Role',
      'de': 'Wählen Sie Ihre Rolle',
      'ru': 'Выберите свою роль',
      'tr': 'Rolünüzü Seçin',
    },
    'kbx9vggh': {
      'en': 'Choose how you want to use the Döveç app',
      'de': 'Wählen Sie, wie Sie die Döveç-App verwenden möchten',
      'ru': 'Выберите, как вы хотите использовать приложение Döveç',
      'tr': 'Döveç uygulamasını nasıl kullanmak istediğinizi seçin',
    },
    'cwskdxyj': {
      'en': 'Property Owner',
      'de': 'Eigentümer',
      'ru': 'Владелец недвижимости',
      'tr': 'Emlak Sahibi',
    },
    'uej44b4n': {
      'en':
          'Manage your properties, track income, and handle maintenance requests',
      'de':
          'Verwalten Sie Ihre Immobilien, verfolgen Sie Einnahmen und bearbeiten Sie Wartungsanfragen',
      'ru':
          'Управляйте своей недвижимостью, отслеживайте доход и обрабатывайте заявки на техническое обслуживание',
      'tr':
          'Emlaklarınızı yönetin, geliri takip edin ve bakım taleplerini karşılayın',
    },
    'w3fef4zw': {
      'en': 'Tenant',
      'de': 'Mieter',
      'ru': 'Жилец',
      'tr': 'Kiracı',
    },
    'leyytim1': {
      'en': 'Pay bills, submit maintenance requests, and access amenities',
      'de':
          'Bezahlen Sie Rechnungen, reichen Sie Wartungsanfragen ein und greifen Sie auf Annehmlichkeiten zu',
      'ru':
          'Оплачивайте счета, подавайте заявки на техническое обслуживание и пользуйтесь удобствами',
      'tr': 'Faturaları ödeyin, bakım taleplerini iletin ve olanaklara erişin',
    },
    'yhq0inlp': {
      'en': 'Employee',
      'de': 'Mitarbeiter',
      'ru': 'Сотрудник',
      'tr': 'Çalışan',
    },
    'zhmhodhp': {
      'en': 'Get rewards, discounts, and coupons',
      'de': 'Erhalten Sie Prämien, Rabatte und Gutscheine',
      'ru': 'Получайте вознаграждения, скидки и купоны',
      'tr': 'Ödüller, indirimler ve kuponlar kazanın',
    },
    '2cq73f4n': {
      'en': 'Guest / Registered User',
      'de': 'Gast / Registrierter Benutzer',
      'ru': 'Гость / Зарегистрированный пользователь',
      'tr': 'Misafir / Kayıtlı Kullanıcı',
    },
    '5rulba5d': {
      'en': 'Access Döveç amenities like gyms and restaurants',
      'de':
          'Zugang zu Döveç-Annehmlichkeiten wie Fitnessstudios und Restaurants',
      'ru': 'Доступ к удобствам Дёвеча, таким как тренажерные залы и рестораны',
      'tr': 'Spor salonları ve restoranlar gibi Döveç olanaklarına erişin',
    },
    'sy7iqw2b': {
      'en': 'You can change your role later in settings',
      'de': 'Sie können Ihre Rolle später in den Einstellungen ändern',
      'ru': 'Вы можете изменить свою роль позже в настройках.',
      'tr': 'Rolünüzü daha sonra ayarlardan değiştirebilirsiniz',
    },
    'fr06npqa': {
      'en': 'My Profile',
      'de': 'Mein Profil',
      'ru': 'Мой профиль',
      'tr': 'Profilim',
    },
  },
  // checkout
  {
    'm4rpqrqi': {
      'en': 'Checkout',
      'de': 'Kasse',
      'ru': 'Проверить',
      'tr': 'Çıkış yapmak',
    },
    'w4omgfj6': {
      'en': 'Fill in the information below to top up credit.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Guthaben aufzuladen.',
      'ru': 'Заполните информацию ниже, чтобы пополнить кредит.',
      'tr': 'Kredi yüklemek için aşağıdaki bilgileri doldurun.',
    },
    'dqvdo923': {
      'en': 'Amount to top up',
      'de': 'Aufzuladender Betrag',
      'ru': 'Сумма для пополнения',
      'tr': 'Üste eklenecek miktar',
    },
    'z0iq7akn': {
      'en': 'Card Number',
      'de': 'Kartennummer',
      'ru': 'Номер карты',
      'tr': 'Kart Numarası',
    },
    '0ysnkqok': {
      'en': 'Name on Card',
      'de': 'Name auf der Karte',
      'ru': 'Имя на карте',
      'tr': 'Kart Üzerindeki İsim',
    },
    'kwl71fm1': {
      'en': 'CVV',
      'de': 'CVV',
      'ru': 'CVV',
      'tr': 'Özgeçmiş',
    },
    '12cu5ho9': {
      'en': 'exp month',
      'de': 'Ablaufmonat',
      'ru': 'месяц срока действия',
      'tr': 'son ay',
    },
    'yv7s5wh8': {
      'en': 'exp year',
      'de': 'Ablaufjahr',
      'ru': 'год эксп',
      'tr': 'son yıl',
    },
    '9uoig4fe': {
      'en': 'Total',
      'de': 'Gesamt',
      'ru': 'Общий',
      'tr': 'Toplam',
    },
    'tan6arvq': {
      'en': '₺ ',
      'de': '₺',
      'ru': '₺',
      'tr': '₺',
    },
    '9y0ak5pd': {
      'en': 'Hello World',
      'de': 'Hallo Welt',
      'ru': 'Привет, мир',
      'tr': 'Selam Dünya',
    },
    'zisvnmnr': {
      'en': 'Top Up Credit',
      'de': 'Guthaben aufladen',
      'ru': 'Пополнить кредит',
      'tr': 'Krediyi Tamamla',
    },
    'ggpp7a03': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'ru': 'Поле обязательно для заполнения',
      'tr': 'Alan gereklidir',
    },
    'pqur15d8': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'rlc8hjc1': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'ru': 'Поле обязательно для заполнения',
      'tr': 'Alan gereklidir',
    },
    'exkwv7po': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'sp43eipo': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'ru': 'Поле обязательно для заполнения',
      'tr': 'Alan gereklidir',
    },
    '78gdhw44': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'dk0jqeuo': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'ru': 'Поле обязательно для заполнения',
      'tr': 'Alan gereklidir',
    },
    'l6fg2gjf': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'medgscms': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'ru': 'Поле обязательно для заполнения',
      'tr': 'Alan gereklidir',
    },
    'oiwawg5a': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '7i604nhl': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'ru': 'Поле обязательно для заполнения',
      'tr': 'Alan gereklidir',
    },
    'aia3stbn': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
  },
  // noResult
  {
    'qb9s85bt': {
      'en': 'No Results Found',
      'de': 'Keine Ergebnisse gefunden',
      'ru': 'Результаты не найдены',
      'tr': 'Sonuç Bulunamadı',
    },
  },
  // TopBar
  {
    'b8o4eeb4': {
      'en': 'Add Property',
      'de': 'Eigenschaft hinzufügen',
      'ru': 'Добавить недвижимость',
      'tr': 'Özellik Ekle',
    },
  },
  // ScanQR
  {
    'y5imtt6s': {
      'en': 'Scan QR Code to Pay',
      'de': 'Zum Bezahlen QR-Code scannen',
      'ru': 'Отсканируйте QR-код для оплаты',
      'tr': 'Ödeme yapmak için QR Kodunu tarayın',
    },
    'z18e2p33': {
      'en': 'Position the QR code within the frame.',
      'de': 'Positionieren Sie den QR-Code innerhalb des Rahmens.',
      'ru': 'Разместите QR-код в рамке.',
      'tr': 'QR kodunu çerçevenin içerisine yerleştirin.',
    },
    '81bo33nq': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    '6h3acva9': {
      'en':
          'For demo purposes, click the button below to simulate a successful scan.',
      'de':
          'Klicken Sie zu Demozwecken auf die Schaltfläche unten, um einen erfolgreichen Scan zu simulieren.',
      'ru':
          'В демонстрационных целях нажмите кнопку ниже, чтобы имитировать успешное сканирование.',
      'tr':
          'Demo amaçlı olarak, başarılı bir taramayı simüle etmek için aşağıdaki butona tıklayın.',
    },
    'bp88eo57': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    's3l3yv2o': {
      'en': 'Simulate Scan',
      'de': 'Scan simulieren',
      'ru': 'Имитация сканирования',
      'tr': 'Taramayı Simüle Et',
    },
  },
  // readQR
  {
    'olo14cll': {
      'en': 'Your Payment QR Code',
      'de': 'Ihr Zahlungs-QR-Code',
      'ru': 'Ваш платежный QR-код',
      'tr': 'Ödeme QR Kodunuz',
    },
    'ifo7q0bs': {
      'en': 'Scan this code to receive payments.',
      'de': 'Scannen Sie diesen Code, um Zahlungen zu erhalten.',
      'ru': 'Отсканируйте этот код для получения платежей.',
      'tr': 'Ödeme almak için bu kodu tarayın.',
    },
    '7801xfep': {
      'en':
          'This QR code is linked to your Dovec Wallet.\nShare it to receive payments instantly.',
      'de':
          'Dieser QR-Code ist mit Ihrem Dovec Wallet verknüpft.\nTeilen Sie ihn, um sofort Zahlungen zu erhalten.',
      'ru':
          'Этот QR-код связан с вашим кошельком Dovec. Поделитесь им, чтобы получать платежи мгновенно.',
      'tr':
          'Bu QR kodu Dovec Cüzdanınıza bağlıdır.\nAnında ödeme almak için paylaşın.',
    },
    'djvk6hcz': {
      'en': 'Close',
      'de': 'Schließen',
      'ru': 'Закрывать',
      'tr': 'Kapalı',
    },
  },
  // navBar
  {
    '1xyazirh': {
      'en': 'Home',
      'de': 'Heim',
      'ru': 'Дом',
      'tr': 'Ev',
    },
    'd7y5693f': {
      'en': 'Properties',
      'de': 'Eigenschaften',
      'ru': 'Характеристики',
      'tr': 'Özellikler',
    },
    'sdc0vjqk': {
      'en': 'Rental',
      'de': 'Vermietung',
      'ru': 'Аренда',
      'tr': 'Kiralama',
    },
    'cnm5ybaz': {
      'en': 'Amenities',
      'de': 'Ausstattung',
      'ru': 'Удобства',
      'tr': 'Kolaylıklar',
    },
    '2vg8xwnk': {
      'en': 'Rewards',
      'de': 'Belohnungen',
      'ru': 'Награды',
      'tr': 'Ödüller',
    },
    '86p2ycph': {
      'en': 'More',
      'de': 'Mehr',
      'ru': 'Более',
      'tr': 'Daha',
    },
    '0niwaghd': {
      'en': 'Projects',
      'de': 'Projekte',
      'ru': 'Проекты',
      'tr': 'Projeler',
    },
    'wfdehaw6': {
      'en': 'Profile',
      'de': 'Profil',
      'ru': 'Профиль',
      'tr': 'Profil',
    },
  },
  // productModal
  {
    'br7x5f7z': {
      'en': 'Quantity',
      'de': 'Menge',
      'ru': 'Количество',
      'tr': 'Miktar',
    },
  },
  // deleteCart
  {
    'aq37gzmg': {
      'en': 'Clear Cart ?',
      'de': 'Warenkorb leeren?',
      'ru': 'Очистить корзину ?',
      'tr': 'Sepeti Temizle ?',
    },
    '8d4q79xh': {
      'en': 'You already have items from in your cart.',
      'de': 'Sie haben bereits Artikel von in Ihrem Warenkorb.',
      'ru': 'В вашей корзине уже есть товары из.',
      'tr': 'Sepetinizde zaten ürün var.',
    },
    '6oborlht': {
      'en': 'Go to Cart',
      'de': 'Zum Warenkorb',
      'ru': 'Перейти в корзину',
      'tr': 'Sepete Git',
    },
    '7twdqd3r': {
      'en': 'Clear Cart',
      'de': 'Warenkorb leeren',
      'ru': 'Очистить корзину',
      'tr': 'Sepeti Temizle',
    },
  },
  // addNewProperty
  {
    'r9qeunzy': {
      'en': 'Add New Property',
      'de': 'Neue Eigenschaft hinzufügen',
      'ru': 'Добавить новое свойство',
      'tr': 'Yeni Emlak Ekle',
    },
    'jxqvwbqx': {
      'en':
          'Submit your property for verification. It will appear in your list once approved.',
      'de':
          'Senden Sie Ihre Immobilie zur Überprüfung. Nach der Genehmigung wird sie in Ihrer Liste angezeigt.',
      'ru':
          'Отправьте свою недвижимость на проверку. Она появится в вашем списке после одобрения.',
      'tr':
          'Doğrulama için mülkünüzü gönderin. Onaylandıktan sonra listenizde görünecektir.',
    },
    '2yovjvvk': {
      'en': 'Property Name',
      'de': 'Eigenschaftsname',
      'ru': 'Имя свойства',
      'tr': 'Mülk Adı',
    },
    'wjymu9y7': {
      'en': 'La Isla A01',
      'de': 'La Isla A01',
      'ru': 'Ла Исла A01',
      'tr': 'Ada A01',
    },
    'tsmyvatw': {
      'en': 'Project',
      'de': 'Projekt',
      'ru': 'Проект',
      'tr': 'Proje',
    },
    'gh2efbf4': {
      'en': 'Select Project',
      'de': 'Projekt auswählen',
      'ru': 'Выбрать проект',
      'tr': 'Proje Seçin',
    },
    '4h9yya0s': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'ism218gg': {
      'en': 'Block',
      'de': 'Block',
      'ru': 'Блокировать',
      'tr': 'Engellemek',
    },
    'cdi9plke': {
      'en': 'Select Block',
      'de': 'Block auswählen',
      'ru': 'Выбрать блок',
      'tr': 'Blok Seç',
    },
    '803ulwj4': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    '0rqwo0fw': {
      'en': 'Property',
      'de': 'Eigentum',
      'ru': 'Свойство',
      'tr': 'Mülk',
    },
    'ttew42ri': {
      'en': 'Select Property',
      'de': 'Eigenschaft auswählen',
      'ru': 'Выбрать недвижимость',
      'tr': 'Özellik Seç',
    },
    'eqz6mr46': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    '7wp23l4z': {
      'en': 'ID Number',
      'de': 'ID-Nummer',
      'ru': 'Номер удостоверения личности',
      'tr': 'Kimlik Numarası',
    },
    'w9ehawte': {
      'en': 'Property Name is required',
      'de': 'Der Eigenschaftsname ist erforderlich',
      'ru': 'Имя свойства обязательно',
      'tr': 'Mülk Adı gereklidir',
    },
    '864fx8yt': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '44a3437a': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    '65ul8wxf': {
      'en': 'Submit for Verification',
      'de': 'Zur Überprüfung einreichen',
      'ru': 'Отправить на проверку',
      'tr': 'Doğrulama İçin Gönder',
    },
  },
  // newPropertyDone
  {
    'ppp1wqri': {
      'en': 'Request Submitted Successfully!',
      'de': 'Anfrage erfolgreich übermittelt!',
      'ru': 'Запрос успешно отправлен!',
      'tr': 'Talebiniz Başarıyla İletildi!',
    },
    '1dv9mfbc': {
      'en': 'We\'ve received your request and will get back to you shortly.',
      'de':
          'Wir haben Ihre Anfrage erhalten und werden uns in Kürze bei Ihnen melden.',
      'ru': 'Мы получили ваш запрос и свяжемся с вами в ближайшее время.',
      'tr': 'Talebinizi aldık ve en kısa sürede size geri dönüş yapacağız.',
    },
    'g9wmoixw': {
      'en': 'Go to Rental',
      'de': 'Zur Vermietung',
      'ru': 'Перейти к аренде',
      'tr': 'Kiralamaya Git',
    },
    'b0v6zvhm': {
      'en': 'Go to Properties',
      'de': 'Gehe zu Eigenschaften',
      'ru': 'Перейти к свойствам',
      'tr': 'Özelliklere Git',
    },
  },
  // newMaintenanceRequest
  {
    'n9btygrc': {
      'en': 'Submit Maintenance Request',
      'de': 'Wartungsanfrage senden',
      'ru': 'Отправить запрос на обслуживание',
      'tr': 'Bakım Talebi Gönder',
    },
    '3m0w3xw1': {
      'en': 'Describe the issue you\'re experiencing in your unit.',
      'de': 'Beschreiben Sie das Problem, das in Ihrem Gerät auftritt.',
      'ru': 'Опишите проблему, с которой вы столкнулись в своем подразделении.',
      'tr': 'Biriminizde yaşadığınız sorunu açıklayın.',
    },
    't4du30ns': {
      'en': 'Property & Unit',
      'de': 'Eigentum & Einheit',
      'ru': 'Недвижимость и юнит',
      'tr': 'Emlak ve Birim',
    },
    'k6647yfk': {
      'en': 'Select property and unit',
      'de': 'Wählen Sie eine Immobilie und eine Einheit aus',
      'ru': 'Выберите недвижимость и единицу',
      'tr': 'Mülk ve üniteyi seçin',
    },
    '7pakdlas': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'a5d56fh2': {
      'en': 'Issue Category',
      'de': 'Problemkategorie',
      'ru': 'Категория проблемы',
      'tr': 'Sorun Kategorisi',
    },
    'zfbcvlnu': {
      'en': 'Select category',
      'de': 'Kategorie auswählen',
      'ru': 'Выберите категорию',
      'tr': 'Kategori seçin',
    },
    'm3kv9q78': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'mzpg3qhr': {
      'en': 'Plumbing',
      'de': 'Sanitär',
      'ru': 'Сантехника',
      'tr': 'Sıhhi tesisat',
    },
    'hlplbsw3': {
      'en': 'Electrical',
      'de': 'Elektrisch',
      'ru': 'Электрические',
      'tr': 'Elektrik',
    },
    'pnmfvkkx': {
      'en': 'HVAC',
      'de': 'Heizungs-, Lüftungs- und Klimatechnik',
      'ru': 'ОВиК',
      'tr': 'Isıtma, havalandırma ve iklimlendirme',
    },
    'pm6hlkxn': {
      'en': 'Appliances',
      'de': 'Geräte',
      'ru': 'Бытовая техника',
      'tr': 'Ev aletleri',
    },
    'k66qd2cn': {
      'en': 'Structural',
      'de': 'Strukturell',
      'ru': 'Структурный',
      'tr': 'Yapısal',
    },
    'ynhb8wt1': {
      'en': 'Pest Control',
      'de': 'Schädlingsbekämpfung',
      'ru': 'Борьба с вредителями',
      'tr': 'Haşere Kontrolü',
    },
    'zh1klyfu': {
      'en': 'Internet/Connectivity',
      'de': 'Internet/Konnektivität',
      'ru': 'Интернет/Связь',
      'tr': 'İnternet/Bağlantı',
    },
    'gmltj7wb': {
      'en': 'Security',
      'de': 'Sicherheit',
      'ru': 'Безопасность',
      'tr': 'Güvenlik',
    },
    'ednjnd9i': {
      'en': 'Furniture',
      'de': 'Möbel',
      'ru': 'Мебель',
      'tr': 'Mobilya',
    },
    '9us60cnu': {
      'en': 'General Cleaning',
      'de': 'Allgemeine Reinigung',
      'ru': 'Генеральная уборка',
      'tr': 'Genel Temizlik',
    },
    '1r2bfr1f': {
      'en': 'Priority Level',
      'de': 'Prioritätsstufe',
      'ru': 'Уровень приоритета',
      'tr': 'Öncelik Seviyesi',
    },
    'rf59ikxi': {
      'en': 'Select priority',
      'de': 'Priorität auswählen',
      'ru': 'Выберите приоритет',
      'tr': 'Önceliği seçin',
    },
    'rj68ymnb': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'vhr5jcsw': {
      'en': 'Low',
      'de': 'Niedrig',
      'ru': 'Низкий',
      'tr': 'Düşük',
    },
    '3qetnxkz': {
      'en': 'Medium',
      'de': 'Medium',
      'ru': 'Середина',
      'tr': 'Orta',
    },
    '7v98vll3': {
      'en': 'High',
      'de': 'Hoch',
      'ru': 'Высокий',
      'tr': 'Yüksek',
    },
    'rymz7w9g': {
      'en': 'Critical',
      'de': 'Kritisch',
      'ru': 'Критический',
      'tr': 'Kritik',
    },
    '4ss6n4lf': {
      'en': 'Issue Title',
      'de': 'Titel der Ausgabe',
      'ru': 'Название выпуска',
      'tr': 'Konu Başlığı',
    },
    'lppnhruv': {
      'en': '',
      'de': 'Kurze Beschreibung des Problems',
      'ru': 'Краткое описание проблемы',
      'tr': 'Sorunun kısa açıklaması',
    },
    'oqykk7w2': {
      'en': 'Brief description of the issue',
      'de': 'Kurze Beschreibung des Problems',
      'ru': 'Краткое описание проблемы',
      'tr': 'Sorunun kısa açıklaması',
    },
    '319rudn2': {
      'en': 'Detailed Description',
      'de': 'Detaillierte Beschreibung',
      'ru': 'Подробное описание',
      'tr': 'Ayrıntılı Açıklama',
    },
    'usokzc74': {
      'en': '',
      'de': 'Bitte geben Sie so viele Details wie möglich zu dem Problem an.',
      'ru':
          'Пожалуйста, предоставьте как можно более подробную информацию о проблеме.',
      'tr': 'Lütfen konu hakkında mümkün olduğunca ayrıntılı bilgi verin.',
    },
    '3bw7br0h': {
      'en': 'Please provide as much detail as possible about the issue.',
      'de': 'Bitte geben Sie so viele Details wie möglich zu dem Problem an.',
      'ru':
          'Пожалуйста, предоставьте как можно более подробную информацию о проблеме.',
      'tr': 'Lütfen konu hakkında mümkün olduğunca ayrıntılı bilgi verin.',
    },
    'no301fgv': {
      'en': 'Location within Unit (e.g., Kitchen, Bathroom, Living Room)',
      'de':
          'Standort innerhalb der Einheit (z. B. Küche, Badezimmer, Wohnzimmer)',
      'ru':
          'Расположение в пределах помещения (например, кухня, ванная комната, гостиная)',
      'tr': 'Ünite içindeki konum (örneğin, Mutfak, Banyo, Oturma Odası)',
    },
    '2qbt7s2l': {
      'en': '',
      'de': 'z. B. Küchenspüle, Schlafzimmerfenster',
      'ru': 'например, кухонная раковина, окно в спальне',
      'tr': 'Örn. Mutfak lavabosu, Yatak odası penceresi',
    },
    'a7stn1mt': {
      'en': 'e.g., Kitchen sink, Bedroom window',
      'de': 'z. B. Küchenspüle, Schlafzimmerfenster',
      'ru': 'например, кухонная раковина, окно в спальне',
      'tr': 'Örn. Mutfak lavabosu, Yatak odası penceresi',
    },
    'i3tn4xw5': {
      'en': 'Photos/Videos (Optional)',
      'de': 'Fotos/Videos (optional)',
      'ru': 'Фото/Видео (необязательно)',
      'tr': 'Fotoğraflar/Videolar (İsteğe bağlı)',
    },
    'bic24rm7': {
      'en': 'Photos help us understand the issue better and respond faster.',
      'de':
          'Fotos helfen uns, das Problem besser zu verstehen und schneller zu reagieren.',
      'ru':
          'Фотографии помогают нам лучше понять проблему и быстрее отреагировать.',
      'tr':
          'Fotoğraflar konuyu daha iyi anlamamıza ve daha hızlı yanıt vermemize yardımcı oluyor.',
    },
    'rp5qxed6': {
      'en': 'Brief description of the issue is required',
      'de': 'Kurze Beschreibung des Problems erforderlich',
      'ru': 'Требуется краткое описание проблемы.',
      'tr': 'Sorunun kısa bir açıklaması gereklidir',
    },
    '3m0qjtaq': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'vrnvw790': {
      'en':
          'Please provide as much detail as possible about the issue. is required',
      'de':
          'Bitte geben Sie so viele Details wie möglich zu dem Problem an. ist erforderlich',
      'ru':
          'Пожалуйста, предоставьте как можно больше подробностей о проблеме. обязательно',
      'tr':
          'Lütfen sorun hakkında mümkün olduğunca fazla ayrıntı sağlayın. gereklidir',
    },
    'qp8t1cnm': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    '6ds53ejy': {
      'en': 'e.g., Kitchen sink, Bedroom window is required',
      'de': 'z.B. Küchenspüle, Schlafzimmerfenster ist erforderlich',
      'ru': 'например, требуется кухонная раковина, окно в спальне',
      'tr': 'örn. Mutfak lavabosu, Yatak odası penceresi gereklidir',
    },
    'ccr06pr0': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'konyw8dg': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    'l0qqsaok': {
      'en': 'Submit for Verification',
      'de': 'Zur Überprüfung einreichen',
      'ru': 'Отправить для проверки',
      'tr': 'Doğrulama İçin Gönder',
    },
  },
  // GuestNameForm
  {
    'n9cv4tuz': {
      'en': 'First Name',
      'de': 'Vorname',
      'ru': 'Имя',
      'tr': 'İlk adı',
    },
    'hxys5x46': {
      'en': 'Last Name',
      'de': 'Nachname',
      'ru': 'Фамилия',
      'tr': 'Soy isim',
    },
  },
  // ownPropertyQ
  {
    '2iz4lu6p': {
      'en': 'Do you own a property?',
      'de': 'Besitzen Sie eine Immobilie?',
      'ru': 'У вас есть недвижимость?',
      'tr': 'Bir mülkünüz var mı?',
    },
    'qgsgo91w': {
      'en': 'Do you own any property with Döveç Group?',
      'de': 'Besitzen Sie Eigentum der Döveç Group?',
      'ru': 'Владеете ли вы какой-либо недвижимостью в Döveç Group?',
      'tr': 'Döveç Group\'ta herhangi bir gayrimenkulünüz var mı?',
    },
    '3a6b6sdk': {
      'en': 'No',
      'de': 'NEIN',
      'ru': 'Нет',
      'tr': 'HAYIR',
    },
    '7k835png': {
      'en': 'Yes',
      'de': 'Ja',
      'ru': 'Да',
      'tr': 'Evet',
    },
  },
  // rentedPropertyQ
  {
    'utmm3h5q': {
      'en': 'Are you a tenant?',
      'de': 'Sind Sie Mieter?',
      'ru': 'Вы арендатор?',
      'tr': 'Kiracı mısınız?',
    },
    'ym8xszux': {
      'en': 'Do you rent any property from Döveç Group?',
      'de': 'Mieten Sie Immobilien von der Döveç Group?',
      'ru': 'Арендуете ли вы какую-либо недвижимость у Döveç Group?',
      'tr': 'Döveç Group\'tan kiraladığınız bir gayrimenkul var mı?',
    },
    '69wccikt': {
      'en': 'No',
      'de': 'NEIN',
      'ru': 'Нет',
      'tr': 'HAYIR',
    },
    '4rys1hl5': {
      'en': 'Yes',
      'de': 'Ja',
      'ru': 'Да',
      'tr': 'Evet',
    },
  },
  // addNewRental
  {
    'nthk6esc': {
      'en': 'Add New House',
      'de': 'Neues Haus hinzufügen',
      'ru': 'Добавить новый дом',
      'tr': 'Yeni Ev Ekle',
    },
    '5sqpia42': {
      'en':
          'Submit your rented property for verification. It will appear once approved.',
      'de':
          'Senden Sie Ihr Mietobjekt zur Überprüfung. Es wird angezeigt, sobald es genehmigt wurde.',
      'ru':
          'Отправьте вашу арендуемую недвижимость на проверку. Она появится после одобрения.',
      'tr':
          'Kiraladığınız mülkü doğrulama için gönderin. Onaylandıktan sonra görünecektir.',
    },
    'twef1etl': {
      'en': 'Property Name',
      'de': 'Eigenschaftsname',
      'ru': 'Имя свойства',
      'tr': 'Mülk Adı',
    },
    'bc2786qu': {
      'en': 'La Isla A01',
      'de': 'La Isla A01',
      'ru': 'Ла Исла A01',
      'tr': 'Ada A01',
    },
    'o731rk66': {
      'en': 'Project',
      'de': 'Projekt',
      'ru': 'Проект',
      'tr': 'Proje',
    },
    'vqf3jxf5': {
      'en': 'Select Project',
      'de': 'Projekt auswählen',
      'ru': 'Выбрать проект',
      'tr': 'Proje Seçin',
    },
    '6e9l177w': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    '5eo5k4ya': {
      'en': 'Block',
      'de': 'Block',
      'ru': 'Блокировать',
      'tr': 'Engellemek',
    },
    't2suj0zu': {
      'en': 'Select Block',
      'de': 'Block auswählen',
      'ru': 'Выбрать блок',
      'tr': 'Blok Seç',
    },
    'u94qqv3r': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    '2wnkb0ef': {
      'en': 'Property',
      'de': 'Eigentum',
      'ru': 'Свойство',
      'tr': 'Mülk',
    },
    'ffi6q0yk': {
      'en': 'Select Property',
      'de': 'Eigenschaft auswählen',
      'ru': 'Выбрать недвижимость',
      'tr': 'Özellik Seç',
    },
    'g6wqqw1o': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    'a9yd3c9b': {
      'en': 'ID Number',
      'de': 'ID-Nummer',
      'ru': 'Номер удостоверения личности',
      'tr': 'Kimlik Numarası',
    },
    'ohubosyp': {
      'en': 'Property Name is required',
      'de': 'Der Eigenschaftsname ist erforderlich',
      'ru': 'Имя свойства обязательно',
      'tr': 'Mülk Adı gereklidir',
    },
    'z4d9k2pw': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
    'nzyu7s1a': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    '1g2blwr4': {
      'en': 'Submit for Verification',
      'de': 'Zur Überprüfung einreichen',
      'ru': 'Отправить для проверки',
      'tr': 'Doğrulama İçin Gönder',
    },
  },
  // bookingEventPayment
  {
    'bzeos7ob': {
      'en': 'Complete Your Booking',
      'de': 'Vervollständigen Sie Ihre Buchung',
      'ru': 'Завершите бронирование',
      'tr': 'Rezervasyonunuzu Tamamlayın',
    },
    '9h0a3wvb': {
      'en': 'Review and confirm your event booking',
      'de': 'Überprüfen und bestätigen Sie Ihre Veranstaltungsbuchung',
      'ru': 'Проверьте и подтвердите бронирование мероприятия',
      'tr': 'Etkinlik rezervasyonunuzu inceleyin ve onaylayın',
    },
    'moocmrc1': {
      'en': 'Number of people',
      'de': 'Anzahl der Personen',
      'ru': 'Количество человек',
      'tr': 'Kişi sayısı',
    },
    'ht7o8qve': {
      'en': 'Döveç Wallet',
      'de': 'Döveç Geldbörse',
      'ru': 'Кошелек Döveç',
      'tr': 'Döveç Cüzdan',
    },
    'elb1vkl6': {
      'en': 'Balance: ',
      'de': 'Gleichgewicht:',
      'ru': 'Баланс:',
      'tr': 'Denge:',
    },
    'noc8mxtw': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'rfgvgccp': {
      'en': 'Back to Booking',
      'de': 'Zurück zur Buchung',
      'ru': 'Вернуться к бронированию',
      'tr': 'Rezervasyona Geri Dön',
    },
    'wuhd3fev': {
      'en': 'Checkout',
      'de': 'Kasse',
      'ru': 'Проверить',
      'tr': 'Çıkış yapmak',
    },
  },
  // gymCard
  {
    '05q0v8ku': {
      'en': 'Gym Membership',
      'de': 'Fitnessstudio-Mitgliedschaft',
      'ru': 'Членство в спортзале',
      'tr': 'Spor salonu üyeliği',
    },
    'quxomtqx': {
      'en': 'Days Remaining',
      'de': 'Verbleibende Tage',
      'ru': 'Осталось дней',
      'tr': 'Kalan Günler',
    },
    'egsl2dba': {
      'en': 'QR Access',
      'de': 'QR-Zugriff',
      'ru': 'QR-доступ',
      'tr': 'QR Erişimi',
    },
    '5339r9ur': {
      'en': 'Expires ',
      'de': 'Läuft ab',
      'ru': 'Истекает',
      'tr': 'Sona eriyor',
    },
    'o4la77m9': {
      'en': 'Gym Membership',
      'de': 'Fitnessstudio-Mitgliedschaft',
      'ru': 'Членство в спортзале',
      'tr': 'Spor salonu üyeliği',
    },
    'bcuxa7eg': {
      'en': 'Expired/Inactive',
      'de': 'Abgelaufen/Inaktiv',
      'ru': 'Истек срок действия/Неактивен',
      'tr': 'Süresi Dolmuş/Etkin Değil',
    },
    'jzx70p0g': {
      'en': 'Days Remaining',
      'de': 'Verbleibende Tage',
      'ru': 'Осталось дней',
      'tr': 'Kalan Günler',
    },
    'l3ixj1or': {
      'en': '- -',
      'de': '- -',
      'ru': '- -',
      'tr': '- -',
    },
    'm6v58j4e': {
      'en': 'Subscribe',
      'de': 'Abonnieren',
      'ru': 'Подписаться',
      'tr': 'Abone',
    },
    'g1ufz7sb': {
      'en': 'Expires ',
      'de': 'Läuft ab',
      'ru': 'Истекает',
      'tr': 'Sona eriyor',
    },
    '27q9j6wq': {
      'en': '- -',
      'de': '- -',
      'ru': '- -',
      'tr': '- -',
    },
  },
  // ownerPropertyCard
  {
    'bgu5zfri': {
      'en': 'Portfolio Overview',
      'de': 'Portfolioübersicht',
      'ru': 'Обзор портфолио',
      'tr': 'Portföy Genel Bakışı',
    },
    'pv5fmlc4': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'aiebktf6': {
      'en': 'View All',
      'de': 'Alle',
      'ru': 'Просмотреть все',
      'tr': 'Tümünü Görüntüle',
    },
    'hdygafqj': {
      'en': 'Portfolio Overview',
      'de': 'Portfolioübersicht',
      'ru': 'Обзор портфолио',
      'tr': 'Portföy Genel Bakışı',
    },
    'panvjq6s': {
      'en': 'No Properties',
      'de': 'Keine Eigenschaften',
      'ru': 'Нет свойств',
      'tr': 'Hiçbir Özellik',
    },
    'a8nzo4ij': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'gb8bhy3n': {
      'en': '₺0',
      'de': '₺0',
      'ru': '₺0',
      'tr': '₺0',
    },
    'm4575ro5': {
      'en': 'Add Property',
      'de': 'Eigenschaft hinzufügen',
      'ru': 'Добавить недвижимость',
      'tr': 'Özellik Ekle',
    },
    'aviu9rp5': {
      'en': 'No Invoices',
      'de': 'Keine Rechnungen',
      'ru': 'Никаких счетов-фактур',
      'tr': 'Fatura Yok',
    },
  },
  // tenantPropertyCard
  {
    'xiadvpr2': {
      'en': 'Current Rental',
      'de': 'Aktuelle Miete',
      'ru': 'Текущая аренда',
      'tr': 'Mevcut Kiralama',
    },
    '514e0k3d': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    'gvzmfvyh': {
      'en': 'Pay Dues',
      'de': 'Beiträge zahlen',
      'ru': 'Платить взносы',
      'tr': 'Aidatları Öde',
    },
    'kv1v979p': {
      'en': 'Current Rental',
      'de': 'Aktuelle Miete',
      'ru': 'Текущая аренда',
      'tr': 'Mevcut Kiralama',
    },
    'ajk9pwjw': {
      'en': 'No Rental',
      'de': 'Keine Vermietung',
      'ru': 'Нет аренды',
      'tr': 'Kiralama Yok',
    },
    'drcbhs4t': {
      'en': 'Pending Dues',
      'de': 'Ausstehende Beiträge',
      'ru': 'Ожидаемые взносы',
      'tr': 'Bekleyen Borçlar',
    },
    '2icwdosc': {
      'en': '₺0',
      'de': '₺0',
      'ru': '₺0',
      'tr': '₺0',
    },
    'pn988u0r': {
      'en': 'Add Rental',
      'de': 'Miete hinzufügen',
      'ru': 'Добавить аренду',
      'tr': 'Kiralık Ekle',
    },
    '8zkdb73r': {
      'en': 'No Invoices',
      'de': 'Keine Rechnungen',
      'ru': 'Никаких счетов-фактур',
      'tr': 'Fatura Yok',
    },
  },
  // gymSubscriptionCheckout
  {
    'qgr3svzq': {
      'en': 'Add Subscription',
      'de': 'Abonnement hinzufügen',
      'ru': 'Добавить подписку',
      'tr': 'Abonelik Ekle',
    },
    's3e84w3z': {
      'en': 'Choose when you want to start your 1 Month Membership',
      'de':
          'Wählen Sie, wann Sie Ihre 1-Monats-Mitgliedschaft beginnen möchten',
      'ru': 'Выберите, когда вы хотите начать свое месячное членство',
      'tr': '1 Aylık Üyeliğinizi ne zaman başlatmak istediğinizi seçin',
    },
    'zo2cpg4c': {
      'en': 'Start Date',
      'de': 'Startdatum',
      'ru': 'Дата начала',
      'tr': 'Başlangıç Tarihi',
    },
    'z4x4tgg6': {
      'en': 'Plan',
      'de': 'Planen',
      'ru': 'План',
      'tr': 'Plan',
    },
    '0kc4hs0y': {
      'en': 'Start Date:',
      'de': 'Startdatum:',
      'ru': 'Дата начала:',
      'tr': 'Başlangıç Tarihi:',
    },
    'nq2z8s1c': {
      'en': 'End Date:',
      'de': 'Enddatum:',
      'ru': 'Дата окончания:',
      'tr': 'Bitiş Tarihi:',
    },
    'agiq4jlq': {
      'en': 'Total:',
      'de': 'Gesamt:',
      'ru': 'Общий:',
      'tr': 'Toplam:',
    },
    '4g3325wi': {
      'en': 'Döveç Wallet',
      'de': 'Döveç Geldbörse',
      'ru': 'Кошелек Döveç',
      'tr': 'Döveç Cüzdan',
    },
    '9vc3ilpg': {
      'en': 'Balance: ',
      'de': 'Gleichgewicht:',
      'ru': 'Баланс:',
      'tr': 'Denge:',
    },
    'to7c793m': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'bj5nca0v': {
      'en': 'Back to Booking',
      'de': 'Zurück zur Buchung',
      'ru': 'Вернуться к бронированию',
      'tr': 'Rezervasyona Geri Dön',
    },
    '50xu64vo': {
      'en': 'Confirm',
      'de': 'Bestätigen',
      'ru': 'Подтверждать',
      'tr': 'Onaylamak',
    },
  },
  // gymThankYou
  {
    'hbwwqven': {
      'en': 'Subscription Successful!',
      'de': 'Abonnement erfolgreich!',
      'ru': 'Подписка оформлена успешно!',
      'tr': 'Abonelik Başarılı!',
    },
    'wrpxu4r9': {
      'en': 'Start: ',
      'de': 'Start:',
      'ru': 'Начинать:',
      'tr': 'Başlangıç:',
    },
    't4h874t4': {
      'en': 'End: ',
      'de': 'Ende:',
      'ru': 'Конец:',
      'tr': 'Son:',
    },
    'w9oe7933': {
      'en': 'Enjoy your gym benefits!',
      'de': 'Genießen Sie die Vorteile Ihres Fitnessstudios!',
      'ru': 'Наслаждайтесь преимуществами тренажерного зала!',
      'tr': 'Spor salonunun avantajlarından yararlanın!',
    },
    'gt5m4gbf': {
      'en': 'Go to Home',
      'de': 'Gehe zur Startseite',
      'ru': 'Перейти на главную',
      'tr': 'Ana Sayfaya Git',
    },
  },
  // spaSubscriptionCheckout
  {
    'w18aoes4': {
      'en': 'Book Your Appointment',
      'de': 'Buchen Sie Ihren Termin',
      'ru': 'Запишитесь на прием',
      'tr': 'Randevunuzu Alın',
    },
    'f4pb403w': {
      'en': 'Package booking',
      'de': 'Paketbuchung',
      'ru': 'Бронирование пакета',
      'tr': 'Paket rezervasyon',
    },
    'ekgg91x9': {
      'en': 'Includes',
      'de': 'Enthält',
      'ru': 'Включает в себя',
      'tr': 'İçerir',
    },
    'nqdqy9u1': {
      'en': 'Date',
      'de': 'Datum',
      'ru': 'Дата',
      'tr': 'Tarih',
    },
    'e1egpkc8': {
      'en': 'Time',
      'de': 'Zeit',
      'ru': 'Время',
      'tr': 'Zaman',
    },
    '4g3q5311': {
      'en': 'Döveç Wallet',
      'de': 'Döveç Geldbörse',
      'ru': 'Кошелек Döveç',
      'tr': 'Döveç Cüzdan',
    },
    'a75brjca': {
      'en': 'Balance: ',
      'de': 'Gleichgewicht:',
      'ru': 'Баланс:',
      'tr': 'Denge:',
    },
    'af2y44oh': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'xc4x1r2a': {
      'en': 'Back to Booking',
      'de': 'Zurück zur Buchung',
      'ru': 'Вернуться к бронированию',
      'tr': 'Rezervasyona Geri Dön',
    },
    'sjrbah8w': {
      'en': 'Confirm',
      'de': 'Bestätigen',
      'ru': 'Подтверждать',
      'tr': 'Onaylamak',
    },
  },
  // bookingConfirmed
  {
    '7tsv07cp': {
      'en': 'Booking Confirmed!',
      'de': 'Buchung bestätigt!',
      'ru': 'Бронирование подтверждено!',
      'tr': 'Rezervasyonunuz Onaylandı!',
    },
    'v56b2znx': {
      'en': 'Your spa appointment has been successfully booked.',
      'de': 'Ihr Spa-Termin wurde erfolgreich gebucht.',
      'ru': 'Ваш визит в спа-салон успешно забронирован.',
      'tr': 'Spa randevunuz başarıyla alındı.',
    },
    'mjfypt91': {
      'en': 'Service:',
      'de': 'Service:',
      'ru': 'Услуга:',
      'tr': 'Hizmet:',
    },
    'nu10vmxf': {
      'en': 'Date & Time:',
      'de': 'Datum und Uhrzeit:',
      'ru': 'Дата и время:',
      'tr': 'Tarih & Saat:',
    },
    '40g3g3zw': {
      'en': '•',
      'de': '•',
      'ru': '•',
      'tr': '•',
    },
    '4sicw1k6': {
      'en': 'Amount Paid:',
      'de': 'Bezahlter Betrag:',
      'ru': 'Сумма оплаты:',
      'tr': 'Ödenen Tutar:',
    },
    'pz0vzr90': {
      'en': 'Package:',
      'de': 'Paket:',
      'ru': 'Упаковка:',
      'tr': 'Paket:',
    },
    'bzhakskt': {
      'en': 'Date & Time:',
      'de': 'Datum und Uhrzeit:',
      'ru': 'Дата и время:',
      'tr': 'Tarih & Saat:',
    },
    'kpyqcizz': {
      'en': '•',
      'de': '•',
      'ru': '•',
      'tr': '•',
    },
    '7o046ysc': {
      'en': 'Amount Paid:',
      'de': 'Bezahlter Betrag:',
      'ru': 'Сумма оплаты:',
      'tr': 'Ödenen Tutar:',
    },
    'cqo5g99g': {
      'en': 'A confirmation has been sent to your email.',
      'de': 'Eine Bestätigung wurde an Ihre E-Mail gesendet.',
      'ru': 'Подтверждение отправлено на ваш адрес электронной почты.',
      'tr': 'E-postanıza bir onay gönderildi.',
    },
    '7rge1p78': {
      'en': 'Go to Home',
      'de': 'Gehe zur Startseite',
      'ru': 'Перейти на главную',
      'tr': 'Ana Sayfaya Git',
    },
  },
  // spaServicesCheckout
  {
    'rn99t9nk': {
      'en': 'Book Your Service',
      'de': 'Buchen Sie Ihren Service',
      'ru': 'Забронируйте услугу',
      'tr': 'Servisinizi Ayırtın',
    },
    '4s6nepes': {
      'en': 'Massage booking',
      'de': 'Massagebuchung',
      'ru': 'Бронирование массажа',
      'tr': 'Masaj rezervasyonu',
    },
    'w0gwndao': {
      'en': 'Date',
      'de': 'Datum',
      'ru': 'Дата',
      'tr': 'Tarih',
    },
    'q3aypbqo': {
      'en': 'Time',
      'de': 'Zeit',
      'ru': 'Время',
      'tr': 'Zaman',
    },
    'q0n9g12o': {
      'en': 'Döveç Wallet',
      'de': 'Döveç Geldbörse',
      'ru': 'Кошелек Döveç',
      'tr': 'Döveç Cüzdan',
    },
    '03p2a5lf': {
      'en': 'Balance: ',
      'de': 'Gleichgewicht:',
      'ru': 'Баланс:',
      'tr': 'Denge:',
    },
    '339289si': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'uvchvswt': {
      'en': 'Back to Booking',
      'de': 'Zurück zur Buchung',
      'ru': 'Вернуться к бронированию',
      'tr': 'Rezervasyona Geri Dön',
    },
    '1c2bcf5s': {
      'en': 'Confirm',
      'de': 'Bestätigen',
      'ru': 'Подтверждать',
      'tr': 'Onaylamak',
    },
  },
  // payInvoice
  {
    'n34qjcf4': {
      'en': 'Invoice Payment',
      'de': 'Rechnungszahlung',
      'ru': 'Оплата счета',
      'tr': 'Fatura Ödeme',
    },
    '5hc5kn4v': {
      'en': 'Review and confirm your invoice',
      'de': 'Überprüfen und bestätigen Sie Ihre Rechnung',
      'ru': 'Проверьте и подтвердите свой счет',
      'tr': 'Faturanızı inceleyin ve onaylayın',
    },
    'xrzn5lse': {
      'en': 'Due Date: ',
      'de': 'Fälligkeitsdatum:',
      'ru': 'Срок оплаты:',
      'tr': 'Bitiş tarihi:',
    },
    'm97tvw2t': {
      'en': 'Unit: ',
      'de': 'Einheit:',
      'ru': 'Единица:',
      'tr': 'Birim:',
    },
    'kxzdnv6u': {
      'en': 'Döveç Wallet',
      'de': 'Döveç Geldbörse',
      'ru': 'Кошелек Döveç',
      'tr': 'Döveç Cüzdan',
    },
    'ykrtq46u': {
      'en': 'Balance: ',
      'de': 'Gleichgewicht:',
      'ru': 'Баланс:',
      'tr': 'Denge:',
    },
    '3e4k1nvs': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    '8r0580t2': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    'pyw9l8lp': {
      'en': 'Complete Payment',
      'de': 'Zahlung abschließen',
      'ru': 'Полная оплата',
      'tr': 'Ödemeyi Tamamla',
    },
  },
  // invoiceDone
  {
    'wo6tood0': {
      'en': 'Payment Confirmed!',
      'de': 'Zahlung bestätigt!',
      'ru': 'Платеж подтвержден!',
      'tr': 'Ödeme Onaylandı!',
    },
    'hg8wcs22': {
      'en': 'Thank you for paying your invoice!',
      'de': 'Vielen Dank für die Bezahlung Ihrer Rechnung!',
      'ru': 'Спасибо за оплату счета!',
      'tr': 'Faturanızı ödediğiniz için teşekkür ederiz!',
    },
    'vmwe87c6': {
      'en': 'Go to Home',
      'de': 'Gehe zur Startseite',
      'ru': 'Перейти на главную',
      'tr': 'Ana Sayfaya Git',
    },
  },
  // orderDoneCopy
  {
    's460a6nu': {
      'en': 'Order Confirmed!',
      'de': 'Bestellung bestätigt!',
      'ru': 'Заказ подтвержден!',
      'tr': 'Siparişiniz Onaylandı!',
    },
    '0yakeplx': {
      'en': 'Your order has been sent to the kitchen.',
      'de': 'Ihre Bestellung wurde an die Küche gesendet.',
      'ru': 'Ваш заказ отправлен на кухню.',
      'tr': 'Siparişiniz mutfağa gönderildi.',
    },
    'wn58darj': {
      'en': 'Estimated preparation time: 15–20 minutes',
      'de': 'Geschätzte Zubereitungszeit: 15–20 Minuten',
      'ru': 'Расчетное время приготовления: 15–20 минут.',
      'tr': 'Tahmini hazırlama süresi: 15–20 dakika',
    },
    '22zk8uak': {
      'en': 'Order ID: ',
      'de': 'Bestellnummer:',
      'ru': 'Идентификатор заказа:',
      'tr': 'Sipariş No:',
    },
    'jvap803n': {
      'en': 'Go to Home',
      'de': 'Gehe zur Startseite',
      'ru': 'Перейти на главную',
      'tr': 'Ana Sayfaya Git',
    },
  },
  // chooseLanguage
  {
    'bq2gdqzk': {
      'en': 'Select Language',
      'de': 'Sprache auswählen',
      'ru': 'Выберите язык',
      'tr': 'Dil Seçin',
    },
    '27jqxo3v': {
      'en': 'English',
      'de': 'Englisch',
      'ru': 'Английский',
      'tr': 'İngilizce',
    },
    'm9u2ubu3': {
      'en': 'Türkçe',
      'de': 'Türkisch',
      'ru': 'Türkçe',
      'tr': 'Türkçe',
    },
    'rgakjkhf': {
      'en': 'Deutsch',
      'de': 'Deutsch',
      'ru': 'немецкий',
      'tr': 'Almanca',
    },
    '0q3whsb1': {
      'en': 'Русский',
      'de': 'Russisch',
      'ru': 'Русский',
      'tr': 'Rusça',
    },
  },
  // utilityTopUp
  {
    'pcfb3snv': {
      'en': 'Top Up Utilities',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '046485bl': {
      'en': 'Add water or electricity to your unit',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'wc5z43mc': {
      'en': 'Utility Type',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'bagm0tx0': {
      'en': 'Water',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'c85fv8jq': {
      'en': 'Electricity',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'lpi3z2jj': {
      'en': 'Water',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '4wa3elnh': {
      'en': 'Select Unit',
      'de': 'Einheit auswählen',
      'ru': 'Выберите единицу измерения',
      'tr': 'Birim Seçin',
    },
    '85tfjbdv': {
      'en': 'Select...',
      'de': 'Wählen...',
      'ru': 'Выбирать...',
      'tr': 'Seçme...',
    },
    'z5f0uvni': {
      'en': 'Search...',
      'de': 'Suchen...',
      'ru': 'Поиск...',
      'tr': 'Aramak...',
    },
    '09pw6d1o': {
      'en': 'Top Up Amount',
      'de': 'Aufladebetrag',
      'ru': 'Сумма пополнения',
      'tr': 'Üstten Yükleme Miktarı',
    },
    'fhte5y0v': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'z2xls1or': {
      'en': 'Enter amount',
      'de': 'Betrag eingeben',
      'ru': 'Введите сумму',
      'tr': 'Tutarı girin',
    },
    'qj7hmixo': {
      'en': '₺ 500',
      'de': '₺ 500',
      'ru': '500 ₺',
      'tr': '₺ 500',
    },
    'b7ouputu': {
      'en': '₺ 1,000',
      'de': '₺ 1.000',
      'ru': '1000 ₺',
      'tr': '₺ 1.000',
    },
    'x3x7jdzm': {
      'en': '₺ 2,000',
      'de': '₺ 2.000',
      'ru': '2000 ₺',
      'tr': '₺ 2.000',
    },
    'kdxu2q58': {
      'en': 'Döveç Wallet',
      'de': 'Döveç Geldbörse',
      'ru': 'Кошелек Döveç',
      'tr': 'Döveç Cüzdan',
    },
    'sazro1oz': {
      'en': 'Balance: ',
      'de': 'Gleichgewicht:',
      'ru': 'Баланс:',
      'tr': 'Denge:',
    },
    'jgkzige6': {
      'en': 'Top Up',
      'de': 'Nachfüllen',
      'ru': 'Пополнить',
      'tr': 'Üstten yükleme',
    },
    'hoyzhqw1': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    'e69r4yu3': {
      'en': 'Confirm',
      'de': 'Bestätigen',
      'ru': 'Подтверждать',
      'tr': 'Onaylamak',
    },
    '4epmnwbf': {
      'en': 'Enter amount is required',
      'de': 'Die Eingabe des Betrags ist erforderlich',
      'ru': 'Введите сумму обязательно',
      'tr': 'Tutar girilmesi zorunludur',
    },
    'xqx9epyz': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'ru': 'Пожалуйста, выберите вариант из выпадающего списка',
      'tr': 'Lütfen açılır menüden bir seçenek seçin',
    },
  },
  // utilityTopUpThankYou
  {
    'mhbeo5vr': {
      'en': 'Payment Confirmed!',
      'de': 'Zahlung bestätigt!',
      'ru': 'Платеж подтвержден!',
      'tr': 'Ödeme Onaylandı!',
    },
    '1v85zk8f': {
      'en':
          'A staff member will top up your account within 1 working day.\n\nThank you!',
      'de':
          'Ein Mitarbeiter wird Ihr Konto innerhalb eines Werktages aufladen.\n\nVielen Dank!',
      'ru': 'Сотрудник пополнит ваш счет в течение 1 рабочего дня.\n\nСпасибо!',
      'tr':
          'Bir personel 1 iş günü içerisinde hesabınıza para yükleyecektir.\n\nTeşekkür ederiz!',
    },
    'hrxxhl7b': {
      'en': 'Go to Home',
      'de': 'Gehe zur Startseite',
      'ru': 'Перейти на главную',
      'tr': 'Ana Sayfaya Git',
    },
  },
  // topUpChoice
  {
    'el39hnj2': {
      'en': 'Top Up Options',
      'de': 'Aufladeoptionen',
      'ru': 'Варианты пополнения',
      'tr': 'Üstten Yükleme Seçenekleri',
    },
    'xq2y2b6l': {
      'en': 'Choose how you\'d like to add funds to your account',
      'de': 'Wählen Sie, wie Sie Geld auf Ihr Konto einzahlen möchten',
      'ru': 'Выберите способ пополнения вашего счета.',
      'tr': 'Hesabınıza para ekleme yöntemini seçin',
    },
    'k2rv9agb': {
      'en': 'Top Up Wallet',
      'de': 'Geldbörsen aufladen',
      'ru': 'Пополнить кошелек',
      'tr': 'Cüzdanı Doldur',
    },
    'tbjw9ow3': {
      'en': 'Top Up Utility',
      'de': 'Aufladeprogramm',
      'ru': 'Утилита пополнения',
      'tr': 'Üstten Yükleme Yardımcı Programı',
    },
  },
  // deleteAccountConfirmation
  {
    'bk8k2jpx': {
      'en': 'Delete Account',
      'de': 'Konto löschen',
      'ru': 'Удалить аккаунт',
      'tr': 'Hesabı Sil',
    },
    'c0vfxefy': {
      'en':
          'Are you sure you want to delete your account? This action cannot be undone and all your data will be permanently removed.',
      'de':
          'Möchten Sie Ihr Konto wirklich löschen? Diese Aktion kann nicht rückgängig gemacht werden. Alle Ihre Daten werden dauerhaft gelöscht.',
      'ru':
          'Вы уверены, что хотите удалить свой аккаунт? Это действие нельзя отменить, и все ваши данные будут удалены навсегда.',
      'tr':
          'Hesabınızı silmek istediğinizden emin misiniz? Bu işlem geri alınamaz ve tüm verileriniz kalıcı olarak silinecektir.',
    },
    '0atwf6d4': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'ru': 'Отмена',
      'tr': 'İptal etmek',
    },
    'urwolcw4': {
      'en': 'Confirm',
      'de': 'Bestätigen',
      'ru': 'Подтверждать',
      'tr': 'Onaylamak',
    },
  },
  // discountVoucher
  {
    'mtam0y85': {
      'en': 'EMPLOYEE DISCOUNT',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'n9v1akk8': {
      'en': 'Döveç Group Companies',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '132w7q4w': {
      'en': '25%',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'iqzpurcj': {
      'en': 'OFF',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'ibd4fyon': {
      'en': 'All DMAR Products',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '8mwkxele': {
      'en': 'Employee Name',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'wbosggor': {
      'en': 'Employee ID: DOV2024001',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'bfmnhwu4': {
      'en': 'Valid until December 31, 2025',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'cgp3mjtm': {
      'en': 'Terms & Conditions',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '7uxc7bmv': {
      'en': '• Valid employee ID required at time of purchase',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'ap96itc1': {
      'en': '• Cannot be combined with other offers',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '4kkrwipv': {
      'en': '• Discount applies to regular-priced items only',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '8n3h3963': {
      'en': '• Present this digital voucher at checkout',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '2y5ozy85': {
      'en': '• Offered exclusively by Dovec Group of Companies',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '46zixn2m': {
      'en': 'Authorized by Dovec Group Management',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'kp6a1ef1': {
      'en': 'Valid at all DMAR locations',
      'de': '',
      'ru': '',
      'tr': '',
    },
  },
  // Miscellaneous
  {
    '08y01yph': {
      'en':
          'Uses your location to show nearby facilities and enhance your experience.',
      'de':
          'Verwendet Ihren Standort, um Einrichtungen in der Nähe anzuzeigen und Ihr Erlebnis zu verbessern.',
      'ru':
          'Использует ваше местоположение, чтобы показывать близлежащие объекты и улучшать ваши впечатления.',
      'tr':
          'Yakınınızdaki tesisleri göstermek ve deneyiminizi geliştirmek için konumunuzu kullanır.',
    },
    '8q99su61': {
      'en':
          'Allows you to take photos for your profile or submitting a photo to support.',
      'de':
          'Ermöglicht Ihnen, Fotos für Ihr Profil aufzunehmen oder ein Foto an den Support zu senden.',
      'ru':
          'Позволяет вам делать фотографии для своего профиля или отправлять фотографии в службу поддержки.',
      'tr':
          'Profiliniz için fotoğraf çekmenize veya destek için fotoğraf göndermenize olanak tanır.',
    },
    '0o8fhzzy': {
      'en': '',
      'de': '',
      'ru': '',
      'tr':
          'Bu uygulamanın video için ses kaydı yapabilmesi için mikrofona erişim iznine ihtiyacı var.',
    },
    'vfia8myi': {
      'en':
          'Allows you to upload photos for your profile or submitting a photo to support.',
      'de':
          'Ermöglicht Ihnen, Fotos für Ihr Profil hochzuladen oder ein Foto an den Support zu senden.',
      'ru':
          'Позволяет загружать фотографии для вашего профиля или отправлять фотографии в службу поддержки.',
      'tr':
          'Profiliniz için fotoğraf yüklemenize veya desteğe fotoğraf göndermenize olanak tanır.',
    },
    'ltvdk7px': {
      'en':
          'Allows you to take photos for your profile or submitting a photo to support.',
      'de':
          'Ermöglicht Ihnen, Fotos für Ihr Profil aufzunehmen oder ein Foto an den Support zu senden.',
      'ru':
          'Позволяет вам делать фотографии для своего профиля или отправлять фотографии в службу поддержки.',
      'tr':
          'Profiliniz için fotoğraf çekmenize veya destek için fotoğraf göndermenize olanak tanır.',
    },
    'dsuqe23y': {
      'en': 'please turn on',
      'de': 'bitte einschalten',
      'ru': 'пожалуйста, включите',
      'tr': 'lütfen açın',
    },
    '0viqvfd4': {
      'en':
          'Allows you to upload photos for your profile or submitting a photo to support.',
      'de':
          'Ermöglicht Ihnen, Fotos für Ihr Profil hochzuladen oder ein Foto an den Support zu senden.',
      'ru':
          'Позволяет загружать фотографии для вашего профиля или отправлять фотографии в службу поддержки.',
      'tr':
          'Profiliniz için fotoğraf yüklemenize veya desteğe fotoğraf göndermenize olanak tanır.',
    },
    'mz9u38kn': {
      'en': 'Please enable notifications to get the latest updates on D-Life.',
      'de':
          'Bitte aktivieren Sie Benachrichtigungen, um die neuesten Updates zu D-Life zu erhalten.',
      'ru':
          'Включите уведомления, чтобы получать последние обновления о D-Life.',
      'tr':
          'D-Life\'taki son güncellemeleri almak için lütfen bildirimleri etkinleştirin.',
    },
    '75tmk3x9': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'ql6gr4hp': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'efz2vyld': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '0y2bnrnw': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'rd4qaeut': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '30uhxyy9': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'd65dif9h': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    's6nifn89': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'ohecitmi': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'wfdzkeyr': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'lkq9p5z3': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'ilc93yn9': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'pekzepbu': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'lca4auoe': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'w6yk7q2m': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'dij98452': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '00pyq01h': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '0hdxbvf1': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'o7nix5e0': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'qff8dxoq': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '4q6udp06': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'ae7gqse1': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'hhmoqd57': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    'lvn3y7vk': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
    '3wpgoh6j': {
      'en': '',
      'de': '',
      'ru': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
