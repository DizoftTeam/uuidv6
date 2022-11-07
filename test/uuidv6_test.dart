import 'package:uuid/uuid.dart';
import 'package:uuidv6/uuidv6.dart';
import 'package:test/test.dart';

void main() {
  group('Group of uuidv6 tests', () {
    final String uuid = uuidv6(disableRandom: true);

    test('Uuid v6 is valid Uuid', () {
      expect(Uuid.isValidUUID(fromString: uuid), isTrue);
    });
  });
}
