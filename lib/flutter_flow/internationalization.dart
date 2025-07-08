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

  static List<String> languages() => ['en', 'fr', 'zh_Hans', 'hi', 'sw'];

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
    String? frText = '',
    String? zh_HansText = '',
    String? hiText = '',
    String? swText = '',
  }) =>
      [enText, frText, zh_HansText, hiText, swText][languageIndex] ?? '';

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
  // TexttoSpeech
  {
    'vn9uwr75': {
      'en': 'Transform Text to Natural Speech',
      'fr': 'Transformer le texte en parole naturelle',
      'hi': 'पाठ को स्वाभाविक भाषण में बदलें',
      'sw': 'Badilisha maandishi kuwa Hotuba ya Asili',
      'zh_Hans': '将文本转换为自然语音',
    },
    'c0a47lco': {
      'en':
          'Type or paste your text here, and insert line breaks, spaces and  punctuation marks.',
      'fr': 'Tapez ou collez votre texte ici...',
      'hi': 'अपना पाठ यहां लिखें या चिपकाएं...',
      'sw': 'Andika au ubandike maandishi yako hapa...',
      'zh_Hans': '在此处输入或粘贴您的文本...',
    },
    'z3ru800z': {
      'en': 'Voice Options',
      'fr': 'Options vocales',
      'hi': 'आवाज़ विकल्प',
      'sw': 'Chaguo za Sauti',
      'zh_Hans': '语音选项',
    },
    'v5hdbune': {
      'en': 'More voices',
      'fr': 'Changer de voix',
      'hi': 'आवाज बदलें',
      'sw': 'Badilisha sauti',
      'zh_Hans': '改变声音',
    },
    'rbiy8v1o': {
      'en': 'Generate Speech',
      'fr': 'Générer la parole',
      'hi': 'भाषण उत्पन्न करें',
      'sw': 'Tengeneza Hotuba',
      'zh_Hans': '生成语音',
    },
    'xbbv9avf': {
      'en': 'Home',
      'fr': 'Maison',
      'hi': 'घर',
      'sw': 'Nyumbani',
      'zh_Hans': '家',
    },
  },
  // home
  {
    'owpekz6s': {
      'en': '5',
      'fr': '5',
      'hi': '5',
      'sw': '5',
      'zh_Hans': '5',
    },
    'sutn0tek': {
      'en': 'Welcome to Voixr!',
      'fr': 'Bienvenue sur Voixr !',
      'hi': 'Voixr में आपका स्वागत है!',
      'sw': 'Karibu Voixr!',
      'zh_Hans': '欢迎来到 Voixr！',
    },
    't1qctibp': {
      'en': 'Generate  high-quality AI audio now',
      'fr': 'Générez dès maintenant un son IA de haute qualité',
      'hi': 'अब उच्च गुणवत्ता वाला AI ऑडियो उत्पन्न करें',
      'sw': 'Tengeneza sauti ya hali ya juu ya AI sasa',
      'zh_Hans': '立即生成高品质 AI 音频',
    },
    'fdgjcdl8': {
      'en': 'Text to Speech',
      'fr': 'Synthèse vocale',
      'hi': 'भाषण के पाठ',
      'sw': 'Maandishi kwa Hotuba',
      'zh_Hans': '文本转语音',
    },
    'uyrj41k9': {
      'en': 'Create the Speech from Text.',
      'fr': 'Créer le discours à partir du texte.',
      'hi': 'पाठ से भाषण बनाएँ.',
      'sw': 'Unda Hotuba kutoka kwa maandishi.',
      'zh_Hans': '从文本创建演讲。',
    },
    'mo3jcz8o': {
      'en': 'Try now',
      'fr': 'Essayez maintenant',
      'hi': 'अब कोशिश करो',
      'sw': 'Jaribu sasa',
      'zh_Hans': '立即试用',
    },
    'hvoe8oyf': {
      'en': 'Voice Changer',
      'fr': 'Changeur de voix IA',
      'hi': 'एआई वॉयस चेंजर',
      'sw': 'Kibadilisha sauti cha AI',
      'zh_Hans': '人工智能语音转换器',
    },
    'fbxx4i64': {
      'en': 'Create the Speech from audio.',
      'fr': 'Créez le discours à partir de l\'audio.',
      'hi': 'ऑडियो से भाषण बनाएं.',
      'sw': 'Unda Hotuba kutoka kwa sauti.',
      'zh_Hans': '从音频创建演讲。',
    },
    'i1l0a7in': {
      'en': 'Try now',
      'fr': 'Essayez maintenant',
      'hi': 'अब कोशिश करो',
      'sw': 'Jaribu sasa',
      'zh_Hans': '立即试用',
    },
    '50nvmnm7': {
      'en': 'Podcast Studio',
      'fr': 'Changeur de voix IA',
      'hi': 'एआई वॉयस चेंजर',
      'sw': 'Kibadilisha sauti cha AI',
      'zh_Hans': '人工智能语音转换器',
    },
    'iomqytlg': {
      'en': 'generates a concise podcast in 1minute.',
      'fr': 'Créez le discours à partir de l\'audio.',
      'hi': 'ऑडियो से भाषण बनाएं.',
      'sw': 'Unda Hotuba kutoka kwa sauti.',
      'zh_Hans': '从音频创建演讲。',
    },
    '9hmjub2l': {
      'en': 'Try now',
      'fr': 'Essayez maintenant',
      'hi': 'अब कोशिश करो',
      'sw': 'Jaribu sasa',
      'zh_Hans': '立即试用',
    },
    'k3kge8ng': {
      'en': 'Transcription ',
      'fr': 'Synthèse vocale',
      'hi': 'भाषण के पाठ',
      'sw': 'Maandishi kwa Hotuba',
      'zh_Hans': '文本转语音',
    },
    'dj85qmuj': {
      'en': 'Transcribe and tranlate audio in one click.',
      'fr': 'Créer le discours à partir du texte.',
      'hi': 'पाठ से भाषण बनाएँ.',
      'sw': 'Unda Hotuba kutoka kwa maandishi.',
      'zh_Hans': '从文本创建演讲。',
    },
    'g7702otg': {
      'en': 'Try now',
      'fr': 'Essayez maintenant',
      'hi': 'अब कोशिश करो',
      'sw': 'Jaribu sasa',
      'zh_Hans': '立即试用',
    },
    'w20ykwpg': {
      'en': 'Popular Voice',
      'fr': 'Voix populaire',
      'hi': 'लोकप्रिय आवाज़',
      'sw': 'Sauti Maarufu',
      'zh_Hans': '流行之声',
    },
    '4t4zwp9s': {
      'en': 'See all >',
      'fr': 'Tout voir >',
      'hi': 'सभी देखें >',
      'sw': 'Tazama zote >',
      'zh_Hans': '查看全部 >',
    },
    'elogg7le': {
      'en': 'Odessey',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'pf6pon9p': {
      'en': 'Commercials',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'qd39u7g3': {
      'en': 'Commercials',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '0hbo7vgd': {
      'en': 'Fredie',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'hyw2rguz': {
      'en': 'Broadcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '1iz5c8ze': {
      'en': 'Broadcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'x1hdpoij': {
      'en': 'Tressy',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'arvfkm0b': {
      'en': 'Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '9r5wkh1e': {
      'en': 'Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'o3w42kzw': {
      'en': 'Grandpa Oxley',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'j9nkltg8': {
      'en': 'Narrative',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'co4v5grg': {
      'en': 'Narrative',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // voices
  {
    'jz53j2r4': {
      'en': 'Explore',
      'fr': 'Explorer',
      'hi': 'अन्वेषण करना',
      'sw': 'Chunguza',
      'zh_Hans': '探索',
    },
    '4zte9vmj': {
      'en': 'Bring your stories to life',
      'fr': 'Donnez vie à vos histoires',
      'hi': 'अपनी कहानियों को जीवंत बनायें',
      'sw': 'Zihuisha hadithi zako',
      'zh_Hans': '让您的故事栩栩如生',
    },
    '9lov4giv': {
      'en': 'Odessey',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'l5q96s4y': {
      'en': 'Commercials',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'jwjgsmr6': {
      'en': 'commercials',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'qf2v08c3': {
      'en': 'Tressy',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'y8n1htr4': {
      'en': 'Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'sjqc1bgs': {
      'en': 'Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '9xndj487': {
      'en': 'Grandpa',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '02drj4al': {
      'en': 'Narrative',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '0cux78tc': {
      'en': 'Narrative',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'v2y3ggui': {
      'en': 'Fredie',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '222kr5pt': {
      'en': 'TV Broardcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'fw2xbjgh': {
      'en': 'TV Broardcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'a9rzxj2c': {
      'en': 'Back',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '8ilrswiv': {
      'en': 'Home',
      'fr': 'Maison',
      'hi': 'घर',
      'sw': 'Nyumbani',
      'zh_Hans': '家',
    },
  },
  // RecordAudio
  {
    'hlcj889b': {
      'en': 'Transform voice to Natural Speech',
      'fr': 'Transformez la voix en parole naturelle',
      'hi': 'आवाज़ को स्वाभाविक भाषण में बदलें',
      'sw': 'Badilisha sauti kuwa Hotuba ya Asili',
      'zh_Hans': '将语音转换为自然语音',
    },
    'e6dzz35c': {
      'en':
          'Create lifelike voiceovers for your content with our advanced AI voice technology',
      'fr':
          'Créez des voix off réalistes pour votre contenu grâce à notre technologie vocale IA avancée',
      'hi':
          'हमारी उन्नत AI वॉयस तकनीक से अपने कंटेंट के लिए जीवंत वॉयसओवर बनाएं',
      'sw':
          'Unda sauti zinazofanana na maisha kwa maudhui yako ukitumia teknolojia yetu ya hali ya juu ya sauti ya AI',
      'zh_Hans': '利用我们先进的人工智能语音技术为您的内容创建逼真的画外音',
    },
    'cakp048z': {
      'en': 'Voice Options',
      'fr': 'Options vocales',
      'hi': 'आवाज़ विकल्प',
      'sw': 'Chaguo za Sauti',
      'zh_Hans': '语音选项',
    },
    'muwni8e0': {
      'en': 'More Voices',
      'fr': 'Changer de voix',
      'hi': 'आवाज़ बदलें',
      'sw': 'Badilisha Sauti',
      'zh_Hans': '改变声音',
    },
    'a9r6zer6': {
      'en': 'Generate Speech',
      'fr': 'Générer la parole',
      'hi': 'भाषण उत्पन्न करें',
      'sw': 'Tengeneza Hotuba',
      'zh_Hans': '生成语音',
    },
    'mirvop8s': {
      'en': 'Back',
      'fr': 'Dos',
      'hi': 'पीछे',
      'sw': 'Nyuma',
      'zh_Hans': '后退',
    },
    'sfwtj70q': {
      'en': 'Home',
      'fr': 'Maison',
      'hi': 'घर',
      'sw': 'Nyumbani',
      'zh_Hans': '家',
    },
  },
  // notification
  {
    '6ut0yli9': {
      'en': 'Search your voice library...',
      'fr': 'Recherchez dans votre bibliothèque vocale...',
      'hi': 'अपनी आवाज़ लाइब्रेरी खोजें...',
      'sw': 'Tafuta maktaba yako ya sauti...',
      'zh_Hans': '搜索您的语音库...',
    },
    'wvk5yw3f': {
      'en': 'Audio Library',
      'fr': 'Bibliothèque audio',
      'hi': 'ऑडियो लाइब्रेरी',
      'sw': 'Maktaba ya Sauti',
      'zh_Hans': '音频库',
    },
  },
  // Onboarding
  {
    'laafw5yw': {
      'en': 'Voixr',
      'fr': 'Voixr',
      'hi': 'वोइक्स्र',
      'sw': 'Voixr',
      'zh_Hans': '沃伊克斯',
    },
    'aagduu72': {
      'en': 'Used by millions of the best creators\n',
      'fr': 'Utilisé par des millions des meilleurs créateurs',
      'hi': 'लाखों सर्वश्रेष्ठ रचनाकारों द्वारा उपयोग किया गया',
      'sw': 'Inatumiwa na mamilioni ya watayarishi bora',
      'zh_Hans': '数百万优秀创作者使用',
    },
    'h6zxvauu': {
      'en': 'Sign up with e-mail',
      'fr': 'Inscrivez-vous avec votre e-mail',
      'hi': 'ईमेल के लिए साइन इन करें',
      'sw': 'Jisajili kwa barua pepe',
      'zh_Hans': '使用电子邮件注册',
    },
    'o7r22byq': {
      'en': 'Sign up with Google',
      'fr': 'Inscrivez-vous avec Google',
      'hi': 'गूगल के साथ साइन अप करें',
      'sw': 'Jisajili na Google',
      'zh_Hans': '使用 Google 注册',
    },
    '4wnqsxlw': {
      'en': 'Already have an account?',
      'fr': 'Vous avez déjà un compte ?',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'sw': 'Je, tayari una akaunti?',
      'zh_Hans': '已有账户？',
    },
    '66jxaqg2': {
      'en': ' Log In!',
      'fr': 'Se connecter!',
      'hi': 'लॉग इन करें!',
      'sw': 'Ingia!',
      'zh_Hans': '登录！',
    },
    '110i19iw': {
      'en': 'Home',
      'fr': 'Maison',
      'hi': 'घर',
      'sw': 'Nyumbani',
      'zh_Hans': '家',
    },
  },
  // CreateAccount
  {
    'pq0uo0ep': {
      'en': 'Voixr',
      'fr': 'Voixr',
      'hi': 'वोइक्स्र',
      'sw': 'Voixr',
      'zh_Hans': '沃伊克斯',
    },
    '3bb1d85e': {
      'en': 'Sign up',
      'fr': 'S\'inscrire',
      'hi': 'साइन अप करें',
      'sw': 'Jisajili',
      'zh_Hans': '报名',
    },
    '7qdh3b4k': {
      'en': 'First Name',
      'fr': 'Prénom',
      'hi': 'पहला नाम',
      'sw': 'Jina la kwanza',
      'zh_Hans': '名',
    },
    '414eh48r': {
      'en': 'Last Name',
      'fr': 'Nom de famille',
      'hi': 'उपनाम',
      'sw': 'Jina la mwisho',
      'zh_Hans': '姓',
    },
    'nz9fweto': {
      'en': 'Email',
      'fr': 'E-mail',
      'hi': 'ईमेल',
      'sw': 'Barua pepe',
      'zh_Hans': '电子邮件',
    },
    '4nkv3z0l': {
      'en': 'Password',
      'fr': 'Mot de passe',
      'hi': 'पासवर्ड',
      'sw': 'Nenosiri',
      'zh_Hans': '密码',
    },
    'wab2jr26': {
      'en': 'Confirm Password',
      'fr': 'Confirmez le mot de passe',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'sw': 'Thibitisha Nenosiri',
      'zh_Hans': '确认密码',
    },
    'f64k5t2q': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
      'hi': 'खाता बनाएं',
      'sw': 'Fungua Akaunti',
      'zh_Hans': '创建账户',
    },
    'i6l2fbmp': {
      'en': 'Already have an account?  ',
      'fr': 'Vous avez déjà un compte ?',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'sw': 'Je, tayari una akaunti?',
      'zh_Hans': '已有账户？',
    },
    '6s9iklou': {
      'en': 'Sign in here',
      'fr': 'Connectez-vous ici',
      'hi': 'यहां साइन इन करो',
      'sw': 'Ingia hapa',
      'zh_Hans': '在此登录',
    },
    '2q9mfixj': {
      'en': 'Home',
      'fr': 'Maison',
      'hi': 'घर',
      'sw': 'Nyumbani',
      'zh_Hans': '家',
    },
  },
  // Signin
  {
    'w96ubvr6': {
      'en': 'Voixr',
      'fr': 'Voixr',
      'hi': 'वोइक्स्र',
      'sw': 'Voixr',
      'zh_Hans': '沃伊克斯',
    },
    'amjzvbko': {
      'en': 'Welcom back!',
      'fr': 'Bienvenue à nouveau !',
      'hi': 'वापसी पर आपका स्वागत है!',
      'sw': 'Karibu tena!',
      'zh_Hans': '欢迎回来！',
    },
    'kqydpfjl': {
      'en': 'Let\'s get on by filling out the form below.',
      'fr': 'Commençons en remplissant le formulaire ci-dessous.',
      'hi': 'आइये नीचे दिया गया फॉर्म भरकर आगे बढ़ें।',
      'sw': 'Wacha tuendelee kwa kujaza fomu hapa chini.',
      'zh_Hans': '让我们继续填写下面的表格。',
    },
    '9r7euvn9': {
      'en': 'Email',
      'fr': 'E-mail',
      'hi': 'ईमेल',
      'sw': 'Barua pepe',
      'zh_Hans': '电子邮件',
    },
    'uggnn62t': {
      'en': 'Password',
      'fr': 'Mot de passe',
      'hi': 'पासवर्ड',
      'sw': 'Nenosiri',
      'zh_Hans': '密码',
    },
    '6axoagr3': {
      'en': 'Sign in ',
      'fr': 'Se connecter',
      'hi': 'दाखिल करना',
      'sw': 'Ingia',
      'zh_Hans': '登入',
    },
    '0f9mnhh8': {
      'en': 'Forgot password? ',
      'fr': 'Vous n\'avez pas de compte ?',
      'hi': 'क्या आपके पास खाता नहीं है?',
      'sw': 'Je, huna akaunti?',
      'zh_Hans': '沒有帳戶？',
    },
    '75d1p9kj': {
      'en': 'Reset now',
      'fr': 'Inscrivez-vous ici',
      'hi': 'यहां साइन अप करें',
      'sw': 'Jisajili hapa',
      'zh_Hans': '在此注册',
    },
    'bwvzxsbn': {
      'en': 'Don\'t have an account?  ',
      'fr': 'Vous n\'avez pas de compte ?',
      'hi': 'क्या आपके पास खाता नहीं है?',
      'sw': 'Je, huna akaunti?',
      'zh_Hans': '沒有帳戶？',
    },
    '1nqj83b3': {
      'en': 'Sign up here',
      'fr': 'Inscrivez-vous ici',
      'hi': 'यहां साइन अप करें',
      'sw': 'Jisajili hapa',
      'zh_Hans': '在此注册',
    },
    '6qe3b9at': {
      'en': 'Sign in with Google',
      'fr': 'Connectez-vous avec Google',
      'hi': 'Google के साथ साइन इन करें',
      'sw': 'Ingia kwa kutumia Google',
      'zh_Hans': '使用 Google 登录',
    },
    '8ra9g5vw': {
      'en': 'Home',
      'fr': 'Maison',
      'hi': 'घर',
      'sw': 'Nyumbani',
      'zh_Hans': '家',
    },
  },
  // Profile0
  {
    'byzbwusz': {
      'en': 'Switch to Light Mode',
      'fr': 'Passer en mode clair',
      'hi': 'लाइट मोड पर स्विच करें',
      'sw': 'Badili hadi Hali ya Mwanga',
      'zh_Hans': '切换到灯光模式',
    },
    'iczydecc': {
      'en': 'Account',
      'fr': 'Compte',
      'hi': 'खाता',
      'sw': 'Akaunti',
      'zh_Hans': '帐户',
    },
    '6ijffmpn': {
      'en': 'Manage plan',
      'fr': 'Gérer le plan',
      'hi': 'योजना प्रबंधित करें',
      'sw': 'Dhibiti mpango',
      'zh_Hans': '管理计划',
    },
    'k4ioym33': {
      'en': 'Lite',
      'fr': 'Gérer le plan',
      'hi': 'योजना प्रबंधित करें',
      'sw': 'Dhibiti mpango',
      'zh_Hans': '管理计划',
    },
    'kvrp50a6': {
      'en': 'Notification Settings',
      'fr': 'Paramètres de notification',
      'hi': 'अधिसूचना सेटिंग्स',
      'sw': 'Mipangilio ya Arifa',
      'zh_Hans': '通知设置',
    },
    'hwls3mcz': {
      'en': 'Edit Profile',
      'fr': 'Modifier le profil',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'sw': 'Badilisha Wasifu',
      'zh_Hans': '编辑个人资料',
    },
    '8h71ygye': {
      'en': 'General',
      'fr': 'Général',
      'hi': 'सामान्य',
      'sw': 'Mkuu',
      'zh_Hans': '一般的',
    },
    'u40zxgyb': {
      'en': 'Support',
      'fr': 'Soutien',
      'hi': 'सहायता',
      'sw': 'Msaada',
      'zh_Hans': '支持',
    },
    '4d7g7yx9': {
      'en': 'Terms of Service',
      'fr': 'Conditions d\'utilisation',
      'hi': 'सेवा की शर्तें',
      'sw': 'Masharti ya Huduma',
      'zh_Hans': '服务条款',
    },
    'jr76ls51': {
      'en': 'Invite Friends',
      'fr': 'Inviter des amis',
      'hi': 'मित्रों को आमंत्रित करें',
      'sw': 'Waalike Marafiki',
      'zh_Hans': '邀请好友',
    },
    'blhcm77h': {
      'en': 'Logout',
      'fr': 'Déconnexion',
      'hi': 'लॉग आउट',
      'sw': 'Ondoka',
      'zh_Hans': '登出',
    },
    'ypo6qgvb': {
      'en': 'Home',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // voicesRecorder
  {
    'mf4k755n': {
      'en': 'Choose a voice',
      'fr': 'Explorer',
      'hi': 'अन्वेषण करना',
      'sw': 'Chunguza',
      'zh_Hans': '探索',
    },
    'vsj8zmju': {
      'en': 'Home',
      'fr': 'Maison',
      'hi': 'घर',
      'sw': 'Nyumbani',
      'zh_Hans': '家',
    },
  },
  // voicesTextspch
  {
    'bj4mds55': {
      'en': 'choose a voice',
      'fr': 'Explorer',
      'hi': 'अन्वेषण करना',
      'sw': 'Chunguza',
      'zh_Hans': '探索',
    },
    'qs3ri59g': {
      'en': 'Home',
      'fr': 'Maison',
      'hi': 'घर',
      'sw': 'Nyumbani',
      'zh_Hans': '家',
    },
  },
  // Podcaststudio
  {
    'lqz96ebh': {
      'en': 'Generate Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '28erbyri': {
      'en':
          'Create a 1-minute AI-generated podcast episode with your custom details',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'cqfq6uq2': {
      'en': 'Podcast Topic',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '1p4cv1a3': {
      'en': 'Enter your podcast topic',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'p68wpghp': {
      'en': 'Podcast Description',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'sgetvf5s': {
      'en': 'AI',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '2nm0z97i': {
      'en': 'What should they discuss?',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'o7wtr7ak': {
      'en': 'Language',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'dx9c5tgu': {
      'en': 'English',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '92s7xu2c': {
      'en': 'Spanish',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '000nci8k': {
      'en': 'French',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ed0u7ii8': {
      'en': 'German',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'tsic6aw7': {
      'en': 'Portuguese',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'sdncninx': {
      'en': 'Italian',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'o5tsupf3': {
      'en': 'Hindi',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '0ia0yu5p': {
      'en': 'Arabic',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'olbioytn': {
      'en': 'Turkish',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'k8odffhp': {
      'en': 'Korean',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '5rat83lh': {
      'en': 'Japanese',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'as2wa4r3': {
      'en': 'Chinese',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'l4ifuzfh': {
      'en': 'Russian',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'h7ao3160': {
      'en': 'Swedish',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    't0k8acuo': {
      'en': 'Romanian',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ckxgh5yo': {
      'en': 'Greek',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '8ssuova0': {
      'en': 'Filipino',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '3zyftdd2': {
      'en': 'Bulgarian',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'dgfglh8y': {
      'en': 'Malay',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'a3rittmz': {
      'en': 'Dutch',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'lm1j6lji': {
      'en': 'English',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'podizzjq': {
      'en': 'Host Name',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '6yh1cizz': {
      'en': 'Enter host name',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'pjkudbjy': {
      'en': 'Choose Voice (Host)',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'lya5188q': {
      'en': 'Guest Name',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '79tyzjg9': {
      'en': 'Enter guest name',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '4zov0dwt': {
      'en': 'Choose Voice (Guest)',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'pgoerpsr': {
      'en': 'Enter your podcast title is required',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '3grriv7t': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'rwicth9r': {
      'en': 'What should they discuss? is required',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ez0fm39z': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'v5wzwpms': {
      'en': 'Enter host name is required',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'cygln8dv': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '2869ljs1': {
      'en': 'Enter guest name is required',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '78kuok6v': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '98otsmth': {
      'en': 'Preview Player',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'tasj77le': {
      'en': 'All set preview and download you audio',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '0qx5icpw': {
      'en': 'Generate Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'iyvmy39j': {
      'en': 'Generate Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'tfgnbt5q': {
      'en': 'Generation takes about 30-60 seconds',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'j03q0h7d': {
      'en': 'Your podcast will be ready for download once complete',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // transcribe
  {
    'o3swmd7k': {
      'en': 'AudioTranscription',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '4lyw8zik': {
      'en': 'Transform your audio into text with advanced AI technology',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'm4vcvqqe': {
      'en': 'English',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'enn1rpzn': {
      'en': 'Select target language',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'hvjicokf': {
      'en': 'Search languages...',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'kv08dpfx': {
      'en': 'English',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'nx6k7jbs': {
      'en': 'Spanish',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'x7j2gcfs': {
      'en': 'French',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'e3l37hbt': {
      'en': 'German',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '55axc58i': {
      'en': 'Chinese',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '39r1gnk3': {
      'en': 'Japanese',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'kdfkqja6': {
      'en': 'Start Transcription',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // LIBRARYPAGE
  {
    'lgrqzu1m': {
      'en': 'Audio Library',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'z7dv7nix': {
      'en': 'Podcasts',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    't2s4ngio': {
      'en': 'Search podcasts...',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'rq8t1n7y': {
      'en': 'My Saves',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'knyg8s9h': {
      'en': 'Tech Talk Daily',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '3pt254dj': {
      'en': 'Episode 142',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'fg93kahs': {
      'en': 'Tech Talk Daily',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '7rnr9d04': {
      'en': 'Episode 142',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'zb136cs0': {
      'en': 'My Podcasts',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'wcfgpjxp': {
      'en': 'Voice overs',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'uc1vqhr0': {
      'en': 'Search your voice library...',
      'fr': 'Recherchez dans votre bibliothèque vocale...',
      'hi': 'अपनी आवाज़ लाइब्रेरी खोजें...',
      'sw': 'Tafuta maktaba yako ya sauti...',
      'zh_Hans': '搜索您的语音库...',
    },
    'en30l9gt': {
      'en': 'Transcriptions',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'fxuqgx1h': {
      'en': 'Search transcriptions...',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'v8yon0jg': {
      'en': 'Recent Transcriptions',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ad85tnwr': {
      'en': 'New',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // Discover
  {
    'eb6r74pz': {
      'en': 'Discover',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'xlqvcjaq': {
      'en': '5',
      'fr': '5',
      'hi': '5',
      'sw': '5',
      'zh_Hans': '5',
    },
    '8bdwxoqa': {
      'en': 'Search',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'fllzk05c': {
      'en': 'Featured',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'o3gcyhb7': {
      'en': 'Trending Now',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // single
  {
    'h99orz14': {
      'en': 'your recent transcritions',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // CHOOSETYPE
  {
    '8vx70mwk': {
      'en': 'Choose Your Format',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'mqmcaecl': {
      'en': 'Select the type of podcast you\'d like to create',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '9t7wtyrv': {
      'en': 'Solo Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'bwnbxjkn': {
      'en':
          'Just yourself  sharing thoughts, stories, or expertise with your audience',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '72k3h9qn': {
      'en': 'Dialogue Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'y09n0w67': {
      'en':
          'Have conversations with guests, co-hosts, or interview interesting people',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '64plpvoa': {
      'en': 'Continue',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    't006ghjw': {
      'en': 'New Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // pricing
  {
    'ziqvo6nt': {
      'en': 'Subscription Plans',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'waae3xc0': {
      'en':
          'From quick voiceovers to full podcast productions \noixr scales with your voice journey. Start small or go big — every word counts.',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '8cbzje0y': {
      'en': 'Lite',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '9o86zz8g': {
      'en': '8,000 credits',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '9it73hj5': {
      'en': '\$4.49*',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'mo9ydlrc': {
      'en': 'Monthly',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '2z0v25sq': {
      'en': 'Perfect for',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'b28pcpqh': {
      'en': 'Beginners',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'dyhzt50r': {
      'en': 'Text-to-Speech',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'm3a5yuvk': {
      'en': 'Voice Changer',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '84djomla': {
      'en': 'Transcription',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '4zbwmeni': {
      'en': '3,000 credits',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'y3xqtiwf': {
      'en': 'Choose Lite',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'sbh4kl9t': {
      'en': 'Voice Pro',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'lb61o9j1': {
      'en': '15,000 credits',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'x6xub86h': {
      'en': 'POPULAR',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'w1h0xo2c': {
      'en': '\$8.42*',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '1t7ssqx4': {
      'en': 'Monthly',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '4h9mrvz2': {
      'en': 'Ideal for',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'mkvknffs': {
      'en': 'Creators',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'sb0v2s3p': {
      'en': 'All Lite features',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'zma4d99p': {
      'en': '15,000 credits',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'thew2vlp': {
      'en': 'Ideal for podcasters & creators',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'uzyu0e7z': {
      'en': 'Choose Voice Pro',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '7str77mb': {
      'en': 'Studio Elite',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '31lp5ves': {
      'en': '40,000 credits',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '12z32dg0': {
      'en': '\$22.44*',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ck2si1ff': {
      'en': 'Monthly',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ehci934j': {
      'en': 'Best for',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'dbny89tu': {
      'en': 'Educators',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'k2i8ozou': {
      'en': 'Full access',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '2n8485c7': {
      'en': 'Long scripts',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '1thbouif': {
      'en': 'Best for educators & media creators',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'lzctk3s6': {
      'en': 'Choose Studio Elite',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'pg1cu9tq': {
      'en': 'Business Plus',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'cjfoonsx': {
      'en': '100,000 credits',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'm00icdg1': {
      'en': '\$56.10*',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'rxej7oyv': {
      'en': 'Monthly',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'nk1jghtn': {
      'en': 'Perfect for',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '07xwdfqu': {
      'en': 'Teams',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'tc5ew6d2': {
      'en': 'Full access',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '252m79kr': {
      'en': 'Team use',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'js49vpvv': {
      'en': 'Best for companies and business',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '3n62qujb': {
      'en': 'Choose Business Plus',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'aav3v4rd': {
      'en': 'Top-Up Options',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'v66869k4': {
      'en': 'Top up your credit balance anytime ',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'vy7oio9o': {
      'en': '1,000',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'mhghie31': {
      'en': 'Credits',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'pv0v4pbs': {
      'en': '\$0.56',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'nom685gn': {
      'en': '5,000',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'hz22nfzp': {
      'en': 'Credits',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ttgb09as': {
      'en': '\$2.81',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ng60583y': {
      'en': '10,000',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '4y04bjjd': {
      'en': 'Credits',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '6nxq71y4': {
      'en': '\$5.61',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // COPYTOCB
  {
    'i3qyut5b': {
      'en': 'Transcript',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'fxu8xnwk': {
      'en': 'Copy ',
      'fr': '147',
      'hi': '147',
      'sw': '147',
      'zh_Hans': '147',
    },
    '1w2tw64j': {
      'en': 'Home',
      'fr': 'Maison',
      'hi': 'घर',
      'sw': 'Nyumbani',
      'zh_Hans': '家',
    },
  },
  // Actionsheet1
  {
    'u25wl1ws': {
      'en': 'Choose  type ',
      'fr': 'Choisissez le type',
      'hi': 'प्रकार चुनें',
      'sw': 'Chagua aina',
      'zh_Hans': '选择类型',
    },
    's3hbrkfl': {
      'en': 'Text to speech',
      'fr': 'Synthèse vocale',
      'hi': 'भाषण के पाठ',
      'sw': 'Maandishi kwa hotuba',
      'zh_Hans': '文本转语音',
    },
    '4s77k2eu': {
      'en': 'Voice to speech',
      'fr': 'Voix à parole',
      'hi': 'आवाज़ से भाषण तक',
      'sw': 'Sauti kwa hotuba',
      'zh_Hans': '语音转语音',
    },
    '2f12xk1r': {
      'en': 'Cancel',
      'fr': 'Annuler',
      'hi': 'रद्द करना',
      'sw': 'Ghairi',
      'zh_Hans': '取消',
    },
  },
  // createdAudioHistory
  {
    'aisx8xt4': {
      'en': 'Recent Generations',
      'fr': 'Générations récentes',
      'hi': 'हाल की पीढ़ियाँ',
      'sw': 'Vizazi vya Hivi Karibuni',
      'zh_Hans': '最近几代人',
    },
    'dzzkubsf': {
      'en': 'Search your voice library...',
      'fr': 'Recherchez dans votre bibliothèque vocale...',
      'hi': 'अपनी आवाज़ लाइब्रेरी खोजें...',
      'sw': 'Tafuta maktaba yako ya sauti...',
      'zh_Hans': '搜索您的语音库...',
    },
  },
  // podcastchoicev
  {
    'nu1cliom': {
      'en': 'Podcast Voices',
      'fr': 'Choisissez le type',
      'hi': 'प्रकार चुनें',
      'sw': 'Chagua aina',
      'zh_Hans': '选择类型',
    },
    '95zyhue3': {
      'en': 'Host',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'f60f9m49': {
      'en': 'Guest',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'tkkczr63': {
      'en': 'Odessey',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'bsi8jw5v': {
      'en': 'Commercials',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'coit0uga': {
      'en': 'Tressy',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'fz9m455w': {
      'en': 'Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '48ocn7a3': {
      'en': 'Next',
      'fr': 'Voix à parole',
      'hi': 'आवाज़ से भाषण तक',
      'sw': 'Sauti kwa hotuba',
      'zh_Hans': '语音转语音',
    },
  },
  // choosepodcaster1
  {
    'vwvjwlu4': {
      'en': 'Click any below to choose your voice',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'e6a3e3ug': {
      'en': 'Odessey',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '8lgl1g99': {
      'en': 'Commercials',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'e9qwzark': {
      'en': 'Tressy',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '1nesu6qk': {
      'en': 'Podcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'tzjmm9at': {
      'en': 'Grandpa',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '1l9lnhao': {
      'en': 'Narrative',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    's3rjve40': {
      'en': 'Fredie',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'dm4r4ldn': {
      'en': 'TV Broardcast',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // loadingScreen
  {
    'gvpw734r': {
      'en': 'Generation takes about 30-60 seconds',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'za6263p8': {
      'en': 'Your Audio will be ready for download once complete',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // nointernet
  {
    'bypem04v': {
      'en': 'No Internet Connection',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'qghm61ok': {
      'en': 'Please check your network settings and try again',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // emptylist
  {
    '95il9kc9': {
      'en': 'Nothing here yet',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'qsq2q6kl': {
      'en': 'Your list is empty. Add some items to get started!',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // loadingScreentranscript
  {
    '9gfagmhk': {
      'en': 'Generation takes about 10-60 seconds',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'z82a4f6s': {
      'en':
          'Your Transcription Text file  will be ready for download once complete',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    '1h41x0gj': {
      'en':
          'This app needs your permission to use  mic on this device  for audio recording',
      'fr':
          'Cette application a besoin de votre autorisation pour utiliser le micro de cet appareil pour l\'enregistrement audio',
      'hi':
          'इस ऐप को ऑडियो रिकॉर्डिंग के लिए इस डिवाइस पर माइक का उपयोग करने के लिए आपकी अनुमति की आवश्यकता है',
      'sw':
          'Programu hii inahitaji ruhusa yako ili kutumia maikrofoni kwenye kifaa hiki kurekodi sauti',
      'zh_Hans': '此应用需要您的许可才能使用此设备上的麦克风进行录音',
    },
    'qge0sy52': {
      'en': 'Voixr needs your permission to send notifications',
      'fr': 'Voixr a besoin de votre permission pour envoyer des notifications',
      'hi': 'Voixr को सूचनाएं भेजने के लिए आपकी अनुमति की आवश्यकता है',
      'sw': 'Voixr inahitaji ruhusa yako ili kutuma arifa',
      'zh_Hans': 'Voixr 需要您的许可发送通知',
    },
    'xyqf7ad6': {
      'en': 'Voixr needs you permission to use your microphone',
      'fr': 'Voixr a besoin de votre permission pour utiliser votre microphone',
      'hi':
          'Voixr को आपके माइक्रोफ़ोन का उपयोग करने के लिए आपकी अनुमति की आवश्यकता है',
      'sw': 'Voixr inahitaji uidhinishe ili kutumia maikrofoni yako',
      'zh_Hans': 'Voixr 需要您的许可才能使用您的麦克风',
    },
    'dhwbflrc': {
      'en': 'Voixr needs your permission to access library',
      'fr': 'Voixr a besoin de votre permission pour accéder à la bibliothèque',
      'hi': 'Voixr को लाइब्रेरी तक पहुंचने के लिए आपकी अनुमति की आवश्यकता है',
      'sw': 'Voixr inahitaji ruhusa yako ili kufikia maktaba',
      'zh_Hans': 'Voixr 需要您的许可访问图书馆',
    },
    'zaok08hb': {
      'en':
          'This app requires Bluetooth access to record audio through a Bluetooth device',
      'fr':
          'Cette application nécessite un accès Bluetooth pour enregistrer l\'audio via un appareil Bluetooth',
      'hi':
          'इस ऐप को ब्लूटूथ डिवाइस के माध्यम से ऑडियो रिकॉर्ड करने के लिए ब्लूटूथ एक्सेस की आवश्यकता होती है',
      'sw':
          'Programu hii inahitaji ufikiaji wa Bluetooth ili kurekodi sauti kupitia kifaa cha Bluetooth',
      'zh_Hans': '此应用需要蓝牙访问才能通过蓝牙设备录制音频',
    },
    'dt4n40hq': {
      'en': 'Voixr needs your permission to use you device camera',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'z2t71xm3': {
      'en':
          'This app needs your permission to use  mic on this device  for audio recording',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'islc1ou8': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'm76ssen1': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '5z4rwp16': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'm2ta948d': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '15bliji9': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'mjg7t20d': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ofkrr1f1': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'qkyfn4fe': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'y3bhnuzg': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '29m0v3t8': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'ea06pa3v': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '2rbbrrwo': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '58lpq27j': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '9omw0s3h': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '9a7inutd': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'sawbcdf8': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'j20823ao': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'rwla9rwi': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'bdisup6g': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'q871ggbs': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'egxof4ee': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'mxs9ksjt': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '3o39qq48': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    '7alw6vgh': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
    'swv1jwjr': {
      'en': '',
      'fr': '',
      'hi': '',
      'sw': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
