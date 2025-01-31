import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'image_links.dart';
import 'industry_identifier.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

class VolumeInfo extends Equatable {
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;
  final int? averageRating;
  final int? ratingsCount;

  const VolumeInfo({
    this.averageRating,
    this.ratingsCount,
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromMap(Map<String, dynamic> data) => VolumeInfo(
        averageRating: (data['averageRating'] as num?)?.toInt(),
        ratingsCount: (data['ratingsCount'] as num?)?.toInt(),
        title: data['title']?.toString(),
        authors: (data['authors'] as List<dynamic>?)
            ?.map((e) => e?.toString())
            .whereType<String>()
            .toList(),
        publisher: data['publisher']?.toString(),
        publishedDate: data['publishedDate']?.toString(),
        description: data['description']?.toString(),
        industryIdentifiers: (data['industryIdentifiers'] as List<dynamic>?)
            ?.map((e) => e is Map<String, dynamic>
                ? IndustryIdentifier.fromMap(e)
                : null)
            .whereType<IndustryIdentifier>()
            .toList(),
        readingModes: data['readingModes'] is Map<String, dynamic>
            ? ReadingModes.fromMap(data['readingModes'] as Map<String, dynamic>)
            : null,
        pageCount: (data['pageCount'] as num?)?.toInt(),
        printType: data['printType']?.toString(),
        categories: (data['categories'] as List<dynamic>?)
            ?.map((e) => e?.toString())
            .whereType<String>()
            .toList(),
        maturityRating: data['maturityRating']?.toString(),
        allowAnonLogging: data['allowAnonLogging'] as bool?,
        contentVersion: data['contentVersion']?.toString(),
        panelizationSummary: data['panelizationSummary'] is Map<String, dynamic>
            ? PanelizationSummary.fromMap(
                data['panelizationSummary'] as Map<String, dynamic>)
            : null,
        imageLinks: data['imageLinks'] is Map<String, dynamic>
            ? ImageLinks.fromMap(data['imageLinks'] as Map<String, dynamic>)
            : null,
        language: data['language']?.toString(),
        previewLink: data['previewLink']?.toString(),
        infoLink: data['infoLink']?.toString(),
        canonicalVolumeLink: data['canonicalVolumeLink']?.toString(),
      );
  Map<String, dynamic> toMap() => {
        'title': title,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'description': description,
        'industryIdentifiers':
            industryIdentifiers?.map((e) => e.toMap()).toList(),
        'readingModes': readingModes?.toMap(),
        'pageCount': pageCount,
        'printType': printType,
        'categories': categories,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'panelizationSummary': panelizationSummary?.toMap(),
        'imageLinks': imageLinks?.toMap(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VolumeInfo].
  factory VolumeInfo.fromJson(String data) {
    return VolumeInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VolumeInfo] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      publisher,
      publishedDate,
      description,
      industryIdentifiers,
      readingModes,
      pageCount,
      printType,
      categories,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      panelizationSummary,
      imageLinks,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
