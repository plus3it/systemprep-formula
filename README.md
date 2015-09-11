# systemprep

Salt formula to manage states applied by the systemprep bootstrapping
framework. This formula uses pilar to to determine what states to apply,
rather than top.sls in file_roots. The abstraction into pillar makes it easier
to treat the list of states to apply as configuration data. Pillar targeting
is then used to determine what states to apply to what minion.


## Available States

There is only one state, `systemprep`. It simply reads a list of states from
pillar, and 'includes' those states so they apply to the system.


## Configuration

This formula is configured entirely through pillar. If the 'states' pillars
are not present, then the formula will do nothing.


### systemprep:base-states

A list of states defining the os-level configuration baseline to apply to the
system.

**Example**:

```
systemprep:
  base-states:
    - dotnet4
    - emet
    - ash-windows.stig
```


### systemprep:ent-states

A list of states defining the enterprise-controlled services to apply to the
system.

**Example**:

```
systemprep:
  ent-states:
    - splunkforwarder-windows
    - mcafee-agent-windows
    - windows-update-agent
```
