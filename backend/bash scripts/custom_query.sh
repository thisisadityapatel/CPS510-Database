#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

sqlplus64 "msghani/08203666@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca) (Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

