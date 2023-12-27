#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <xml_file>"
    exit 1
fi

# Input XML file
xml_file="$1"

# CustomerID to uncomment
customer_id1="HUNGC"

# Run Python script to uncomment the specified CustomerID
python3 - <<EOF
import re

xml_file = "$xml_file"
customer_id1 = "$customer_id1"

with open(xml_file, 'r') as file:
    content = file.read()

pattern = rf"(?s)<!--.*?<CustomerID>{customer_id1}</CustomerID>.*?</Order>.*?-->"
match = re.search(pattern, content)

if match:
    uncommented_content = content[:match.start()] + match.group(0).replace("<!--", "").replace("-->", "") + content[match.end():]

    with open(xml_file, 'w') as file:
        file.write(uncommented_content)
    print(f"Uncommented the first occurrence of CustomerID {customer_id1} in {xml_file}")
else:
    print(f"No match found for CustomerID {customer_id1} in {xml_file}")
EOF
