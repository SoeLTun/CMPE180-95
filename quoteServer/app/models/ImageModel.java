package models;

import com.avaje.ebean.Model;
import play.data.validation.Constraints;
import play.data.*;
import scala.Option;
import java.sql.Connection;
import java.sql.Statement;
import java.util.*;
import java.io.*;
import java.sql.*;
import play.db.*;
import java.util.*;
import javax.persistence.*;
import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;
import com.avaje.ebean.Model.Finder;
import play.Logger;
import play.mvc.Http.*;

@Entity
public class ImageModel  extends Model{

  @Id
  public long id;

  public long userId;

  @Version
  public java.util.Date version;

  @Lob
  public byte[] userUploadedImage;

  @Lob
  public byte[] processedImage;

  public boolean readyForGrabcut;
  public boolean readyForMeasurement;

  public static List<ImageModel> getImages(int teamNumber){
    if(teamNumber == 1){
      return find.where().eq("readyForGrabcut", true).findList();

    }else if(teamNumber == 2){
      return find.where().eq("readyForMeasurement", true).findList();
    }else{
      return null;
    }

  }


  public static ImageModel loadImageModel(String email){
    //this.id = user.id;
    Logger.debug("Find : email");
    ImageModel newUserModel = ImageModel.find.where().eq("email", email).findUnique();

    return newUserModel;
  }

  public static ImageModel loadImageById(Long id){
    ImageModel newImageModel = ImageModel.find.where().eq("id", id).findUnique();
    return newImageModel;
  }


  public static Finder<Long, ImageModel> find = new Finder<Long, ImageModel>(
  Long.class, ImageModel.class);

}
