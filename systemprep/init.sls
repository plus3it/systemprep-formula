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
{%- else %}
Print systemprep-formula help:
  test.show_notification:
    - text: |
        The "systemprep" formula gets the states to apply from the pillar keys:

            systemprep:base-states
            systemprep:ent-states
            systemprep:post-states

        The states are applied in that order, and each pillar key may be a list
        of one or more states (also applied in the order listed in the pillar).
        None of those pillar keys are present, or they evaluate to False, so
        the formula did not apply any states in this execution.
{%- endif %}
