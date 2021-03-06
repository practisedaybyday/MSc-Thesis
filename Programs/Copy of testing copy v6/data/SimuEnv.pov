// Persistence Of Vision raytracer version 3.5 sample file.
// Utah Teapot w/ Bezier patches
// adapted by Alexander Enzmann


global_settings { assumed_gamma 1.0 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

#declare My_Focus = <0.0000, 1.0000, 0.0000>;
#declare My_Camera_Location = <0.0000, 0.0000, 0.0000>;

#declare My_Water_Texture =
texture {
    pigment{ rgbf <1.0, 1.0, 1.5, 0.85> }
    finish {                
//        phong 0.9 phong_size 100
        specular 0.9 roughness 0.01
        reflection {0.02 1 fresnel}
        ambient 0.05
        diffuse 0.05
        conserve_energy
    }
}
#declare My_Water_Interior =
interior {
    ior 1.33
    fade_distance 5
    fade_power 1
//    fade_color <1, 1, 1>
}

#declare My_Water_Material =
material {
    texture {My_Water_Texture}
    interior {My_Water_Interior}
}
                                    
#declare Camera_Location_Up = 2;
#declare Camera_Zoom_In = -6;
camera {
   location  <My_Camera_Location.x,
              My_Camera_Location.y+Camera_Location_Up,
              My_Camera_Location.z+Camera_Zoom_In>
                 //<0.0, 0.0, -10.0>
//   direction <0.0, 0.0,  1.0>
//   up        <0.0, 1.0,  0.0>
   up        <0.0, 1.2,  0.0>
   right     <2/3, 0.0,  0.0>
   look_at   <My_Focus.x, My_Focus.y, My_Focus.z>
}

light_source { <10.0, 10.0, 10.0> colour White
}
light_source { <-10.0, 10.0, -10.0> colour White
/*    spotlight
    radius 14
    falloff 16
    tightness 10
    point_at My_Focus
*/
}

#declare pre_cond = 1;
#if (pre_cond)
        #declare cond = 1;
#else                              
        #declare cond = 0;
#end
#if (cond)
        #declare test_radius = 1;
#else                              
        #declare test_radius = 0.5;
#end

sphere { My_Focus, test_radius material {My_Water_Material} }                               

#declare Sphere_Water = 
sphere {
    My_Focus, 1
//  pigment { color rgb <1, 1, 1> }
//  finish { ambient 0 diffuse 0 reflection 0.9 }
    material {My_Water_Material}
}                               

/*  
sky_sphere {
    pigment {
        gradient y
        color_map {
            [0 color White]//rgb <0.05, 0.05, 0.05>]
            [1 color rgb <0.05, 0.05, 0.55>]
        }
        scale 5
        translate -1
    }
}
*/
    
/* Background */
plane {
   z, 20

   texture {
      pigment {
        color rgb <0.5, 0.5, 0.9>
//         checker color red 0.2 green 0.5 blue 0.2
  //               color red 0.6 green 0.6 blue 0.6
    //     scale 160
      }
   }
}
    
/* Floor */
plane {
   y, -1.1

   texture {
      pigment {   
        color Gray
//        color rgb <0.5, 0.5, 0.9>
//         checker color red 0.2 green 0.2 blue 0.5
  //               color red 0.6 green 0.6 blue 0.6
     //   scale 1
      }
   }
}
