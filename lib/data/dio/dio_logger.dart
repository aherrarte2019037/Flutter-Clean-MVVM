import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tutapp/data/config/logger_options.dart';

class DioLogger extends PrettyDioLogger {
  DioLogger()
      : super(
          requestBody: LoggerOptions.requestBody,
          requestHeader: LoggerOptions.requestHeader,
          responseBody: LoggerOptions.responseBody,
          responseHeader: LoggerOptions.requestHeader,
        );
}
