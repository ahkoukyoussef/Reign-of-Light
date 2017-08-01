///scr_attack_state_1()

image_speed=.5;
/*
switch(sprite_index){
    case spr_player_down_1:
        sprite_index = spr_player_attack_down_1;
    break;
    
    case spr_player_up_1:
        sprite_index = spr_player_attack_up_1;  
    break;
        
    case spr_player_right_1:
        sprite_index = spr_player_attack_right_1;
    break;
        
    case spr_player_left_1:
        sprite_index = spr_player_attack_left_1;
    break;
    
}  */

if(mdir>210 && mdir<330){sprite_index = spr_player_attack_down_1;face=DOWN;}
else if(mdir>30 && mdir<150 ){sprite_index = spr_player_attack_up_1;face=UP;}
else if( (mdir>330 && mdir<360) || (mdir>0 && mdir<30)  ){sprite_index = spr_player_attack_right_1;face=RIGHT;}
else {sprite_index = spr_player_attack_left_1;face=LEFT;}



if(image_index>= 3 and attacked==false){
    var xx=0;
    var yy=0;

    switch(sprite_index){
        case spr_player_attack_down_1:
            xx=x;
            yy=y+12;
        break;
        
        case spr_player_attack_up_1:
            xx=x;
            yy=y-10;
        break;
            
        case spr_player_attack_right_1:
            xx=x+10;
            yy=y+2;    
        
        break;
            
        case spr_player_attack_left_1:
            xx=x-10;
            yy=y+2;
        break;
    } 
    
    var damage = instance_create(xx,yy,obj_elec_ball);
    
    var xdir = lengthdir_x(50,mdir);  
    var ydir = lengthdir_y(50,mdir); 
    damage.creator = id;
    damage.knockback = 5;
    damage.damage = obj_player_stats.Attack;
    damage.spd = 3;
    
    attacked=true;
    with(damage){
        physics_apply_force(x,y,xdir,ydir);
    }
}