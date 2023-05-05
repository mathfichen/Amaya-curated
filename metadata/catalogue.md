## SWHAPPE catalogue.md Template

Here we propose a template for catalogue<span>.md for SWHAPPE.

Each Item in the `raw_materials` and `additional_materials` folders of Workbench should have a corresponding record on the `catalogue.md` with the structure below..

Please note that:
* Name and Surname of actors should be linked to their paragraph in [actors.md](./actors.md) file;
* Items should be linked to the file [inside the raw materials repository](./raw_matherials/) or [inside the additional materials repository](./additional_matherials/);
* On the [second part of the Catalogue](./catalogue.md#SW_NAME-Catalogue-Tree) should be copied the result of the command `tree -a raw_materials additional_materials ` ;
* *Notes:* are optional; they should contains `Additional materials.` for additional materials
* *Warehouse:* is optional - should be used only when a physical warehouse is used to store material taken from the *origin*; .

Example of Actor link:
~~~
[Name Surname](./actors.md#name-surname)
~~~
Example of Item links:
~~~
[Item Name](./raw_materials/example_file.zip)
[Additional Materials Item Name](./additional_materials/example.ppt)
~~~


# SW_NAME Catalogue


* **[Screenshot Amaya 1998](./raw_materials/example_file.zip)**
  * *Origin:* [Amaya Website - Wayback Machine](https://web.archive.org/web/19980703153334/https://www.w3.org/Amaya/)
  * *Warehouse:* 
  * *Authors:* W3C and Inria
  * *Date:* 1998 
  * *Collectors:* [Mathilde Fichen](./actors.md#fichen-mathilde)
  * *Description:* A screenshot view of Amaya's user interface. Possibly version 1.1 or earlier.
  * *Licence/Copyright:* [W3C Software licence](https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document)
  * *Notes:* 
  
* **[Orignial Amya logo](./additional_materials/example.ppt)**
  * *Origin:* [Amaya Website - Wayback Machine](https://web.archive.org/web/19970605010725/https://www.w3.org/Amaya/)
  * *Authors:* [Unknown](./actors.md#name-surname)
  * *Date:* 1997
  * *Collectors:* [Mathilde Fichen](./actors.md#fichen-mathilde)
  * *Description:* Original logo of Amaya
  * *Licence/Copyright:* [W3C Software licence](https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document)
  * *Notes:* 

# SW_NAME Catalogue Tree


result of `tree -a raw_materials additional_materials` command.
