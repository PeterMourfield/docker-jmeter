Build container using
docker build -t docker-jmeter:latest .

Run container using
docker run -i -t --rm -v ${pwd}:/tests docker-jmeter:latest jmeter -n -t /tests/test-plan.jmx -l /tests/output/test-plan.jtl -j /tests/output/test-plan.log -e -o /tests/output/report