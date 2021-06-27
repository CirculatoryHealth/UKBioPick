UKBioPick
============
[![License](https://img.shields.io/badge/license-MIT-orange)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/CirculatoryHealth/UKBioPick)

The UKBioPick allows extraction of interested UK Biobank (UKBB) phenotypes from tab-delimited phenotypic file (ukbxxxx.tab).


--------------

## Requirements
- `Bash`
- `Perl`
- UKBB phenotypic tab-delimited file (ukbxxxx.tab)
- Create a tab-separated file contains Field ID (column1) and Field (column2) (see example [_**here**_](data/Field_ID.txt). You can select Field ID and Field for each UKBB phenotypes in the [UKBB data dictionary Data_Dictionary_Showcase](https://biobank.ndph.ox.ac.uk/~bbdatan/Data_Dictionary_Showcase.csv).  


## Usage
You must supply at least [4] arguments when running a UKBioPick!

Arguments                         | Description                      
--------------------------------- | --------------------------------
arg1                              | UKBB phenotypic tab file (ukbxxxx.tab)       
arg2                              | Field ID and Field file         
arg3                              | Path to output directory         
arg4                              | Project name                    


You can run **UKBioPick** using the following command:

```
bash run_UKBioPick.sh [arg1:UKBB_phenotypics_tab_file] [arg2:field_ID_file] [arg3:output_directory] [arg4:project_name]
```

## Outputs
**UKBioPick** generates 2 output files:  
- *<project_name>_ ukb_selected_phenotypes.tab*: contains extracted phenotypes in tab-delimited file (similar to original tab file "ukbxxxx.tab").
- *<project_name>_ ukb_selected_phenotypes.info*: shows information about phenotypes availability in the ukbxxxx.tab file, number of measure for each phenotype, and column location on both original and extracted tab file. [Click here to see example](data/ukbxxxxx_ukb_phenotypes.info)


--------------

### Available UKBB phenotypes at dhl_ec (UMC Utrecht)  
- The lates version of UKBB phenotypes file (ukbxxxx.tab) in the HPC is `ukb44641.tab`.   
- You can find the `ukb44641.tab` in this path.   
```
/hpc/dhl_ec/data/ukbiobank/phenotypic/ukb44641.tab
```

##

### Slides
These slides have information about UKBB phenotypes at dhl_ec. [Click here to view slides](https://docs.google.com/presentation/d/1puiKuASZytYSQGJS6kJ629CmGbuVUW8pcx1X5H1gJAI/edit?usp=sharing).

##

### Contact

If you have any suggestions for improvement, discover bugs, etc. please create an [issues](https://github.com/CirculatoryHealth/UKBioPick/issues). For all other questions, please refer to the last author:

Abdulrahman Alasiri | a.i.alasiri [at] umcutrecht.nl

##

### License and copyright

[MIT License](LICENSE)

Copyright (c) 2021-2031 Abdulrahman Alasiri
