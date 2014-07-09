export default function(){
  this.transition(
    this.between(function(){ return /\d\d+/.test(this); }),
    this.use('toDown')
  );
  this.transition(
    this.between(function(change){
      return typeof(this) === 'string' && this.length > 3;
    }),
    this.use('crossFade', {duration: 3000})
  );
}
