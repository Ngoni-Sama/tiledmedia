
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

  static String customerID = '';
  static String apiAuthToken = '';
  static String xAPIKey = '';
}