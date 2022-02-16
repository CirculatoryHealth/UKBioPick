#!/bin/bash

# Step 1: Download the DataDictionary from the UKBiobank site. (http://biobank.ndph.ox.ac.uk/showcase/exinfo.cgi?src=AccessingData)
# Step 2: Select the FieldID and Fiels you need for your research and copy them to your input file. Please take in mind that the header should be like the header in the exapmle below.
# Step 3: Make sure the space between the two columns is tab space as shown in the example below.
# Step 4: When you run the script, type the name of your inputfile after the command you use to run the script. For example: $ bash ukb_pheno.sh tab_file fieldID_file output_directory <project_name>

#							    FieldID Field
#							    3       Verbal interview duration
#							    4       Biometrics duration
#							    5       Sample collection duration
#							    6       Conclusion duration
#							    19      Heel ultrasound method

set -e

### Creating display functions
### Setting colouring
NONE='\033[00m'
OPAQUE='\033[2m'
FLASHING='\033[5m'
BOLD='\033[1m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'
STRIKETHROUGH='\033[9m'

RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'

function echobold { #'echobold' is the function name
    echo -e "${BOLD}${1}${NONE}" # this is whatever the function needs to execute, note ${1} is the text for echo
}
function echoitalic {
    echo -e "${ITALIC}${CYAN}${1}${NONE}"
}
function echonooption {
    echo -e "${OPAQUE}${RED}${1}${NONE}"
}
function echoerrorflash {
    echo -e "${RED}${BOLD}${FLASHING}${1}${NONE}"
}
function echoerror {
    echo -e "${RED}${1}${NONE}"
}
# errors no option
function echoerrornooption {
    echo -e "${YELLOW}${1}${NONE}"
}
function echoerrorflashnooption {
    echo -e "${YELLOW}${BOLD}${FLASHING}${1}${NONE}"
}
function importantnote {
    echo -e "${PURPLE}${1}${NONE}"
}

script_copyright_message() {
        echo ""
        THISYEAR=$(date +'%Y')
        echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
        echo "+ CC-BY-SA-4.0 License                                                                                  +"
  echo "+ Copyright (c) 2021-${THISYEAR} Abdulrahman Alasiri                                                           +"
  echo "+                                                                                                       +"
  echo "+ Copyright (c) 2020 University Medical Center Utrecht                                                  +"
  echo "+                                                                                                       +"
  echo "+ Creative Commons Attribution Share Alike 4.0 International                                            +"
        echo "+                                                                                                       +"
        echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
}

script_arguments_error() {
        echoerrorflash "                                     *** Oh no! Computer says no! ***"
        echoerror ""
        echoerror "An example command would be: run_UKBioPick.sh [arg1:UKBB_phenotypics_tab_file] [arg2:field_ID_file] [arg3:output_directory] [arg4:project_name]"
        echoerror "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
        echo ""
        script_copyright_message
        exit 1
}

echobold "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echobold "+                                             UKBIOPICK                                                 +"
echobold "+                                                                                                       +"
echobold "+                                                                                                       +"
echobold "+ * Written by  : Abdulrahman Alasiri                                                                   +"
echobold "+ * E-mail      : a.i.alasiri@umcutrecht.nl                                                             +"
echobold "+ * Last update : 2021-06-17                                                                            +"
echobold "+ * Version     : 1.1.0                                                                                 +"
echobold "+                                                                                                       +"
echobold "+ * Description : This script will extract your interested UKBB phenotypes according to your list of    +"
echobold "+                 Field ID and Field name using the UKBB phenotypic tab file.                           +"
echobold "+                                                                                                       +"
echobold "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Today's date and time: "$(date)
TODAY=$(date +"%Y%m%d")
echo ""
echo ""
echo ""
echo ""

