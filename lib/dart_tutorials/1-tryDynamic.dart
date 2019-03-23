void main() {
  Person person = new Person();
  person.leg = "person leg";
  NotPerson notPerson = new NotPerson();
  notPerson.leg = "not person eg";
  tryDynamic(person);
  tryDynamic(notPerson);
}
class Person{
  String leg;
}

class NotPerson{
  String leg;
}

void tryDynamic(dynamic a){
  print(a.leg);
//  int ab;
//  assert(ab != null, "ab not null");
//  String nullString = "nullString";
//  String nullString ;
//  nullString ??= "demo string";
//  print(nullString);

}
