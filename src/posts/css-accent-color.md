---
layout: "../layouts/BlogPost.astro"
title: "Use CSS accent-color to style your inputs"
slug: css-accent-color
description: "If you want a quick styling win, you can set a color for your input and progress HTML tags!"
added: "Jan 30 2024"
tags: [technical]
---

If you've ever wanted to style HTML `<input>` tags in your projects, you know it's a bit tricky to deal with the labels and making everything look custom and themed.

This won't go wildly into all the ways you can style them, BUT, if you want a quick win to change the color of those controls, use the CSS `accent-color` property!

`accent-color` works on the following HTML elements:

- `<input type="checkbox">`
- `<input type="radio">`
- `<input type="range">`
- `<progress>`

You can style all of these by just plopping it in your root:

```css
:root {
	accent-color: #ccff00;
}
```

Or, if you want different elements to have different colors, you can style them all individually!

<p class="codepen" data-height="300" data-theme-id="light" data-default-tab="css,result" data-slug-hash="OJqQQwg" data-editable="true" data-user="cassidoo" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/cassidoo/pen/OJqQQwg">
  accent-color demo</a> by Cassidy (<a href="https://codepen.io/cassidoo">@cassidoo</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

[Here's the documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/accent-color) if you want to learn more!

Byyyyye <3
