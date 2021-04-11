param location string = 'westeurope'
param rg string = 'rg_joan_deployments'

resource automation 'Microsoft.Automation/automationAccounts@2020-01-13-preview' = {
  name: 'aa-control'
  properties: {
    sku: {
      name: 'Free'
    }
  }

  location: location
}

resource startstopRunbook 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
  name: 'start-stop-vm'
  parent: automation
  location: location
  properties: {
    runbookType: 'PowerShell'
    publishContentLink: {
      uri: 'https://raw.githubusercontent.com/joanteixi/az-bicep/master/start-stop-vm/start-stop-vm-daily.ps1'
    }
  }
}

resource daily_6 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '06_00_daily'
  parent: automation
  properties: {
    startTime: '2021-04-11T06:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1
  }
}

resource startstop0600 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: 'start-0600'
  parent: automation
  dependsOn: [
    daily_6
    startstopRunbook
  ]
  properties: {
    schedule: {
      name: '${daily_6.name}'
    }
    runbook: {
      name: '${startstopRunbook.name}'
    }

    parameters: {
      'action': 'start'
      'rg': rg
      'tagname': 'start-stop'
    }
  }
}
