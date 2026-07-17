import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'activity_log_repository.dart';
import 'auth_service.dart';
import 'fcm_service.dart';
import 'order_repository.dart';
import 'product_repository.dart';
import 'stats_repository.dart';
import 'storage_service.dart';
import 'user_repository.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository());
final productRepositoryProvider =
    Provider<ProductRepository>((ref) => ProductRepository());
final orderRepositoryProvider =
    Provider<OrderRepository>((ref) => OrderRepository());
final activityLogRepositoryProvider =
    Provider<ActivityLogRepository>((ref) => ActivityLogRepository());
final statsRepositoryProvider =
    Provider<StatsRepository>((ref) => StatsRepository());
final storageServiceProvider =
    Provider<StorageService>((ref) => StorageService());
final fcmServiceProvider = Provider<FcmService>((ref) => FcmService());
