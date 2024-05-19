part of theme;

abstract class NFTObserverTextStyles {
  static const String kanitFontFamily = 'Kanit';

  ///Bold
  static TextStyle get kanitBoldHeader1 => _kanitBold(fontSize: 48.0);

  static TextStyle get kanitBoldHeader2 => _kanitBold(fontSize: 40.0);

  static TextStyle get kanitBoldHeader3 => _kanitBold(fontSize: 32.0);

  static TextStyle get kanitBoldHeader4 => _kanitBold(fontSize: 24.0);

  static TextStyle get kanitBoldHeader5 => _kanitBold(fontSize: 20.0);

  static TextStyle get kanitBoldHeader6 => _kanitBold(fontSize: 18.0);

  static TextStyle get kanitBoldLarge => _kanitBold(fontSize: 16.0);

  static TextStyle get kanitBoldMedium => _kanitBold(fontSize: 14.0);

  static TextStyle get kanitBoldSmall => _kanitBold(fontSize: 12.0);

  static TextStyle get kanitBoldXtraSmall => _kanitBold(fontSize: 10.0);

  ///SemiBold
  static TextStyle get kanitSemiBoldHeader1 => _kanitSemiBold(fontSize: 48.0);

  static TextStyle get kanitSemiBoldHeader2 => _kanitSemiBold(fontSize: 40.0);

  static TextStyle get kanitSemiBoldHeader3 => _kanitSemiBold(fontSize: 32.0);

  static TextStyle get kanitSemiBoldHeader4 => _kanitSemiBold(fontSize: 24.0);

  static TextStyle get kanitSemiBoldHeader5 => _kanitSemiBold(fontSize: 20.0);

  static TextStyle get kanitSemiBoldHeader6 => _kanitSemiBold(fontSize: 18.0);

  static TextStyle get kanitSemiBoldLarge => _kanitSemiBold(fontSize: 16.0);

  static TextStyle get kanitSemiBoldMedium => _kanitSemiBold(fontSize: 14.0);

  static TextStyle get kanitSemiBoldSmall => _kanitSemiBold(fontSize: 12.0);

  static TextStyle get kanitSemiBoldXtraSmall => _kanitSemiBold(fontSize: 10.0);

  ///Medium
  static TextStyle get kanitMediumHeader1 => _kanitMedium(fontSize: 48.0);

  static TextStyle get kanitMediumHeader2 => _kanitMedium(fontSize: 40.0);

  static TextStyle get kanitMediumHeader3 => _kanitMedium(fontSize: 32.0);

  static TextStyle get kanitMediumHeader4 => _kanitMedium(fontSize: 24.0);

  static TextStyle get kanitMediumHeader5 => _kanitMedium(fontSize: 20.0);

  static TextStyle get kanitMediumHeader6 => _kanitMedium(fontSize: 18.0);

  static TextStyle get kanitMediumLarge => _kanitMedium(fontSize: 16.0);

  static TextStyle get kanitMediumMedium => _kanitMedium(fontSize: 14.0);

  static TextStyle get kanitMediumSmall => _kanitMedium(fontSize: 12.0);

  static TextStyle get kanitMediumXtraSmall => _kanitMedium(fontSize: 10.0);

  ///Regular
  static TextStyle get kanitRegularHeader1 => _kanitRegular(fontSize: 48.0);

  static TextStyle get kanitRegularHeader2 => _kanitRegular(fontSize: 40.0);

  static TextStyle get kanitRegularHeader3 => _kanitRegular(fontSize: 32.0);

  static TextStyle get kanitRegularHeader4 => _kanitRegular(fontSize: 24.0);

  static TextStyle get kanitRegularHeader5 => _kanitRegular(fontSize: 20.0);

  static TextStyle get kanitRegularHeader6 => _kanitRegular(fontSize: 18.0);

  static TextStyle get kanitRegularLarge => _kanitRegular(fontSize: 16.0);

  static TextStyle get kanitRegularMedium => _kanitRegular(fontSize: 14.0);

  static TextStyle get kanitRegularSmall => _kanitRegular(fontSize: 12.0);

  static TextStyle get kanitRegularXtraSmall => _kanitRegular(fontSize: 10.0);

  static TextStyle _kanitBold({required double fontSize}) {
    return _kanit(fontWeight: FontWeight.w700, fontSize: fontSize);
  }

  static TextStyle _kanitSemiBold({required double fontSize}) {
    return _kanit(fontWeight: FontWeight.w600, fontSize: fontSize);
  }

  static TextStyle _kanitMedium({required double fontSize}) {
    return _kanit(fontWeight: FontWeight.w500, fontSize: fontSize);
  }

  static TextStyle _kanitRegular({required double fontSize}) {
    return _kanit(fontWeight: FontWeight.w400, fontSize: fontSize);
  }

  static TextStyle _kanit({required FontWeight fontWeight, required double fontSize}) {
    return TextStyle(
      fontFamily: kanitFontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
