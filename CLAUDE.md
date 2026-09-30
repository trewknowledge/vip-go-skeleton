# Conventions

## Code comments

Comment the **why**, never the how or the what. The code already says what it does.

- Keep them short. One line is the default; two is the limit.
- Only write one when the reason isn't obvious: a workaround, a hidden constraint, a surprising choice, a link to the bug or docs behind it.
- Don't restate the code, narrate steps, add section banners, or write docblocks that repeat the function name and signature.
- Don't leave commented-out code, and don't write history ("added for X", "changed from Y"). That belongs in the commit message.
- If a comment is needed to explain what a block does, rename or restructure the code instead.

```php
// Bad: loops over posts and adds the meta value to each one.
foreach ( $posts as $post ) { ... }

// Good: VIP's page cache ignores a cookie-less request, so warm it with one.
wp_remote_get( $url, array( 'cookies' => array() ) );
```
