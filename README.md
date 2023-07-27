# ISBN-13 Checker

Calculate the check digit of ISBN-13 barcodes.

## Check Digit Calculation

The logic responsible to calculate the ISBN-13 check digit is in the `#check_digit` method, in the [lib/isbn_checker.rb](lib/isbn_checker.rb) file.

## Installation

It's assumed you have Ruby 3.1+ installed.

```sh
git clone git@github.com:meleu/isbn13.git
cd isbn13
bundle install
```

## Running the tests

Just run `rake` and that's enough. Example:

```
$ rake

#initialize
  raises InvalidIsbnError if argument has less than 12 digits
  raises InvalidIsbnError if argument has more than 13 digits

#check_digit
  returns the correct check digit (4) for 978014300723

#valid
  validates 9780143007234
  validates existing ISBNs from some classic books
  reject invalid ISBNs

Finished in 0.00326 seconds (files took 0.15032 seconds to load)
6 examples, 0 failures

Coverage report generated for RSpec to ./coverage. 49 / 49 LOC (100.0%) covered.
```

### Code Coverage Report

After running the tests you can check the coverage report in `coverage/index.html`.

## CLI

I also added a little CLI to validate ISBN-13 codes.

Usage:

```
./isbncheck <ISBN-13-code>
```

Examples:

```
$ ./isbncheck 9780143007234
✅ '9780143007234' is a valid ISBN-13 code

$ ./isbncheck 9780143007235
❌ '9780143007235' is an invalid ISBN-13 code

$ ./isbncheck 978-014-300-7234
✅ '978_014_300_7234' is a valid ISBN-13 code

$ ./isbncheck 978-014-30
❌ [ERROR]: invalid number of digits: 978-014-30
```
