---
layout: "../layouts/BlogPost.astro"
title: 'HTML "self-awareness" with sibling indexing in JavaScript'
slug: self-aware-html
description: 'Make your HTML more "self-aware" with a fun little trick to get its own index.'
added: "Jan 28 2024"
tags: [technical]
---

This is a super specific use case, but if you have an HTML element and you want it to be more "self-aware", you can do:

```js
let element = document.getElementById('whatever');

// To get an array of siblings
[...element.parentElement.children]

// To get current index of self
[...element.parentElement.children].indexOf(element)
```

What we're doing here is:

- Getting our HTML element
- Getting the parent of our HTML element
- Getting the children of the parent
- Spreading it into an array (because it's an `HTMLCollection` otherwise, you can also use [`Array.from`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from))
- Getting the index of our element amongst all of its siblings

I figured this out after working on a framework-less project, where I wanted an HTML `<button>` to be able to tell the function it called its own index.

Example HTML:

```html
<div>
	<button onclick="whoami(event)">Some button</button>
	<button onclick="whoami(event)">Some other button</button>
	<button onclick="whoami(event)">And other button</button>
</div>
```

And the corresponding example JavaScript:

```js
function whoami(event) {
	let element = event.currentTarget;
	let currentButtonIndex = [...element.parentElement.children].indexOf(element);
	// ...and so on
}
```

Anyway, I thought this was cool, hope it's useful for you!
