class ApiResponse<D, M> {
  final D rawData;
  M model;
  final ApiError apiError;
  bool success;

  ApiResponse({this.model, this.rawData, this.apiError, this.success});
}

class ApiError {
  final int code;
  final String error;

  ApiError(this.code, this.error);
}