# Common Misconceptions startup message

Display an entry from Wikipedia's [list of common misconceptions](https://en.wikipedia.org/wiki/List_of_common_misconceptions) in your startup message.

1.  Copy `misconceptions.csv` to `~/.R/misconceptions.csv`
2.  Edit your global `~/.Rprofile` (or your project's `.Rprofile`) and append the following code:

``` r
message("Common Misconception: ", rep("*", 58))
message("\n", sample(utils::read.csv("~/.R/misconceptions.csv")$misconception, 1))
message("\n", rep("*", 80))
```

Inspired by [xkcd #843](https://xkcd.com/843/).
