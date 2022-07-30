// ignore_for_file: unnecessary_raw_strings, public_member_api_docs

const getParticipantByEmailDoc = r'''
query GetUserByEmail($vEmail: String) {
  participant(where: {email: {_eq: $vEmail}}) {
    id
    email
    first_name
    last_name
    profile_photo
  }
}
''';
