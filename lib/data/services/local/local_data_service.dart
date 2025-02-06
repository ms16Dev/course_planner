// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../config/assets.dart';
import '../../../domain/models/summary/summarry.dart';
import '../../../domain/models/field/field.dart';
import '../../../domain/models/subject/subject.dart';
import '../../../domain/models/user/user.dart';

class LocalDataService {
  List<Field> getFields() {
    return [
      const Field(
        name: 'Computer Science',
        imageUrl: 'https://th.bing.com/th/id/OIP.L-YnUrseh_GARPg44gFjgQHaE8?rs=1&pid=ImgDetMain',
      ),
      const Field(
        name: 'Machine Learning',
        imageUrl: 'https://th.bing.com/th/id/OIP.y8lkIwWEp22S_9T1J8-goQHaE8?rs=1&pid=ImgDetMain',
      ),
      const Field(
        name: 'Artificial Intelligence',
        imageUrl: 'https://th.bing.com/th/id/OIP.tFrPTQeOkdxPeRbKpDJZgwHaFF?rs=1&pid=ImgDetMain',
      ),
      const Field(
        name: 'Software Engineering',
        imageUrl: 'https://th.bing.com/th/id/R.501e2b10f28d1759e94441090af87552?rik=9tWZNE%2b4YTgT8Q&pid=ImgRaw&r=0',
      ),
      const Field(
        name: 'Web Development',
        imageUrl: 'https://th.bing.com/th/id/R.2211a28e0a154c4b34ff8acfb945dba1?rik=FxTk9BfwMf6lUA&pid=ImgRaw&r=0',
      ),
      const Field(
        name: 'Database Management',
        imageUrl: 'https://th.bing.com/th/id/OIP.GSQim60q0HZDFT8Q11C0zAHaEW?rs=1&pid=ImgDetMain',
      ),
      const Field(
        name: 'DevOps',
        imageUrl: 'https://th.bing.com/th/id/OIP.w8W9VW9I5xa8BNxTwE8gnQHaE1?rs=1&pid=ImgDetMain',
      ),
    ];
  }

  Future<List<Summarry>> getSummaries() async {
    final json = await _loadStringAsset(Assets.summaries);
    return json.map<Summarry>((json) => Summarry.fromJson(json)).toList();
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
