import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Translation on BuildContext {
  AppLocalizations get text {
    return AppLocalizations.of(this)!;
  }
}
