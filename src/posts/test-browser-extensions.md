---
layout: "../layouts/BlogPost.astro"
title: "How to test a browser extension locally"
slug: test-browser-extensions
description: "Here's a step-by-step guide for quickly testing browser extensions locally in Edge or Chrome."
added: "Feb 17 2024"
tags: [technical]
---

I built [a browser extension](https://github.com/cassidoo/copy-mailto-plus) this week, and had to do a bit of digging to figure out how to test it properly on Chrome and Edge before publishing it. It's always important to test extensions before publishing them to stores, so here's some quick steps for you to get started (and for my future self who will definitely forget this)!

- Download/clone your repository if it's not on your computer already (just have the one you have built ready, no need to zip it up)
- On Edge, go to `edge://extensions`, or on Chrome, go to `chrome://extensions`
- Toggle on "Developer Mode"
- Click the "Load Unpacked" button
- Select the unzipped extension folder (again, don't zip it up yet)
- Look for the lil puzzle piece icon, and make sure the extension is toggled on
- And you're installed!

Now as you develop your extension, you can hit the "reload" button on the Extensions page and the browser will automatically load your changes.

Once you're done, you can hit the "Pack Extension" button to make a downloadable extension file (a `.crx` file), or you can just zip your folder up and send it to the various web stores.
