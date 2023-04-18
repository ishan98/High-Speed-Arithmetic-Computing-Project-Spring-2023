#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(min max);


my $n = 6;
my $r = 8;
my $k = 1;

my $and_gate = 0;
my $sha_gate = 0;
my $mha_gate = 0;
my $rha_gate = 0;
my $rfa_gate = 0;
my $mfa_gate = 0;
my $ha_gate = 0; 
my $fa_gate = 0;

# my @adderInfo = (0, 0 ,0, 0, 0, 0, 0, 0);# 6, 12, 0 r - n + 2 + k length 
# my @adderInfo = (0, 0, 0, -1);# 6, 8, 0 r - n + 2 + k length 
 my @adderInfo = (0, 0, 0, 0, -1);# 6, 8, 1 r - n + 2 + k length 
# my @adderInfo = (0, 0, 0, 0 ,1, -1);# 6, 8, 2 r - n + 2 + k length 
# my @adderInfo = (0, 0, 0, 0 ,1, 1, -1);# 6, 8, 3 r - n + 2 + k length 

# my @adderInfo =  (0, 0, 0, 0 ,0, 0, 0, 0, 0);# 8, 16, 0 r - n + 2 + k length 
# my @adderInfo =  (0, 0, -1);# 8, 9, 0 r - n + 2 + k length 
# my @adderInfo =  (0, 0, 0, -1);# 8, 9, 1 r - n + 2 + k length 
# my @adderInfo =    (0, 0, 0, 1, -1);# 8, 9, 2 r - n + 2 + k length 
# my @adderInfo =  (0, 0, 0, 1 ,1, -1);# 8, 9, 3 r - n + 2 + k length 

# my @adderInfo =  (0, 0, 0, 0 ,0, 0, 0, 0, 0, 0, 0, 0, 0);# 12, 24, 0 r - n + 2 + k length
# my @adderInfo =  (0, 0, 0, 0, 0, -1);# 12, 16, 0 r - n + 2 + k length v
# my @adderInfo =  (0, 0, 0, 0, 0, 0, -1);# 12, 16, 1 r - n + 2 + k length 
# my @adderInfo =  (0, 0, 0, 0, 0, 0, 1, -1);# 12, 16, 2 r - n + 2 + k length
# my @adderInfo =  (0, 0, 0, 0, 0, 0, 1 ,1, -1);# 12, 16, 3 r - n + 2 + k length 


# my @adderInfo =  (0)x27;# 25, 50, 0 r - n + 2 + k length
# my @adderInfo =  (0, 0, 0, 0, 0, 0, 1, 0, 0);# 25, 32, 0 r - n + 2 + k length 
# my @adderInfo =    (0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1);# 25, 32, 2 r - n + 2 + k length 
# my @adderInfo =  (0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, -1);# 25, 32, 4 r - n + 2 + k length 
# my @adderInfo =  (0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, -1);# 25, 32, 8 r - n + 2 + k length 
 # my @adderInfo =  (0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1);# 25, 32, 12 r - n + 2 + k length 
###############################################################
my $msbOp = $n-1;
my $msbResult = (2*$n)-1;
my $numIndex = (2*$n);
my $resultmsb = $r - 1;
###############################################################

