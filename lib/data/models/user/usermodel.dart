enum UserRole { admin, user, moderator, guest }

enum AccountStatus { active, suspended, deleted, pending }

class User {
  final String id;
  final String email;
  final String? phoneNumber;
  final String firstName;
  final String lastName;
  final DateTime createdAt;
  final DateTime lastLoginAt;
  final UserRole role;
  final String? profileImageUrl;

  // Account Status Flags
  final bool isAvailable;
  final bool isAccountLocked;
  final bool isBlocked;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final bool isTwoFactorEnabled;
  final AccountStatus status;

  // Account Details
  final int loginAttempts;
  final DateTime? lockoutEnd;
  final DateTime? passwordLastChanged;
  final Map<String, dynamic>? metadata;
  final List<String> deviceTokens;
  final Map<String, bool> permissions;
  final String? refreshToken;

  User({
    required this.id,
    required this.email,
    this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.lastLoginAt,
    this.role = UserRole.user,
    this.profileImageUrl,
    this.isAvailable = true,
    this.isAccountLocked = false,
    this.isBlocked = false,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.isTwoFactorEnabled = false,
    this.status = AccountStatus.active,
    this.loginAttempts = 0,
    this.lockoutEnd,
    this.passwordLastChanged,
    this.metadata,
    this.deviceTokens = const [],
    this.permissions = const {},
    this.refreshToken,
  });

  // Computed Properties
  String get fullName => '$firstName $lastName';
  bool get isLocked =>
      isAccountLocked || (lockoutEnd?.isAfter(DateTime.now()) ?? false);
  bool get isActive =>
      status == AccountStatus.active && !isLocked && !isBlocked;
  bool get requiresPasswordChange =>
      passwordLastChanged == null ||
      DateTime.now().difference(passwordLastChanged!).inDays > 90;

  // Copy With Method
  User copyWith({
    String? id,
    String? email,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    UserRole? role,
    String? profileImageUrl,
    bool? isAvailable,
    bool? isAccountLocked,
    bool? isBlocked,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    bool? isTwoFactorEnabled,
    AccountStatus? status,
    int? loginAttempts,
    DateTime? lockoutEnd,
    DateTime? passwordLastChanged,
    Map<String, dynamic>? metadata,
    List<String>? deviceTokens,
    Map<String, bool>? permissions,
    String? refreshToken,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      role: role ?? this.role,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isAvailable: isAvailable ?? this.isAvailable,
      isAccountLocked: isAccountLocked ?? this.isAccountLocked,
      isBlocked: isBlocked ?? this.isBlocked,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      isTwoFactorEnabled: isTwoFactorEnabled ?? this.isTwoFactorEnabled,
      status: status ?? this.status,
      loginAttempts: loginAttempts ?? this.loginAttempts,
      lockoutEnd: lockoutEnd ?? this.lockoutEnd,
      passwordLastChanged: passwordLastChanged ?? this.passwordLastChanged,
      metadata: metadata ?? this.metadata,
      deviceTokens: deviceTokens ?? this.deviceTokens,
      permissions: permissions ?? this.permissions,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  // Factory constructor from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      createdAt: DateTime.parse(json['createdAt']),
      lastLoginAt: DateTime.parse(json['lastLoginAt']),
      role: UserRole.values.firstWhere(
        (role) => role.toString() == 'UserRole.${json['role']}',
        orElse: () => UserRole.user,
      ),
      profileImageUrl: json['profileImageUrl'],
      isAvailable: json['isAvailable'] ?? true,
      isAccountLocked: json['isAccountLocked'] ?? false,
      isBlocked: json['isBlocked'] ?? false,
      isEmailVerified: json['isEmailVerified'] ?? false,
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      isTwoFactorEnabled: json['isTwoFactorEnabled'] ?? false,
      status: AccountStatus.values.firstWhere(
        (status) => status.toString() == 'AccountStatus.${json['status']}',
        orElse: () => AccountStatus.pending,
      ),
      loginAttempts: json['loginAttempts'] ?? 0,
      lockoutEnd: json['lockoutEnd'] != null
          ? DateTime.parse(json['lockoutEnd'])
          : null,
      passwordLastChanged: json['passwordLastChanged'] != null
          ? DateTime.parse(json['passwordLastChanged'])
          : null,
      metadata: json['metadata'],
      deviceTokens: List<String>.from(json['deviceTokens'] ?? []),
      permissions: Map<String, bool>.from(json['permissions'] ?? {}),
      refreshToken: json['refreshToken'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'createdAt': createdAt.toIso8601String(),
      'lastLoginAt': lastLoginAt.toIso8601String(),
      'role': role.toString().split('.').last,
      'profileImageUrl': profileImageUrl,
      'isAvailable': isAvailable,
      'isAccountLocked': isAccountLocked,
      'isBlocked': isBlocked,
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
      'isTwoFactorEnabled': isTwoFactorEnabled,
      'status': status.toString().split('.').last,
      'loginAttempts': loginAttempts,
      'lockoutEnd': lockoutEnd?.toIso8601String(),
      'passwordLastChanged': passwordLastChanged?.toIso8601String(),
      'metadata': metadata,
      'deviceTokens': deviceTokens,
      'permissions': permissions,
      'refreshToken': refreshToken,
    };
  }

  // Compare users
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.email == email &&
        other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ status.hashCode;

  // Helper methods
  bool hasPermission(String permission) => permissions[permission] ?? false;

  bool canPerformAction(String action) {
    if (!isActive) return false;
    return hasPermission(action);
  }

  static User empty() {
    return User(
      id: '',
      email: '',
      firstName: '',
      lastName: '',
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
      status: AccountStatus.pending,
    );
  }
}
