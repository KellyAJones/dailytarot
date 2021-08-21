Rails.application.routes.draw do



  # Routes for the Daily spread resource:

  # CREATE
  post("/insert_daily_spread", { :controller => "daily_spreads", :action => "create" })
          
  # READ
  get("/daily_spreads", { :controller => "daily_spreads", :action => "index" })
  
  get("/daily_spreads/:path_id", { :controller => "daily_spreads", :action => "show" })
  
  # UPDATE
  
  post("/modify_daily_spread/:path_id", { :controller => "daily_spreads", :action => "update" })
  
  # DELETE
  get("/delete_daily_spread/:path_id", { :controller => "daily_spreads", :action => "destroy" })

  #------------------------------

  # Routes for the Tarot card resource:

  # CREATE
  post("/insert_tarot_card", { :controller => "tarot_cards", :action => "create" })
          
  # READ
  get("/tarot_cards", { :controller => "tarot_cards", :action => "index" })
  
  get("/tarot_cards/:path_id", { :controller => "tarot_cards", :action => "show" })
  
  # UPDATE
  
  post("/modify_tarot_card/:path_id", { :controller => "tarot_cards", :action => "update" })
  
  # DELETE
  get("/delete_tarot_card/:path_id", { :controller => "tarot_cards", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
