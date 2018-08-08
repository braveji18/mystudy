// ORM class for table 'CODE_TYPE'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:55:27 KST 2017
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

public class CODE_TYPE extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("code_type", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        code_type = (String)value;
      }
    });
    setters.put("type_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        type_name = (String)value;
      }
    });
    setters.put("reg_date", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        reg_date = (java.sql.Timestamp)value;
      }
    });
  }
  public CODE_TYPE() {
    init0();
  }
  private String code_type;
  public String get_code_type() {
    return code_type;
  }
  public void set_code_type(String code_type) {
    this.code_type = code_type;
  }
  public CODE_TYPE with_code_type(String code_type) {
    this.code_type = code_type;
    return this;
  }
  private String type_name;
  public String get_type_name() {
    return type_name;
  }
  public void set_type_name(String type_name) {
    this.type_name = type_name;
  }
  public CODE_TYPE with_type_name(String type_name) {
    this.type_name = type_name;
    return this;
  }
  private java.sql.Timestamp reg_date;
  public java.sql.Timestamp get_reg_date() {
    return reg_date;
  }
  public void set_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
  }
  public CODE_TYPE with_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof CODE_TYPE)) {
      return false;
    }
    CODE_TYPE that = (CODE_TYPE) o;
    boolean equal = true;
    equal = equal && (this.code_type == null ? that.code_type == null : this.code_type.equals(that.code_type));
    equal = equal && (this.type_name == null ? that.type_name == null : this.type_name.equals(that.type_name));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof CODE_TYPE)) {
      return false;
    }
    CODE_TYPE that = (CODE_TYPE) o;
    boolean equal = true;
    equal = equal && (this.code_type == null ? that.code_type == null : this.code_type.equals(that.code_type));
    equal = equal && (this.type_name == null ? that.type_name == null : this.type_name.equals(that.type_name));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.code_type = JdbcWritableBridge.readString(1, __dbResults);
    this.type_name = JdbcWritableBridge.readString(2, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(3, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.code_type = JdbcWritableBridge.readString(1, __dbResults);
    this.type_name = JdbcWritableBridge.readString(2, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(3, __dbResults);
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
    JdbcWritableBridge.writeString(code_type, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(type_name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 3 + __off, 93, __dbStmt);
    return 3;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(code_type, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(type_name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 3 + __off, 93, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.code_type = null;
    } else {
    this.code_type = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.type_name = null;
    } else {
    this.type_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.reg_date = null;
    } else {
    this.reg_date = new Timestamp(__dataIn.readLong());
    this.reg_date.setNanos(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.code_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, code_type);
    }
    if (null == this.type_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, type_name);
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
    if (null == this.code_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, code_type);
    }
    if (null == this.type_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, type_name);
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
    __sb.append(FieldFormatter.escapeAndEnclose(code_type==null?"null":code_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(type_name==null?"null":type_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(reg_date==null?"null":"" + reg_date, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(code_type==null?"null":code_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(type_name==null?"null":type_name, delimiters));
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
    if (__cur_str.equals("null")) { this.code_type = null; } else {
      this.code_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.type_name = null; } else {
      this.type_name = __cur_str;
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
    if (__cur_str.equals("null")) { this.code_type = null; } else {
      this.code_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.type_name = null; } else {
      this.type_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.reg_date = null; } else {
      this.reg_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    CODE_TYPE o = (CODE_TYPE) super.clone();
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
    return o;
  }

  public void clone0(CODE_TYPE o) throws CloneNotSupportedException {
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("code_type", this.code_type);
    __sqoop$field_map.put("type_name", this.type_name);
    __sqoop$field_map.put("reg_date", this.reg_date);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("code_type", this.code_type);
    __sqoop$field_map.put("type_name", this.type_name);
    __sqoop$field_map.put("reg_date", this.reg_date);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
