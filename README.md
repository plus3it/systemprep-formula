[![license](https://img.shields.io/github/license/plus3it/systemprep-formula.svg)](./LICENSE)
[![Travis Build Status](https://travis-ci.org/plus3it/systemprep-formula.svg?branch=master)](https://travis-ci.org/plus3it/systemprep-formula)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/plus3it/systemprep-formula?branch=master&svg=true)](https://ci.appveyor.com/project/plus3it/systemprep-formula)

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
system. `base-states` will always run first, in the order specified in the
list.

**Example**:

```
systemprep:
  base-states:
    - dotnet4
    - emet
    - ash-windows.stig
```


### systemprep:post-states

A list of states that will be run last, after `base-states` and after
`ent-states`. `post-states` will always run in the order specified in the
list.

**Example**:

```
systemprep:
  post-states:
    - ash-windows.delta
```


### systemprep:ent-states

A list of states defining the enterprise-controlled services to apply to the
system. `ent-states` will always run just after `base-states`, in the order
specified in the list.

**Example**:

```
systemprep:
  ent-states:
    - splunkforwarder-windows
    - mcafee-agent-windows
    - windows-update-agent
```
