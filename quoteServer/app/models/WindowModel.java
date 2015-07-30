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
public class WindowModel  extends Model{

  @Id
  public long id;

  @Lob
  public byte[] windowImage;

  public String manufacturer_Name;
  public String series;
  public String style;
  public int length;
  public int width;
  public String color;
  public String cost;
  public String frame_type;
  public String grid_style;
  public String grid_type;
  public boolean tempered;
  public String glass_type;

  public void saveImage(){

  }

  public static Finder<Long,WindowModel> find = new Finder<Long,WindowModel>(
  Long.class, WindowModel.class);


}
