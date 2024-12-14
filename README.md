# Cassidy's blog template

[![Netlify Status](https://api.netlify.com/api/v1/badges/eab04209-5f7f-41ed-a8dd-c45a9ebb1834/deploy-status)](https://app.netlify.com/sites/blahg/deploys)

Hello, welcome. This is a blog ("blahg" is the proper spelling for Chicagoans) template. It's built with [Astro](https://astro.build), and uses [TinaCMS](https://tina.io) to edit the content!

![cover](https://github.com/cassidoo/blahg/assets/1454517/b56ff04f-9499-48e7-be62-d9b422c4287d)

## See the blahg

[blahg.netlify.app](https://blahg.netlify.app/)

## To use the template

- Connect to your chosen hosting provider (see Deploy to Netlify button below if you want to go that route, otherwise use the GitHub template button above and pick a different one)
- Make an account at [tina.io](https://tina.io/)
- Add your TinaCMS keys (see below)
- Update `astro.config.mjs` with your domain
- Edit `src/config.js`
- Add your URL in line 1 of `public/robots.txt`
- Add your links in `src/components/Header.astro`
- Update the intro in `pages/about.md`
- Edit the images in `public/` (optional)
- Edit whatever tags you want in `tina/config.js` (optional)

After this, you can add your content to `posts/` with Markdown files, or with TinaCMS by going to `yoururl.com/admin`!

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/cassidoo/blahg)

And finally, please ping me (via social media, or in a GitHub Issue, or whatever) if you use this template! I would love to see your writing and subscribe to your RSS feed!

## Run it yourself

All commands are run from the root of the project, from a terminal:

| Command                          | Action                                                        |
| :------------------------------- | :------------------------------------------------------------ |
| `npm install`                    | Installs dependencies                                         |
| `npm run dev`                    | Starts local dev server at `localhost:4321`                   |
| `npx tinacms dev -c 'astro dev'` | Manually run local server if the regular command doesn't work |
| `npm run build`                  | Build your production site to `./dist/`                       |
| `npm run preview`                | Preview your build locally, before deploying                  |

You go to `localhost:4321/admin/index.html` to see the CMS and use it. If you want to clone this for yourself, you'll need a `.env.development` file that has the following in it:

```
TINACLIENTID=<from tina.io>
TINATOKEN=<from tina.io>
TINASEARCH=<from tina.io>
```

If you get a remote GraphQL schema error, chances are you need to update TinaCMS, [details here](https://tina.io/docs/introduction/faq#how-do-i-resolve-the-local-graphql-schema-doesnt-match-the-remote-graphql-schema-errors)!

**Have fun!**
