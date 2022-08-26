package require pbctools
	mol new ../trj/dump.nvt10.lammpstrjdump type lammpstrj first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all	
	pbc wrap -center com -all
	for { set j -60} { ${j} < 57 } { incr j 4} {
        	set g [expr ${j}+4]
		set num_frames_total 0
        	set z1 ${j}
       	 	set z2 ${g}
		set output [open "out.$z1$z2.2" "w"]

    	set num_frames [molinfo top get numframes]

    		for { set i 0 } { ${i} < ${num_frames} } { incr i 1} {

	        set frame [expr ${num_frames_total} + ${i} + 1]
	
	        puts -nonewline stderr "Reading frame ${i}\r"
		set s0 [atomselect top all frame $i]
		set s01 [atomselect top "type 1 2 3 4 5 6 7 8 9 10 11" frame $i]
		set cen [measure center $s01]
		$s0 moveby [vecinvert $cen]
	        set s1 [atomselect top "type 23 and z>$z1 and z<$z2" frame $i]
		set s2 [atomselect top "type 21 and z>$z1 and z<$z2 or type 24 and z>$z1 and z<$z2" frame $i]
		set s3 [atomselect top "type 22 and z>$z1 and z<$z2" frame $i]
	
	        set numAtomsO [$s1 num]
	        set numAtomsC [$s2 num]
		set numAtomsH [$s3 num]
		set MassAtomsO [expr 16.0 * $numAtomsO]
		set MassAtomsC [expr 12.0 * $numAtomsC]
		set MassAtomsH [expr 1.0 * $numAtomsH]

	                puts -nonewline ${output} [format " %6d    " ${frame}  ]
	                puts -nonewline ${output} [format " %7f\t" ${MassAtomsO}]
			puts -nonewline ${output} [format " %7f\t" ${MassAtomsC}]
			puts -nonewline ${output} [format " %7f\n" ${MassAtomsH}]
		
		$s0 delete
		$s01 delete
		$s1 delete
		$s2 delete
		$s3 delete
    }


close ${output}
}
exit

