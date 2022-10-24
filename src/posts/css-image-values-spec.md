---
layout: "../layouts/BlogPost.astro"
title: "The CSS Image Values Spec"
slug: css-image-values
description: "The CSS Image Values Spec allows you to cleanly blow up pixel art on the web."
added: "Jun 07 2015"
tags: [technical]
---

I started looking at the [CSS Image Values Specification](http://dev.w3.org/csswg/css-images-3/) recently and was fascinated by it, particularly the [image rendering](http://dev.w3.org/csswg/css-images-3/#the-image-rendering) section.

Say you take a small image sprite, like one that you would use in a video game:

<img src="/assets/linksprite.gif" style="width:32px;" />

Now, when you decide to blow this picture up, something happens that's not totally unexpected.

<img src="/assets/linksprite.gif" style="width:300px;" />

It's all blurry and gross. As we expect.

But, there's a better way to deal with it. Add the following into your CSS:

```css
.image-class {
	/* Firefox */
	image-rendering: -moz-crisp-edges;

	/* Safari */
	image-rendering: -webkit-optimize-contrast;

	/* IE */
	-ms-interpolation-mode: nearest-neighbor;

	/* Everything Else */
	image-rendering: pixelated;
}
```

Yes, it's a lot for one effect, but hey. It's cross-browser.

Now check out your glorious image!

<img src="/assets/linksprite.gif" style="width:300px; image-rendering: -moz-crisp-edges; image-rendering: -webkit-optimize-contrast; -ms-interpolation-mode: nearest-neightbor; image-rendering: pixelated;" />

Whoa! Beautiful! So let's dig into this. Why are there SO many different values? Well, put simply, each browser just hasn't hit standard yet. But, it's coming.
The CSS Image Values spec is still being constantly updated and reviewed. It only just recently consolidated all of these values (`crisp-edges`, `optimize-contrast`, `nearest-neighbor`, and `pixelated`) by officially standardizing `image-rendering` to have either `pixelated`, `crisp-edges`, or `auto` as its values.
As you can see [in the example on the spec website](http://dev.w3.org/csswg/css-images-3/#the-image-rendering), `auto` and `crisp-edges` have their own uses, but `pixelated` is best for this pixel art example.

One thing that will be interesting to look out for moving forward is the Microsoft Edge browser. They're slowly phasing out all of the `-ms` prefixes, so I'm personally curious to see it they're going to use the standard and use `image-rendering: pixelated` or if they're going to stick to the `nearest-neighbor` idea. Only time will tell.

Enjoy making giant pixelated images, until next time!
