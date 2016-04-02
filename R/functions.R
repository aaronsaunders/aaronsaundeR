library(phyloseq)

format_excel_otutable <- function(physeq, fname = FALSE){
  #' A function to format a phyloseq object as an otu table for excel
  #'
  #' @param physeq A phyloseq object.
  #' @param fname An optional filename/path. Saves to file if TRUE.
  #' @export
  #' @examples
  #' format_excel_otutable(myphyseq, fname = "otu_table.csv")
  otus <- as.data.frame(otu_table(physeq))
  otus[ , "OTU_ID"] <- row.names(otus)
  taxa <- as.data.frame(tax_table(physeq))
  taxa[ , "OTU_ID"] <- row.names(taxa)

  df <- merge(otus, taxa, by = "OTU_ID")
  df
  if (!is.null(fname)){
    write.table(df, file = fname, sep = "\t")
  }
}
