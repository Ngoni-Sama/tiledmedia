class Globals {

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

  static String customerID = '';
  static String apiAuthToken = '';
  static String xAPIKey = '';
}