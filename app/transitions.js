import Person from "./models/person";

export default function(){
  this.transition(
    this.childOf('.time'),
    this.use('toDown')
  );
  this.transition(
    this.childOf('.mood'),
    this.use('crossFade', {duration: 3000})
  );
  this.transition(
    this.hasClass('demo-if'),
    this.use('toDown')
  );
  this.transition(
    this.fromRoute('parent-child-transition.index'),
    this.toRoute('parent-child-transition.detail'),
    this.use('toLeft')
  );
  this.transition(
    this.fromRoute('parent-child-transition.detail'),
    this.toRoute('parent-child-transition.index'),
    this.use('toRight')
  );
  this.transition(
    this.fromModel({instanceOf: Person}),
    this.toModel(higherPerson),
    this.use('toLeft')
  );
  this.transition(
    this.fromModel({instanceOf: Person}),
    this.toModel(lowerPerson),
    this.use('toRight')
  );
}

function higherPerson(otherPerson){
  return this.get('id') > otherPerson.get('id');
}

function lowerPerson(otherPerson){
  return this.get('id') < otherPerson.get('id');
}
