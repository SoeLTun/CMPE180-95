package controllers;

import play.*;
import models.*;
import play.api.libs.json.JsPath;
import play.mvc.*;
import views.html.*;
import play.data.*;
import play.Logger;
import play.mvc.Http.*;
import java.io.File;

public class UserController extends Controller{

  public Result newUser(String email, String password){

    return ok("New User Created.");
  }

  public Result userImageUpload(){
            Form<ImageModel> window = Form.form(ImageModel.class);
            ImageModel windowData = window.bindFromRequest().get();
            try{
              MultipartFormData body = request().body().asMultipartFormData();
              MultipartFormData.FilePart picture = body.getFile("userUploadedImage");
          if (picture != null) {
            String fileName = picture.getFilename();
            String contentType = picture.getContentType();
            File file = picture.getFile();
            windowData.userUploadedImage = com.google.common.io.Files.toByteArray(file);
            windowData.readyForGrabcut = true;
            windowData.readyForMeasurement = true;
            windowData.save();
            Logger.debug("Image captured!");
          } else {
              Logger.debug("Unable to capture image.");
            }
          }catch(Exception e){
            Logger.debug("Form Error.");
          }
      return ok("Image received");
    }


}
