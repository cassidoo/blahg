---
layout: "../layouts/BlogPost.astro"
title: "Pure CSS3 Text Carousel"
slug: css-text-carousel
description: "I built a pure CSS text carousel because I couldn't find one I liked. Here's how I did it, and tweaks for later."
added: "Mar 04 2016"
tags: [technical]
---

Recently while building a pretty typical static site, I found the need to have
some quotes scrolling through a page. Classic job for a carousel. After doing
some hunting online though, almost all carousels either used jQuery or Bootstrap
as a dependency, and/or just had some really nasty CSS. And, also, I only found
ONE carousel in all my hunting that was just for text, not for pictures.

So, it came time to act. AKA build it myself.

This is the result I came up with. It's a little hacky, but it's pure CSS3 and
is perfect for quotes, if I do say so myself:

<p data-height="268" data-theme-id="0" data-slug-hash="MyaWzp" data-default-tab="result" data-user="cassidoo" class="codepen">See the Pen <a href="http://codepen.io/cassidoo/pen/MyaWzp/">Pure CSS3 Text Carousel</a> by Cassidy Williams (<a href="http://codepen.io/cassidoo">@cassidoo</a>) on <a href="http://codepen.io">CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>

The code isn't too crazy, if you read it out. The first thing I had to add in
the HTML was the wrappers for the quotes. The `<div>` tags for
`content-slider`, `slider`, and `mask` (let's call these the _Trio of Mystery_)
were all purely for the actual box holding the quotes and making sure that they
disappeared when they "faded away" (I use quotes because of how it's written,
you'll see).

Then you see that there's an unordered list, where each `<li>` has an animation
class and contains a quote and its source. This is probably the most
straightforward part of the code.

Now let's get crazy.

So in the CSS you'll see basic body stuff, and then the _Trio of Mystery_. Like
I said before, pretty straightforward, just creates a container and a mask that
makes innocent `<div>`s like you disappear. Now, you'll notice a little further
down that the `.slider li` section has something a little gross in there. This
is where things get hard-coded.

```css
height: 320px;
position: absolute;
top: -325px;
```

Here, you'll notice that the `<li>` are being set at a height and positioned
325px above their normal position. That's because the container is set at 320px
high. The `top` part could have had `-321px` and it would have been fine. This
is how the _Trio of Mystery_ gets away with hiding its stowaways.

If you look after this section, you'll get to the animations. Now, this is the
part that would have been very, very significantly improved had I used a CSS
preprocessor. There's a LOT of repetition here, and a lot of things hard-coded
for 5 quotes (no more, no less). The way each animation works is that each
quote is hidden at `-325px` (just out of sight, again, thanks to the _Trio of
Mystery_), and then when it's that quote's turn, it scrolls into view at 100%
opacity, and after 3 seconds, it fades (when really, its position is just moving
at the same time as the opacity is lowered to zero). Because each of the
animations last the same amount of time and goes in one direction
(`15s linear infinite`), we just break up the 100% into approximately fifths so
that the quotes can be spread out (the first one "exiting" at 20%, the next at
around 40%, etc).

## But alas, what now?

Honestly, this works for what my original needs were. But, this mini-project
could DEFINITELY be improved. Some of my ideas for a next time:

- Use a pre-processor
- Save CSS variables for the number of quotes that exist
- Generate HTML code based on the number of quotes
- Divide the percentages for the animations based on the number of quotes

Until next time!
