package controllers;

import play.*;
import play.api.libs.json.JsPath;
import play.mvc.*;
import views.html.*;
import play.data.*;
import play.Logger;

public class Application extends Controller{

  public static Result index(){
    return ok("Welcome To EzQuote");
}

public static Result uploadPicture(){
  return ok("Picture uploaded.");
}

public static Result returnQuote(){
  return ok("Quote returned");
}
