import { defineConfig } from "astro/config";
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
	site: "https://cassidoo.co/blog",
	base: "/blog",
	integrations: [sitemap()],
});
