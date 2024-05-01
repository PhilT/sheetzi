Scripts to generate PDFs and CSVs from ruby code.

## Install

bundix -m

## Usage

To see available options:

    cd sheetzi
    ./invoice

## Examples

You need to be in a folder with your invoice template. Then:

Generate timesheet/invoice for last month, worked every week day:

    ./invoice path/to/client/dir -1

Generate timesheet/invoice for current month, worked every day except last week:

    ./invoice path/to/client/dir -0 -x 26,27,28,29,30

Regenerate timesheet/invoice for 2 months ago, only worked a couple of days plus 1 half day

    ./invoice path/to/client/dir -f -2 -i 3,4,5am
