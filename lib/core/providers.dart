import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

final selectedProjectProvider = StateProvider<Map<String, String>?>((ref) => null);
