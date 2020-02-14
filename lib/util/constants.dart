
class Constants {

  static final Map<String, String> contentSourceLocations = {
    's3bucket': 's3bucket',
    'azure-blob': 'azure-blob',
    'http-pull': 'http-pull',
  };

  static final Map<String, String> contentDestinationLocations = {
    'akamai-ns': 'akamai-ns',
    'wangsu': 'wangsu',
    'http-put': 'http-put',
    's3bucket': 's3bucket',
    'azure-blob': 'azure-blob',
  };

  static final Map<String, String> inProjectionType = {
    '360-erp-mono': '360-erp-mono',
    '360-erp-stereo-top-bottom': '360-erp-stereo-top-bottom',
    '180-erpmono': '180-erpmono',
    '180-erp-stereo-left-right': '180-erp-stereo-left-right',
    '3x2-cubemap-mono': '3x2-cubemap-mono',
    '3x2-cubemap-stereo-top-bottom': '3x2-cubemap-stereo-top-bottom'
  };

  static final Map<String, String> outProjectionType = {
    '360-cubemap-mono': '360-cubemap-mono',
    '360-cubemap-stereo': '360-cubemap-stereo',
    '180-cubemapmono': '180-cubemapmono',
    '180-cubemap-stereo': '180-cubemap-stereo',
    'planar': 'planar'
  };

  static final Map<String, String> encodeQuality = {
    'default': 'default',
    'medium': 'medium',
    'high': 'high',
    'very-high': 'very-high',
    'fixed-low': 'fixed-low',
    'fixedstandard': 'fixedstandard',
    'fixed-high': 'fixed-high'
  };

  static final Map<String, String> srcLocType = {
    's3bucket': 'S3 Bucket',
    'azure-blob': 'Azure Blob',
    'http-pull': 'Pull from Http'
  };

  static final Map<String, String> destLocType = {
    's3bucket': 'S3 Bucket',
    'azure-blob': 'Azure Blob',
    'akamai-ns': 'Akamai NS',
    'wangsu': 'Wangsu',
    'http-put': 'Put to Http'
  };

  static final Map<String, String> notificationType = {
    'webhook': 'Webhook',
    'mail': 'Mail'
  };

  static final Map<String, String> s3Regions = {
    'us-east-2': 'US East (Ohio)',
    'us-east-1': 'US East (N. Virginia)',
    'us-west-1': 'US West (N. California)',
    'us-west-2': 'US West (Oregon)',
    'ap-east-1': 'Asia Pacific (Hong Kong)',
    'ap-south-1': 'Asia Pacific (Mumbai)',
    'ap-northeast-3': 'Asia Pacific (Osaka-Local)',
    'ap-northeast-2': 'Asia Pacific (Seoul)',
    'ap-southeast-1': 'Asia Pacific (Singapore)',
    'ap-southeast-2': 'Asia Pacific (Sydney)',
    'ap-northeast-1': 'Asia Pacific (Tokyo)',
    'ca-central-1': 'Canada (Central)',
    'eu-central-1': 'Europe (Frankfurt)',
    'eu-west-1': 'Europe (Ireland)',
    'eu-west-2': 'Europe (London)',
    'eu-west-3': 'Europe (Paris)',
    'eu-north-1': 'Europe (Stockholm)',
    'me-south-1': 'Middle East (Bahrain)',
    'sa-east-1': 'South America (São Paulo)',
  };

  static final Map<String, String> packageFormats = {
    "":"",
    'tm11-manifest-v4': 'tm11-manifest-v4',
    'tm11-manifest-v5': 'tm11-manifest-v5',
    'tm20-manifest-v5': 'tm20-manifest-v5'
  };