### START of if-else statement for the number of command-line arguments passed ###
if [[ $# -lt 4 ]]; then
    script_arguments_error "You must supply at least [4] arguments when running a UKBioPick!"

else

    INPUT_TAB_FAILE=$1
    INPUT_FIELD_ID=$2
    OUTPUT=$3
    OUTPUT_FILE_NAME=$4
    OUTPUTFILE=${OUTPUT}/${OUTPUT_FILE_NAME}_

### External Tools
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    MERGE=${SCRIPT_DIR}/bin/merge_tables.pl
    TRANSPOSE=${SCRIPT_DIR}/bin/transpose1.pl

# transpose header of the origin tab file
    head -1 ${INPUT_TAB_FAILE} > ${OUTPUTFILE}heade_1_original.tab
    ${TRANSPOSE} ${OUTPUTFILE}heade_1_original.tab > ${OUTPUTFILE}heade_1_original.tab_trans

# column location for phenotypes
    echo "Column.No.original FieldID" > ${OUTPUTFILE}pheno_location_v1
    awk '{print $1,$1}' ${OUTPUTFILE}heade_1_original.tab_trans | sed 's/\./ /' | sed 's/\./ /' | cat -n| awk '{print $1,$3}' | sort -k2 -u | sed '$d' >> ${OUTPUTFILE}pheno_location_v1
# number of measures
    echo "NO.measure FieldID" > ${OUTPUTFILE}pheno_NO.measure_v1
    awk '{print $1,$1}' ${OUTPUTFILE}heade_1_original.tab_trans | sed 's/\./ /' | sed 's/\./ /' | cut -d' ' -f2 | uniq -c | awk '{print $1, $2}' >> ${OUTPUTFILE}pheno_NO.measure_v1

# phenotypes information file
    echoerrorflash "Extracting required phenotypes from"
    importantnote ${INPUT_TAB_FAILE}
    echo ""
    sed 's/ /\_/g' ${INPUT_FIELD_ID} > ${OUTPUTFILE}f.eid_modif_v1 #replace spaces between wards
# merge number of measures and input file
    ${MERGE} --file1 ${OUTPUTFILE}pheno_NO.measure_v1 --file2 ${OUTPUTFILE}f.eid_modif_v1 --index FieldID > ${OUTPUTFILE}output2.1_v1
# merge column location with previous
    ${MERGE} --file1 ${OUTPUTFILE}pheno_location_v1 --file2 ${OUTPUTFILE}output2.1_v1 --index FieldID | sed  's/NA/0/g' | awk '$3 != 0 && $4 != 0 {print $0}' | sort -k 1n > ${OUTPUTFILE}output2.2_v1

## Extract interest phenotypes from origin tab file
    VAR=$(tail -n +2 ${OUTPUTFILE}output2.2_v1 | awk '{print $4,$4+$3-1}' | sed 's/ /-/g' | ${TRANSPOSE} | sed 's/\t/,/g')
    cut -f1,$VAR ${INPUT_TAB_FAILE} > ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.tab
    echoerrorflash "Just create an tab file contains your interest phenotypes in UKB:"
    importantnote "${OUTPUT_FILE_NAME}_ukb_phenotypes.tab"
    echo ""

# transpose header of the output tab file
    head -1 ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.tab > ${OUTPUTFILE}heade_1_output.tab
    ${TRANSPOSE} ${OUTPUTFILE}heade_1_output.tab > ${OUTPUTFILE}heade_1_output.tab_trans
# column location for phenotypes in output tab
    echo "Column.No.output.tab FieldID" > ${OUTPUTFILE}pheno_location_v2
    awk '{print $1,$1}' ${OUTPUTFILE}heade_1_output.tab_trans | sed 's/\./ /' | sed 's/\./ /' | cat -n| awk '{print $1,$3}' | sort -k2 -u | sed '$d' >> ${OUTPUTFILE}pheno_location_v2
    ${MERGE} --file1 ${OUTPUTFILE}pheno_location_v2 --file2 ${OUTPUTFILE}output2.2_v1 --index FieldID | sed  's/NA/0/g' | awk '$3 != 0 && $4 != 0 && $5 != 0 {print $0}' | sort -k 1n > ${OUTPUTFILE}output2.3_v1

## Print output information file
    echoerrorflash "Processing the phenotypes information file"
    echo ""
    AVAIL=$(tail -n +2 ${OUTPUTFILE}output2.3_v1 | wc -l)
    echo "#### Available phenotypes \(n = ${AVAIL}\) on ${INPUT_TAB_FAILE} ####" > ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.info
    echo  >> ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.info
    cat ${OUTPUTFILE}output2.3_v1 >> ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.info

    echo  >> ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.info
    echo  >> ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.info
    echo  >> ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.info
    NOT_AVAIL=$(awk '$3 == "NA" {print $1,$2}' ${OUTPUTFILE}output2.1_v1 | wc -l)
    echo "#### Unavailable phenotypes \(n = ${NOT_AVAIL}\) on ${INPUT_TAB_FAILE} ####" >> ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.info
    echo  >> ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.info

    awk '$3 == "NA" {print $1,$2}' ${OUTPUTFILE}output2.1_v1 >>  ${OUTPUT}/${OUTPUT_FILE_NAME}_ukb_phenotypes.info
    echoerrorflash "Just create an info file contains more details:"
    importantnote "${OUTPUT_FILE_NAME}_ukb_phenotypes.info"
    echo ""

#####

    rm ${OUTPUTFILE}heade_1_original.tab
    rm ${OUTPUTFILE}heade_1_original.tab_trans
    rm ${OUTPUTFILE}pheno_location_v1
    rm ${OUTPUTFILE}pheno_NO.measure_v1
    rm ${OUTPUTFILE}f.eid_modif_v1
    rm ${OUTPUTFILE}output2.1_v1
    rm ${OUTPUTFILE}output2.2_v1
    rm ${OUTPUTFILE}heade_1_output.tab
    rm ${OUTPUTFILE}heade_1_output.tab_trans
    rm ${OUTPUTFILE}pheno_location_v2
    rm ${OUTPUTFILE}output2.3_v1

    echo ""
    echoitalic "Job is DONE! Thank you for using UKBioPick :)"
    echo ""
    echo ""
    echo ""

fi
script_copyright_message
