---
layout: ../layouts/BlogPost.astro
title: Base CSS for your text-based pages
slug: base-css
description: >-
  Sometimes the defaults your web browser gives you aren't very cute. Here's a
  lil snippet I use to fix that.
tags:
  - technical
added: 2024-01-19T07:56:14.460Z
---

If you don't want to deal with styling a mostly text-based HTML document, plop these lines in and it'll look good:

```css
html {
  font-family: 'Helvetica Neue', 'Helvetica', 'Arial', sans-serif;
  font-size: 1.3em;
  max-width: 40rem;
  padding: 2rem;
  margin: auto;
  line-height: 1.5rem;
}
```

I use this for a bunch of projects where I just need some plain ol' styling that is better than the defaults (and that I can easily add to), like [AI Ipsum](https://ai-ipsum.app/) and [W-9 Crafter](https://github.com/cassidoo/w9-crafter).

You can save [cass.run/basecss](https://cass.run/basecss) if you want a quick link to the snippet, and here's a little demo of what it looks like:

<p class="codepen" data-height="300" data-theme-id="light" data-default-tab="result" data-slug-hash="YzgVYWV" data-editable="true" data-user="cassidoo" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/cassidoo/pen/YzgVYWV">
  Cassidy's base CSS demo</a> by Cassidy (<a href="https://codepen.io/cassidoo">@cassidoo</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>
