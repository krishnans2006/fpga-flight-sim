# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\krishnan\Documents\fpga-flight-sim\flight_sim_sdk\flight_sim_top\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\krishnan\Documents\fpga-flight-sim\flight_sim_sdk\flight_sim_top\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {flight_sim_top}\
-hw {C:\Users\krishnan\Documents\fpga-flight-sim\flight_sim\flight_sim_top.xsa}\
-out {C:/Users/krishnan/Documents/fpga-flight-sim/flight_sim_sdk}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {flight_sim_top}
platform generate -quick
platform generate
platform config -updatehw {C:/Users/krishnan/Documents/fpga-flight-sim/flight_sim/flight_sim_top.xsa}
platform generate -domains 
platform active {flight_sim_top}
platform config -updatehw {C:/Users/krishnan/Documents/fpga-flight-sim/flight_sim/flight_sim_top.xsa}
platform generate -domains 
platform config -updatehw {C:/Users/krishnan/Documents/fpga-flight-sim/flight_sim/flight_sim_top.xsa}
platform generate -domains 
