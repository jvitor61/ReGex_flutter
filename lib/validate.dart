//create email validadtion function

bool validateEmailAddress (String input){
  const emailRegex = 
    r'[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\-?[0-9]{2}';

  if (RegExp(emailRegex).hasMatch(input)) {
    return true;
  } else {
    return false;
}
}