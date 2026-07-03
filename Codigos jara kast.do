clear
cd "C:\Users\juanm\Desktop\votacion jara kast"
use "base jara kast"

gen porcentaje_rechazo=rechazo/(apruebo+rechazo)*100
gen porcentaje_apruebo=apruebo/(apruebo+rechazo)*100


twoway (scatter porcentaje_kast pobreza, mcolor(gray)) (lfit porcentaje_kast pobreza) , /// 
	xtitle(Porcentaje de pobreza) ytitle(Porcentaje votación Kast) legend(off)

	
twoway ///
 (scatter porcentaje_kast pobreza, mcolor(gs12) msymbol(O) msize(small)) ///
 (lfit porcentaje_kast pobreza, lcolor(navy) lpattern(dash)), ///
 ///
 text(88 45 "y = 0.9443x - 0.814", size(small)) ///
 text(85 45 "R{sup:2} = 0.9332", size(small) color(navy)) ///
 text(82 45 "(p < 0.001)", size(vsmall)) ///
 ///
 title("Del Rechazo '22 a Kast '25") ///
 xtitle("% Rechazo (Sept. 2022)") ///
 ytitle("% Kast (Dic. 25)") ///
 legend(off)

 
twoway ///
 (scatter porcentaje_kast pobreza if !inlist(nombre,"Vitacura","Colchane","Isla de Pascua","Lo Espejo"), ///
     mcolor(gs12) msymbol(O) msize(small)) ///
 ///
 (scatter porcentaje_kast pobreza if nombre=="Vitacura", ///
     mcolor(navy) msymbol(O) msize(medlarge) ///
     mlabel(nombre) mlabpos(12)) ///
 ///
 (scatter porcentaje_kast pobreza if nombre=="Colchane", ///
     mcolor(navy) msymbol(O) msize(medlarge) ///
     mlabel(nombre) mlabpos(12)) ///
 ///
 (scatter porcentaje_kast pobreza if inlist(nombre,"Isla de Pascua","Lo Espejo"), ///
     mcolor(red) msymbol(O) msize(medlarge) ///
     mlabel(nombre) mlabpos(12)) ///
 ///
 (lfit porcentaje_kast pobreza, ///
     lcolor(navy) lpattern(dash) lwidth(medthick)), ///
 ///
 title("Del Rechazo '22 a Kast '25") ///
 xtitle("% Rechazo (Sept. 2022)") ///
 ytitle("% Kast (Dic. 25)") ///
 legend(off)

