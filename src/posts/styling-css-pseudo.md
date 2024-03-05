---
layout: "../layouts/BlogPost.astro"
title: "Styling a CSS pseudo-element with JavaScript"
slug: styling-css-pseudo
description: "JavaScript can't target pseudo-elements, but that doesn't mean you can't mess with them!"
added: "Mar 05 2024"
tags: [technical]
---

In JavaScript, you can't do some kind of query selector like:

```js
document.querySelector("div::after");
```

But, with the power of CSS variables, you can still change the styles of those selectors with JavaScript!

In your CSS, pick a variable name and assign it to something:

```css
div::after {
	/* 50px is the default value if --somewidth doesn't exist */
	width: var(--somewidth, 50px);
}
```

And in your JavaScript, you use the [`setProperty` function](https://developer.mozilla.org/en-US/docs/Web/API/CSSStyleDeclaration/setProperty) to assign a value to that variable!

```js
// this is just grabbing a div, you can change it to select any element
const element = document.getElementsByTagName("div")[0];

element.style.setProperty("--somewidth", "50%");
```

So there ya go! You can obviously make this more complex as needed. Here's an example of all of this in action! It's a template I made for tracking fundraising efforts (feel free to use the template [on CodePen](https://codepen.io/cassidoo/pen/KKYpjMJ)).
Specifically note **line 38** in the CSS, and **line 25** in the JavaScript!

<p class="codepen" data-height="300" data-theme-id="light" data-default-tab="css,result" data-slug-hash="KKYpjMJ" data-user="cassidoo" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/cassidoo/pen/KKYpjMJ">
  Money goal tracker template</a> by Cassidy (<a href="https://codepen.io/cassidoo">@cassidoo</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>
