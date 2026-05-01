# Visible Tests

The visible test script:
- builds with `make`
- runs `./bin/report_buffer_lab samples/orders.txt`
- checks exact output against a static expected output block
- expects the summary line to include `reads=4 | writes=1`

Hidden tests may include:
- malformed lines with missing separators
- names or categories near buffer limits
- exact alignment with a different longest product name
- grand totals and max totals for different numeric combinations
- buffer-capacity failures when building the output report
