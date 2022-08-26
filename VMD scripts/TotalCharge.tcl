package require pbctools
	mol new ../../trj/dump.nvt10.lammpstrjdump type lammpstrj first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all	
	pbc wrap -center com -all
	set num_frames_total 0
        set z1 NUM1
        set z2 NUM2
	set output [open "out.$z1$z2" "w"]

    set num_frames [molinfo top get numframes]

    for { set i 0 } { ${i} < ${num_frames} } { incr i 1} {

        set frame [expr ${num_frames_total} + ${i} + 1]

        puts -nonewline stderr "Reading frame ${i}\r"
	set s0 [atomselect top all frame $i]
	set s01 [atomselect top "type 1 2 3 4 5 6 7 8 9 10 11" frame $i]
	set cen [measure center $s01]
	$s0 moveby [vecinvert $cen]
        set s1 [atomselect top "{index 12212 to 12226 or index 12233 to 12259 or index 12263 to 12274 or index 12278 to 12289 or index 12438 to 12443 or index 12447 to 12461 or index 12465 to 12467 or index 12471 to 12485 or index 12489 to 12515 or index 12664 to 12678 or index 12685 to 12702 or index 12706 to 12723 or index 12727 to 12738 or index 12744 to 12746 or index 12890 to 12904 or index 12908 to 12919 or index 12923 to 12928 or index 12932 to 12943 or index 12947 to 12964 or index 12970 to 12972 or index 13116 to 13124 or index 13128 to 13139 or index 13143 to 13163 or index 13167 to 13184 or index 13188 to 13190 or index 13196 to 13198} and type 23 and z>$z1 and z<$z2" frame $i]
	set s2 [atomselect top "{index 12212 to 12226 or index 12233 to 12259 or index 12263 to 12274 or index 12278 to 12289 or index 12438 to 12443 or index 12447 to 12461 or index 12465 to 12467 or index 12471 to 12485 or index 12489 to 12515 or index 12664 to 12678 or index 12685 to 12702 or index 12706 to 12723 or index 12727 to 12738 or index 12744 to 12746 or index 12890 to 12904 or index 12908 to 12919 or index 12923 to 12928 or index 12932 to 12943 or index 12947 to 12964 or index 12970 to 12972 or index 13116 to 13124 or index 13128 to 13139 or index 13143 to 13163 or index 13167 to 13184 or index 13188 to 13190 or index 13196 to 13198} and type 21 and z>$z1 and z<$z2 or {index 12212 to 12226 or index 12233 to 12259 or index 12263 to 12274 or index 12278 to 12289 or index 12438 to 12443 or index 12447 to 12461 or index 12465 to 12467 or index 12471 to 12485 or index 12489 to 12515 or index 12664 to 12678 or index 12685 to 12702 or index 12706 to 12723 or index 12727 to 12738 or index 12744 to 12746 or index 12890 to 12904 or index 12908 to 12919 or index 12923 to 12928 or index 12932 to 12943 or index 12947 to 12964 or index 12970 to 12972 or index 13116 to 13124 or index 13128 to 13139 or index 13143 to 13163 or index 13167 to 13184 or index 13188 to 13190 or index 13196 to 13198} and type 24 and z>$z1 and z<$z2" frame $i]
	set s3 [atomselect top "{index 12158 to 12211 or index 12290 to 12291 or index 12384 to 12437 or index 12516 to 12517 or index 12610 to 12663 or index 12742 to 12743 or index 12836 to 12889 or index 12968 to 12969 or index 13062 to 13115 or index 13194 to 13195} and z>$z1 and z<$z2" frame $i] 
	set s4 [atomselect top "{index 12227 12230 12260 12275 12292 12444 12462 12468 12486 12518 12679 12682 12703 12724 12739 12905 12920 12929 12944 12965 13125 13140 13164 13185 13191} and z>$z1 and z<$z2" frame $i]
	set s5 [atomselect top "{index 12228 12231 12261 12276 12293 12445 12463 12469 12487 12519 12680 12683 12704 12725 12740 12906 12921 12930 12945 12966 13126 13141 13165 13186 13192} and z>$z1 and z<$z2" frame $i]
	set s6 [atomselect top "{index 12229 12232 12262 12277 12294 12446 12464 12470 12488 12520 12681 12684 12705 12726 12741 12907 12922 12931 12946 12967 13127 13142 13166 13187 13193} and z>$z1 and z<$z2" frame $i]
	set s7 [atomselect top "{index 12383 12295 to 12379 12521 to 12605 12609 12747 to 12831 12835 12973 to 13057 13061 13199 to 13283 13287} and z>$z1 and z<$z2" frame $i]
	set s8 [atomselect top "{index 13287 to 13292 13297 to 13316} and z>$z1 and z<$z2" frame $i]
	set s9 [atomselect top "index 13293 and z>$z1 and z<$z2" frame $i]
	set s10 [atomselect top "type 20 and z>$z1 and z<$z2 and x*x+y*y<480" frame $i]	
	set numAtomsO1 [$s1 num]
        set numAtomsC1 [$s2 num]
	set numAtomsC2 [$s3 num]
	set numAtomsC3 [$s4 num]
	set numAtomsO2 [$s5 num]
	set numAtomsO3 [$s6 num]
	set numAtomsH1 [$s7 num]
	set numAtomsH2 [$s8 num]
	set numAtomsO4 [$s9 num]
	set numAtomsN [$s10 num]
	set chargeO1 [expr -0.639424 * $numAtomsO1]
	set chargeC1 [expr 0.188910 * $numAtomsC1]
	set chargeC2 [expr -0.007507 * $numAtomsC2]
	set chargeC3 [expr 0.19407 * $numAtomsC3]
	set chargeO2 [expr -0.169821 * $numAtomsO2]
	set chargeO3 [expr -0.34221 * $numAtomsO3]
	set chargeH1 [expr 0.0335774 * $numAtomsH1]
	set chargeH2 [expr 0.220236 * $numAtomsH2]
	set chargeO4 [expr 1.0 * $numAtomsO4]
	set chargeN [expr 1.0 * $numAtomsN]
                puts -nonewline ${output} [format " %6d    " ${frame}  ]
                puts -nonewline ${output} [format " %7.4f\t" ${chargeO1}]
		puts -nonewline ${output} [format " %7.4f\t" ${chargeC1}]
		puts -nonewline ${output} [format " %7.4f\t" ${chargeC2}]
		puts -nonewline ${output} [format " %7.4f\t" ${chargeC3}]
		puts -nonewline ${output} [format " %7.4f\t" ${chargeO2}]
                puts -nonewline ${output} [format " %7.4f\t" ${chargeO3}]
                puts -nonewline ${output} [format " %7.4f\t" ${chargeH1}]
                puts -nonewline ${output} [format " %7.4f\t" ${chargeH2}]
		puts -nonewline ${output} [format " %7.4f\t" ${chargeO4}]
		puts -nonewline ${output} [format " %7.4f\n" ${chargeN}]
	
	$s0 delete
	$s01 delete
	$s1 delete
	$s2 delete
	$s3 delete
        $s4 delete
        $s5 delete
        $s6 delete
        $s7 delete
        $s8 delete
        $s9 delete
        $s10 delete


    }


close ${output}
exit