  static final Map<String, String> languages = {
    'af': 'Afrikaans',
    'af-ZA': 'Afrikaans (South Africa)',
    'ar': 'Arabic',
    'ar-AE': 'Arabic (U.A.E.)',
    'ar-BH': 'Arabic (Bahrain)',
    'ar-DZ': 'Arabic (Algeria)',
    'ar-EG': 'Arabic (Egypt)',
    'ar-IQ': 'Arabic (Iraq)',
    'ar-JO': 'Arabic (Jordan)',
    'ar-KW': 'Arabic (Kuwait)',
    'ar-LB': 'Arabic (Lebanon)',
    'ar-LY': 'Arabic (Libya)',
    'ar-MA': 'Arabic (Morocco)',
    'ar-OM': 'Arabic (Oman)',
    'ar-QA': 'Arabic (Qatar)',
    'ar-SA': 'Arabic (Saudi Arabia)',
    'ar-SY': 'Arabic (Syria)',
    'ar-TN': 'Arabic (Tunisia)',
    'ar-YE': 'Arabic (Yemen)',
    'az': 'Azeri (Latin)',
    'az-AZ': 'Azeri (Latin) (Azerbaijan)',
    'az-Cyrl-AZ': 'Azeri (Cyrillic) (Azerbaijan)',
    'be': 'Belarusian',
    'be-BY': 'Belarusian (Belarus)',
    'bg': 'Bulgarian',
    'bg-BG': 'Bulgarian (Bulgaria)',
    'bs-BA': 'Bosnian (Bosnia and Herzegovina)',
    'ca': 'Catalan',
    'ca-ES': 'Catalan (Spain)',
    'cs': 'Czech',
    'cs-CZ': 'Czech (Czech Republic)',
    'cy': 'Welsh',
    'cy-GB': 'Welsh (United Kingdom)',
    'da': 'Danish',
    'da-DK': 'Danish (Denmark)',
    'de': 'German',
    'de-AT': 'German (Austria)',
    'de-CH': 'German (Switzerland)',
    'de-DE': 'German (Germany)',
    'de-LI': 'German (Liechtenstein)',
    'de-LU': 'German (Luxembourg)',
    'dv': 'Divehi',
    'dv-MV': 'Divehi (Maldives)',
    'el': 'Greek',
    'el-GR': 'Greek (Greece)',
    'en': 'English',
    'en-AU': 'English (Australia)',
    'en-BZ': 'English (Belize)',
    'en-CA': 'English (Canada)',
    'en-CB': 'English (Caribbean)',
    'en-GB': 'English (United Kingdom)',
    'en-IE': 'English (Ireland)',
    'en-JM': 'English (Jamaica)',
    'en-NZ': 'English (New Zealand)',
    'en-PH': 'English (Republic of the Philippines)',
    'en-TT': 'English (Trinidad and Tobago)',
    'en-US': 'English (United States)',
    'en-ZA': 'English (South Africa)',
    'en-ZW': 'English (Zimbabwe)',
    'eo': 'Esperanto',
    'es': 'Spanish',
    'es-AR': 'Spanish (Argentina)',
    'es-BO': 'Spanish (Bolivia)',
    'es-CL': 'Spanish (Chile)',
    'es-CO': 'Spanish (Colombia)',
    'es-CR': 'Spanish (Costa Rica)',
    'es-DO': 'Spanish (Dominican Republic)',
    'es-EC': 'Spanish (Ecuador)',
    'es-ES': 'Spanish (Spain)',
    'es-GT': 'Spanish (Guatemala)',
    'es-HN': 'Spanish (Honduras)',
    'es-MX': 'Spanish (Mexico)',
    'es-NI': 'Spanish (Nicaragua)',
    'es-PA': 'Spanish (Panama)',
    'es-PE': 'Spanish (Peru)',
    'es-PR': 'Spanish (Puerto Rico)',
    'es-PY': 'Spanish (Paraguay)',
    'es-SV': 'Spanish (El Salvador)',
    'es-UY': 'Spanish (Uruguay)',
    'es-VE': 'Spanish (Venezuela)',
    'et': 'Estonian',
    'et-EE': 'Estonian (Estonia)',
    'eu': 'Basque',
    'eu-ES': 'Basque (Spain)',
    'fa': 'Farsi',
    'fa-IR': 'Farsi (Iran)',
    'fi': 'Finnish',
    'fi-FI': 'Finnish (Finland)',
    'fo': 'Faroese',
    'fo-FO': 'Faroese (Faroe Islands)',
    'fr': 'French',
    'fr-BE': 'French (Belgium)',
    'fr-CA': 'French (Canada)',
    'fr-CH': 'French (Switzerland)',
    'fr-FR': 'French (France)',
    'fr-LU': 'French (Luxembourg)',
    'fr-MC': 'French (Principality of Monaco)',
    'gl': 'Galician',
    'gl-ES': 'Galician (Spain)',
    'gu': 'Gujarati',
    'gu-IN': 'Gujarati (India)',
    'he': 'Hebrew',
    'he-IL': 'Hebrew (Israel)',
    'hi': 'Hindi',
    'hi-IN': 'Hindi (India)',
    'hr': 'Croatian',
    'hr-BA': 'Croatian (Bosnia and Herzegovina)',
    'hr-HR': 'Croatian (Croatia)',
    'hu': 'Hungarian',
    'hu-HU': 'Hungarian (Hungary)',
    'hy': 'Armenian',
    'hy-AM': 'Armenian (Armenia)',
    'id': 'Indonesian',
    'id-ID': 'Indonesian (Indonesia)',
    'is': 'Icelandic',
    'is-IS': 'Icelandic (Iceland)',
    'it': 'Italian',
    'it-CH': 'Italian (Switzerland)',
    'it-IT': 'Italian (Italy)',
    'ja': 'Japanese',
    'ja-JP': 'Japanese (Japan)',
    'ka': 'Georgian',
    'ka-GE': 'Georgian (Georgia)',
    'kk': 'Kazakh',
    'kk-KZ': 'Kazakh (Kazakhstan)',
    'kn': 'Kannada',
    'kn-IN': 'Kannada (India)',
    'ko': 'Korean',
    'ko-KR': 'Korean (Korea)',
    'kok': 'Konkani',
    'kok-IN': 'Konkani (India)',
    'ky': 'Kyrgyz',
    'ky-KG': 'Kyrgyz (Kyrgyzstan)',
    'lt': 'Lithuanian',
    'lt-LT': 'Lithuanian (Lithuania)',
    'lv': 'Latvian',
    'lv-LV': 'Latvian (Latvia)',
    'mi': 'Maori',
    'mi-NZ': 'Maori (New Zealand)',
    'mk': 'FYRO Macedonian',
    'mk-MK': 'FYRO Macedonian (Former Yugoslav Republic of Macedonia)',
    'mn': 'Mongolian',
    'mn-MN': 'Mongolian (Mongolia)',
    'mr': 'Marathi',
    'mr-IN': 'Marathi (India)',
    'ms': 'Malay',
    'ms-BN': 'Malay (Brunei Darussalam)',
    'ms-MY': 'Malay (Malaysia)',
    'mt': 'Maltese',
    'mt-MT': 'Maltese (Malta)',
    'nb': 'Norwegian (Bokm?l)',
    'nb-NO': 'Norwegian (Bokm?l) (Norway)',
    'nl': 'Dutch',
    'nl-BE': 'Dutch (Belgium)',
    'nl-NL': 'Dutch (Netherlands)',
    'nn-NO': 'Norwegian (Nynorsk) (Norway)',
    'ns': 'Northern Sotho',
    'ns-ZA': 'Northern Sotho (South Africa)',
    'pa': 'Punjabi',
    'pa-IN': 'Punjabi (India)',
    'pl': 'Polish',
    'pl-PL': 'Polish (Poland)',
    'ps': 'Pashto',
    'ps-AR': 'Pashto (Afghanistan)',
    'pt': 'Portuguese',
    'pt-BR': 'Portuguese (Brazil)',
    'pt-PT': 'Portuguese (Portugal)',
    'qu': 'Quechua',
    'qu-BO': 'Quechua (Bolivia)',
    'qu-EC': 'Quechua (Ecuador)',
    'qu-PE': 'Quechua (Peru)',
    'ro': 'Romanian',
    'ro-RO': 'Romanian (Romania)',
    'ru': 'Russian',
    'ru-RU': 'Russian (Russia)',
    'sa': 'Sanskrit',
    'sa-IN': 'Sanskrit (India)',
    'se': 'Sami',
    'se-FI': 'Sami (Finland)',
    'se-NO': 'Sami (Norway)',
    'se-SE': 'Sami (Sweden)',
    'sk': 'Slovak',
    'sk-SK': 'Slovak (Slovakia)',
    'sl': 'Slovenian',
    'sl-SI': 'Slovenian (Slovenia)',
    'sq': 'Albanian',
    'sq-AL': 'Albanian (Albania)',
    'sr-BA': 'Serbian (Latin) (Bosnia and Herzegovina)',
    'sr-Cyrl-BA': 'Serbian (Cyrillic) (Bosnia and Herzegovina)',
    'sr-SP': 'Serbian (Latin) (Serbia and Montenegro)',
    'sr-Cyrl-SP': 'Serbian (Cyrillic) (Serbia and Montenegro)',
    'sv': 'Swedish',
    'sv-FI': 'Swedish (Finland)',
    'sv-SE': 'Swedish (Sweden)',
    'sw': 'Swahili',
    'sw-KE': 'Swahili (Kenya)',
    'syr': 'Syriac',
    'syr-SY': 'Syriac (Syria)',
    'ta': 'Tamil',
    'ta-IN': 'Tamil (India)',
    'te': 'Telugu',
    'te-IN': 'Telugu (India)',
    'th': 'Thai',
    'th-TH': 'Thai (Thailand)',
    'tl': 'Tagalog',
    'tl-PH': 'Tagalog (Philippines)',
    'tn': 'Tswana',
    'tn-ZA': 'Tswana (South Africa)',
    'tr': 'Turkish',
    'tr-TR': 'Turkish (Turkey)',
    'tt': 'Tatar',
    'tt-RU': 'Tatar (Russia)',
    'ts': 'Tsonga',
    'uk': 'Ukrainian',
    'uk-UA': 'Ukrainian (Ukraine)',
    'ur': 'Urdu',
    'ur-PK': 'Urdu (Islamic Republic of Pakistan)',
    'uz': 'Uzbek (Latin)',
    'uz-UZ': 'Uzbek (Latin) (Uzbekistan)',
    'uz-Cyrl-UZ': 'Uzbek (Cyrillic) (Uzbekistan)',
    'vi': 'Vietnamese',
    'vi-VN': 'Vietnamese (Viet Nam)',
    'xh': 'Xhosa',
    'xh-ZA': 'Xhosa (South Africa)',
    'zh': 'Chinese',
    'zh-CN': 'Chinese (S)',
    'zh-HK': 'Chinese (Hong Kong)',
    'zh-MO': 'Chinese (Macau)',
    'zh-SG': 'Chinese (Singapore)',
    'zh-TW': 'Chinese (T)',
    'zu': 'Zulu',
    'zu-ZA': 'Zulu (South Africa)'
  };

  static final Map<String, String> spatials = {
    '': '',
    'foa-acn': 'foa-acn',
    'foa-fuma': 'foa-fuma',
  };

  static final Map<String, String> yuvFormats = {
    '': '',
    'yuv420p': 'yuv420p',
    'yuv420p10le': 'yuv420p10le',
  };
}