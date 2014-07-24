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
  // BEGIN-SNIPPET route-transition-demo
  this.transition(
    this.fromRoute('route-transition.index'),
    this.toRoute('route-transition.detail'),
    this.use('toLeft')
  );
  this.transition(
    this.fromRoute('route-transition.detail'),
    this.toRoute('route-transition.index'),
    this.use('toRight')
  );
  // END-SNIPPET

  // BEGIN-SNIPPET context-dependent-demo
  function higherPerson(otherPerson){
    return this.get('id') > otherPerson.get('id');
  }

  function lowerPerson(otherPerson){
    return this.get('id') < otherPerson.get('id');
  }

  this.transition(
    this.fromModel({instanceOf: Person}),
    this.toModel(higherPerson),
    this.use('toLeft', {duration: 1000})
  );
  this.transition(
    this.fromModel({instanceOf: Person}),
    this.toModel(lowerPerson),
    this.use('toRight', {duration: 1000})
  );
  // END-SNIPPET

  // BEGIN-SNIPPET liquid-box-demo-transition
  this.transition(
    // hasClass('vehicles') is true even during the first render, so
    // we also require fromNonEmptyModel to prevent an animation when
    // the page first loads.
    this.fromNonEmptyModel(),
    this.hasClass('vehicles'),
    this.use('crossFade')
  );
  // END-SNIPPET

}
