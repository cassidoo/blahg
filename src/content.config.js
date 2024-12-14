import { defineCollection, z } from "astro:content";

import { glob } from "astro/loaders";

const posts = defineCollection({
	loader: glob({ pattern: "*.md", base: "./posts" }),
	schema: z.object({
		title: z.string(),
		slug: z.string(),
		description: z.string(),
		added: z.union([z.string(), z.date()]),
		updated: z.union([z.string(), z.date()]).optional(),
		tags: z.array(z.string()),
	}),
});

export const collections = { posts };
