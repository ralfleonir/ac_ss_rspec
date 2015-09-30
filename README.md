This is Ralfi's automation code to aid in the manual tests against AC Superstars web site.

This automation framework was built in rspec dsl using watir-webdriver as the browser control and page object pattern.

The data used in the inputs are stored in the user_data file and the expected data are stored in the expected_data file, both located in the root of the project.

Everytime the automation runs, a new .log file is created in the log folder and filled with data from the examples executed.

A result report is also generated in .html format in the report folder and is always replaced by the latest one.

Screenshots are taken in the face of erros when found and stored in the screenshots folder.
