import Person from "./models/person";

export default function(){
  this.transition(
    this.between({childOf: '.time'}),
    this.use('toDown')
  );
  this.transition(
    this.between({childOf: '.mood'}),
    this.use('crossFade', {duration: 3000})
  );
  this.transition(
    this.between({class: 'demo-if'}),
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
    this.fromContext({instanceOf: Person}),
    this.toContext(higherPerson),
    this.use('toLeft')
  );
  this.transition(
    this.fromContext({instanceOf: Person}),
    this.toContext(lowerPerson),
    this.use('toRight')
  );
}

function higherPerson(change){
  return change.leaving.context.get('id') < change.entering.context.get('id');
}

function lowerPerson(change){
  return change.leaving.context.get('id') > change.entering.context.get('id');
}
