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
import java.io.*;
import java.util.*;
import play.libs.Json;
import com.fasterxml.jackson.databind.JsonNode;
import javax.imageio.*;

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
          windowData.windowImage = com.google.common.io.Files.toByteArray(file);
          windowData.save();
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
  Logger.debug("Num Requested: " + numRequested);
  JsonNode images = Json.toJson(ImageModel.getImages(numRequested));
  if(images != null){
      return ok(images);
    }else{
      return ok("No images to return");
    }
  }

  public Result requestImageFile(int numRequested){
    Logger.debug("Num Requested: " + numRequested);
    JsonNode images = Json.toJson(ImageModel.getImages(numRequested));
    ImageModel[] imageItems = new ImageModel[20];
    int x = 0;

    for (JsonNode item : images) { //Loads results from api call to JsonNode. Stores in FeedItem
										imageItems[x] = new ImageModel();
										imageItems[x].userUploadedImage = item.get("userUploadedImage").textValue();
										imageItems[x].id = item.get("id").textValue();
                    imageItems[x].userId = item.get("userId").textValue();

                    x++;
										//Logger.debug(item.get("pubDate").textValue());
										}

    //File file = ImageIO.read(new ByteArrayInputStream());

    if(images != null){
        return ok(images);
      }else{
        return ok("No images to return");
      }
    }

public Result returnQuote(){
    return ok("Quote returned");
  }
}
