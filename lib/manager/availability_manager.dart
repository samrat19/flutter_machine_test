
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/availability_response_model.dart';
import '../service/api_service.dart';

final apiManager = Provider<APIService>((ref) => APIService());

final availabilityManager =
    FutureProvider<AvailabilityResponseModel?>((ref) {
  final service = ref.read(apiManager);

  return service.getAvailableTime();
});
