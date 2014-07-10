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
}
