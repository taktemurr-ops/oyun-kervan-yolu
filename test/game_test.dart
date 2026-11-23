import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kervan_yolu/oyun_kervan_yolu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kervanYoluConfig.title.length, 33);
    expect(kervanYoluConfig.tagline.length, 33);
    for (final s in kervanYoluConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kervanYoluConfig.gameId, kervanYoluId);
    expect(kervanYoluRules.gameId, kervanYoluId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kervanYoluRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kervanYoluId, optionalMechanics: kervanYoluRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kervanYoluRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
