// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

void main() {
  final serializers = new Serializers();

  group('BigInt with known specifiedType', () {
    final data = BigInt.parse('123456789012345678901234567890');
    final serialized = '123456789012345678901234567890';
    final specifiedType = const FullType(BigInt);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('BigInt with unknown specifiedType', () {
    final data = BigInt.parse('123456789012345678901234567890');
    final serialized = ['BigInt', '123456789012345678901234567890'];
    final specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });
}
