let g:capture_templates = {
      \ 'journal': {'file': '~/wiki/journal/journal.md',
      \             'pattern': '^# ',
      \             'new_snip': '# `!v strftime("%A, %F")`
      \             'extend_pattern': '.\+$',
      \             'extend_snip': '
      \ 'research': {'file': '~/wiki/research.md',
      \             'pattern': '^# ',
      \             'new_snip': '# `!v strftime("%A, %F")`
      \             'extend_pattern': '.\+$',
      \             'extend_snip': '
      \ 'advisor': {'file': '~/wiki/ross_meetings.md',
      \             'pattern': '^# ',
      \             'new_snip': '# `!v strftime("%A, %F")`
      \}