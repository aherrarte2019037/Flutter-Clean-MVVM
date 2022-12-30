enum Locales {
  enUS(languageCode: 'en', regionCode: 'US'),
  esES(languageCode: 'es', regionCode: 'ES');

  const Locales({
    required this.languageCode,
    required this.regionCode,
  });

  final String languageCode;
  final String regionCode;

  @override
  String toString() => '${languageCode}_$regionCode';
}
