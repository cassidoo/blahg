---
layout: "../layouts/BlogPost.astro"
title: "Removing trailing space underlines from groups of anchor tags"
slug: trailing-underlines
description: "Sometimes when you have a bunch of anchor tags, the trailing spaces around them are underlined. Here's how to fix that."
added: "Jun 14 2023"
tags: [technical]
---

Recently as I was working on some styles for my blog, I ran into an issue where I had a block of anchor tags rendered in JSX, and they didn't look right.

![A list of tags with trailing spaces that were underlined](/assets/tagsspaces.png)

All of the links had trailing spaces, and those spaces were being underlined!

## How did we get here?

I had an array of tags, and they were being displayed in a `<div>`, like so:

```jsx
<div>
	{tags.map((tag) => (
		<a class="tag" href={`#`}>
			#{tag}
		</a>
	))}
</div>
```

I didn't fully understand why the underlined, trailing space was being rendered, and weeped as the gods of JavaScript mocked me.

After getting over it, I tried changing the `word-wrap` and other various CSS styles to fix the links, with no success. I admit it took me way longer than I expected to find a solution, and I wrote this blog to save me from my future self who will inevitably run into this problem again.

## How did we overcome?

Turns out, if you add `display: inline-block`, it removes the underlines in the spaces!

Here's a CodePen to show this lil CSS trick in action!

<p class="codepen" data-height="300" data-theme-id="light" data-default-tab="css,result" data-slug-hash="BaGjpBe" data-user="cassidoo" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/cassidoo/pen/BaGjpBe">
  Underlined spaces in blocks of links</a> by Cassidy (<a href="https://codepen.io/cassidoo">@cassidoo</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

The end, stay safe, nerds.
