import 'package:uuid/uuid.dart';

class UuidGenerateUtil {
  String generateId() {
    return const Uuid().v4();
  }
}
