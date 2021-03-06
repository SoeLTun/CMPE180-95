package models;

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
import com.avaje.ebean.Model;






@Entity
public class UserModel  extends Model{

  @Id
  public long id;

  @Version
  public java.util.Date version;

  //@Constraints.Required
  @Column(unique=true)
  public String email;

  //@Constraints.Required
  public String password;

  public static UserModel loadUserModel(String email){
    //this.id = user.id;
    Logger.debug("Find : email");
    UserModel newUserModel = UserModel.find.where().eq("email", email).findUnique();

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


  public static Finder<Long,UserModel> find = new Finder<Long,UserModel>(
  Long.class, UserModel.class
);

}
