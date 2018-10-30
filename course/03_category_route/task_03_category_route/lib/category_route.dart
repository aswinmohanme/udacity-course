// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

// TODO: Check if we need to import anything
import 'category.dart';

// TODO: Define any constants
final _backgroundColor = Colors.green[100];

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    List<Category> categories = zip([_categoryNames, _baseColors])
        .map((pair) => Category(
              name: pair[0],
              color: pair[1],
              iconLocation: Icons.account_balance_wallet,
            ))
        .toList();

    Widget _buildCategoryWidgets(List<Widget> categories) {
      return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) => categories[index],
      );
    }

    // TODO: Create a list view of the Categories
    final listView = Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
      color: _backgroundColor,
    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      title: Text(
        'Unit Conversion',
        style: TextStyle(fontSize: 30.0, color: Colors.black),
      ),
      elevation: 0.0,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
