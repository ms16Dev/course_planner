// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../config/assets.dart';
import '../../../domain/models/summary/summary.dart';
import '../../../domain/models/field/field.dart';
import '../../../domain/models/subject/subject.dart';
import '../../../domain/models/user/user.dart';

class LocalDataService {
  List<Field> getFields() {
    return [
      const Field(
        name: 'Europe',
        imageUrl: 'https://rstr.in/google/tripedia/TmR12QdlVTT',
      ),
      const Field(
        name: 'Asia',
        imageUrl: 'https://rstr.in/google/tripedia/VJ8BXlQg8O1',
      ),
      const Field(
        name: 'South America',
        imageUrl: 'https://rstr.in/google/tripedia/flm_-o1aI8e',
      ),
      const Field(
        name: 'Africa',
        imageUrl: 'https://rstr.in/google/tripedia/-nzi8yFOBpF',
      ),
      const Field(
        name: 'North America',
        imageUrl: 'https://rstr.in/google/tripedia/jlbgFDrSUVE',
      ),
      const Field(
        name: 'Oceania',
        imageUrl: 'https://rstr.in/google/tripedia/vxyrDE-fZVL',
      ),
      const Field(
        name: 'Australia',
        imageUrl: 'https://rstr.in/google/tripedia/z6vy6HeRyvZ',
      ),
    ];
  }

  Future<List<Summary>> getSummaries() async {
    final json = await _loadStringAsset(Assets.summaries);
    return json.map<Summary>((json) => Summary.fromJson(json)).toList();
  }

  Future<List<Subject>> getSubjects() async {
    final json = await _loadStringAsset(Assets.subjects);
    return json.map<Subject>((json) => Subject.fromJson(json)).toList();
  }

  Future<List<Map<String, dynamic>>> _loadStringAsset(String asset) async {
    final localData = await rootBundle.loadString(asset);
    return (jsonDecode(localData) as List).cast<Map<String, dynamic>>();
  }

  User getUser() {
    return const User(
      name: 'Sofie',
      // For demo purposes we use a local asset
      picture: 'assets/user.jpg',
    );
  }
}
