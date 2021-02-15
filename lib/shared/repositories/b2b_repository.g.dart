// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'b2b_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _B2bRepository implements B2bRepository {
  _B2bRepository(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<BaseStatementModel> fetchStatement(initialDate, finalDate) async {
    ArgumentError.checkNotNull(initialDate, 'initialDate');
    ArgumentError.checkNotNull(finalDate, 'finalDate');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'initialDate': initialDate,
      r'finalDate': finalDate
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/b2b/statement',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseStatementModel.fromJson(_result.data);
    return value;
  }
}
