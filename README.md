# Cassidy's blog template

Hello, welcome. This is a blog ("blahg" is the proper spelling for Chicagoans), or digital garden, or whatever. It's built with [Astro](https://astro.build), and uses [TinaCMS](https://tina.io) to edit the content!

## See the blahg

[blahg.netlify.app](https://blahg.netlify.app/)

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
