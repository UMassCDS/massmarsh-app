import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/organization/organization.dart';
import '../services/org_service.dart';
import 'auth_provider.dart';

// ---------------------------------------------------------------------------
// OrgService provider
// ---------------------------------------------------------------------------

final orgServiceProvider = Provider<OrgService>((ref) => OrgService());

// ---------------------------------------------------------------------------
// List of orgs the current user belongs to
// ---------------------------------------------------------------------------

final myOrgsProvider = FutureProvider<List<Organization>>((ref) async {
  final auth = ref.watch(authProvider);
  final token = auth.token;
  if (token == null) return [];
  return ref.read(orgServiceProvider).getMyOrgs(token);
});

// ---------------------------------------------------------------------------
// Selected org state
// ---------------------------------------------------------------------------

class SelectedOrgNotifier extends Notifier<Organization?> {
  @override
  Organization? build() => null;

  void select(Organization org) => state = org;

  void clear() => state = null;
}

final selectedOrgProvider =
    NotifierProvider<SelectedOrgNotifier, Organization?>(
        SelectedOrgNotifier.new);

/// Convenience: the currently selected org's id (throws if none selected).
final selectedOrgIdProvider = Provider<int>((ref) {
  final org = ref.watch(selectedOrgProvider);
  if (org == null) throw StateError('No org selected');
  return org.id;
});
