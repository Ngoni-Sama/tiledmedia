
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
}