import 'dart:io';

import 'package:dd3/features/hero/widgets/detail_modal.dart';
import 'package:dd3/features/shared/ui/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('Detail Modal', () {
    setUp(() {
      HttpOverrides.global = null;
    });

    testWidgets('should render a simpel detail modal', (widgetTester) async {
      // arrange

      // act

      await widgetTester.pumpApp(
        const DetailModal(
          thumbnail: 'd',
          title: 'title',
          extra: Text('extra'),
        ),
      );

      // assert
      expect(find.byType(NetworkImageWidget), findsOneWidget);
      expect(find.text('title'), findsOneWidget);
      expect(find.text('extra'), findsOneWidget);
    });
  });
}
