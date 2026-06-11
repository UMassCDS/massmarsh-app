import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/protocol_service.dart';

final protocolServiceProvider = Provider<ProtocolService>(
  (ref) => ProtocolService.instance,
);

/// Fetches and caches the active protocol for a given org ID.
/// Use as: ref.watch(activeProtocolProvider(orgId))
final activeProtocolProvider =
    FutureProvider.family<ProtocolDefinition, int>((ref, orgId) async {
  return ref.read(protocolServiceProvider).fetchAndCache(orgId);
});
