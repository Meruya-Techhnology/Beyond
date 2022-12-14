class BaseClassProperty {
  final String name;
  final String type;
  final String originalKey;
  final bool? isListOrMap;
  final String? childType;
  final bool mapToModel;
  final bool isAList;

  BaseClassProperty({
    required this.name,
    required this.type,
    required this.originalKey,
    this.isListOrMap,
    this.childType,
    this.mapToModel = false,
    this.isAList = false,
  });
}
