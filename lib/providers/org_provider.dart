import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/organization/organization.dart';
import '../services/auth_cache.dart';
import '../services/org_service.dart';
import 'auth_provider.dart';

// ---------------------------------------------------------------------------
// OrgService provider
// ---------------------------------------------------------------------------

final orgServiceProvider = Provider<OrgService>((ref) => OrgService());

// ---------------------------------------------------------------------------
// List of orgs the current user belongs to
// ---------------------------------------------------------------------------

// Falls back to the cached list when the network call fails, so org
// selection works with no signal instead of hanging on a request that
// cannot complete
final myOrgsProvider = FutureProvider<List<Organization>>((ref) async {
  final auth = ref.watch(authProvider);
  final token = auth.token;
  if (token == null) return [];

  try {
    final orgs = await ref.read(orgServiceProvider).getMyOrgs(token);
    await AuthCache.saveOrgs(orgs);
    return orgs;
  } catch (_) {
    return AuthCache.readOrgs();
  }
});

// ---------------------------------------------------------------------------
// Selected org state
// ---------------------------------------------------------------------------

class SelectedOrgNotifier extends Notifier<Organization?> {
  static const _orgIdKey = 'selected_org_id';
  static const _storage = FlutterSecureStorage();

  @override
  Organization? build() {
    _restore();
    return null;
  }

  // Restores the last selected org so it doesn't silently reset on cold start
  Future<void> _restore() async {
    final savedId = await _storage.read(key: _orgIdKey);
    if (savedId == null) return;

    // Waits for AuthNotifier to know the token first, so this never reads
    // myOrgsProvider before it's set and silently fails to match every boot
    await ref.read(authProvider.notifier).ready;

    final orgs = await ref.read(myOrgsProvider.future);
    if (state != null) return;
    for (final org in orgs) {
      if (org.id.toString() == savedId) {
        state = org;
        return;
      }
    }
  }

  void select(Organization org) {
    state = org;
    _storage.write(key: _orgIdKey, value: org.id.toString());
  }

  void clear() {
    state = null;
    _storage.delete(key: _orgIdKey);
  }
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
