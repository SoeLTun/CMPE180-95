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

  @Version
  public java.util.Date version;

  @Lob
  public byte[] userUploadedImage;


}