class ResourseHelper {
  /// Returns the path to the image asset.
  static String getImagePath({required String imageName}) {
    return 'assets/images/$imageName';
  }

  /// Returns the path to the SVG asset.
  static String getSvgPath({required String svgName}) {
    return 'assets/svgs/$svgName';
  }

  /// Returns the path to the font asset.
  static String getFontPath({required String fontName}) {
    return 'assets/fonts/$fontName';
  }

  /// Returns the path to the sound asset.
  static String getSoundPath({required String soundName}) {
    return 'assets/sounds/$soundName';
  }

  /// Returns the path to the sound asset.
  static String getLangPath({required String langName}) {
    return 'assets/langs/$langName.json';
  }
}
