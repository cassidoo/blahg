---
layout: ../layouts/BlogPost.astro
title: How and when to use keys in React
slug: react-keys
description: 'When you render lists in React, you need to use keys.'
tags:
  - technical
added: 2023-10-28T00:34:25.253Z
---

Whenever you want to render a list of something in React, you need to add a `key` attribute to it. This helps the renderer know how to keep track of that element, kind of like an ID. That `key` *can* be pretty much anything (a number or a string or whatever), but there's some high-level rules you should follow when using them.

1. **Keys have to be unique** - when React is differentiating things across renders, keys shouldn't be the same as something else.
2. **Keys should not be random IDs** - if an ID is a random number generated during a render, then your items will have all new keys every time the state in your component changes. That being said, if you generate unique IDs when creating the data, that's different and okay.
3. **Keys should probably not be just the item's `index`** - if you plan on changing the order of your list, or adding or deleting items, then the indices will change whenever the list changes, and that will throw React off.

Here's a good example of a `key` being set properly, using an `id` in the list::

```jsx
const CityList = () => {
  const cities = [
    { id: 1, name: 'New York', description: 'The Big Apple' },
    { id: 2, name: 'Chicago', description: 'The Windy City' },
    { id: 3, name: 'San Francisco', description: 'The Golden City' },
    { id: 4, name: 'Los Angeles', description: 'The City of Angels' },
  ];

  return (
    <div>
      <h1>U.S. cities</h1>
      <ul>
        {cities.map(city => (
          <li key={city.id}>
            <h2>{city.name}</h2>
            <p>{city.description}</p>
          </li>
        ))}
      </ul>
    </div>
  );
};
```

Here's some further reading if you'd like to learn more!

* [React documentation on rendering lists](https://react.dev/learn/rendering-lists)
* [Real-life example on Stack Overflow](https://stackoverflow.com/questions/56235483/material-ui-popover-is-thrown-to-the-top-left-when-used-on-an-inline-button-in-a)
