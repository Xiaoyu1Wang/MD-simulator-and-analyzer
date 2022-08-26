package require pbctools
        mol addfile ../../minimization_33_NVT_cons_5/dump.nvt10.lammpstrjdump type lammpstrj first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all
	pbc wrap -center com -all
	set num_frames_total 0
	set output [open "out.numwater2" "w"]

    set num_frames [molinfo top get numframes]

    for { set i 0 } { ${i} < ${num_frames} } { incr i 1} {

        set frame [expr ${num_frames_total} + ${i} + 1]

        puts -nonewline stderr "Reading frame ${i}\r"
	set s0 [atomselect top all frame $i]
	set cen [measure center $s0]
	$s0 moveby [vecinvert $cen]
	set s1 [atomselect top "type 12 and -41.5<z and z<41.5 and x*x+y*y<480" frame $i]

        set numAtomsN [$s1 num]
                puts -nonewline ${output} [format " %6d    " ${frame}  ]
                puts -nonewline ${output} [format " %6d\n" ${numAtomsN}]

	$s0 delete
	$s1 delete
    }


close ${output}
exit

