# My blaaaahg

[![Netlify Status](https://api.netlify.com/api/v1/badges/eab04209-5f7f-41ed-a8dd-c45a9ebb1834/deploy-status)](https://app.netlify.com/sites/blahg/deploys)

Hello, welcome. This is a blog ("blahg" is the proper spelling for Chicagoans), or digital garden, or whatever. It's built with [Astro](https://astro.build), and uses [TinaCMS](https://tina.io) to edit the content!

## See the blahg

[blog.cassidoo.co](https://blog.cassidoo.co)

## Run it yourself

All commands are run from the root of the project, from a terminal:

| Command                          | Action                                                        |
| :------------------------------- | :------------------------------------------------------------ |
| `npm install`                    | Installs dependencies                                         |
| `npm run dev`                    | Starts local dev server at `localhost:3000`                   |
| `npx tinacms dev -c 'astro dev'` | Manually run local server if the regular command doesn't work |
| `npm run build`                  | Build your production site to `./dist/`                       |
| `npm run preview`                | Preview your build locally, before deploying                  |

You go to `localhost:3000/admin/index.html` to see the CMS and use it. If you want to clone this for yourself, you'll need a `.env.development` file that has the following in it:

```
TINACLIENTID=<from tina.io>
TINATOKEN=<from tina.io>
TINASEARCH=<from tina.io>
```
