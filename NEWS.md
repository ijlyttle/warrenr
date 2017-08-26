# warrenr 0.0.0.9000

* removes `otherwise` argument from `persistently()` so that it invokes 
  an error persistence "fails". This way, its behavior is orthogonal to 
  `purrr::safely()` and `purrr::possibly()`. If you want to add that behavior, 
  you can further modify your verb with one of these adverbs.

* reconstitiutes `persisitently()` from @richierocks fork of tidyverse/purrr

* adds a `NEWS.md` file to track changes to the package.



