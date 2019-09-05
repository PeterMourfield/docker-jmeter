#!/bin/bash

echo "############### jMeter Parameters ###############"
echo "Test File: $TEST_FILE"
echo "Test Path: $TEST_PATH"
echo "Output Path $OUTPUT_PATH"
echo "Report Path: $REPORT_PATH"

echo "jmeter -n -t $TEST_PATH/$TEST_FILE.jmx -l $OUTPUT_PATH/$TEST_FILE.jtl -j $OUTPUT_PATH/$TEST_FILE.log -e -o $REPORT_PATH"

jmeter -n -t $TEST_PATH/$TEST_FILE.jmx -l $OUTPUT_PATH/$TEST_FILE.jtl -j $OUTPUT_PATH/$TEST_FILE.log -e -o $REPORT_PATH

# zip up report files
zip -r $TEST_PATH/$(date +'%Y-%m-%d%H%M%S')-results.zip $OUTPUT_PATH/$TEST_FILE.jtl $OUTPUT_PATH/$TEST_FILE.log $REPORT_PATH/**

# clean up this run
rm -rf $OUTPUT_PATH