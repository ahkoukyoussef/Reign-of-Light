///src_dash_state()
phy_active=false;
invulnerable=1;
if (len == 0){ 
dir = mdir; 
}
//      --Dash Distance
len = spd*6;

//      --Get Horizental and Vertical Speed
hspd = lengthdir_x(len,mdir); 
vspd = lengthdir_y(len,mdir);

//      --Move
phy_position_x += hspd;
phy_position_y += vspd;

if(mdir>210 && mdir<330){sprite_index = spr_player_down_1;face=DOWN}
else if(mdir>30 && mdir<150 ){sprite_index = spr_player_up_1;face=UP}
else if( (mdir>330 && mdir<360) || (mdir>0 && mdir<30)  ){sprite_index = spr_player_right_1;face=RIGHT}
else {sprite_index = spr_player_left_1;face=LEFT}

if(instance_place(phy_position_x,phy_position_y,obj_solid_parent)){
phy_active=true;

}

//      --Create The Dash effect
var dash = instance_create(x,y,obj_dash_effect);
dash.sprite_index = sprite_index;


