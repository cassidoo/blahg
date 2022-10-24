---
layout: "../layouts/BlogPost.astro"
title: "Closures in JavaScript"
slug: closures-in-js
description: "Closures in JavaScript are an important concept that all JS devs should know. So here's a summary for you."
added: "Feb 25 2016"
tags: [technical]
---

JavaScript closures are a pretty essential concept to know if you're a JS dev.
But, sadly, if you were to ask the average junior developer what they are, more
often than not you won't get a solid answer. I'm writing this so that YOU can
be the knowledge bomb-dropper in the room. Let's do this.

Okay so the quick summary of a closure is that from an inner function, it gives
you access to an outer function's scope. So essentially, you can create
_private variables_. In JavaScript. Whoa.

Moving backwards a bit, JS has both local and global variables. A local variable
looks something like this (see `magic`):

```js
function yolo() {
	var magic = 3.14;
	return magic;
}
```

And a global variable looks something like this (again, see `magic`):

```js
var magic = 3.14;
function yolo() {
	return magic;
}
```

So global variables live forever (or as long as your window/website is open),
and local variables are created when the function is invoked and deleted when
the function has finished up. But if you have a variable that you want
available to all of your functions, you might run into some security issues.
Because if you use a global variable, it's not only accessible to all of your
functions in your JS, but it's also available to any scripts that might be
executed on your site.

There has to be a better way.

Oh wait, that's the whole point of this blog post.

_Closures!_

Closures are the primary way to have data privacy in your JavaScript. A super
duper basic example of this is a simple iterator, where every time you call
`iterate()`, a counter is increased by 1.

```js
function iterate() {
	var count = 0;
	return function () {
		return (count += 1);
	};
}
```

So to run that function, you'd run the following lines and get the shown output:

```js
> var x = iterate();
> x();
1
> x();
2
> x();
3
```

...and so forth. It looks a little funny, but it's because `iterate()` has
become a closure. It consists of the local variable `count`, and the returned
function.

You'll see a lot of closures if you do functional programming in JavaScript (and
along the same lines, currying), and also a lot in event handlers, in callbacks,
and also just when you're coding or reading code in JS that involve data
privacy. Definitely try messing with them if you haven't yet. It'll be super
helpful for you in the long run.
