///scr_inventory_add_item(x,y,item)
var xx = argument[0];
var yy = argument[1];
var add_item = argument[2];

if(xx!=median(0,xx,obj_inventory.width-1) || yy!=median(0,yy,obj_inventory.height-1)){
    show_debug_message("The x and y are outside of the range");
    exit;
}