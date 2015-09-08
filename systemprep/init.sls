{%- set states = salt['pillar.get']('systemprep:states', None) %}

{%- if states %}
include:
{%- for state in salt['pillar.get']('systemprep:states') %}
  - {{ state }}
{%- endfor %}
{%- endif %}
