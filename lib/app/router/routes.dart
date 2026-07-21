/// Named route paths for [GoRouter]. Use these constants everywhere to avoid typos.
abstract final class AppRoutes {
  static const bottomNav = '/bottom-nav';
  static const maintenance = '/maintenance';
  static const preArrivalInspectionScreeninspection = '/preinspection/:id';
  static const charge = '/charge/:id';
  static const contest = '/contest/:id';

  static String bottomNavPath() => '/bottom-nav';
  static String preinspectionPath(String id) => '/preinspection/$id';
  static String chargePath(String id) => '/charge/$id';
  static String contestPath(String id) => '/contest/$id';
}
