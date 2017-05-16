## JSON (Favorite Numbers) ##

A web app developed using Ruby, Sinatra and HTML to demonstrate front-end testing using rack.  Data is written to and retrieved from a custom JSON file.

----------

**Running the App**

----------

To run the JSON app locally:

1. Make sure that [Ruby](https://www.ruby-lang.org/en/documentation/installation/) is installed.
2. Make sure that the [Sinatra](https://github.com/sinatra/sinatra) gem is installed.  *Note that installing the Sinatra gem will install other gems necessary to run the game locally, such as rack.*
3. Navigate to the directory which contains **app.rb** in a terminal (command prompt) session.
4. Run the following command to launch the Sinatra web server:

	`rackup`

To open the app locally once it is running via *rackup*, use the following URL:

[http://localhost:9292](http://localhost:9292/)

----------

**Using the App**

----------

To use the JSON app, do the following:

1. Specify a name in the input field.
2. Select the **Submit** button.
3. On the subsequent page, specify an age in the input field.
4. Select the **Submit** button.
5. On the subsequent page, specify numbers in the three input fields.
6. Select the **Submit** button.
7. The final page provides a summary of the provided details by reading data back out of the JSON file.

----------

## Tests ##

Please refer to the following sections for details on how to run the unit and front-end tests for the web app.

----------

**Unit and Front-End Tests Overview**

----------

Tests have been developed to verify that the methods in each class file and routes/views in the web app are working as intended.

Unit Tests:

- **test\_output\_json.rb** > **output_json.rb** (3 tests)

Front-End Tests:

- **/tests/test\_app.rb** > **/app\_test\_version.rb** (4 tests, 16 assertions)

----------

**Running Unit Tests**

----------

Unit tests can be run by doing the following:

1. Navigate to the directory which contains **app.rb** in a terminal (command prompt) session.
2. Run the following command for the unit test file:<br>

    ruby test\_output_json.rb

The resulting output will indicate the success of the unit tests:

	Run options: --seed 30541

	# Running:

	...

	Finished in 0.013155s, 228.0496 runs/s, 228.0496 assertions/s.

	3 runs, 3 assertions, 0 failures, 0 errors, 0 skips

----------

**Running Front-End Tests**

----------

*Note that a test version of **app.rb** is used as number of the JSON file methods caused the front-end tests to fail.*

The **/tests/test\_app.rb** file contains front-end tests for the web app routes (**app\_test\_version.rb**) and associated views (for example, **/views/get_name.erb**).

Front-end tests can be run by doing the following:

1. Navigate to the **/tests** directory in a terminal (command prompt) session.
2. Run the following command for the front-end test:

	`ruby test_app.rb`

The resulting output will indicate the success of the front-end tests and assertions:

	Run options: --seed 14230

	# Running:

	....

	Finished in 0.072269s, 55.3484 runs/s, 221.3938 assertions/s.

	4 runs, 16 assertions, 0 failures, 0 errors, 0 skips

----------

Enjoy!