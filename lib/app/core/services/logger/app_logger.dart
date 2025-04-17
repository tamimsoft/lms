// import 'package:logger/logger.dart';
//
// enum LogLevel { info, debug, warning, error, verbose }
//
// mixin class AppLogger {
//   static final AppLogger _instance = AppLogger._internal();
//
//   factory AppLogger() => _instance;
//
//   final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0)); // Customize the printer
//
//   AppLogger._internal();
//
//   void log(String message, {LogLevel level = LogLevel.info}) {
//     switch (level) {
//       case LogLevel.info:
//         _logger.i(message);
//         break;
//       case LogLevel.debug:
//         _logger.d(message);
//         break;
//       case LogLevel.warning:
//         _logger.w(message);
//         break;
//       case LogLevel.error:
//         _logger.e(message);
//         break;
//       default:
//         _logger.i(message);
//         break;
//     }
//   }
// }