# Every window PAA xyz 
package require pbctools
	mol new ../trj/dump.nvt10.lammpstrjdump type lammpstrj first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all
	pbc wrap -center com -all
	set num_frames_total 0
	set output [open "out.RzPAA" "w"]
	
    set num_frames [molinfo top get numframes]

    for { set i 0 } { ${i} < ${num_frames} } { incr i 1} {

        set frame [expr ${num_frames_total} + ${i} + 1]

        puts -nonewline stderr "Reading frame ${i}\r"
	set s0 [atomselect top all frame $i]
	set s1 [atomselect top "type 1 2 3 4 5 6 7 8 9 10 11" frame $i]
	set cen [measure center $s1]
	$s0 moveby [vecinvert $cen]
        puts -nonewline stderr "Reading frame ${i}\r"
	set s2 [atomselect top "type 23" frame $i]
	set PAAO_index [$s2 get index]
	foreach PAAOindex $PAAO_index {
		set a [atomselect top "index $PAAOindex" frame $i]
		set x [$a get x]
		set y [$a get y]
		set z [$a get z]

			puts -nonewline ${output} [format " %7d" ${frame}  ]
			puts -nonewline ${output} [format " %7d" ${PAAOindex} ]
	       		puts -nonewline ${output} [format " %7.4f" ${x} ]
			puts -nonewline ${output} [format " %7.4f" ${y} ]
			puts -nonewline ${output} [format " %7.4f\n" ${z} ]
		$a delete
	    }
	    $s0 delete
	    $s1 delete
	    $s2 delete
	}

close ${output}
exit

