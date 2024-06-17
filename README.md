# factorio-scripts
A collection of Factorio Lua scripts that are useful.


# Table of Contents

--------------------
- [Overview](#Overview)
- [Scripts](#Scripts)
  - [export_hotbars](#export_hotbars)
  - [import_hotbars](#import_hotbars)
  - [get_item_ids](#get_item_ids)
  - [get_item_stack_sizes](#get_item_s)

--------------------

# Overview
Most of these scripts are designed for use in sandbox mode. Because of this, 
they generally won't reference any external packages so that the script can easily be copy pasted
into the Lua Snippets execution tab.

Additionally, there are a couple utility command line scripts to copy these scripts into your local
snippets all at once.

# Scripts

--------------------

### export_hotbars
The primary purpose of this is to enable copying over hotbars from one save to another.

Exports the player's current hotbars as a JSON object and writes them to a file. 
Primarily used to generate the JSON that import_hotbars will take in the future as input.


### import_hotbars
Imports the hotbars that are listed to the player's current hotbars and ensures that all items 
have at least one stack of contents.

Mainly used in conjunction with export_hotbars to enable transferring of hotbars between saves.


### get_item_ids
Returns a set of combinators containing ids for items that may be used for indexing.
Each item should have a unique identifier.


### get_item_stack_sizes
Returns a set of combinators containing each item as a signal that has its stack size as a value.
