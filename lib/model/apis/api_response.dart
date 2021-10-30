class ApiResponse<T> {
  Status status;
  T? data;
  String? message;
  ApiResponse.initial(this.message) : status = Status.INITIAL;
  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    //override toStrign method and return data with status;
    return "Status: $status\n Message :$message\nData : $data";
  }
}

enum Status { INITIAL, LOADING, COMPLETED, ERROR }  // define enum for status;
