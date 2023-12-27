# bash script that will accepts the attached XML file (devops-test.xml) as input at run-time and implement logic to:
1. Uncomment the entire block containing the first occurrence of CustomerID "HUNGC" within the commented section.
2. Uncomment the entire block containing the second occurrence of CustomerID "LETSS" within the commented section.
3. Modify ShipPostalCode to 0000 where ShipRegion is WA
## Make the script executable:
```
chmod +x (example).sh
``` 
## Then run it with your XML file as an argument:
```
./(example).sh devops-test.xml
```

