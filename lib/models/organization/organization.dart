import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization.freezed.dart';
part 'organization.g.dart';

@freezed
class Organization with _$Organization {
  const factory Organization({
    required int id,
    required String name,
    required String slug,
    String? description,
    String? contactEmail,
    @Default(true) bool isActive,
    required String userRole, // viewer, contributor, manager, owner
    @Default('public') String defaultVisibility, // public, private, embargo
    int? memberCount,
    DateTime? createdAt,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}
