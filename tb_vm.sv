module tb_vm #(//VALUES TO FEED
parameter ITEM_SUPP,	//WHICH ITEM TO RESTOCK	(1 To 6 for BUTTONS 0 THROUGH 6; 0, 7, 8 INDICATE NO ITEM)
		  COUNT_SUPP,	//FOR THE ITEM TO RESTOCK HOW MANY ITEMS TO RESTOCK (MAXIMUM VALUE IS 15) 
	      COST_SUPP,	//FOR THE ITEM TO RESTOCK HOW MUCH SHOULD BE THE COST FOR THAT ITEM (MAXIMUM VALUE IS 255) 
	      COINS,		//COINS THE USER WILL INPUT (1-NICKEL; 2-DIME; 3-QUARTER; 0-NO COINS)
  BUTTON);		// BUTTON THE USER WILL PRESS TO FETCH AN ITEM (VALID INPUTS ARE 0 To 5);
		  

//SUPPLIER INPUTS TO DESIGN
bit valid_s;
bit [2:0] items_s;
bit [3:0] count_s;
bit [7:0] cost_s;
bit enter_key;

//USER INPUTS TO DESIGN
bit [1:0]coins;
bit [5:0]button;

//ESSENTIAL INPUTS
bit clk, rst;

//MISC. INPUTS
bit load_flag;
int i;



//MODULE INSTANTIATION
vm dut(.valid_s(valid_s),
	   .item_s(item_s),
	   .count_s(count_s),
	   .cost_s(cost_s),
	   .enter_key(enter_key),
	   .clk(clk),
       .rst(rst),
       .coins(coins));
	   
initial 
begin
	clk=0;
	rst=0;
	forever #5 clk=~clk;
end

initial 
begin
	if(rst==1)
	begin
		valid_s=1;
		for(i=1; i<=8; i++)	// 	FOR STARTING AT 1 BECAUSE THE item_s=3'b000 is not used
		begin
			if(i==ITEM_SUPP)
			begin
				item_s=ITEM_SUPP;
				count_s=COUNT_SUPP;
				cost_s=COST_SUPP;
				button[i-1]=1;
				valid_s=0;
				rst=0;
				break;
				//$display(values)
			end
		end
    end
		
	if ((rst==0) && (valid_s==0))
	begin
		coins=COINS;
		//for()
		enter_key=1;
		button[BUTTON]=1;
	end
end

endmodule
