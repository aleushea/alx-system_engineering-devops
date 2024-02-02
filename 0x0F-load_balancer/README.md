0x0F. Load balancer
Background Context
You have been given 2 additional servers:

gc-[STUDENTID]-web-02-XXXXXXXXXX
gc-[STUDENTID]-lb-01-XXXXXXXXXX
Let’s improve our web stack so that there is redundancy for our web servers. This will allow us to be able to accept more traffic by doubling the number of web servers, and to make our infrastructure more reliable. If one web server fails, we will still have a second one to handle requests.

For this project, you will need to write Bash scripts to automate your work. All scripts must be designed to configure a brand new Ubuntu server to match the task requirements.
Your servers
Name	Username	IP	State
117018-web-01	ubuntu	18.234.193.94	running
117018-web-02	ubuntu	18.234.107.246	running
117018-lb-01	ubuntu	54.160.89.115	running
Tasks
0. Double the number of webservers
