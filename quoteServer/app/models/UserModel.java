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
import play.db.ebean.Model.Finder;
import play.Logger;



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



  public static Finder<Long,UserModel> find = new Finder<Long,UserModel>(
  Long.class, UserModel.class
);

}
