///src_dash_state()
phy_active=false;
dashing=1;
if (len == 0){ 
dir = face*90; 
}
//      --Dash Distance
len = spd*4;

//      --Get Horizental and Vertical Speed
hspd = lengthdir_x(len,dir); 
vspd = lengthdir_y(len,dir);

//      --Move
phy_position_x += hspd;
phy_position_y += vspd;

//      --Create The Dash effect
var dash = instance_create(x,y,obj_dash_effect);
dash.sprite_index = sprite_index;
phy_active=true;