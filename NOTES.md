These are the speaker's notes that accompany the slides.

Outline
-------

- Title Slide

  I'm going to talk about how to incorporate animations and
  transitions into your Ember app. But before we dive into "how", I
  want to mention the "what" and the "why".

- Not this kind

  The web has had animations for a long time. But this is really not
  what we're talking about. What we're talking about is the kind of
  animation-enhanced UIs that went mainstream with the introduction of
  iOS.

- Physical Metaphors

  Question: what was new about iOS 7? "Flat design". Repudiation of
  skeuomorphism. [Define skeuomorph.]

  But that's not quite the whole story: Apple (and others) are shying
  away from skeuomorphic *textures*, but they're *not* shying away
  from skeumoprhic *actions*.

- Momentum Scroll Example

  Momentum scrolling appeals to the user's intuitive sense of how
  physical things behave. It's essentially skeuomoprhic. We're copying
  an incidental feature of another medium into a new medium to make it
  more relatable.

  To preserve the illusion, any delay has to be imperceptible. This is
  why we care about "jank".

- Slide Example

  Our monkey brains are not adapted to things instantly appearing and
  disappearing. If we can provide physical simulations for where
  "things" are "coming from" and "going to", we engage the user's
  brain in a much more natural way, and we make it easier for them to
  "navigate around".

  Notice that I can't even talk about UI design without physical
  metaphors. Nobody's really navigating anywhere. 

  What we do is deeply weird. We spend years training ourselves to be
  able to operate in highly-abstract domains. Abstraction is our most
  powerful tool, but finding ways to connect normal people with
  powerful abstractions is deeply challenging.

- Ember and Animation

  Broadly speaking, there are two classes of animations in an Ember
  app: ones that involve a single route, and ones that move between
  routes. 

- Simple Animations

  Animations within a single route are relatively easy, and can mostly
  be contained within the view layer using components.

  [Demo an adaptive form, and explain each piece. Possibly just use the order editor.]

- Reusable components

  - measurable-box
  - growable-box
  - animated-if
  - animated bound value update with both old and new values on screen concurrently

- Inter-route animations

  These are harder, because they cut across all layers: views,
  controllers, and routes. But thanks to the promise-driven router,
  they're generally possible if you use a few of Ember's key features.

- Nested route transition

  Nesting is great becaue the parent route stays rendered.

  - needs willTransition to get back out before the child is destroyed

- Modals

  - named outlets
  - query params

- model-to-model fade

  - trigger the load & fade immediately
  - trigger the fade back in once the new model is ready

  

- This Presentation

  Is an ember app, and here's the source. I threw the whole app
  together in only about a day, which is a testament to just how far
  Ember has come. Thanks to all contributors, and a special shout out
  to Jo Liss and Stephan Penner for ember-cli.

Idea Stack
----------

- Animations within a single route
  - simplest case: bind a class and use transitions
  - measured view
  - dynamic spacer
  - animated-if
  - animate a bound value updating

- Animations between routes
  - nested routes are your friend
    - master / detail animated transition pattern

    - aside: another reason to use nested routes is to quantine
      expensive views so that their parents can render faster, giving
      the user faster access to navigation, etc.

  - named outlets are your friend
    - modals
      - problem of components with their own many sub-routes: can we use queryparams to solve this?
