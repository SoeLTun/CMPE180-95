package controllers;

import play.*;
import models.*;
import play.api.libs.json.JsPath;
import play.mvc.*;
import views.html.*;
import play.data.*;
import play.Logger;

public class Application extends Controller{

public Result index(){
  Form<WindowModel> windowForm = Form.form(WindowModel.class);
    return ok(upload.render(windowForm));
}



public Result uploadPicture(){
          Form<WindowModel> window = Form.form(WindowModel.class);
          WindowModel windowData = window.bindFromRequest().get();
          try{
              MultipartFormData body = request().body().asMultipartFormData();
              MultipartFormData.FilePart picture = body.getFile("windowImage");
        if (picture != null) {
          String fileName = picture.getFilename();
          String contentType = picture.getContentType();
          File file = picture.getFile();
          window.windowImage = com.google.common.io.Files.toByteArray(file);
          window.save();
          Logger.debug("Image captured!");
        } else {
          Logger.debug("Unable to capture image.");
        }
      }catch(Exception e){
        Logger.debug("Form Error.");
      }

          return ok("Picture uploaded.");
        }


public Result requestImages(int numRequested){

    ImageModel.getImages(numRequested);

    return ok("Image Sent");
  }

public Result returnQuote(){
    return ok("Quote returned");
  }
}
