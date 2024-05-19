part of theme;

const String _iconsPath = 'assets/icons/';

abstract class NFTObserverIcons {
  static NFTObserverIcons of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    switch (brightness) {
      case Brightness.dark:
        return const DarkIcons();
      case Brightness.light:
        return const LightIcons();
    }
  }

// static const String example = '$_iconsPath/example.svg';
}

class DarkIcons implements NFTObserverIcons {
  const DarkIcons();
}

class LightIcons implements NFTObserverIcons {
  const LightIcons();
}
