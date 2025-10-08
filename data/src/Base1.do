clear all
set more off
use Base1.dta

/*Niveles Salud Mental*/
gen SM=1
replace SM=2 if ssmc=="Nivel de riesgo medio"
replace SM=3 if ssmc=="Nivel de riesgo alto"

/*Niveles por riesgo sicosocial*/
gen R1=1
replace R1=2 if rs1c=="Nivel de riesgo medio"
replace R1=3 if rs1c=="Nivel de riesgo alto"

gen R2=1
replace R2=2 if rs2c=="Nivel de riesgo medio"
replace R2=3 if rs2c=="Nivel de riesgo alto"

gen R3=1
replace R3=2 if rs3c=="Nivel de riesgo medio"
replace R3=3 if rs3c=="Nivel de riesgo alto"

gen R4=1
replace R4=2 if rs4c=="Nivel de riesgo medio"
replace R4=3 if rs4c=="Nivel de riesgo alto"

gen R5=1
replace R5=2 if rs5c=="Nivel de riesgo medio"
replace R5=3 if rs5c=="Nivel de riesgo alto"

gen R6=1
replace R6=2 if rs6c=="Nivel de riesgo medio"
replace R6=3 if rs6c=="Nivel de riesgo alto"

/*Dicotomización Variable Asalariados*/
gen Asalariada=0
replace Asalariada=1 if categoria=="Asalariada"

/*Ingreso en millones */
gen income=ingreso/1000000

/*Estadística Descriptiva */
sum ssmt R1 R2 R3 R4 R5 R6 estadocivil edad Educación income

/*Regresiones con NIVELES*/
eststo m1: reg SM Asalariada R1 R2 R3 R4 R5 R6, robust
eststo m2: reg SM Asalariada R1 R2 R3 R4 R5 R6 estadocivil edad Educación income, robust
eststo m3: reg SM Asalariada R1 R2 R3 R4 R5 R6 estadocivil edad Educación income Cuidadoniños trabajohogar, robust
eststo m4: reg SM Asalariada R1 R2 R3 R4 R5 R6 estadocivil edad Educación income Cuidadoniños trabajohogar Región integranteshogar, robust
eststo m5: reg SM Asalariada R1 R2 R3 R4 R5 R6 estadocivil edad Educación income Cuidadoniños trabajohogar Región integranteshogar migrante, robust

esttab m1 m2 m3 m4 m5, se(%9.4f) b(%9.4f) star(* 0.10 ** 0.05 *** 0.01) r2 ar2 sca(F) compress nogap

/*Regresiones con Y como cifra*/
eststo n1: reg ssmt rs1 rs2 rs3 rs4 rs5 rs6, robust
eststo n2: reg ssmt rs1 rs2 rs3 rs4 rs5 rs6 estadocivil edad Educación income, robust
eststo n3: reg ssmt rs1 rs2 rs3 rs4 rs5 rs6 estadocivil edad Educación income, robust
eststo n4: reg ssmt rs1 rs2 rs3 rs4 rs5 rs6 estadocivil edad Educación income, robust
eststo n5: reg ssmt rs1 rs2 rs3 rs4 rs5 rs6 estadocivil edad Educación income, robust

esttab n1 n2 n3 n4 n5, se(%9.4f) b(%9.4f) star(* 0.10 ** 0.05 *** 0.01) r2 ar2 sca(F Método) compress

/*FIN DEL CODIGO*/


/*Detalles variables*/
*R1: carga_de_trabajo_total
*R2: condiciones_de_trabajo_exigencias_emocionales
*R3: condiciones_de_trabajo_compañerismo
*R4: condiciones_de_trabajo_inseguridad
*R5: condiciones_de_trabajo_EQUILIBRIO TRABAJO /VIDA PRIVADA
*R6: condiciones_de_trabajo_VIOLENCIA Y ACOSO