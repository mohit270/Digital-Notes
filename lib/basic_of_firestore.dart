




// fethcing the data from firestore
  // DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //     .collection('Notes')
  //     .doc("X7rMA1jNQ0ZxnpyvgrTS")
  //     .get();
  // log(snapshot.data().toString());



  // desyning model for our firestore
  // Map<String, dynamic> newuser = {
  //   'color_id': '1',
  //   'creation_date': '27/09/2023 10.40PM',
  //   'note_content': 'adding a entre via vs code',
  //   'note_titile': 'first entry via vs code'
  // };

  //create 

  // adding a content in firestore
  // _firestore.collection('Notes').add(newuser);
  // log('new user save!');

  // _firestore.collection('Notes').doc('my content').set(newuser);
  // log('new user add from a specific key given by me');


  //update

  // user update in firestore from a specific key given by me
  // Map<String, dynamic> updateUser = {
  //   'note_content': 'updating the firestore via vs code',
  //   'note_titile': 'updating user'
  // };
  // _firestore.collection('Notes').doc('my content').update(updateUser);
  // log('user update from a specific key given by me');

  // delete

  // // firestore user deleting via vs code
  // _firestore.collection('Notes').doc('X7rMA1jNQ0ZxnpyvgrTS').delete();
  // log('user delete!');