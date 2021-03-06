
REPORTER = spec
TIMEOUT = 10s

test: test-entire test-modules test-evernote-api test-feedparser-check-uri test-feedparser-validate-data test-simplequeue test-worker test-working-model test-manager test-schedule test-sqlite

test-w:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--growl \
		--watch \
		--timeout $(TIMEOUT) 

test-entire:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_entire.js

test-modules:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_modules.js

test-evernote-api:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_evernote_api.js

test-feedparser-check-uri:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_feedparser_check_uri.js

test-feedparser-validate-data:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_feedparser-validate-data.js

test-sqlite:	
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_sqlite.js

test-simplequeue:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_simplequeue.js

test-worker:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_queue_based_worker.js

test-working-model:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_working_model.js

test-manager:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_manager.js

test-schedule:
	@./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		test/test_schedule.js

.PHONY: test

