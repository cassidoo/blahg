import { defineConfig } from "tinacms";

// Your hosting provider likely exposes this as an environment variable
const branch = process.env.HEAD || "main";

export default defineConfig({
	branch,
	clientId: null, // Get this from tina.io
	token: null, // Get this from tina.io

	build: {
		outputFolder: "admin",
		publicFolder: "public",
	},
	media: {
		tina: {
			mediaRoot: "",
			publicFolder: "public",
		},
	},
	schema: {
		collections: [
			{
				name: "post",
				label: "Posts",
				path: "src/posts",
				defaultItem: () => ({
					title: "New Post",
					layout: "../layouts/BlogPost.astro",
					added: new Date(),
					tags: [],
				}),
				fields: [
					{
						name: "layout",
						label: "Layout",
						type: "string",
						required: true,
					},
					{
						name: "title",
						label: "Title",
						type: "string",
						isTitle: true,
						required: true,
					},
					{
						label: "Slug",
						name: "slug",
						type: "string",
						required: true,
					},
					{
						label: "Description",
						name: "description",
						type: "string",
						required: true,
					},
					{
						label: "Tags",
						name: "tags",
						type: "string",
						list: true,
					},
					{
						label: "Added",
						name: "added",
						type: "datetime",
						dateFormat: "MMM DD YYYY",
						required: true,
					},
					{
						type: "rich-text",
						name: "body",
						label: "Body",
						isBody: true,
					},
				],
			},
		],
	},
});
