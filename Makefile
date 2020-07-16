
clone:
	git clone git@github.com:python/cpython.git

configure:
	cd cpython && ./configure --enable-loadable-sqlite-extensions

build: 
	cd cpython && make -s -j

# TODO Fix
# do this step outside the makefile, then run the remaining 
# targets to install coverage and run tests
venv:
	./cpython/python -m venv cpython-venv
	source cpython-venv/bin/activate

install-coverage:
	pip install coverage

clean-coverage:
	cd cpython && python -m coverage erase

test-help: # very useful
	cd cpython && python -m test -h

test-coverage:
	cd cpython && python -m coverage run --pylib Lib/test/regrtest.py

coverage-report:
	cd cpython && python -m coverage report -i

coverage-html:
	cd cpython && python -m coverage html -i --include=`pwd`/Lib/* --omit="Lib/test/*,Lib/*/tests/*"

single-test-coverage:
	cd cpython && python -m coverage run --pylib --source=urllib Lib/test/regrtest.py test_urlparse
	
single-test:
	cd cpython && python -m test test_urlparse -v
	#cd cpython && python -m test test_dict -v
	#cd cpython && python -m test test_asyncio.test_events -v

clean:
	cd cpython && make clean