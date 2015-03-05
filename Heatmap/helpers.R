#colors<-c("midnightblue","royalblue3","palegreen3","orange2","red","red4")

clean<- function(ids){
  GENES<-ids
  GENES<-unique(toupper(GENES))
  #todo check empty genes, two consecutive ,,
  unlist(strsplit(GENES,split=","))
}

heat <- function(var,ids,ncolor,leu) {
  hc.cols <- brewer.pal(ncolor,"RdYlBu")
  E<-exprs(var)
  row.names(E)<-fData(var)$SYMBOL
  Leu<-as.character(var$Leu)
  Pass<-as.character(var$Pass)
  anno<-t(rbind(colnames(var),Pass,Leu))
  Anno<-data.frame(Passage=anno[,2],Donor=anno[,3])
  rownames(Anno)<-anno[,1]
  preINF<- which(Anno$Passage == "preINF")
  Pass1<-which(Anno$Passage == "Pass1")
  Pass4<- which(Anno$Passage == "Pass4")
  Ordered<-E[,c(preINF,Pass1,Pass4)]
  OrderedT<-Anno[c(preINF,Pass1,Pass4),]
  #EGENES<-E[match(ids,rownames(E),nomatch=0),]
  #pheatmap(EGENES,cellwidth=12,cellheight=12,fontsize_row=8,cluster_cols=FALSE,show_colnames=FALSE,color=rev(hc.cols),fontsize=8)
  EGENES<-Ordered[match(ids,rownames(E),nomatch=0),]
  pheatmap(EGENES,annotation=OrderedT,cellwidth=12,cellheight=12,fontsize_row=8,cluster_cols=FALSE,show_colnames=FALSE,color=rev(hc.cols),fontsize=8)
}