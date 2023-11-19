---
layout: ../layouts/BlogPost.astro
title: 'A use-case for CSS :has()'
slug: css-has
description: 'I found an unexpected use case for the newly, fully supported :has() selector!'
tags:
  - technical
added: 2023-11-19T07:09:43.844Z
---

In case you missed it, [the CSS `:has()` selector](https://developer.mozilla.org/en-US/docs/Web/CSS/:has) is [now supported](https://caniuse.com/css-has) in all major browsers!

It's a very weird (but cool) selector that allows you to select elements that contain a specific thing, like for example `a:has(img)` selects all anchor `<a>` tags that have an `<img>` inside.

I've thought it was really interesting, but I've never actually had a good use-case to use it myself besides... adding captions to images or something. But, that changed today!

On [my personal website](https://cassidoo.co) (which I first made a solid 4 years ago with plain HTML, CSS, and JS, and I admit I haven't really updated since besides some words and links), I have a dark mode toggle. It's probably rarely if ever clicked (I should probably modernize it with some `prefers-color-scheme` stuff sometime), but when you do, it does what you expect, it turns on dark mode.

Under the hood, that toggle adds a `.dark-mode` class to the `<body>`, and in the CSS, we style nearly everything based on that:

```css
html,
body {
	/* ... */
	background: var(--white);
	color: var(--black);
}

body.dark-mode,
body.dark-mode a {
	background: var(--black);
	color: var(--white);
}

/* ... */
```

Now, here's the problem: the body doesn't always take up the entire height of the page. I was cleaning up and organizing some code, and when I put the `background` and `color` properties under `html, body`, that meant that the `html` was keeping its white background and black text color, even in dark mode.

![Light things on dark mode](/assets/disgustingwhitespace.png)

BUT `:has()` came to my rescue! Because it kind of acts like a parent selector, I'm able to say "if the `<html>` has `.dark-mode` inside of it, that means it should have certain styles." One line change later we had this:

```css
html:has(.dark-mode),
body.dark-mode,
body.dark-mode a {
	background: var(--black);
	color: var(--white);
}
```

...and voilà, just like that, all of my problems I've ever had are solved!
