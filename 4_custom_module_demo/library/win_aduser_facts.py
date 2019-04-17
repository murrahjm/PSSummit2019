#!/usr/bin/python
# -*- coding: utf-8 -*-

ANSIBLE_METADATA = {'metadata_version': '1.1',
                    'status': ['preview'],
                    'supported_by': 'community'}
DOCUMENTATION = r'''
module: win_aduser_facts
short_description: queries AD for user info and returns specified attributes
version_added: 2.5
description: 
- Searches Active Directory for user accounts matching the provided attribute and search string.
- Returns the specified user account properties or just the samaccountname attribute if no other properties are specified.
author: Jeremy Murrah (murrahjm@gmail.com)
options:
  filter_property:
    description: The AD attribute to use when searching for user accounts.
    type: str
    required: yes
  filter_match_type:
    description: 
    - The type of comparison to use with I(filter_property) and I(filter_value) when searching for users.
    type: str
    choices:
    - exact
    - partial
    required: no
    default: exact
  filter_value:
    description: 
    - The value to use when searching for user accounts.
    - The attribute specified by I(filter_property) must match this value to be returned.
    type: str
    required: no
  return_properties:
    description: The list of user account attributes to return for matching accounts.
    default: samaccountname
    type: list
    required: no
  domain_name:
    description:
    - The fully qualified domain name to search.
    - If this is not specified the domain of the target machine will be used.
    type: str
    required: no
'''
EXAMPLES = r'''

'''
RETURN = r'''
ansible_facts:
  description: Dictionary containing all matching user accounts
  returned: on success
  type: complex
  contains:
    samaccountname:
      description: samAccountName attribute of Active Directory user object
      returned: success
      type: str
      sample:
      - bgates
      - jsnover1
changed:
    description: Whether or not any changes were made.
    returned: always
    type: bool
    sample: true
'''