corr porcentaje_kast pobreza
twoway ///
 (scatter porcentaje_kast pobreza, mcolor(gs15) mlcolor(gs9) msymbol(O) msize(small)) ///
 (lfit porcentaje_kast pobreza, lcolor(ebblue) lpattern(dash)) ///
 (scatter porcentaje_kast pobreza if nombre=="Vitacura" | nombre=="Colchane" | nombre=="Las Condes" | nombre=="Lo Barnechea", ///
	mlabel(nombre) mlabpos(3) mlabsize() mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_kast pobreza if nombre=="Pedro Aguirre Cerda" | nombre=="Lo Espejo" , ///
	mlabel(nombre) mlabpos(3) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_kast pobreza if  nombre=="San Joaquín", ///
	mlabel(nombre) mlabpos(9) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_kast pobreza if nombre=="Juan Fernández"  , ///
	mlabel(nombre) mlabpos(4) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
	, ///
	xtitle(Porcentaje de pobreza) ytitle(Porcentaje votación Kast) legend(off) ///
 text(98 8 "y = 1.094x + 53.1", color(gs4)) ///
 text(94 8 "R{sup:2} = 0.27", color(gs4)) ///
 text(90 8 "(p < 0.001)", color(gs4)) ///
 ///
 xtitle("Tasa de pobreza") ///
 ytitle("Votación Kast (Porcentaje)") ///
 legend(off) ysize(16) xsize(16)  ylabel(40 50 60 70 80 90 100)
 

 
twoway ///
 (scatter porcentaje_kast pobreza, mcolor(gs15) mlcolor(gs9) msymbol(O) msize(small)) ///
 (lfit porcentaje_kast pobreza if region==13, lcolor(ebblue) lpattern(dash)) ///
 (scatter porcentaje_kast pobreza if nombre=="Vitacura" | nombre=="Colchane" | nombre=="Las Condes" | nombre=="Lo Barnechea", ///
	mlabel(nombre) mlabpos(3) mlabsize() mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_kast pobreza if nombre=="Pedro Aguirre Cerda" | nombre=="Lo Espejo" , ///
	mlabel(nombre) mlabpos(3) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_kast pobreza if  nombre=="San Joaquín", ///
	mlabel(nombre) mlabpos(9) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_kast pobreza if nombre=="Juan Fernández"  , ///
	mlabel(nombre) mlabpos(4) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
	if region==13, ///
	xtitle(Porcentaje de pobreza) ytitle(Porcentaje votación Kast) legend(off) ///
 ///
 xtitle("Tasa de pobreza") ///
 ytitle("Votación Kast (Porcentaje)") ///
 legend(off) ysize(16) xsize(16)  ylabel(40 50 60 70 80 90)
 
 
reg porcentaje_jara ruralidad
 
twoway ///
 (scatter porcentaje_jara ruralidad, mcolor(gs15) mlcolor(gs9) msymbol(O) msize(small)) ///
 (lfit porcentaje_jara ruralidad , lcolor(ebblue) lpattern(dash)) ///
 (scatter porcentaje_jara ruralidad if nombre=="Vitacura"  , ///
	mlabel(nombre) mlabpos(3) mlabsize() mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_jara ruralidad if  nombre=="Colchane" , ///
	mlabel(nombre) mlabpos(9) mlabsize() mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_jara ruralidad if nombre=="Pedro Aguirre Cerda" , ///
	mlabel(nombre) mlabpos(3) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_jara ruralidad if nombre=="Juan Fernández"  , ///
	mlabel(nombre) mlabpos(9) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
	, ///
	xtitle(Porcentaje de pobreza) ytitle(Porcentaje votación Jara) legend(off) ///
 ///
 xtitle("Porcentaje de población rural") ///
 ytitle("Votación Jara (Porcentaje)") ///
 legend(off) ysize(16) xsize(16)  ylabel(10 20 30 40 50 60)

gen ruralidad2=ruralidad^2
gen ruralidad3=ruralidad^3
gen ruralidad4=ruralidad^4
reg porcentaje_jara ruralidad ruralidad2 ruralidad3 
 
gen lnjara=ln(jara)
gen lnrural=ln(ruralidad)
gen lnkast=ln(kast)
corr lnjara lnrural

gen lntotal= ln(total_votos)
 
twoway (scatter lnkast lnrural)(lfit lnkast lnrural)
twoway (scatter lnjara lnrural)(lfit lnjara lnrural)

twoway (scatter lnkast lnrural)(lfit lnkast lnrural)
twoway (scatter porcentaje_jara ruralidad)(lfit porcentaje_jara ruralidad)

reg porcentaje_jara i.region
predict resid_porcentaje_jara,r
reg ruralidad i.region
predict resid_ruralidad,r

reg porcentaje_jara i.region ruralidad

reg resid_porcentaje_jara resid_ruralidad
twoway (scatter resid_porcentaje_jara resid_ruralidad)(lfit resid_porcentaje_jara resid_ruralidad)

twoway ///
 (scatter resid_porcentaje_jara resid_ruralidad, mcolor(gs15) mlcolor(gs9) msymbol(O) msize(small)) ///
 (lfit resid_porcentaje_jara resid_ruralidad , lcolor(ebblue) lpattern(dash)) ///
 (scatter resid_porcentaje_jara resid_ruralidad if nombre=="Vitacura"  , ///
	mlabel(nombre) mlabpos(3) mlabsize() mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter resid_porcentaje_jara resid_ruralidad if  nombre=="Colchane" , ///
	mlabel(nombre) mlabpos(9) mlabsize() mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter resid_porcentaje_jara resid_ruralidad if nombre=="Iquique" , ///
	mlabel(nombre) mlabpos(11) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
 (scatter resid_porcentaje_jara resid_ruralidad if nombre=="Juan Fernández"  , ///
	mlabel(nombre) mlabpos(9) mlabsize() mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
	, ///
	xtitle(Porcentaje de pobreza) ytitle(Porcentaje votación Jara) legend(off) ///
 ///
 xtitle("Ruralidad comunal (residuo neto de efectos fijos regionales)") ///
 ytitle("Votación Jara (residuo neto de efectos fijos regionales)") ///
 legend(off) ysize(16) xsize(16)  ylabel(-30 -20 -10 0 10 20 30) xlabel(-100 -50 0 50 100) yline(0) xline(0)

twoway ///
 (scatter resid_porcentaje_jara resid_ruralidad, ///
     mcolor(gs15) mlcolor(gs9) msymbol(O) msize(small)) ///
 (lfit resid_porcentaje_jara resid_ruralidad, ///
     lcolor(ebblue) lpattern(dash)) ///
 (scatter resid_porcentaje_jara resid_ruralidad if nombre=="Vitacura", ///
     mlabel(nombre) mlabpos(3) mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter resid_porcentaje_jara resid_ruralidad if nombre=="Colchane", ///
     mlabel(nombre) mlabpos(9) mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter resid_porcentaje_jara resid_ruralidad if nombre=="Iquique", ///
     mlabel(nombre) mlabpos(11) mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
 (scatter resid_porcentaje_jara resid_ruralidad if nombre=="Juan Fernández", ///
     mlabel(nombre) mlabpos(9) mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)), ///
 ///
 xtitle("Ruralidad comunal (residuo neto de efectos fijos regionales)") ///
 ytitle("Votación Jara (residuo neto de efectos fijos regionales)") ///
 legend(off) ///
 ylabel(-30 -20 -10 0 10 20 30) ///
 xlabel(-100 -50 0 50 100) ///
 yline(0) xline(0) ///
 aspectratio(1)

reg porcentaje_kast porcentaje_rechazo

 twoway ///
 (scatter porcentaje_kast porcentaje_rechazo, ///
     mcolor(gs15) mlcolor(gs9) msymbol(O) msize(small)) ///
 (lfit porcentaje_kast porcentaje_rechazo, ///
     lcolor(ebblue) lpattern(dash)) ///
 (scatter porcentaje_kast porcentaje_rechazo if nombre=="Vitacura", ///
     mlabel(nombre) mlabpos(3) mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_kast porcentaje_rechazo if nombre=="Colchane", ///
     mlabel(nombre) mlabpos(9) mcolor(blue*0.3) mlcolor(blue*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_kast porcentaje_rechazo if nombre=="Pedro Aguirre Cerda", ///
     mlabel(nombre) mlabpos(12) mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)) ///
 (scatter porcentaje_kast porcentaje_rechazo if nombre=="Juan Fernández", ///
     mlabel(nombre) mlabpos(6) mcolor(red*0.3) mlcolor(red*0.8) msymbol(O) msize(small)), ///
 ///
  xsize(16) ysize(16) ///
 text(98 52 "Y = 0.939X - 0.555", color(gs4)) ///
 text(94 52 "R{sup:2} = 0.9376", color(gs4)) ///
 text(90 52 "(p < 0.001)", color(gs4)) ///
 xtitle("Votación Rechazo (Porcentaje)") ///
 ytitle("Votación Kast (Porcentaje)") ///
 legend(off) 

 