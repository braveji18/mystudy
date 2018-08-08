// ORM class for table 'SENSOR'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:57:32 KST 2017
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class SENSOR extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("sensor_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sensor_name = (String)value;
      }
    });
    setters.put("device_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        device_name = (String)value;
      }
    });
    setters.put("sensor_type", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sensor_type = (String)value;
      }
    });
    setters.put("sensor_model", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sensor_model = (String)value;
      }
    });
    setters.put("sensor_id", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sensor_id = (String)value;
      }
    });
    setters.put("sensor_manufacturer", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sensor_manufacturer = (String)value;
      }
    });
    setters.put("description", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        description = (String)value;
      }
    });
    setters.put("reg_date", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        reg_date = (java.sql.Timestamp)value;
      }
    });
  }
  public SENSOR() {
    init0();
  }
  private String sensor_name;
  public String get_sensor_name() {
    return sensor_name;
  }
  public void set_sensor_name(String sensor_name) {
    this.sensor_name = sensor_name;
  }
  public SENSOR with_sensor_name(String sensor_name) {
    this.sensor_name = sensor_name;
    return this;
  }
  private String device_name;
  public String get_device_name() {
    return device_name;
  }
  public void set_device_name(String device_name) {
    this.device_name = device_name;
  }
  public SENSOR with_device_name(String device_name) {
    this.device_name = device_name;
    return this;
  }
  private String sensor_type;
  public String get_sensor_type() {
    return sensor_type;
  }
  public void set_sensor_type(String sensor_type) {
    this.sensor_type = sensor_type;
  }
  public SENSOR with_sensor_type(String sensor_type) {
    this.sensor_type = sensor_type;
    return this;
  }
  private String sensor_model;
  public String get_sensor_model() {
    return sensor_model;
  }
  public void set_sensor_model(String sensor_model) {
    this.sensor_model = sensor_model;
  }
  public SENSOR with_sensor_model(String sensor_model) {
    this.sensor_model = sensor_model;
    return this;
  }
  private String sensor_id;
  public String get_sensor_id() {
    return sensor_id;
  }
  public void set_sensor_id(String sensor_id) {
    this.sensor_id = sensor_id;
  }
  public SENSOR with_sensor_id(String sensor_id) {
    this.sensor_id = sensor_id;
    return this;
  }
  private String sensor_manufacturer;
  public String get_sensor_manufacturer() {
    return sensor_manufacturer;
  }
  public void set_sensor_manufacturer(String sensor_manufacturer) {
    this.sensor_manufacturer = sensor_manufacturer;
  }
  public SENSOR with_sensor_manufacturer(String sensor_manufacturer) {
    this.sensor_manufacturer = sensor_manufacturer;
    return this;
  }
  private String description;
  public String get_description() {
    return description;
  }
  public void set_description(String description) {
    this.description = description;
  }
  public SENSOR with_description(String description) {
    this.description = description;
    return this;
  }
  private java.sql.Timestamp reg_date;
  public java.sql.Timestamp get_reg_date() {
    return reg_date;
  }
  public void set_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
  }
  public SENSOR with_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof SENSOR)) {
      return false;
    }
    SENSOR that = (SENSOR) o;
    boolean equal = true;
    equal = equal && (this.sensor_name == null ? that.sensor_name == null : this.sensor_name.equals(that.sensor_name));
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.sensor_type == null ? that.sensor_type == null : this.sensor_type.equals(that.sensor_type));
    equal = equal && (this.sensor_model == null ? that.sensor_model == null : this.sensor_model.equals(that.sensor_model));
    equal = equal && (this.sensor_id == null ? that.sensor_id == null : this.sensor_id.equals(that.sensor_id));
    equal = equal && (this.sensor_manufacturer == null ? that.sensor_manufacturer == null : this.sensor_manufacturer.equals(that.sensor_manufacturer));
    equal = equal && (this.description == null ? that.description == null : this.description.equals(that.description));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof SENSOR)) {
      return false;
    }
    SENSOR that = (SENSOR) o;
    boolean equal = true;
    equal = equal && (this.sensor_name == null ? that.sensor_name == null : this.sensor_name.equals(that.sensor_name));
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.sensor_type == null ? that.sensor_type == null : this.sensor_type.equals(that.sensor_type));
    equal = equal && (this.sensor_model == null ? that.sensor_model == null : this.sensor_model.equals(that.sensor_model));
    equal = equal && (this.sensor_id == null ? that.sensor_id == null : this.sensor_id.equals(that.sensor_id));
    equal = equal && (this.sensor_manufacturer == null ? that.sensor_manufacturer == null : this.sensor_manufacturer.equals(that.sensor_manufacturer));
    equal = equal && (this.description == null ? that.description == null : this.description.equals(that.description));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.sensor_name = JdbcWritableBridge.readString(1, __dbResults);
    this.device_name = JdbcWritableBridge.readString(2, __dbResults);
    this.sensor_type = JdbcWritableBridge.readString(3, __dbResults);
    this.sensor_model = JdbcWritableBridge.readString(4, __dbResults);
    this.sensor_id = JdbcWritableBridge.readString(5, __dbResults);
    this.sensor_manufacturer = JdbcWritableBridge.readString(6, __dbResults);
    this.description = JdbcWritableBridge.readString(7, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(8, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.sensor_name = JdbcWritableBridge.readString(1, __dbResults);
    this.device_name = JdbcWritableBridge.readString(2, __dbResults);
    this.sensor_type = JdbcWritableBridge.readString(3, __dbResults);
    this.sensor_model = JdbcWritableBridge.readString(4, __dbResults);
    this.sensor_id = JdbcWritableBridge.readString(5, __dbResults);
    this.sensor_manufacturer = JdbcWritableBridge.readString(6, __dbResults);
    this.description = JdbcWritableBridge.readString(7, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(8, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(sensor_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sensor_type, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sensor_model, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sensor_id, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sensor_manufacturer, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(description, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 8 + __off, 93, __dbStmt);
    return 8;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(sensor_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sensor_type, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sensor_model, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sensor_id, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(sensor_manufacturer, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(description, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 8 + __off, 93, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.sensor_name = null;
    } else {
    this.sensor_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.device_name = null;
    } else {
    this.device_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.sensor_type = null;
    } else {
    this.sensor_type = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.sensor_model = null;
    } else {
    this.sensor_model = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.sensor_id = null;
    } else {
    this.sensor_id = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.sensor_manufacturer = null;
    } else {
    this.sensor_manufacturer = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.description = null;
    } else {
    this.description = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.reg_date = null;
    } else {
    this.reg_date = new Timestamp(__dataIn.readLong());
    this.reg_date.setNanos(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.sensor_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_name);
    }
    if (null == this.device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_name);
    }
    if (null == this.sensor_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_type);
    }
    if (null == this.sensor_model) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_model);
    }
    if (null == this.sensor_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_id);
    }
    if (null == this.sensor_manufacturer) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_manufacturer);
    }
    if (null == this.description) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, description);
    }
    if (null == this.reg_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.reg_date.getTime());
    __dataOut.writeInt(this.reg_date.getNanos());
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.sensor_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_name);
    }
    if (null == this.device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_name);
    }
    if (null == this.sensor_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_type);
    }
    if (null == this.sensor_model) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_model);
    }
    if (null == this.sensor_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_id);
    }
    if (null == this.sensor_manufacturer) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sensor_manufacturer);
    }
    if (null == this.description) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, description);
    }
    if (null == this.reg_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.reg_date.getTime());
    __dataOut.writeInt(this.reg_date.getNanos());
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_name==null?"null":sensor_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_name==null?"null":device_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_type==null?"null":sensor_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_model==null?"null":sensor_model, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_id==null?"null":sensor_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_manufacturer==null?"null":sensor_manufacturer, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(description==null?"null":description, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(reg_date==null?"null":"" + reg_date, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_name==null?"null":sensor_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_name==null?"null":device_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_type==null?"null":sensor_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_model==null?"null":sensor_model, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_id==null?"null":sensor_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_manufacturer==null?"null":sensor_manufacturer, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(description==null?"null":description, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(reg_date==null?"null":"" + reg_date, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_name = null; } else {
      this.sensor_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_name = null; } else {
      this.device_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_type = null; } else {
      this.sensor_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_model = null; } else {
      this.sensor_model = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_id = null; } else {
      this.sensor_id = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_manufacturer = null; } else {
      this.sensor_manufacturer = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.description = null; } else {
      this.description = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.reg_date = null; } else {
      this.reg_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_name = null; } else {
      this.sensor_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_name = null; } else {
      this.device_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_type = null; } else {
      this.sensor_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_model = null; } else {
      this.sensor_model = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_id = null; } else {
      this.sensor_id = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sensor_manufacturer = null; } else {
      this.sensor_manufacturer = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.description = null; } else {
      this.description = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.reg_date = null; } else {
      this.reg_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    SENSOR o = (SENSOR) super.clone();
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
    return o;
  }

  public void clone0(SENSOR o) throws CloneNotSupportedException {
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("sensor_name", this.sensor_name);
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("sensor_type", this.sensor_type);
    __sqoop$field_map.put("sensor_model", this.sensor_model);
    __sqoop$field_map.put("sensor_id", this.sensor_id);
    __sqoop$field_map.put("sensor_manufacturer", this.sensor_manufacturer);
    __sqoop$field_map.put("description", this.description);
    __sqoop$field_map.put("reg_date", this.reg_date);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("sensor_name", this.sensor_name);
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("sensor_type", this.sensor_type);
    __sqoop$field_map.put("sensor_model", this.sensor_model);
    __sqoop$field_map.put("sensor_id", this.sensor_id);
    __sqoop$field_map.put("sensor_manufacturer", this.sensor_manufacturer);
    __sqoop$field_map.put("description", this.description);
    __sqoop$field_map.put("reg_date", this.reg_date);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
