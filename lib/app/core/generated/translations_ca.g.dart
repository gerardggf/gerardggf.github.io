///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsCa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsCa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ca,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ca>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsCa _root = this; // ignore: unused_field

	@override 
	TranslationsCa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsCa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsGlobalCa global = _TranslationsGlobalCa._(_root);
}

// Path: global
class _TranslationsGlobalCa implements TranslationsGlobalEn {
	_TranslationsGlobalCa._(this._root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get language => 'Català';
	@override String get anErrorHasOccurred => 'S\'ha produït un error';
	@override String get pageNotFound => 'No s\'ha trobat la pàgina';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsCa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'global.language': return 'Català';
			case 'global.anErrorHasOccurred': return 'S\'ha produït un error';
			case 'global.pageNotFound': return 'No s\'ha trobat la pàgina';
			default: return null;
		}
	}
}

