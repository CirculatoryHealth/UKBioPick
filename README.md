# UKBioPick
============
[![License](https://img.shields.io/badge/license-CC--BY--SA--4.0-orange)](https://choosealicense.com/licenses/cc-by-sa-4.0)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/CirculatoryHealth/LoFTK)

The UKBioPick allows extraction of interested UK Biobank (UKBB) phenotypes.


--------------

## Installation and use

### Requirements
- `Bash`
- UKBB phenotypic tab-delimited file (ukbxxxx.tab)
- Create a file contains Field ID (column1) and Field (column2) with tab separated. You can find them in the [UKBB data dictionary](https://biobank.ndph.ox.ac.uk/~bbdatan/Data_Dictionary_Showcase.csv).  

--------------

### Usage
You must supply at least [4] arguments when running a UKBioPick!

Arguments                         | Description                      
--------------------------------- | -------------------------------- 
arg1                              | UKBB phenotypic tab file        
arg2                              | Field ID and Field file         
arg3                              | Path to output directory         
arg4                              | Project name                    


You can run **UKBioPick** using the following command:

```
bash run_UKBioPick.sh [arg1:UKBB_phenotypics_tab_file] [arg2:field_ID_file] [arg3:output_directory] [arg4:project_name]
```
--------------

### Contact

If you have any suggestions for improvement, discover bugs, etc. please create an [issues](https://github.com/CirculatoryHealth/UKBioPick/issues). For all other questions, please refer to the last author:

Abdulrahman Alasiri | a.i.alasiri [at] umcutrecht.nl

--------------

#### CC-BY-SA-4.0 License
##### Copyright (c) 2020 University Medical Center Utrecht

Creative Commons Attribution-ShareAlike 4.0 International Public License

By exercising the Licensed Rights (defined in the [LICENSE](LICENSE)), you accept and agree to be bound by the terms and conditions of this Creative Commons Attribution-ShareAlike 4.0 International Public License ("Public License"). To the extent this Public License may be interpreted as a contract, you are granted the Licensed Rights in consideration of your acceptance of these terms and conditions, and the Licensor grants you such rights in consideration of benefits the Licensor receives from making the Licensed Material available under these terms and conditions.

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Reference: https://choosealicense.com/licenses/cc-by-sa-4.0/#.
