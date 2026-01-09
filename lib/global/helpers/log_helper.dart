import 'package:logger/logger.dart';

class LoggerHelper {
  // Singleton pattern implementation
  static final LoggerHelper _instance = LoggerHelper._internal();

  factory LoggerHelper() {
    return _instance;
  }

  LoggerHelper._internal();

  final Logger logger = Logger();
}
