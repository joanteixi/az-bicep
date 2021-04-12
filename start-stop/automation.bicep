param location string = 'westeurope'
param rg string = 'rg_joan_deployments'
param initDate string = '2021-04-13'

param dwhName string
param dwhServername string
param dwhRg string

param ssasServer string
param ssasRg string

param vmRg string

resource automation 'Microsoft.Automation/automationAccounts@2020-01-13-preview' = {
  name: 'aa-control'
  properties: {
    sku: {
      name: 'Free'
    }
  }

  location: location
}

resource runbook_vm 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
  name: 'runbook-vm'
  parent: automation
  location: location
  properties: {
    runbookType: 'PowerShell'
    publishContentLink: {
      uri: 'https://raw.githubusercontent.com/joanteixi/az-bicep/master/start-stop/scripts/start-stop-vm.ps1'
    }
  }
}


resource runbook_ssas 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
  name: 'runbook-ssas'
  parent: automation
  location: location
  properties: {
    runbookType: 'PowerShell'
    publishContentLink: {
      uri: 'https://raw.githubusercontent.com/joanteixi/az-bicep/master/start-stop-vm/start-stop-vm-daily.ps1'
    }
  }
}

resource runbook_dwh 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
  name: 'runbook-dwh'
  parent: automation
  location: location
  properties: {
    runbookType: 'PowerShell'
    publishContentLink: {
      uri: 'https://raw.githubusercontent.com/joanteixi/az-bicep/master/start-stop-vm/start-stop-vm-daily.ps1'
    }
  }
}


/*
####################
Schedules
#################### 
*/
resource daily_5 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '05_00_daily'
  parent: automation
  properties: {
    startTime: '${initDate}T05:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1
  }
}

resource daily_6 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '06_00_daily'
  parent: automation
  properties: {
    startTime: '${initDate}T06:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1
  }
}


resource daily_7 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '07_00_daily'
  parent: automation
  properties: {
    startTime: '${initDate}T07:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1
  }
}

resource daily_8 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '08_00_daily'
  parent: automation
  properties: {
    startTime: '${initDate}T08:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1
  }
}

resource workdays_5 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '05_00_workdays'
  parent: automation
  properties: {
    startTime: '${initDate}T05:00:00+02:00'
    frequency: 'Week'
    interval: 1

    timeZone: 'CET'
    advancedSchedule: {
      weekDays: [
        'Monday'
        'Tuesday'
        'Wednesday'
        'Thursday'
        'Friday'
      ]
    }
  }
}


resource workdays_6 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '06_00_workdays'
  parent: automation
  properties: {
    startTime: '${initDate}T06:00:00+02:00'
    frequency: 'Week'
    interval: 1

    timeZone: 'CET'
    advancedSchedule: {
      weekDays: [
        'Monday'
        'Tuesday'
        'Wednesday'
        'Thursday'
        'Friday'
      ]
    }
  }
}


resource workdays_8 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '08_00_workdays'
  parent: automation
  properties: {
    startTime: '${initDate}T08:00:00+02:00'
    frequency: 'Week'
    interval: 1

    timeZone: 'CET'
    advancedSchedule: {
      weekDays: [
        'Monday'
        'Tuesday'
        'Wednesday'
        'Thursday'
        'Friday'
      ]
    }
  }
}

resource daily_14 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '14_00_daily'
  parent: automation
  properties: {
    startTime: '${initDate}T14:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1
  }
}

resource daily_17 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '17_00_daily'
  parent: automation
  properties: {
    startTime: '${initDate}T17:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1
  }
}


resource daily_20 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '20_00_daily'
  parent: automation
  properties: {
    startTime: '${initDate}T20:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1
  }
}



resource daily_22 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '22_00_daily'
  parent: automation
  properties: {
    startTime: '${initDate}T22:00:00+02:00'
    frequency: 'Day'
    timeZone: 'CET'
    interval: 1
  }
}

resource workdays_18 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '18_00_workdays'
  parent: automation
  properties: {
    startTime: '${initDate}T18:00:00+02:00'
    frequency: 'Week'
    interval: 1

    timeZone: 'CET'
    advancedSchedule: {
      weekDays: [
        'Monday'
        'Tuesday'
        'Wednesday'
        'Thursday'
        'Friday'
      ]
    }
  }
}


