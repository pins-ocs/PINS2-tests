#--------------------------------------------------------------------------#
#   ____        _ _               ____ _               
#  / ___| _ __ | (_)_ __   ___   / ___| | __ _ ___ ___ 
#  \___ \| '_ \| | | '_ \ / _ \ | |   | |/ _` / __/ __|
#   ___) | |_) | | | | | |  __/ | |___| | (_| \__ \__ \
#  |____/| .__/|_|_|_| |_|\___|  \____|_|\__,_|___/___/
#        |_|                                           
#   ____       _               
#  / ___|  ___| |_ _   _ _ __  
#  \___ \ / _ \ __| | | | '_ \ 
#   ___) |  __/ |_| |_| | |_) |
#  |____/ \___|\__|\__,_| .__/ 
#                       |_|    
#--------------------------------------------------------------------------#
# possible choices

include Mechatronix

# user defined values

mechatronix do |data|
  
  # Read tabulated file data
  # p "Start reading data from file"
  pars, table = Utils::read_from_table(File.expand_path('../n_ref_traject.txt', __FILE__))
  #p table 
  
  # p "Data read correctly and trajectory built"
  data.SplineSetNRef =
    {
      #:spline_type  => [ "quintic", "quintic" ],
      :spline_type  => ["linear"],
      :headers      => ["n_ref_traj"],
      :xdata         => table["zeta"], #.map {|x|x*Math::PI/180.0},
      :ydata         => [table["n_ref"], ],
    }

  #p data.SplineSet[:data]

end

#EOF
