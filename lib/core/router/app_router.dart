import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/account_requests/account_requests_screen.dart';
import '../../features/admin/analytics/analytics_screen.dart';
import '../../features/admin/consumption/consumption_mappings_screen.dart';
import '../../features/admin/customers/customers_screen.dart';
import '../../features/admin/dashboard/admin_dashboard_screen.dart';
import '../../features/admin/offers/offer_form_screen.dart';
import '../../features/admin/offers/offers_list_screen.dart';
import '../../features/admin/orders/order_detail_screen.dart';
import '../../features/admin/orders/order_form_screen.dart';
import '../../features/admin/orders/orders_list_screen.dart';
import '../../features/admin/products/product_form_screen.dart';
import '../../features/admin/products/products_list_screen.dart';
import '../../features/admin/profits/profits_screen.dart';
import '../../features/admin/shipments/shipment_detail_screen.dart';
import '../../features/admin/shipments/shipment_form_screen.dart';
import '../../features/admin/shipments/shipments_list_screen.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/request_account_screen.dart';
import '../../features/doctor/account/account_settings_screen.dart';
import '../../features/doctor/accounting/accounting_dashboard_screen.dart';
import '../../features/doctor/accounting/debts_screen.dart';
import '../../features/doctor/accounting/transactions_screen.dart';
import '../../features/doctor/appointments/add_appointment_screen.dart';
import '../../features/doctor/appointments/appointments_screen.dart';
import '../../features/doctor/accounting/expense_form_screen.dart';
import '../../features/doctor/accounting/expenses_screen.dart';
import '../../features/doctor/create_order/create_order_screen.dart';
import '../../features/doctor/dashboard/doctor_dashboard_screen.dart';
import '../../features/doctor/offers/offer_detail_screen.dart';
import '../../features/doctor/offers/offers_screen.dart';
import '../../features/doctor/orders/my_orders_screen.dart';
import '../../features/doctor/patients/add_visit_screen.dart';
import '../../features/doctor/patients/patient_detail_screen.dart';
import '../../features/doctor/patients/patient_form_screen.dart';
import '../../features/doctor/patients/patients_list_screen.dart';
import '../../features/doctor/patients/tooth_photo_archive_screen.dart';
import '../../models/user_profile.dart';
import 'auth_state_provider.dart';

