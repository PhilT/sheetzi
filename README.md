Scripts to generate PDFs and CSVs from slim templates and ruby code.

## Install

    gem install activesupport slim wicked_pdf

### On Windows

Grab the wkhtmltopdf binary from https://wkhtmltopdf.org/downloads.html

### On Linux

    gem install wkhtmltopdf-binary

## Usage

To see available options:

    path/to/sheetzi/worksheet

## Docker for Windows

Create an `invoice.ps1` in your path with the content:

    docker run -t -v ${pwd}:/data sheetzi /app/worksheet $args

Then call with:

    invoice -0 -x "2,3"

Note the use of the quotes to make a single argument.

## Examples

You need to be in a folder with your invoice template. Then:

Generate timesheet/invoice for last month, worked every week day:

    path/to/sheetzi/worksheet -1

Generate timesheet/invoice for current month, worked every day except last week:

    path/to/sheetzi/worksheet -0 -x 26,27,28,29,30

Regenerate timesheet/invoice for 2 months ago, only worked a couple of days plus 1 half day

    path/to/sheetzi/worksheet -f -2 -i 3,4,5am
