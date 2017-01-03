systemprep:

  base-states:

    # List of states to apply as part of the os configuration baseline
    - name-computer
    - ash-linux

  post-states:
    # List of states to apply *after* all other states
    - scc.scan

  ent-states:

    # List of states to apply as part of the enterprise baseline
    - splunkforwarder
    - mcafee-agent
    - join-domain
