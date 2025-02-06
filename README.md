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

## Example misconceptions
> The human sense of smell is not weak or underdeveloped. Humans have similar senses of smell to other mammals, and are more sensitive to some odors than rodents and dogs.

> The Bermuda Triangle does not have any more shipwrecks or mysterious disappearances than most other waterways.

> Turkey meat is not particularly high in tryptophan, and does not cause more drowsiness than other foods. Drowsiness after large meals such as Christmas or Thanksgiving dinner generally comes from overeating.

> MC1R, the gene mostly responsible for red hair, is not becoming extinct, nor will the gene for blond hair do so, although both are recessive alleles. Redheads and blonds may become rarer but will not die out unless everyone who carries those alleles dies without passing their hair color genes on to their children.

> There is no such thing as an \"alpha\" in a wolf pack. An early study that coined the term \"alpha wolf\" had only observed unrelated adult wolves living in captivity. In the wild, wolf packs operate like families: parents are in charge until the young grow up and start their own families, and younger wolves do not overthrow an \"alpha\" to become the new leader.
