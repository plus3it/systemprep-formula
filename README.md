# systemprep

Salt formula to manage states applied by the systemprep bootstrapping
framework. This formula uses pilar to to determine what states to apply,
rather than top.sls in file_roots. The abstraction into pillar makes it easier
to treat the list of states to apply as configuration data. Pillar targeting
is then used to determine what states to apply to what minion.


## Available States

There is only one state, `systemprep`. It simply reads a list of states from
pillar, and includes those states so they apply to the system.


## Configuration

This formula is configured entirely through pillar. If the `systemprep:states`
pillar is not present, then the formula will do nothing.


### systemprep:states

A list of states to apply to the system.

**Example**:

```
systemprep:
  states:
    - dotnet4
    - emet
    - ash-windows.stig
```
