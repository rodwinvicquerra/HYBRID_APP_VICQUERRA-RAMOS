class Scene {
  final String storyText;
  final List<String> choices;
  final List<int> nextScenes;
  final String imagePath;
  final bool isEnding;
  final String endingType; // 'good', 'bad', 'neutral', 'weird', ''
  final String endingTitle;
  final String endingMessage;

  const Scene({
    required this.storyText,
    required this.imagePath,
    this.choices = const [],
    this.nextScenes = const [],
    this.isEnding = false,
    this.endingType = '',
    this.endingTitle = '',
    this.endingMessage = '',
  });
}
