import 'package:json_annotation/json_annotation.dart';
part 'locales.g.dart';

@JsonEnum(alwaysCreate: true, valueField: 'languageCode')
enum Locales {
  en(languageCode: 'en'),
  es(languageCode: 'es');

  const Locales({
    required this.languageCode,
  });

  final String languageCode;

  String toJson() => _$LocalesEnumMap[this]!;

  factory Locales.fromJson(String json) => _$LocalesEnumMap.entries
      .firstWhere(
        (element) => element.value == json,
        orElse: () => MapEntry(Locales.en, Locales.en.languageCode),
      )
      .key;
}
