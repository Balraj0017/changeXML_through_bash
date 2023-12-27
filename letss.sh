#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <xml_file>"
    exit 1
fi

# Input XML file
xml_file="$1"

# CustomerID to uncomment
customer_id="LETSS"

# Run Python script to uncomment the second occurrence of the specified CustomerID
python3 - <<EOF
import re

xml_file = "$xml_file"
customer_id = "$customer_id"

with open(xml_file, 'r') as file:
    content = file.read()

# Find all matches for the specified CustomerID
matches = list(re.finditer(r"(?s)<!--.*?<CustomerID>{}</CustomerID>.*?</Order>.*?-->".format(customer_id), content))

# Check if there is a second match
match_count = len(matches)
if match_count >= 2:
    # Uncomment the second occurrence
    uncommented_content = content[:matches[1].start()] + matches[1].group(0).replace("<!--", "").replace("-->", "") + content[matches[1].end():]

    with open(xml_file, 'w') as file:
        file.write(uncommented_content)
    print(f"Uncommented the second occurrence of CustomerID {customer_id} in {xml_file}")
elif match_count == 1:
    print(f"Only one occurrence found for CustomerID {customer_id} in {xml_file}")
else:
    print(f"No second occurrence found for CustomerID {customer_id} in {xml_file}")
EOF
