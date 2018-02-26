# warrenr

The goal of warrenr is to take `persistently()` for a spin. This is based on 
@richierocks's [PR to __purrr__](https://github.com/tidyverse/purrr/pull/333), where he proposes `persistently()`. The goal is that this capability be merged into purrr.

## Installation

You can install warrenr from github with:


``` r
# install.packages("devtools")
devtools::install_github("ijlyttle/warrenr")
```

## Example

Let's say you have an API call that does not work 100% of the time, due to vagaries of the network, etc. 

```R
result <- fragile_api_call(arg1 = "foo", ...)
```

If the call fails, you would like that the call be repeated. Hence the adverb `persistently()`.

```R
persistent_api_call <- warrenr::persistently(fragile_api_call)
```

This returns a new function that will run persistently:

```R
result <- persistent_api_call(arg1 = "foo", ...)
```

There are arguments for `max_attempts` (default: 5) and `wait_seconds` (default: 0.1 s). Should the function throw an error, each subsequent call will wait twice the amount of time as it previously waited (plus some random fuzz).
