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
  public String style;
  public int length;
  public int width;
  public String color;
  public String cost;



}
