///scr_attack_state_1()

image_speed=.5;

switch(sprite_index){
    case spr_player_down:
        sprite_index = spr_player_attack_down;
    break;
    
    case spr_player_up:
        sprite_index = spr_player_attack_up;  
    break;
        
    case spr_player_right:
        sprite_index = spr_player_attack_right;
    break;
        
    case spr_player_left:
        sprite_index = spr_player_attack_left;
    break;
    
}  

if(image_index>= 3 and attacked==false){
    var xx=0;
    var yy=0;

    switch(sprite_index){
        case spr_player_attack_down:
            xx=x;
            yy=y+12;
        break;
        
        case spr_player_attack_up:
            xx=x;
            yy=y-10;
        break;
            
        case spr_player_attack_right:
            xx=x+10;
            yy=y+2;    
        
        break;
            
        case spr_player_attack_left:
            xx=x-10;
            yy=y+2;
        break;
    } 
    var damage = instance_create(xx,yy,obj_elec_ball);
    var xdir = lengthdir_x(50,face*90);  
    var ydir = lengthdir_y(50,face*90); 
    damage.creator = id;
    damage.knockback = 5;
    damage.damage = obj_player_stats.Attack;
    damage.spd = 3;
    
    attacked=true;
    with(damage){
        physics_apply_force(x,y,xdir,ydir);
    }
}