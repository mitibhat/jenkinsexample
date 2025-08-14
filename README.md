We are testing Jenkins Github integration
First push failed, Allowed port in Mcafee through Windows Firewall Inbound Rule
Did not work
Now changed Content-Type to application/json
Still did not work. Enabled https
Setup ngRok Now testing again
changed jenkins startup file now to stop csrf checking
set proxy compatibility in Jenkins and added / at end of ngrok url
set hudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION = true in Manage Nodes Script Console for the node -> Got Authentication required error

