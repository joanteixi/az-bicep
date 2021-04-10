param location string =  'westeurope'
param rg string = 'rg_joan_deployments'


resource startstop0600 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: 'aa-control/start-0600'
  properties: {
    schedule: {
      name: '06d_00_daily'
    }
    runbook: {
      name: 'start-stop-vm'
    }
    
    parameters: {
      'action': 'start' 
      'rg': rg
      'tagname': 'start-stop'
    }
  }
}


resource startstop 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
  name: 'aa-control/start-stop-vm'
  location: location
  properties: {
    runbookType: 'PowerShell'
    publishContentLink:{
      uri: 'https://raw.githubusercontent.com/joanteixi/az-bicep/master/start-stop-vm/start-stop-vm-daily.ps1'

  }
  }
}



resource daily_6 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: 'aa-control/06_00_daily'
  properties: {
    startTime: '2021-04-11T06:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1

  }
}


resource account 'Microsoft.Automation/automationAccounts@2020-01-13-preview' = {
  name: 'aa-control'
  properties: {
    sku: {
      name: 'Free'
      
    }    
  }

  location: location

}
