import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    this.email,
    this.name,
    this.team_id,
    this.pts,
    this.team_members,
  });

  final String? email;
  final String? id;
  final String? name;
  final String? team_id;
  final String? pts;
  final List<String>? team_members;

  static const empty = UserModel(id: '');
  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [email, id, name];

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        email = doc.data()!["email"] as String,
        pts = doc.data()!["pts"] as String,
        name = doc.data()!["name"] as String,
        team_id = doc.data()!["team_id"] as String,
        team_members = [];

  UserModel copyWith({
    final List<String>? team_members,
  }) {
    return UserModel(
      email: email,
      id: id,
      name: name,
      team_id: team_id,
      pts: pts,
      team_members: team_members,
    );
  }
}
