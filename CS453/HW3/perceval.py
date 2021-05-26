from perceval.backends.core.jira import Jira
from datetime import date
from datetime import datetime

url = 'https://tickets.puppetlabs.com'
project = 'IMAGES'

repo = Jira(url = url, project = project)


issueCount = 0
assignedIssues = 0
unassignedIssues = 0
sleepingBugs = 0
bugsLastYear = 0
timeLastYear = 0

maxDate = datetime.strptime( "1970-01-01T09:52:29.000-0700", "%Y-%m-%dT%H:%M:%S.%f%z").date()
minDate = date.today()
todayDate = date.today()

# date = datetime.strptime( "2016-08-17T09:52:29.000-0700", "%Y-%m-%dT%H:%M:%S.%f%z")
# print( date.date())
# resolutionDate =  datetime.strptime('04/Jan/2008 5: 44 AM', "%d/%b/%Y %H: %M %p")
# print( resolutionDate.date())

for issue in repo.fetch():

	issueCount += 1
	# if( issueCount > 4):
	# 	break

	# Getting dates
	createdDate = datetime.strptime(issue['data']['fields']['created'], "%Y-%m-%dT%H:%M:%S.%f%z").date()

	if( createdDate > maxDate):
		maxDate = createdDate
	if( createdDate < minDate):
		minDate = createdDate


	# Checking assigned and unassigned
	if( issue['data']['fields']['issuetype']['name'] == "Bug" and issue['data']['fields']['resolutiondate'] != None and issue['data']['fields']['assignee'] == None):
		unassignedIssues += 1
	elif( issue['data']['fields']['issuetype']['name'] == "Bug" and issue['data']['fields']['resolutiondate'] != None):
		assignedIssues += 1

	# counting sleeping bugs
	if(issue['data']['fields']['issuetype']['name'] == "Bug" and issue['data']['fields']['resolutiondate'] == None):
		if((todayDate - createdDate).days > 90): #3 months
			sleepingBugs += 1
	
	#counting resolution time for last year bugs
	if(issue['data']['fields']['issuetype']['name'] == "Bug"
		and issue['data']['fields']['resolutiondate'] != None):

		# Resolution date: 04/Jan/2008 5: 44 AM
		# %d/%b/%Y %H: %M %p
		resolutionDate =  datetime.strptime(issue['data']['fields']['resolutiondate'], "%Y-%m-%dT%H:%M:%S.%f%z").date()
		if((todayDate - resolutionDate).days < 366): #past year
			bugsLastYear += 1
			timeLastYear += (resolutionDate - createdDate).total_seconds()

print()
print("Latest issue: " + str(maxDate))
print("First issue: " + str(minDate))
print("Repository age: " + str((maxDate - minDate).days) + " days")
print()
print("Issue count: " + str(issueCount))
print()
print("Assigned bugs: " + str(assignedIssues))
print("Unasssigned bugs: " + str(unassignedIssues))
print()
print("Sleeping bugs: " + str(sleepingBugs))
print()
print("Total resolution time for last year: " + str((timeLastYear / (60 * 60))) + " hours")
print("Total bugs in last year: " + str(bugsLastYear))
print("Average resolution time for bugs in last year: " + str(timeLastYear / bugsLastYear / (60 * 60)) + " hours")

