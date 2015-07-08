package controllers;

import play.*;
import play.api.libs.json.JsPath;
import play.mvc.*;
import views.html.*;
import play.data.*;
import play.Logger;

public class Application extends Controller{

public Result index(){
    return ok("Welcome To EzQuote");
}

  public Result uploadPicture(){
    return ok("Picture uploaded.");
  }

  public Result returnQuote(){
    return ok("Quote returned");
  }
}
