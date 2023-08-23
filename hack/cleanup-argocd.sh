oc delete gitopsservice cluster -n openshift-gitops
oc delete crds analysisruns.argoproj.io            
oc delete crds analysistemplates.argoproj.io       
oc delete crds applications.argoproj.io            
oc delete crds applicationsets.argoproj.io         
oc delete crds appprojects.argoproj.io             
oc delete crds argocds.argoproj.io                 
oc delete crds clusteranalysistemplates.argoproj.io
oc delete crds experiments.argoproj.io             
oc delete crds rolloutmanagers.argoproj.io         
oc delete crds rollouts.argoproj.io                