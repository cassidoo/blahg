---
layout: "../layouts/BlogPost.astro"
title: "A Brief History of the PNG"
slug: png-history
description: "The PNG file format has been around forever... sort of. Not really."
added: "Jun 15 2015"
tags: [technical]
---

I remember clear as day several years ago (2007 to be more exact) when transparent PNGs (Portable Network Graphics) became a reality. I was pretty young, at 15 years old, and I was checking out this web design/development forum I regularly looked at for help as I was teaching myself to code.

I logged on, and the site was UGLY. I was so confused. They had pictures of what could have been beautiful icons and graphics, but they all just had these horrible off-color borders and backgrounds.

There was a banner at the top that told me to download Internet Explorer 7, and my life changed. The transparent PNG. Everything was beautiful and shiny. You could have a multi-color background and an image on top of that, and it wouldn't have to line up perfectly to line up with the background.

Now, later, I found out that Microsoft had this whole alpha channel transparency deal figured out since IE5.5, with a proprietary filter called `AlphaImageLoader`. You could add this chunk of CSS and be all set:

```css
img {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(...);
}
```

But, back then, there was no `filter` property in CSS. It was a totally proprietary extension by Microsoft that only worked in IE. And there were _so_ many bugs with it back then, it was beautiful. If you used a PNG background image, links wouldn't often be clickable, and forms might have become unfocusable. It was slow to load. Background images couldn't be positioned nor repeated. Ah, the past. So broken. So delightful.

The PNG was first specified in October of 1996, and became an official international standard in November of 2003. There was a [period of time though when it wasn't so popular](http://www.libpng.org/pub/png/slashpng-1999.html).
Fast forward to now, and the PNG is the most used lossless image compression format on the internet. It was originally created to be a replacement of the GIF, but alas, you can't replace this:

![pic](https://i.imgur.com/7GuGra2.gif)

PNG was decided early on to be a single-image format. The developers of PNG tried to change that in 2001 (again, to compete with the GIF) by making the MNG (Multiple-image Network Graphics), but that never took off. Mozilla also tried by making the APNG (Animated Portable Network Graphics) in 2008, but that never really caught on, either.

Outside of animation, though, the PNG excels relative to the GIF. A PNG file with the same information as a GIF is almost always smaller, by as much as 50%. Dang, son.

The PNG today is great.
It supports grayscale, transparency, palette-based images, non-palette-based RGB[A] images, _and_ it's lossless. There's [whole books](http://www.libpng.org/pub/png/book/cover.html) dedicated to how revolutionary it was back in the day.

So take some time, [read up about it](https://en.wikipedia.org/wiki/Portable_Network_Graphics), and appreciate history, darn it.
