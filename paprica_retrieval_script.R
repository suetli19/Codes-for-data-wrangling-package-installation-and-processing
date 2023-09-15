aws s3 cp s3://amili-global-archive/16S/v3/batch_lsg3_147/ /home/suetli/NICU/v3/ --recursive --exclude "*" --include "*.zip"


#move zip files to one folder in the current directory
find ./ -type f -exec mv -t ./ {} +
  
  
#execute the script to unzip the files to respective folders in new output directory
chmod +x rename_zip_files.sh

./rename_zip_files.sh


#execute the script to untar the merged.tar.gz file in each folder to new respective folders in output directory
chmod +x untar_merged.sh

./untar_merged.sh


#move outputs to respective folders --for edge
chmod +x move_and_rename.sh

./move_and_rename.sh


#move output for --taxa
chmod +x move_and_rename_taxa.sh

./move_and_rename_taxa.sh



#move output for --pathway
chmod +x move_and_rename_path.sh

./move_and_rename_path.sh


#In Rstudio --do separately for edge, taxa, pathway and ec
#edge table
nicu_edge = list.files(pattern = ".txt")

nicu_edge_bind <- lapply(nicu_edge, fread) %>% 
  set_names(nicu_edge) %>% 
  rbindlist(idcol = "Sample", fill = T) %>%
  select(-Sample) 

write.csv(nicu_edge_bind, '~/NICU/v3/nicu_edge_bind.csv')


##taxa table
nicu_taxa = list.files(pattern = ".txt")

nicu_taxa_bind <- lapply(nicu_taxa, fread) %>% 
  set_names(nicu_taxa) %>% 
  rbindlist(idcol = "Sample", fill = T) %>%
  select(-Sample) 

write.csv(nicu_taxa_bind, '~/NICU/v3/nicu_taxa_bind.csv')


##pathway table
nicu_path = list.files(pattern = ".txt")

nicu_path_bind <- lapply(nicu_path, fread) %>% 
  set_names(nicu_path) %>% 
  rbindlist(idcol = "Sample", fill = T) %>%
  select(-Sample) 

write.csv(nicu_path_bind, '~/NICU/v3/nicu_path_bind.csv')


