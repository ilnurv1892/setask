class Task {
  String? uid;
  String? title;
  String? owner;
  String? team;

  Task(this.uid, this.title, this.owner, this.team);

  Task.fromMap(dynamic snapshot) {
    uid = snapshot.id.toString();
    title = snapshot['title'].toString();
    owner = snapshot['owner'].toString();
    team = snapshot['team_id'].toString();
  }
}
