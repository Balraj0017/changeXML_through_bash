#!/bin/bash

# Check if the input file exists
if [ ! -f "$1" ]; then
  echo "Error: Input file not found"
  exit 1
fi

# Modify ShipPostalCode to 0000 where ShipRegion is WA
sed -i '/<Order>/,/<\/Order>/ s/\(<ShipRegion>WA<\/ShipRegion>\)/\1\n<ShipPostalCode>0000<\/ShipPostalCode>/' "$1"
