import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_sample/swapi_shared_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _dioProvider = Provider<Dio>((_) => Dio());

class SwapiRepository {
  SwapiRepository(this._read);
  final Reader _read;

  static final provider = Provider((ref) => SwapiRepository(ref.read));

  Future<List<dynamic>> datasFromUrls(List<dynamic> urls) async {
    final list = <dynamic>[];
    try {
      _read(BusyState.provider).busy();
      await Future.forEach<String>(urls as List<String>, (url) async {
        final request = await _read(_dioProvider).get(url);
        list.add(request.data);
      });
    } on DioError catch (e) {
      debugPrint(e.message);
    } finally {
      _read(BusyState.provider).notBusy();
      return list ?? [];
    }
  }

  Future<dynamic> dataFromUrl(String url) async {
    try {
      _read(BusyState.provider).busy();
      final request = await _read(_dioProvider).get(url);
      return request.data;
    } on DioError catch (e) {
      debugPrint(e.message);
    } finally {
      _read(BusyState.provider).notBusy();
    }
  }
}
