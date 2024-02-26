---
layout: "../layouts/BlogPost.astro"
title: "Jumblie has a database!"
slug: jumblie-db
description: "Using the power of Supabase and Netlify Build Plugins, I was able to make Jumblie a bit cleaner under the hood!"
added: "Feb 25 2024"
tags: [technical, learning]
---

If you haven't played [Jumblie](https://jumblie.com) yet, you should!

I've talked about [how I made Jumblie](https://blog.cassidoo.co/post/jumblie-build-log/) before. Long story short: it's very vanilla HTML, CSS, and JavaScript, and doesn't have any dependencies.

That being said, the way puzzles are generated every day is very manual: I update a JavaScript object in a plain ol' file in the repository to add them on occasion. As you can imagine, that's not very sustainable or practical! But, I didn't want to make the codebase more complicated by pulling from a database and potentially having to install/rewrite a bunch of things.

I ended up coming up with a solution using [Supabase](https://supabase.com/) and [Netlify Build Plugins](https://docs.netlify.com/integrations/build-plugins/) that I'm pretty happy with!

## The Supabase side

On the Supabase side, it was pretty straightforward to throw together a table of all of the puzzles so far, as well as some upcoming ones. I did some funky conversions and scripting to turn my original large JS object into a CSV file, which I could then import directly into a new database.

Supabase does have a well-supported [JavaScript client library](https://supabase.com/docs/reference/javascript/introduction) that I almost used, but because I wanted the script to be in a build plugin, I ended up just doing a simple REST query.

```js
const response = await fetch(`${supabaseUrl}/rest/v1/${tableName}`, {
	headers: {
		"Content-Type": "application/json",
		apikey: supabaseKey,
	},
});
```

Which brings me to...

## The Build Plugin side

I decided on a Netlify Build Plugin approach because I realized that I didn't have to query Supabase every single time the page was loaded by a user, but rather just when I need to load in some new puzzles. So, when I hit the snazzy deploy button, the build plugin is called `onPreBuild` (so right before things are built and deployed), it pulls the puzzles from Supabase, and creates a new file that has all of the content for the rest of the site to query!

```js
const fs = require("fs");

module.exports = {
	onPreBuild: async () => {
		const outputFile = "./wordList.js";

		// ... Supabase query ...

		// content from Supabase
		const data = await response.json();

		const fileContent = `const wordList = ${JSON.stringify(data)};`;
		fs.writeFileSync(outputFile, fileContent);

		console.log(`Successfully saved word list to ${outputFile} 🔥`);
	},
};
```

Because the output of this combo is almost exactly the same as what it was before (the `wordList` file is just populated from the database instead of from my occasionally updating it), I didn't have to change any game logic.

Installing the plugin was just adding these lines to the `netlify.toml`!

```toml
[[plugins]]
package = "/plugins/get-words"
```

And that's it! In summary, we have a Netlify Build Plugin that creates a file, populates it with data from Supabase, and saves that file to the build, and it's referenced throughout the codebase.

## Woo hoo!

I hadn't worked on a build plugin in a long time, and haven't used Supabase in a while either, so it was a fun little learning experience to make something like this! My dream plan is to be able to set up accounts and stuff so that you can save progress and play old puzzles, so this felt like a good step in that direction. But until then, it's the same ol' Jumblie to users, but much cleaner under the hood.

All of the logic for this entire improvement was less than 30 lines of code! [You can see it here](https://github.com/cassidoo/jumblie/blob/main/plugins/get-words/index.js), along with the rest of the Jumblie game code.

Go play [Jumblie](https://jumblie.com), and [suggest a puzzle](https://jumblie.com/suggest/) if you'd like!