/// Nav is tile/button-driven per spec (admin's 2-2-1 grid, doctor's big
/// buttons), not tab-bar-driven, so each shell is a Dashboard screen whose
/// tiles push named routes rather than a persistent BottomNavigationBar.
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(appAuthStateProvider);
  final refreshNotifier = GoRouterRefreshNotifier(ref);
  ref.onDispose(refreshNotifier.dispose);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final status = authState.value?.status ?? AppAuthStatus.loading;
      // '/request-account' is the signed-out "create an account" entry
      // point (App Store Guideline 3.2) — it must stay reachable without
      // credentials, exactly like '/login'.
      final isPublicRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/request-account';

      if (status == AppAuthStatus.loading) return null;

      if (status == AppAuthStatus.signedOut) {
        return isPublicRoute ? null : '/login';
      }
      if (status == AppAuthStatus.admin) {
        if (isPublicRoute || !state.matchedLocation.startsWith('/admin')) {
          return '/admin';
        }
        return null;
      }
      if (status == AppAuthStatus.doctor) {
        if (isPublicRoute || !state.matchedLocation.startsWith('/doctor')) {
          return '/doctor';
        }
        return null;
      }
      return null;
    },
    refreshListenable: refreshNotifier,
    routes: [
      GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
      GoRoute(
        path: '/request-account',
        builder: (c, s) => const RequestAccountScreen(),
      ),

      // Admin shell
      GoRoute(path: '/admin', builder: (c, s) => const AdminDashboardScreen()),
      GoRoute(
        path: '/admin/products',
        builder: (c, s) => const ProductsListScreen(),
      ),
      GoRoute(
        path: '/admin/products/new',
        builder: (c, s) => const ProductFormScreen(),
      ),
      GoRoute(
        path: '/admin/products/:id',
        builder: (c, s) =>
            ProductFormScreen(productId: s.pathParameters['id']),
      ),
      GoRoute(path: '/admin/orders', builder: (c, s) => const OrdersListScreen()),
      GoRoute(
        path: '/admin/orders/new',
        builder: (c, s) => const OrderFormScreen(),
      ),
      GoRoute(
        path: '/admin/orders/:id',
        builder: (c, s) =>
            OrderDetailScreen(orderId: s.pathParameters['id']!),
      ),
      GoRoute(path: '/admin/profits', builder: (c, s) => const ProfitsScreen()),
      GoRoute(
        path: '/admin/analytics',
        builder: (c, s) => const AnalyticsScreen(),
      ),
      GoRoute(
        path: '/admin/customers',
        builder: (c, s) => const CustomersScreen(),
      ),
      GoRoute(
        path: '/admin/account-requests',
        builder: (c, s) => const AccountRequestsScreen(),
      ),
      GoRoute(path: '/admin/offers', builder: (c, s) => const OffersListScreen()),
      GoRoute(
        path: '/admin/offers/new',
        builder: (c, s) => const OfferFormScreen(),
      ),
      GoRoute(
        path: '/admin/offers/:id',
        builder: (c, s) => OfferFormScreen(offerId: s.pathParameters['id']),
      ),
      GoRoute(
        path: '/admin/shipments',
        builder: (c, s) => const ShipmentsListScreen(),
      ),
      GoRoute(
        path: '/admin/shipments/new',
        builder: (c, s) => const ShipmentFormScreen(),
      ),
      GoRoute(
        path: '/admin/shipments/:id',
        builder: (c, s) =>
            ShipmentDetailScreen(shipmentId: s.pathParameters['id']!),
      ),
      GoRoute(
        path: '/admin/shipments/:id/edit',
        builder: (c, s) =>
            ShipmentFormScreen(shipmentId: s.pathParameters['id']),
      ),
      GoRoute(
        path: '/admin/consumption-mappings',
        builder: (c, s) => const ConsumptionMappingsScreen(),
      ),

      // Doctor shell
      GoRoute(
        path: '/doctor',
        builder: (c, s) => const DoctorDashboardScreen(),
      ),
      GoRoute(
        path: '/doctor/orders',
        builder: (c, s) =>
            MyOrdersScreen(initialFilter: s.uri.queryParameters['filter']),
      ),
      GoRoute(
        path: '/doctor/create-order',
        builder: (c, s) => CreateOrderScreen(profile: s.extra as UserProfile?),
      ),
      GoRoute(path: '/doctor/offers', builder: (c, s) => const OffersScreen()),
      GoRoute(
        path: '/doctor/offers/:id',
        builder: (c, s) => OfferDetailScreen(offerId: s.pathParameters['id']!),
      ),
      GoRoute(
        path: '/doctor/account',
        builder: (c, s) => AccountSettingsScreen(profile: s.extra as UserProfile),
      ),
      GoRoute(
        path: '/doctor/patients',
        builder: (c, s) => PatientsListScreen(profile: s.extra as UserProfile),
      ),
      GoRoute(
        path: '/doctor/patients/new',
        builder: (c, s) {
          final args = s.extra as PatientFormArgs;
          return PatientFormScreen(profile: args.profile, existing: args.existing);
        },
      ),
      GoRoute(
        path: '/doctor/patients/:id',
        builder: (c, s) => PatientDetailScreen(
          patientId: s.pathParameters['id']!,
          profile: s.extra as UserProfile,
        ),
      ),
      GoRoute(
        path: '/doctor/patients/:id/edit',
        builder: (c, s) {
          final args = s.extra as PatientFormArgs;
          return PatientFormScreen(profile: args.profile, existing: args.existing);
        },
      ),
      GoRoute(
        path: '/doctor/patients/:id/visits/new',
        builder: (c, s) => AddVisitScreen(
          patientId: s.pathParameters['id']!,
          args: s.extra as AddVisitArgs,
        ),
      ),
      GoRoute(
        path: '/doctor/patients/:id/teeth/:tooth/photos',
        builder: (c, s) => ToothPhotoArchiveScreen(args: s.extra as ToothArchiveArgs),
      ),
      GoRoute(
        path: '/doctor/accounting',
        builder: (c, s) => AccountingDashboardScreen(profile: s.extra as UserProfile),
      ),
      GoRoute(
        path: '/doctor/accounting/debts',
        builder: (c, s) => DebtsScreen(profile: s.extra as UserProfile),
      ),
      GoRoute(
        path: '/doctor/accounting/transactions',
        builder: (c, s) => TransactionsScreen(profile: s.extra as UserProfile),
      ),
      GoRoute(
        path: '/doctor/appointments',
        builder: (c, s) => AppointmentsScreen(profile: s.extra as UserProfile),
      ),
      GoRoute(
        path: '/doctor/appointments/new',
        builder: (c, s) => AddAppointmentScreen(args: s.extra as AddAppointmentArgs),
      ),
      GoRoute(
        path: '/doctor/accounting/expenses',
        builder: (c, s) => ExpensesScreen(profile: s.extra as UserProfile),
      ),
      GoRoute(
        path: '/doctor/accounting/expenses/new',
        builder: (c, s) => ExpenseFormScreen(profile: s.extra as UserProfile),
      ),
    ],
  );
});

/// Bridges Riverpod's [appAuthStateProvider] into a Listenable so
/// go_router re-evaluates `redirect` every time auth/role state changes,
/// not just on navigation events. Uses `ref.listen` rather than the
/// deprecated `.stream` modifier.
class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(Ref ref) {
    ref.listen(appAuthStateProvider, (_, __) => notifyListeners());
  }
}
