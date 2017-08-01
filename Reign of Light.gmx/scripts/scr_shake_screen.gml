///scr_shake_screen(time,force)

time = argument0 ;
timer = time;
force = argument1;

        if(alarm[0] >15){
        view.x = obj_player.x - force;
        view.y = obj_player.y - force;

        }else{
        view.x = obj_player.x + force;
        view.y = obj_player.y + force;
        
        }

    
