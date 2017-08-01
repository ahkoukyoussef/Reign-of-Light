///src_move_state_1()
mdir = point_direction(phy_position_x,phy_position_y,obj_mouse.x,obj_mouse.y);

//      --Get Axis
var xaxis = (obj_input.right_key - obj_input.left_key); // Possible Values : -1 , 0 , 1
var yaxis = (obj_input.down_key - obj_input.up_key);    // Possible Values : -1 , 0 , 1


//      --Get Direction
// Possible Values : 0 , 45 , 90 , 135 , 180 , 225 , 270 , 315
dir = point_direction(0,0,xaxis,yaxis,); 

//      --Get Length
// Possible Values : 0, spd
if (xaxis == 0 and yaxis == 0) {
    len = 0;
} else {
    len = spd;
    //      --Get_Face
    scr_get_face();

}

//      --Get Horizental and Vertical Speed
hspd = lengthdir_x(len,dir); 
vspd = lengthdir_y(len,dir);

//      --Move
phy_position_x += hspd;
phy_position_y += vspd;

//      --Animating
image_speed = sign(len) *0.2;
if (len == 0) image_index =0;


switch(face){

    case RIGHT:
        sprite_index = spr_player_right_1;
    break;
    
    case LEFT:
        sprite_index = spr_player_left_1;
    break;
    
    case UP:
        sprite_index = spr_player_up_1;
    break;
    
    case DOWN:
        sprite_index = spr_player_down_1;
    break;

}


//Attack States



//1
if(obj_input.attack_key && obj_player_stats.spell1_cd<=0){
    var xdir = lengthdir_x(8,face*90);  
    var ydir = lengthdir_y(8,face*90); 
    var speaker = instance_place(x+xdir,y+ydir,obj_speaker);
    if(speaker!=noone){
      
        
            //Activates Dialog
            
            with(speaker){
        
            if(!instance_exists(dialog)){
                dialog = instance_create(x+xoffset,y+yoffset,obj_dialog);
                dialog.text = text;
            }else{
                dialog.text_page++;
                dialog.text_count = 0; 
                if(dialog.text_page > array_length_1d(dialog.text)-1){
                    with(dialog){
                        instance_destroy();
                    }
                }
            }
            
            }
        
        
    }else{
        obj_player_stats.spell1_cd=obj_player_stats.spell1_max_cd; 
        image_index=0;
        state=scr_attack_state_1;
    }
    

}

//2
if(obj_input.special1_key_p and obj_player_stats.Stamina>=5 && obj_player_stats.spell2_cd<=0){
obj_player_stats.spell2_cd=obj_player_stats.spell2_max_cd;
obj_player_stats.Stamina -=5;
image_index=0;
scr_shake_screen(30,3);
state=scr_channel_state_1;


}


//  3
invulnerable=0;

if(obj_input.dash_key && obj_player_stats.Stamina>=3 && obj_player_stats.spell3_cd<=0){
    ///Dash Sound
    if((audio_exists(snd_dash))){
        audio_stop_sound(snd_dash);
        audio_play_sound(snd_dash,1,false);
    }else{
    
       audio_stop_sound(snd_dash);
    }

    obj_player_stats.spell3_cd=obj_player_stats.spell3_max_cd;
    state=scr_dash_state_1;
    obj_player_stats.Stamina-=3;
    alarm[0]= room_speed/8; 
    
    
}

//4
if(obj_input.special2_key and obj_player_stats.Stamina>=10 && obj_player_stats.spell4_cd<=0 ){


  obj_player_stats.spell4_cd=obj_player_stats.spell4_max_cd;
  obj_player_stats.Stamina -=10
  
    
  aura = instance_create(x,y,obj_player_aura);
  aura.creator = id;

  ult = instance_create(x-4,y-160,obj_lightning_down);
  ult.creator = id;
  ult.damage = obj_player_stats.Attack+ult.damage+ult.damage*obj_player_stats.Attack*0.1;
  scr_shake_screen(30,3);

  state = scr_grounded_state_1;  

}

//Refereshing Cooldown
if(obj_player_stats.spell3_cd >= 0){
obj_player_stats.spell3_cd--


}

if(obj_player_stats.spell2_cd >= 0){
obj_player_stats.spell2_cd--


}

if(obj_player_stats.spell1_cd >= 0){
obj_player_stats.spell1_cd--


}


if(obj_player_stats.spell4_cd >= 0){
obj_player_stats.spell4_cd--


}

if(obj_input.ctrl_key_p){

if(obj_input.ctrl_key_r){

state=scr_move_state_1}

//state=scr_camera_state_1;

}
