---
layout: "../layouts/BlogPost.astro"
title: "Adding Keyboard Shortcuts to your React Apps"
slug: keyboard-shortcuts-react
description: "Using the Mousetrap library, you can add keyboard shortcuts to your React apps."
added: "Aug 03 2015"
tags: [technical]
---

I love working with [React](http://facebook.github.io/react/). And I love cool
keyboard shortcuts. Luckily, the [Mousetrap](https://craig.is/killing/mice)
keyboard shortcut library works really well with React. Hot.

So, first you obvi have to install the two. Just use handy npm to do that, and
call:

```sh
> npm install react
> npm install mousetrap
```

Dang. That was so easy. This is crazy.

Now that you've done that, go ahead and build your React app as usual. Now,
let's say that you have a super awesome component (called `<SuperAwesomeComponent>`),
and you want to call a function `letFishFly` in that component's class whenever
someone hits "\* k", "ctrl+r", or the Konami Code. Because you feel like it.

It's so easy to add now! In your component, you just have to bind the Mousetrap
command to `letFishFly` in the `componentWillMount` function, and unbind it in `componentWillUnmount`.

```js
    componentDidMount() {
      Mousetrap.bind(['* k', 'ctrl+r', `up up down down left right left right b a enter`], letFishFly);
    }
    componentWillUnmount() {
      Mousetrap.unbind(['* k', 'ctrl+r', `up up down down left right left right b a enter`], letFishFly);
    }
```

Oh my word. That's it. You have keyboard commands set up in React. Congratulations.

Until next time! :)
