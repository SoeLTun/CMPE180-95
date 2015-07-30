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
    if(teamnumber == 1){
      return list = find.where().eq("readForGrabcut", true).findList();

    }else if(teamNumber == 2){
      return list = find.where().eq("readForMeasurement", true).findList();
    }else{
      return null;
    }

  }


  public static UserModel loadUserModel(String email){
    //this.id = user.id;
    Logger.debug("Find : email");
    UserModel newUserModel = ImageModel.find.where().eq("email", email).findUnique();

    return newUserModel;
  }

  public static UserModel loadUserById(Long id){
    UserModel newUserModel = UserModel.find.where().eq("id", id).findUnique();
    return newUserModel;
  }

  public static List<UserModel> findByName(String name){
    List<UserModel> newUserModel = find.where().ilike("userName", "%" + name + "%").findList();
    return newUserModel;
  }

  public static Finder<Long, ImageModel> find = new Finder<Long, ImageModel>(
  Long.class, ImageModel.class);

}
