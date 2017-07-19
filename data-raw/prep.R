library(tidyverse)
library(stringr)
library(labelled)

# Go to https://meps.ahrq.gov/mepsweb/data_stats/download_data_files_results.jsp?cboDataYear=All&cboDataTypeY=1%2CHousehold+Full+Year+File&buttonYearandDataType=Search&cboPufNumber=All&SearchTitle=Consolidated+Data

# 2014 --------------------------------------------------------------------

## Download raw data file and SPSS programming statement

zip_url = "https://meps.ahrq.gov/mepsweb/data_files/pufs/h171ssp.zip"
spu_url = "https://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h171/h171spu.txt"
ssp_fil = "data-raw/h171.ssp"

if (!file.exists(ssp_fil)) {
    temp = tempfile(fileext = ".zip")
    download.file(zip_url, temp)
    unzip(temp, exdir = "data-raw", junkpaths = TRUE)
}

## Raw data
haven::read_xpt(ssp_fil) %>% rename_all(tolower) -> f2014
f2014

## Types of variables in the raw data (used in the very long sequence)
map(f2014, typeof) -> var_types
var_types # %>% as_tibble() %>% gather(var, type) %>% count(type)

## SPSS programming statement files
read_lines(spu_url) -> spu
spu

## Define a long sequence to extract variable label from the SPSS statement file
extract_var_la = . %>%
    as_tibble() %>%
    mutate(value = tolower(value)) %>%
    mutate(value = str_trim(value)) %>%
    mutate(i = case_when(
        str_detect(value, "variable label") ~ "variable label",
        str_detect(value, "value labels") ~ "value labels",
        str_detect(value, "execute") ~ "stop"
    )) %>%
    fill(i) %>%
    filter(i == "variable label") %>%
    select(-i) %>%
    slice(-1) %>%
    mutate(value = str_replace_all(value, "'", "")) %>%
    separate(value, c("var", "la"), extra = "merge") %>%
    deframe() %>%
    as.list()

## Assign variable labels
extract_var_la(spu) -> var_label(f2014)

## Define a very long sequence to extract value labels from the SPSS statement file
extract_val_la = . %>%
    as_tibble() %>%
    mutate(value = tolower(value)) %>%
    mutate(value = str_trim(value)) %>%
    mutate(i = case_when(
        str_detect(value, "variable label") ~ "variable label",
        str_detect(value, "value labels") ~ "value labels",
        str_detect(value, "execute") ~ "stop"
    )) %>%
    fill(i) %>%
    filter(i == "value labels") %>%
    select(-i) %>%
    slice(-1) %>%
    mutate(i = if_else(str_detect(value, "\\s/|\\s\\."), row_number(), NA_integer_)) %>%
    fill(i, .direction = "up") %>%
    group_by(i) %>%
    mutate(var = value[1]) %>%
    ungroup() %>%
    {split(.$value, .$var)} %>%
    map(~{
        var = .x[1]
        pieces = .x[-1] %>%
            str_replace_all("\\s/|\\s\\.|'", "") %>%
            str_split_fixed(" ", 2)
        levels = pieces[, 1]
        if (var_types[var] == "double") levels = as.double(levels)
        set_names(levels, pieces[, 2])
    })

## Assign value labels
extract_val_la(spu) -> val_labels(f2014)

## Convert all the labelled vectors into factors
f2014 %>% haven::as_factor() -> f2014

## Print and save
f2014
devtools::use_data(f2014)



# 2013 --------------------------------------------------------------------

## Download raw data file and SPSS programming statement

zip_url = "https://meps.ahrq.gov/mepsweb/data_files/pufs/h163ssp.zip"
spu_url = "https://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h163/h163spu.txt"
ssp_fil = "data-raw/h163.ssp"

if (!file.exists(ssp_fil)) {
    temp = tempfile(fileext = ".zip")
    download.file(zip_url, temp)
    unzip(temp, exdir = "data-raw", junkpaths = TRUE)
}

## Raw data
haven::read_xpt(ssp_fil) %>% rename_all(tolower) -> f2013
f2013

## Types of variables in the raw data (used in the very long sequence)
map(f2013, typeof) -> var_types
var_types

## SPSS programming statement files
read_lines(spu_url) -> spu
spu

## Assign variable labels
extract_var_la(spu) -> var_label(f2013)

## Assign value labels
extract_val_la(spu) -> val_labels(f2013)

## Convert all the labelled vectors into factors
f2013 %>% haven::as_factor() -> f2013

## Print and save
f2013
devtools::use_data(f2013)

# 2012 --------------------------------------------------------------------

## Download raw data file and SPSS programming statement

zip_url = "https://meps.ahrq.gov/mepsweb/data_files/pufs/h155ssp.zip"
spu_url = "https://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h155/h155spu.txt"
ssp_fil = "data-raw/h155.ssp"

if (!file.exists(ssp_fil)) {
    temp = tempfile(fileext = ".zip")
    download.file(zip_url, temp)
    unzip(temp, exdir = "data-raw", junkpaths = TRUE)
}

## Raw data
haven::read_xpt(ssp_fil) %>% rename_all(tolower) -> f2012
f2012

## Types of variables in the raw data (used in the very long sequence)
map(f2012, typeof) -> var_types
var_types

## SPSS programming statement files
read_lines(spu_url) -> spu
spu

## Assign variable labels
extract_var_la(spu) -> var_label(f2012)

## Assign value labels
extract_val_la(spu) -> val_labels(f2012)

## Convert all the labelled vectors into factors
haven::as_factor(f2012) -> f2012

## Print and save
f2012
devtools::use_data(f2012)

# 2011 --------------------------------------------------------------------

## Download raw data file and SPSS programming statement

zip_url = "https://meps.ahrq.gov/mepsweb/data_files/pufs/h147ssp.zip"
spu_url = "https://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h147/h147spu.txt"
ssp_fil = "data-raw/h147.ssp"

if (!file.exists(ssp_fil)) {
    temp = tempfile(fileext = ".zip")
    download.file(zip_url, temp)
    unzip(temp, exdir = "data-raw", junkpaths = TRUE)
}

## Raw data
haven::read_xpt(ssp_fil) %>% rename_all(tolower) -> f2011
f2011

## Types of variables in the raw data (used in the very long sequence)
map(f2011, typeof) -> var_types
var_types

## SPSS programming statement files
read_lines(spu_url) -> spu
spu

## Assign variable labels
extract_var_la(spu) -> var_label(f2011)

## Assign value labels
extract_val_la(spu) -> val_labels(f2011)

## Convert all the labelled vectors into factors
haven::as_factor(f2011) -> f2011

## Print and save
f2011
devtools::use_data(f2011)




# Delete raw ssp files ----------------------------------------------------

unlink("data-raw/*.ssp")
