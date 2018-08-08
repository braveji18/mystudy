// ORM class for table 'DEVICE'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:55:41 KST 2017
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

public class DEVICE extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("device_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        device_name = (String)value;
      }
    });
    setters.put("manufacturer", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        manufacturer = (String)value;
      }
    });
    setters.put("device_model", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        device_model = (String)value;
      }
    });
    setters.put("device_type", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        device_type = (String)value;
      }
    });
    setters.put("device_order", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        device_order = (Integer)value;
      }
    });
    setters.put("sn", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sn = (String)value;
      }
    });
    setters.put("device_id", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        device_id = (String)value;
      }
    });
    setters.put("sensor_count", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sensor_count = (Integer)value;
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
  public DEVICE() {
    init0();
  }
  private String device_name;
  public String get_device_name() {
    return device_name;
  }
  public void set_device_name(String device_name) {
    this.device_name = device_name;
  }
  public DEVICE with_device_name(String device_name) {
    this.device_name = device_name;
    return this;
  }
  private String manufacturer;
  public String get_manufacturer() {
    return manufacturer;
  }
  public void set_manufacturer(String manufacturer) {
    this.manufacturer = manufacturer;
  }
  public DEVICE with_manufacturer(String manufacturer) {
    this.manufacturer = manufacturer;
    return this;
  }
  private String device_model;
  public String get_device_model() {
    return device_model;
  }
  public void set_device_model(String device_model) {
    this.device_model = device_model;
  }
  public DEVICE with_device_model(String device_model) {
    this.device_model = device_model;
    return this;
  }
  private String device_type;
  public String get_device_type() {
    return device_type;
  }
  public void set_device_type(String device_type) {
    this.device_type = device_type;
  }
  public DEVICE with_device_type(String device_type) {
    this.device_type = device_type;
    return this;
  }
  private Integer device_order;
  public Integer get_device_order() {
    return device_order;
  }
  public void set_device_order(Integer device_order) {
    this.device_order = device_order;
  }
  public DEVICE with_device_order(Integer device_order) {
    this.device_order = device_order;
    return this;
  }
  private String sn;
  public String get_sn() {
    return sn;
  }
  public void set_sn(String sn) {
    this.sn = sn;
  }
  public DEVICE with_sn(String sn) {
    this.sn = sn;
    return this;
  }
  private String device_id;
  public String get_device_id() {
    return device_id;
  }
  public void set_device_id(String device_id) {
    this.device_id = device_id;
  }
  public DEVICE with_device_id(String device_id) {
    this.device_id = device_id;
    return this;
  }
  private Integer sensor_count;
  public Integer get_sensor_count() {
    return sensor_count;
  }
  public void set_sensor_count(Integer sensor_count) {
    this.sensor_count = sensor_count;
  }
  public DEVICE with_sensor_count(Integer sensor_count) {
    this.sensor_count = sensor_count;
    return this;
  }
  private String description;
  public String get_description() {
    return description;
  }
  public void set_description(String description) {
    this.description = description;
  }
  public DEVICE with_description(String description) {
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
  public DEVICE with_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof DEVICE)) {
      return false;
    }
    DEVICE that = (DEVICE) o;
    boolean equal = true;
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.manufacturer == null ? that.manufacturer == null : this.manufacturer.equals(that.manufacturer));
    equal = equal && (this.device_model == null ? that.device_model == null : this.device_model.equals(that.device_model));
    equal = equal && (this.device_type == null ? that.device_type == null : this.device_type.equals(that.device_type));
    equal = equal && (this.device_order == null ? that.device_order == null : this.device_order.equals(that.device_order));
    equal = equal && (this.sn == null ? that.sn == null : this.sn.equals(that.sn));
    equal = equal && (this.device_id == null ? that.device_id == null : this.device_id.equals(that.device_id));
    equal = equal && (this.sensor_count == null ? that.sensor_count == null : this.sensor_count.equals(that.sensor_count));
    equal = equal && (this.description == null ? that.description == null : this.description.equals(that.description));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof DEVICE)) {
      return false;
    }
    DEVICE that = (DEVICE) o;
    boolean equal = true;
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.manufacturer == null ? that.manufacturer == null : this.manufacturer.equals(that.manufacturer));
    equal = equal && (this.device_model == null ? that.device_model == null : this.device_model.equals(that.device_model));
    equal = equal && (this.device_type == null ? that.device_type == null : this.device_type.equals(that.device_type));
    equal = equal && (this.device_order == null ? that.device_order == null : this.device_order.equals(that.device_order));
    equal = equal && (this.sn == null ? that.sn == null : this.sn.equals(that.sn));
    equal = equal && (this.device_id == null ? that.device_id == null : this.device_id.equals(that.device_id));
    equal = equal && (this.sensor_count == null ? that.sensor_count == null : this.sensor_count.equals(that.sensor_count));
    equal = equal && (this.description == null ? that.description == null : this.description.equals(that.description));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.device_name = JdbcWritableBridge.readString(1, __dbResults);
    this.manufacturer = JdbcWritableBridge.readString(2, __dbResults);
    this.device_model = JdbcWritableBridge.readString(3, __dbResults);
    this.device_type = JdbcWritableBridge.readString(4, __dbResults);
    this.device_order = JdbcWritableBridge.readInteger(5, __dbResults);
    this.sn = JdbcWritableBridge.readString(6, __dbResults);
    this.device_id = JdbcWritableBridge.readString(7, __dbResults);
    this.sensor_count = JdbcWritableBridge.readInteger(8, __dbResults);
    this.description = JdbcWritableBridge.readString(9, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(10, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.device_name = JdbcWritableBridge.readString(1, __dbResults);
    this.manufacturer = JdbcWritableBridge.readString(2, __dbResults);
    this.device_model = JdbcWritableBridge.readString(3, __dbResults);
    this.device_type = JdbcWritableBridge.readString(4, __dbResults);
    this.device_order = JdbcWritableBridge.readInteger(5, __dbResults);
    this.sn = JdbcWritableBridge.readString(6, __dbResults);
    this.device_id = JdbcWritableBridge.readString(7, __dbResults);
    this.sensor_count = JdbcWritableBridge.readInteger(8, __dbResults);
    this.description = JdbcWritableBridge.readString(9, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(10, __dbResults);
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
    JdbcWritableBridge.writeString(device_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(manufacturer, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_model, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_type, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(device_order, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(sn, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_id, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(sensor_count, 8 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(description, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 10 + __off, 93, __dbStmt);
    return 10;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(device_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(manufacturer, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_model, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_type, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(device_order, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(sn, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(device_id, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(sensor_count, 8 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(description, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 10 + __off, 93, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.device_name = null;
    } else {
    this.device_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.manufacturer = null;
    } else {
    this.manufacturer = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.device_model = null;
    } else {
    this.device_model = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.device_type = null;
    } else {
    this.device_type = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.device_order = null;
    } else {
    this.device_order = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.sn = null;
    } else {
    this.sn = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.device_id = null;
    } else {
    this.device_id = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.sensor_count = null;
    } else {
    this.sensor_count = Integer.valueOf(__dataIn.readInt());
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
    if (null == this.device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_name);
    }
    if (null == this.manufacturer) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, manufacturer);
    }
    if (null == this.device_model) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_model);
    }
    if (null == this.device_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_type);
    }
    if (null == this.device_order) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.device_order);
    }
    if (null == this.sn) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sn);
    }
    if (null == this.device_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_id);
    }
    if (null == this.sensor_count) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.sensor_count);
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
    if (null == this.device_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_name);
    }
    if (null == this.manufacturer) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, manufacturer);
    }
    if (null == this.device_model) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_model);
    }
    if (null == this.device_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_type);
    }
    if (null == this.device_order) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.device_order);
    }
    if (null == this.sn) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sn);
    }
    if (null == this.device_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, device_id);
    }
    if (null == this.sensor_count) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.sensor_count);
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
    __sb.append(FieldFormatter.escapeAndEnclose(device_name==null?"null":device_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(manufacturer==null?"null":manufacturer, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_model==null?"null":device_model, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_type==null?"null":device_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_order==null?"null":"" + device_order, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sn==null?"null":sn, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_id==null?"null":device_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_count==null?"null":"" + sensor_count, delimiters));
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
    __sb.append(FieldFormatter.escapeAndEnclose(device_name==null?"null":device_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(manufacturer==null?"null":manufacturer, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_model==null?"null":device_model, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_type==null?"null":device_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_order==null?"null":"" + device_order, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sn==null?"null":sn, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(device_id==null?"null":device_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(sensor_count==null?"null":"" + sensor_count, delimiters));
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
    if (__cur_str.equals("null")) { this.device_name = null; } else {
      this.device_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.manufacturer = null; } else {
      this.manufacturer = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_model = null; } else {
      this.device_model = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_type = null; } else {
      this.device_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.device_order = null; } else {
      this.device_order = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sn = null; } else {
      this.sn = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_id = null; } else {
      this.device_id = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.sensor_count = null; } else {
      this.sensor_count = Integer.valueOf(__cur_str);
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
    if (__cur_str.equals("null")) { this.device_name = null; } else {
      this.device_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.manufacturer = null; } else {
      this.manufacturer = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_model = null; } else {
      this.device_model = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_type = null; } else {
      this.device_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.device_order = null; } else {
      this.device_order = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sn = null; } else {
      this.sn = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.device_id = null; } else {
      this.device_id = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.sensor_count = null; } else {
      this.sensor_count = Integer.valueOf(__cur_str);
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
    DEVICE o = (DEVICE) super.clone();
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
    return o;
  }

  public void clone0(DEVICE o) throws CloneNotSupportedException {
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("manufacturer", this.manufacturer);
    __sqoop$field_map.put("device_model", this.device_model);
    __sqoop$field_map.put("device_type", this.device_type);
    __sqoop$field_map.put("device_order", this.device_order);
    __sqoop$field_map.put("sn", this.sn);
    __sqoop$field_map.put("device_id", this.device_id);
    __sqoop$field_map.put("sensor_count", this.sensor_count);
    __sqoop$field_map.put("description", this.description);
    __sqoop$field_map.put("reg_date", this.reg_date);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("manufacturer", this.manufacturer);
    __sqoop$field_map.put("device_model", this.device_model);
    __sqoop$field_map.put("device_type", this.device_type);
    __sqoop$field_map.put("device_order", this.device_order);
    __sqoop$field_map.put("sn", this.sn);
    __sqoop$field_map.put("device_id", this.device_id);
    __sqoop$field_map.put("sensor_count", this.sensor_count);
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
