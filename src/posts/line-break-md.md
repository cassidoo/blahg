---
layout: ../layouts/BlogPost.astro
title: Making a single line break in markdown
slug: line-break-md
description: Here's how you can add single line breaks in your markdown documents!
tags:
  - technical
added: 2023-12-10T06:00:00.000Z
---

Sometimes when you write markdown, you'll write some paragraph...

and then you hit "Enter" twice to make another paragraph.

```
Like this...

...and then this.
```

This will render:

```html
<p>Like this...</p>
<p>...and then this.</p>
```

But, sometimes you want to make a single line break, kind of like in HTML where you have:

```html
<p>
Like this... <br />
...and then this.
</p>
```

In markdown, you **can** just drop in a `<br />` and it'll work perfectly fine. But, if you want to keep your markdown HTML-less, you can add a backslash `\` after your line, like so!

```
Like this...\
...and then this.
```

This is supported in _most_ markdown processors, but not all of them. Definitely check on the one you're using before you push to prod. Some processors also allow you to add a double space at the end of a line as well (truly just `  `, hit your spacebar twice), but since a lot of code editor setups trim empty spaces, I personally prefer the backslash way.

Have\
fun!
