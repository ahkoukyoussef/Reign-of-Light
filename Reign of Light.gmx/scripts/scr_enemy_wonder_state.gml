///scr_enemy_wonder_state()

scr_check_for_player();

if(point_direction(x,y, targetx,targety) > spd){
    
    var dir = point_direction(x,y, targetx,targety);
    var hspd = lengthdir_x(spd,dir);
    var vspd = lengthdir_y(spd,dir);

    if(phy_position_x !=  targetx && hspd!=0 && turn==1){
        image_xscale = sign(hspd);
    }
    phy_position_x = phy_position_x + hspd;
    phy_position_y = phy_position_y + vspd;

}