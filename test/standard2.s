main:   addi $2,$0,5	#2=5
        ori $3,$0,12	#3=12
        addi $7,$0,7	#7=7
	andi $7,$7,3	#7=3 
        or   $4,$7,$2   #4=7
        and  $5,$3,$4   #5=4
        add  $5,$5,$4   #5=11
        beq  $5,$7,end  # 11 = 3
        slt  $4,$3,$4   #4=0
        bne  $3,$0,around # 0 = 0
        addi $5,$0,0    
around: slti  $4,$7,5   #4=1
        add  $7,$4,$5   #7=12
        sub  $7,$7,$2   #7=7
        sw   $7,84($3)  #[0x60]=7
        lw   $2,96($0)  #2=[0x60]=7
        j    end        # go to end
        sw   $7,80($3)  #[0x5b]=7 
end:    sw   $2,100($0)  #[0x64]=7
        j    main       # do it again
        addi $7,$0,7    #7=7
	andi $7,$7,3	#7=3 