class CustomSlideModel {
  String key;
  String key1;
  String image;

  CustomSlideModel(
      {required this.key, required this.key1, required this.image});
}

List<CustomSlideModel> customSlideLst = [
  CustomSlideModel(
      image: "assets/images/introslider/intro_slider1.png",
      key: '''Welcome to AI-powered Video Conferencing''',
      key1:
      '''OConnect elevates every virtual interaction with the power of AI.'''),
  CustomSlideModel(
      image: "assets/images/introslider/intro_slider2.png",
      key: '''Collaboration made fun and easy!''',
      key1:
      '''Engage, react, and energize your teamwork with Resounds, Reactions, and many more immersive features.'''),
  CustomSlideModel(
      image: "assets/images/introslider/intro_slider3.png",
      key: '''Explore the first AI video conferencing app''',
      key1:
      '''AI meets video conferencing for a game-changing experience! Get Started!'''),
];