resource workdays_20 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  name: '20_00_workdays'
  parent: automation
  properties: {
    startTime: '${initDate}T20:00:00+02:00'
    frequency: 'Week'
    interval: 1
    timeZone: 'CET'
    advancedSchedule: {
      weekDays: [
        'Monday'
        'Tuesday'
        'Wednesday'
        'Thursday'
        'Friday'
      ]
    }
  }
}



/*
######################
Link jobs - runbook

Development
#####################
*/
resource start_vm_dev_0600 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('start-0600')
  parent: automation

  properties: {
    schedule: {
      name: workdays_6.name
    }
    runbook: {
      name: runbook_vm.name
    }

    parameters: {
      'action': 'start'
      'rg': vmRg
    }
  }
}

resource stop_vm_dev_1800 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('stop-1800')
  parent: automation

  properties: {
    schedule: {
      name: workdays_18.name
    }
    runbook: {
      name: runbook_vm.name
    }

    parameters: {
      'action': 'stop'
      'rg': vmRg
    }
  }
}


resource start_ssas_dev_0800 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('start-0800')
  parent: automation

  properties: {
    schedule: {
      name: workdays_8.name
    }
    runbook: {
      name: runbook_ssas.name
    }

    parameters: {
      'AasAction': 'start'
      'ResourceGroupName': ssasRg
      'AnalysisServerName': ssasServer
    }
  }
}


resource pause_ssas_dev_2000 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('pause-2000')
  parent: automation

  properties: {
    schedule: {
      name: workdays_20.name
    }
    runbook: {
      name: runbook_ssas.name
    }

    parameters: {
      'AasAction': 'pause'
      'ResourceGroupName': ssasRg
      'AnalysisServerName': ssasServer
    }
  }
}


resource start_dwh_dev_0600 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('start-0600')
  parent: automation

  properties: {
    schedule: {
      name: workdays_6.name
    }
    runbook: {
      name: runbook_dwh.name
    }

    parameters: {
      'Action': 'start'
      'rg': dwhRg
      'ServerName': dwhServername
      'DwhName': dwhName
    }
  }
}

resource pause_dwh_dev_2000 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('pause-2000')
  parent: automation

  properties: {
    schedule: {
      name: workdays_20.name
    }
    runbook: {
      name: runbook_dwh.name
    }

    parameters: {
      'Action': 'pause'
      'rg': dwhRg
      'ServerName': dwhServername
      'DwhName': dwhName
    }
  }
}



/*
######################
Link jobs - runbook

production
#####################
*/
resource start_vm_prod_0600 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('start-0600')
  parent: automation

  properties: {
    schedule: {
      name: daily_6.name
    }
    runbook: {
      name: runbook_vm.name
    }

    parameters: {
      'action': 'start'
      'rg': vmRg
    }
  }
}

resource stop_vm_prod_1400 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('stop-1400')
  parent: automation

  properties: {
    schedule: {
      name: daily_14.name
    }
    runbook: {
      name: runbook_vm.name
    }

    parameters: {
      'action': 'stop'
      'rg': vmRg
    }
  }
}


resource start_ssas_prod_0700 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('start-0700')
  parent: automation

  properties: {
    schedule: {
      name:daily_7.name
    }
    runbook: {
      name: runbook_ssas.name
    }

    parameters: {
      'AasAction': 'start'
      'ResourceGroupName': ssasRg
      'AnalysisServerName': ssasServer
    }
  }
}

resource pause_ssas_2200 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('pause-2200')
  parent: automation

  properties: {
    schedule: {
      name: daily_22.name
    }
    runbook: {
      name: runbook_ssas.name
    }

    parameters: {
      'AasAction': 'pause'
      'ResourceGroupName': ssasRg
      'AnalysisServerName': ssasServer
    }
  }
}


resource start_dwh_0500 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('start-dwh-0500')
  parent: automation

  properties: {
    schedule: {
      name: daily_5.name
    }
    runbook: {
      name: runbook_dwh.name
    }

    parameters: {
      'Action': 'start'
      'rg': dwhRg
      'ServerName': dwhServername
      'DwhName': dwhName
    }
  }
}

resource pause_dwh_1700 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  name: guid('pause-dwh-1700')
  parent: automation

  properties: {
    schedule: {
      name: daily_17.name
    }
    runbook: {
      name: runbook_dwh.name
    }

    parameters: {
      'Action': 'pause'
      'rg': dwhRg
      'ServerName': dwhServername
      'DwhName': dwhName
    }
  }
}

