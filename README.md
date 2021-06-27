UKBioPick
============
[![License](https://img.shields.io/badge/license-CC--BY--SA--4.0-orange)](https://choosealicense.com/licenses/cc-by-sa-4.0)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/CirculatoryHealth/LoFTK)

The UKBioPick allows extraction of interested UK Biobank (UKBB) phenotypes.


--------------

## Installation and use

### Requirements
- `Bash`
- UKBB phenotypic tab-delimited file (ukbxxxx.tab)
- Create a tab-separated file contains Field ID (column1) and Field (column2) (see example [_**here**_]()). You can select Field ID and Field for each UKBB phenotypes in the [UKBB data dictionary Data_Dictionary_Showcase](https://biobank.ndph.ox.ac.uk/~bbdatan/Data_Dictionary_Showcase.csv).  

--------------

### Usage
You must supply at least [4] arguments when running a UKBioPick!

Arguments                         | Description                      
--------------------------------- | --------------------------------
arg1                              | UKBB phenotypic tab file (ukbxxxx.tab)       
arg2                              | Field ID and Field file         
arg3                              | Path to output directory         
arg4                              | Project name                    


You can run **UKBioPick** using the following command:

```
**bash run_UKBioPick.sh** [arg1:UKBB_phenotypics_tab_file] [arg2:field_ID_file] [arg3:output_directory] [arg4:project_name]
```
--------------

### Available UKBB phenotypes at dhl_ec (UMC Utrecht)
The lates version of UKBB phenotypes file (ukbxxxx.tab) in the HPC is
--------------

### Slides
These slide have information about UKBB phenotypes at dhl_ec. [Click here to view slides].

--------------

### Contact

If you have any suggestions for improvement, discover bugs, etc. please create an [issues](https://github.com/CirculatoryHealth/UKBioPick/issues). For all other questions, please refer to the last author:

Abdulrahman Alasiri | a.i.alasiri [at] umcutrecht.nl

--------------

### License and copyright

[MIT License](LICENSE)

Copyright (c) 2021-2031 Abdulrahman Alasiri
