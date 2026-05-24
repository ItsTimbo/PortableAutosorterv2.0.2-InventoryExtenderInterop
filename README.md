OpenMW Portable Autosorter
======

A portable autosorter making use of Lua scripting in OpenMW 0.49 and onwards.

This was spurred on by my own inability to find the unicorn of house mods that combined my personal taste with extensive sorting. As such, no matter where you live, you'll be able to sort everything in your inventory into containers in the same cell with just one click.

Don't try to combine this with existing alchemy/book/etc sorters, especially ones that use displays or ingredient jars. Sort them into a nearby container using this mod first, then move them manually into the other sorter.

**Will not work on the current OpenMW 0.48 release**. Get the latest Release Candidate build of OpenMW 0.49.0 [from here](https://github.com/OpenMW/openmw/releases/).

Make sure to enable both `portable_autosorter.omwaddon` and `portable_autosorter.omwscripts` for the mod to work.

Requires `Morrowind.esm`.

What's Included
---------------

The Portable Autosorter is a collection items that, when used together, allow for quick and easy sorting. They are:
* **Autosort Master Sorter**: A placeable item that, when activated, will scan containers in the cell for Autosort Targets and move items from your inventory those containers. Looks disturbingly similar to a House Dagoth cup. Can't be picked back up without wearing the Autosort Pickup Ring.
* **Autosort Targets**: A collection of Dwemer Puzzle Boxes that are put into containers. The Autosort Master Sorter looks for these when sorting. Multiple Targets can go in one container. Targets themselves will never be sorted.
    * **Autosort Target - Overflow**: A special Target that catches everything that hasn't already been sorted, *except Gold*.
* **Autosort Excluder**: On its own, it does nothing, but when in the same container as a Target, it prevents the Target from being... well, targeted. Used to store unused Targets without accidentally sorting your inventory.
    * EG: If you want to keep Gold in your inventory, place the Excluder in the same container as the Gold Target. Gold won't be sorted.
* **Autosort Pickup Ring**: When worn, activating the Master Sorter will pick it up instead of sorting your inventory. Has a small Burden enchantment. *Will never be sorted*. Mostly depreciated now that you can pick up the Master Sorter while you are in your inventory.

The Master Sorter, Targets, Excluder, and Pickup Ring can all be bought from Arrille at his tradehouse at Seyda Neen. As such, this mod may conflict with anything that alters Arrille. If so, use the console to add the following items:

autosort_master_sorter
autosort_target_weapon
autosort_target_armor
autosort_target_book
autosort_target_clothing
autosort_target_jewelry
autosort_target_ingredient
autosort_target_security
autosort_target_potion
autosort_target_repair
autosort_target_key
autosort_target_misc
autosort_target_overflow
autosort_target_donotuse
autosort_target_gold
autosort_target_soulgem
autosort_target_apparatus
autosort_target_scroll
autosort_pickup_ring

How To Use
----------

* Buy all of the items above from Arrille in Seyda Neen, or use the console if you have a mod conflict.
* Locate a bunch of containers where you want to store items in the same cell.
* Place an Autosort Target in each container.
* Put down the Autosort Master Sorter.
* Use the Autosort Master Sorter.
* If all goes well, the sorter will make a mystical noise, blink ominously, and a message will pop up that says "Sorting complete!"
* Go check the containers.

If you want to set up more than one location/home, go back to Arrille and buy another set of items (except maybe the ring since you already have one). He restocks them.

Exclusions
----------

The Autosorter can accept a list of items that will *never* be removed from your inventory under any circumstances. To do this, create an `exclusions.txt` file in the same folder as the `.omwaddon` and `.omwscripts` folder and write each item name on a new line. It is case-sensitive.

The exclusion list is read each time the autosort process runs, so it can be amended during gameplay.

Example `exclusions.txt` contents:

```
-- Lua-style comments like this are ignored
Keyring
Bonebiter Bow of Sul-Senipul
Mentor's Ring
Domina Cuirass
Spoiled SlowFall Potion
```

Integrations with other mods
----------------------------

This mod works seamlessly with Zackhasacat's Corporeal Carryable Containers, downloadable from here: https://www.nexusmods.com/morrowind/mods/53772. If you are using that mod and OAAB_Data then I recommend you add the Keyring to your `exclusions.txt` file.

Notes
-----

* Arrille restocks. This means you can get multiples of each item, which also means you can set up more than one location with autosorting.
* The target containers *must* be in the same cell as the sorter. If you have multiple rooms with targets, you will need multiple sorters. This is by design.
* Due to the way the scripting is set up, this mod is theoretically compatible with TES3MP. I haven't tested it and I probably won't.
* This mod doesn't respect container weight limits. The Autosorter will absolutely stuff seventeen Daedric Dai-Katanas into a fish rack as Sotha Sil intended.
* I have no idea how it will behave in an exterior cell.