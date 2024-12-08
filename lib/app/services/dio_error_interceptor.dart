import 'package:dio/dio.dart';
import '../../utils/helper_widgets/custom_toast.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      CustomToast.showErrorToast(msg: err.response!.data["message"]);
    } else if (err.response?.statusCode == 500) {
      CustomToast.showErrorToast(msg: "Something went Wrong");
      //   CustomToast.showErrorToast(msg: err.response!.data["message"]);
    } else if (err.response?.statusCode == 403) {
      CustomToast.showErrorToast(msg: err.response!.data["message"]);
    } else {
      CustomToast.showErrorToast(msg: "Something went Wrong");
    }
    super.onError(err, handler);
  }
}
