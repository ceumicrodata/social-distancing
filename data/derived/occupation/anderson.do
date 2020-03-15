/* Anderson
Michael L Anderson. 2008. Multiple Inference and Gender differences in the Effects of Early
Intervention: A Reevaluation of the Abecedarian, Perry Preschool, and Early Training Projects.
J. Amer. Statist. Assoc. 103, 484 (2008).
*/

*andersen
quietly foreach i of varlist contact customers face2face group {
 cap drop std_`i'
 sum `i' 
 gen std_`i'=(`i'-r(mean))/r(sd)
}
corr std_contact std_customers std_face2face std_group , cov
matrix cov = r(C)
matrix invcov=inv(cov)
matrix D=J(4,1,1)
matrix weights=invcov*D

gen communication_and=weights[1,1]*std_contact + weights[2,1]*std_customers + weights[3,1]* std_face2face + weights[4,1]* std_group 
label var communication_and "summary index of contact customers face2face group using Andesren method"
