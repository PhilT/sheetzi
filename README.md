Scripts to generate PDFs and CSVs from slim templates and ruby code.

## Install

Install `phantomjs` then:

    gem install activesupport shrimp slim


## Examples

You need to be in a folder with your invoice template. Then:

Generate timesheet/invoice for last month, worked every week day:

    path/to/tigen/worksheet -1

Generate timesheet/invoice for current month, worked every day except last week:

    ./worksheet -0 -x 26,27,28,29,30

Regenerate timesheet/invoice for 2 months ago, only worked a couple of days plus 1 half day

    ./worksheet -f -2 -i 3,4,5am
