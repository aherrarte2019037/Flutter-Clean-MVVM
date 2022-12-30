class ConnectionOptions {
  const ConnectionOptions._();

  static const baseUrl = '';
  static const connectTimeout = 60 * 1000;
  static const receiveTimeout = 60 * 1000;
  static const headers = {
    'content-type': ConnectionHeaders.contentType,
    'accept': ConnectionHeaders.accept,
    'authorization': ConnectionHeaders.authorization,
    'language': ConnectionHeaders.language,
  };
}

class ConnectionHeaders {
  ConnectionHeaders._();

  static const contentType = 'application/json';
  static const accept = 'application/json';
  static const authorization = 'token';
  static const language = 'en';
}