open(FH,'>',"./project_1/project_1.srcs/sources_1/new/array_truncated_cct.v");
print FH ("module array_t(a,b,result);
input  [$msbOp:0] a;
input  [$msbOp:0] b;
output [$resultmsb:0] result;\n");


# generates the matrix for the array multiplier
for (my $row=0; $row < $n; $row++)
{
    if ($row == 0)
    {
        for (my $i = 0; $i < min($r - $n + $k + 1, $n); $i++)
        {
            my $aindex = $n - $i - 1;

            print FH ("wire s_row_res_$row\_$aindex;\n");
            print FH ("AND_my and$row\_$aindex(s_row_res_$row\_$aindex, a[$aindex], b[$row]);\n");
	    $and_gate = $and_gate + 1;
        }
    }
    else
    {
        # first AND gate 
        my $prev_row = $row - 1;
        print FH ("wire s_row_res_$row\_$msbOp;\n");# row refers to the originating row of the wire 
        print FH ("AND_my and$row\_$msbOp(s_row_res_$row\_$msbOp, a[$msbOp], b[$row]);\n");
	$and_gate = $and_gate + 1;

        my $num_columns = min($r - $n + $k + $row + 1, $n);# one more for the VCT

        for (my $i = 1; $i < $num_columns; $i++)
        {
            my $aindex = $n - $i - 1;
            my $a_prev_index = $aindex + 1;

            if ($row == 1) 
            {
                if (($adderInfo[$i] == 0) || ($i <= ($r - $n))) # r-n MHAs in the 1st row + atmost k more based on adderInfo
                {
                    # use MHA 
                    print FH ("wire c_row_res_$row\_$aindex, s_row_res_$row\_$aindex;\n");
                    print FH ("mha mha$row\_$aindex(a[$aindex], b[$row], s_row_res_$prev_row\_$a_prev_index, 
                    c_row_res_$row\_$aindex, s_row_res_$row\_$aindex);\n");
			$mha_gate = $mha_gate + 1;
                }
                elsif (($adderInfo[$i] == 1) && ($i >= ($r - $n + 2)) && ($i <= ($r - $n + $k)))
                {
                    # use SHA 
                    print FH ("wire c_row_res_$row\_$aindex, s_row_res_$row\_$aindex;\n");
                    print FH ("sha sha$row\_$aindex(a[$aindex], b[$row], s_row_res_$prev_row\_$a_prev_index, 
                    c_row_res_$row\_$aindex, s_row_res_$row\_$aindex);\n");
		    $sha_gate = $sha_gate + 1;
                }
                else
                {
                    #use AND
                    print FH ("wire c_row_res_$row\_$aindex;\n");
                    print FH ("AND_my and$row\_$aindex(c_row_res_$row\_$aindex, a[$aindex], b[$row]);\n");
		    $and_gate = $and_gate + 1;
                }               
            }
            elsif ($row < (2*$n - $k - $r)) #ramp part : (2*$n - $k - $r) is the length of the ramp (if it is present 0 or negative otherwise)
            {
                if ($i < ($num_columns - 1))#(num_columns - 2) MFAs
                {
                    # use MFA 
                    print FH ("wire s_row_res_$row\_$aindex, c_row_res_$row\_$aindex;\n");
                    print FH ("mfa mfa$row\_$aindex(a[$aindex], b[$row], s_row_res_$prev_row\_$a_prev_index, c_row_res_$prev_row\_$aindex, 
                    c_row_res_$row\_$aindex, s_row_res_$row\_$aindex);\n");
		    $mfa_gate = $mfa_gate + 1;
                }
                elsif ($i == ($num_columns - 1))# 1 AND(last column)
                {
                     #use AND
                    print FH ("wire c_row_res_$row\_$aindex;\n");
                    print FH ("AND_my and$row\_$aindex(c_row_res_$row\_$aindex, a[$aindex], b[$row]);\n");
	             $and_gate = $and_gate + 1;
                }
            }
            elsif  ($row <= ($n - 1))
            {
                if ($i < ($num_columns - 1)) #(num_columns - 2) MFAs
                {
                    # use MFA 
                    print FH ("wire s_row_res_$row\_$aindex, c_row_res_$row\_$aindex;\n");
                    print FH ("mfa mfa$row\_$aindex(a[$aindex], b[$row], s_row_res_$prev_row\_$a_prev_index, c_row_res_$prev_row\_$aindex, 
                    c_row_res_$row\_$aindex, s_row_res_$row\_$aindex);\n");
			$mfa_gate = $mfa_gate + 1;
                }
                elsif ($i == ($num_columns - 1))
                {
                    my $Outputneeded = ($row >= (2*$n - $r)) && ($row <= ($n - 1)) ;
                    my $SpaceAboveEmpty = ($row <= (2*$n - $k - $r - 1));# compares with the row corresponding to the end of the ramp

                    if (($Outputneeded == 0) && ($SpaceAboveEmpty == 1))
                    {
                        # RHA
                        print FH ("wire c_row_res_$row\_$aindex;\n");
                        print FH ("rha rha$row\_$aindex(a[$aindex], b[$row], s_row_res_$prev_row\_$a_prev_index, 
                        c_row_res_$row\_$aindex);\n");
			$rha_gate = $rha_gate + 1;
                    }
                    elsif (($Outputneeded == 0) && ($SpaceAboveEmpty == 0))
                    {
                        # RFA
                        print FH ("wire c_row_res_$row\_$aindex;\n");
                        print FH ("rfa rfa$row\_$aindex(a[$aindex], b[$row], s_row_res_$prev_row\_$a_prev_index, c_row_res_$prev_row\_$aindex,
                        c_row_res_$row\_$aindex);\n");
			$rfa_gate = $rfa_gate + 1;
                    }
                    elsif (($Outputneeded == 1) && ($SpaceAboveEmpty == 1))
                    {
                        # MHA
                        print FH ("wire s_row_res_$row\_$aindex, c_row_res_$row\_$aindex;\n");
                        print FH ("mha mha$row\_$aindex(a[$aindex], b[$row], s_row_res_$prev_row\_$a_prev_index, 
                        c_row_res_$row\_$aindex, s_row_res_$row\_$aindex);\n");
			$mha_gate = $mha_gate + 1;
                    }
                    elsif (($Outputneeded == 1) && ($SpaceAboveEmpty == 0))
                    {
                         # use MFA
                        print FH ("wire s_row_res_$row\_$aindex, c_row_res_$row\_$aindex;\n");
                        print FH ("mfa mfa$row\_$aindex(a[$aindex], b[$row], s_row_res_$prev_row\_$a_prev_index, c_row_res_$prev_row\_$aindex, 
                        c_row_res_$row\_$aindex, s_row_res_$row\_$aindex);\n");
			$mfa_gate = $mfa_gate + 1;
                    }
                }
            }
        }
    }
}


for (my $i = 1; $i <= ($n - 1); $i++)# i is the column number 
{
    my $aindex = $n - $i - 1;
    my $a_prev_index = $aindex + 1;
    my $a_next_index = $aindex - 1;
    my $result_bit = $aindex + $r - $n;
    
    if ($i == ($n - 1))#last column is HA
    {
        print FH ("wire cFull_$aindex;\n");
        print FH ("normal_HA haResult$result_bit(s_row_res_$msbOp\_$a_prev_index, c_row_res_$msbOp\_$aindex, 
        cFull_$aindex, result[$result_bit]);\n");
	$ha_gate = $ha_gate + 1;
    }
    else # from 1 to (last - 1) is FAs
    {
        print FH ("wire cFull_$aindex;\n");
        print FH ("normal_FA faResult$result_bit(s_row_res_$msbOp\_$a_prev_index, c_row_res_$msbOp\_$aindex, cFull_$a_next_index, 
        cFull_$aindex, result[$result_bit]);\n");
	$fa_gate = $fa_gate + 1;
    }
}

for (my $i = 0; $i < ($r - $n); $i++)
{
    my $rownum = 2*$n + $i -$r;
    print FH ("assign result[$i] = s_row_res_$rownum\_0;\n");
}

my $t = $n - 2;
my $resultMsb = $r - 1;
print FH ("assign result[$resultMsb] = cFull_$t;\n");# MSB of the result is carry of the MSB FA


print FH ("endmodule;\n");
print (" $and_gate $sha_gate $mha_gate $rha_gate $rfa_gate $mfa_gate $ha_gate $fa_gate \n" );
close(FH);
