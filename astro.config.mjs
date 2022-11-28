import { defineConfig } from "astro/config";
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
	site: "https://blog.cassidoo.co/",
	base: "/",
	integrations: [sitemap()],
});
