{# Get the states from pillar #}
{%- set base_states = salt['pillar.get']('systemprep:base-states', None) %}
{%- set post_states = salt['pillar.get']('systemprep:post-states', None) %}
{%- set ent_states = salt['pillar.get']('systemprep:ent-states', None) %}

{#- Set the states to an empty list if they have no contents #}
{%- set base_states = [] if not base_states else base_states %}
{%- set post_states = [] if not post_states else post_states %}
{%- set ent_states = [] if not ent_states else ent_states %}

{#- Iterate over the lists and include specified states, if any #}
{%- if base_states or ent_states or post_states %}
include:
{%- for state in base_states %}
  - {{ state }}
{%- endfor %}
{%- for state in ent_states %}
  - {{ state }}
{%- endfor %}
{%- for state in post_states %}
  - {{ state }}
{%- endfor %}
{%- endif %}
