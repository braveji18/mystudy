// ORM class for table 'INSTALL_LOCATION_PANEL'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 16 10:56:22 KST 2017
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

public class INSTALL_LOCATION_PANEL extends SqoopRecord  implements DBWritable, Writable {
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
    setters.put("eps", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        eps = (String)value;
      }
    });
    setters.put("panel", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        panel = (String)value;
      }
    });
    setters.put("breaker_main", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        breaker_main = (String)value;
      }
    });
    setters.put("phase_wire", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        phase_wire = (String)value;
      }
    });
    setters.put("cat_a", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        cat_a = (String)value;
      }
    });
    setters.put("watt_meter", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        watt_meter = (String)value;
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
  public INSTALL_LOCATION_PANEL() {
    init0();
  }
  private String device_name;
  public String get_device_name() {
    return device_name;
  }
  public void set_device_name(String device_name) {
    this.device_name = device_name;
  }
  public INSTALL_LOCATION_PANEL with_device_name(String device_name) {
    this.device_name = device_name;
    return this;
  }
  private String eps;
  public String get_eps() {
    return eps;
  }
  public void set_eps(String eps) {
    this.eps = eps;
  }
  public INSTALL_LOCATION_PANEL with_eps(String eps) {
    this.eps = eps;
    return this;
  }
  private String panel;
  public String get_panel() {
    return panel;
  }
  public void set_panel(String panel) {
    this.panel = panel;
  }
  public INSTALL_LOCATION_PANEL with_panel(String panel) {
    this.panel = panel;
    return this;
  }
  private String breaker_main;
  public String get_breaker_main() {
    return breaker_main;
  }
  public void set_breaker_main(String breaker_main) {
    this.breaker_main = breaker_main;
  }
  public INSTALL_LOCATION_PANEL with_breaker_main(String breaker_main) {
    this.breaker_main = breaker_main;
    return this;
  }
  private String phase_wire;
  public String get_phase_wire() {
    return phase_wire;
  }
  public void set_phase_wire(String phase_wire) {
    this.phase_wire = phase_wire;
  }
  public INSTALL_LOCATION_PANEL with_phase_wire(String phase_wire) {
    this.phase_wire = phase_wire;
    return this;
  }
  private String cat_a;
  public String get_cat_a() {
    return cat_a;
  }
  public void set_cat_a(String cat_a) {
    this.cat_a = cat_a;
  }
  public INSTALL_LOCATION_PANEL with_cat_a(String cat_a) {
    this.cat_a = cat_a;
    return this;
  }
  private String watt_meter;
  public String get_watt_meter() {
    return watt_meter;
  }
  public void set_watt_meter(String watt_meter) {
    this.watt_meter = watt_meter;
  }
  public INSTALL_LOCATION_PANEL with_watt_meter(String watt_meter) {
    this.watt_meter = watt_meter;
    return this;
  }
  private String description;
  public String get_description() {
    return description;
  }
  public void set_description(String description) {
    this.description = description;
  }
  public INSTALL_LOCATION_PANEL with_description(String description) {
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
  public INSTALL_LOCATION_PANEL with_reg_date(java.sql.Timestamp reg_date) {
    this.reg_date = reg_date;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof INSTALL_LOCATION_PANEL)) {
      return false;
    }
    INSTALL_LOCATION_PANEL that = (INSTALL_LOCATION_PANEL) o;
    boolean equal = true;
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.eps == null ? that.eps == null : this.eps.equals(that.eps));
    equal = equal && (this.panel == null ? that.panel == null : this.panel.equals(that.panel));
    equal = equal && (this.breaker_main == null ? that.breaker_main == null : this.breaker_main.equals(that.breaker_main));
    equal = equal && (this.phase_wire == null ? that.phase_wire == null : this.phase_wire.equals(that.phase_wire));
    equal = equal && (this.cat_a == null ? that.cat_a == null : this.cat_a.equals(that.cat_a));
    equal = equal && (this.watt_meter == null ? that.watt_meter == null : this.watt_meter.equals(that.watt_meter));
    equal = equal && (this.description == null ? that.description == null : this.description.equals(that.description));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof INSTALL_LOCATION_PANEL)) {
      return false;
    }
    INSTALL_LOCATION_PANEL that = (INSTALL_LOCATION_PANEL) o;
    boolean equal = true;
    equal = equal && (this.device_name == null ? that.device_name == null : this.device_name.equals(that.device_name));
    equal = equal && (this.eps == null ? that.eps == null : this.eps.equals(that.eps));
    equal = equal && (this.panel == null ? that.panel == null : this.panel.equals(that.panel));
    equal = equal && (this.breaker_main == null ? that.breaker_main == null : this.breaker_main.equals(that.breaker_main));
    equal = equal && (this.phase_wire == null ? that.phase_wire == null : this.phase_wire.equals(that.phase_wire));
    equal = equal && (this.cat_a == null ? that.cat_a == null : this.cat_a.equals(that.cat_a));
    equal = equal && (this.watt_meter == null ? that.watt_meter == null : this.watt_meter.equals(that.watt_meter));
    equal = equal && (this.description == null ? that.description == null : this.description.equals(that.description));
    equal = equal && (this.reg_date == null ? that.reg_date == null : this.reg_date.equals(that.reg_date));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.device_name = JdbcWritableBridge.readString(1, __dbResults);
    this.eps = JdbcWritableBridge.readString(2, __dbResults);
    this.panel = JdbcWritableBridge.readString(3, __dbResults);
    this.breaker_main = JdbcWritableBridge.readString(4, __dbResults);
    this.phase_wire = JdbcWritableBridge.readString(5, __dbResults);
    this.cat_a = JdbcWritableBridge.readString(6, __dbResults);
    this.watt_meter = JdbcWritableBridge.readString(7, __dbResults);
    this.description = JdbcWritableBridge.readString(8, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(9, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.device_name = JdbcWritableBridge.readString(1, __dbResults);
    this.eps = JdbcWritableBridge.readString(2, __dbResults);
    this.panel = JdbcWritableBridge.readString(3, __dbResults);
    this.breaker_main = JdbcWritableBridge.readString(4, __dbResults);
    this.phase_wire = JdbcWritableBridge.readString(5, __dbResults);
    this.cat_a = JdbcWritableBridge.readString(6, __dbResults);
    this.watt_meter = JdbcWritableBridge.readString(7, __dbResults);
    this.description = JdbcWritableBridge.readString(8, __dbResults);
    this.reg_date = JdbcWritableBridge.readTimestamp(9, __dbResults);
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
    JdbcWritableBridge.writeString(eps, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(panel, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(breaker_main, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(phase_wire, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(cat_a, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(watt_meter, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(description, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 9 + __off, 93, __dbStmt);
    return 9;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(device_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(eps, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(panel, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(breaker_main, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(phase_wire, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(cat_a, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(watt_meter, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(description, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(reg_date, 9 + __off, 93, __dbStmt);
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
        this.eps = null;
    } else {
    this.eps = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.panel = null;
    } else {
    this.panel = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.breaker_main = null;
    } else {
    this.breaker_main = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.phase_wire = null;
    } else {
    this.phase_wire = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.cat_a = null;
    } else {
    this.cat_a = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.watt_meter = null;
    } else {
    this.watt_meter = Text.readString(__dataIn);
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
    if (null == this.eps) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, eps);
    }
    if (null == this.panel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, panel);
    }
    if (null == this.breaker_main) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, breaker_main);
    }
    if (null == this.phase_wire) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, phase_wire);
    }
    if (null == this.cat_a) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, cat_a);
    }
    if (null == this.watt_meter) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, watt_meter);
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
    if (null == this.eps) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, eps);
    }
    if (null == this.panel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, panel);
    }
    if (null == this.breaker_main) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, breaker_main);
    }
    if (null == this.phase_wire) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, phase_wire);
    }
    if (null == this.cat_a) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, cat_a);
    }
    if (null == this.watt_meter) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, watt_meter);
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
    __sb.append(FieldFormatter.escapeAndEnclose(eps==null?"null":eps, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(panel==null?"null":panel, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(breaker_main==null?"null":breaker_main, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(phase_wire==null?"null":phase_wire, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(cat_a==null?"null":cat_a, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(watt_meter==null?"null":watt_meter, delimiters));
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
    __sb.append(FieldFormatter.escapeAndEnclose(eps==null?"null":eps, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(panel==null?"null":panel, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(breaker_main==null?"null":breaker_main, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(phase_wire==null?"null":phase_wire, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(cat_a==null?"null":cat_a, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(watt_meter==null?"null":watt_meter, delimiters));
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
    if (__cur_str.equals("null")) { this.eps = null; } else {
      this.eps = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.panel = null; } else {
      this.panel = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.breaker_main = null; } else {
      this.breaker_main = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.phase_wire = null; } else {
      this.phase_wire = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.cat_a = null; } else {
      this.cat_a = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.watt_meter = null; } else {
      this.watt_meter = __cur_str;
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
    if (__cur_str.equals("null")) { this.eps = null; } else {
      this.eps = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.panel = null; } else {
      this.panel = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.breaker_main = null; } else {
      this.breaker_main = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.phase_wire = null; } else {
      this.phase_wire = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.cat_a = null; } else {
      this.cat_a = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.watt_meter = null; } else {
      this.watt_meter = __cur_str;
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
    INSTALL_LOCATION_PANEL o = (INSTALL_LOCATION_PANEL) super.clone();
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
    return o;
  }

  public void clone0(INSTALL_LOCATION_PANEL o) throws CloneNotSupportedException {
    o.reg_date = (o.reg_date != null) ? (java.sql.Timestamp) o.reg_date.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("eps", this.eps);
    __sqoop$field_map.put("panel", this.panel);
    __sqoop$field_map.put("breaker_main", this.breaker_main);
    __sqoop$field_map.put("phase_wire", this.phase_wire);
    __sqoop$field_map.put("cat_a", this.cat_a);
    __sqoop$field_map.put("watt_meter", this.watt_meter);
    __sqoop$field_map.put("description", this.description);
    __sqoop$field_map.put("reg_date", this.reg_date);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("device_name", this.device_name);
    __sqoop$field_map.put("eps", this.eps);
    __sqoop$field_map.put("panel", this.panel);
    __sqoop$field_map.put("breaker_main", this.breaker_main);
    __sqoop$field_map.put("phase_wire", this.phase_wire);
    __sqoop$field_map.put("cat_a", this.cat_a);
    __sqoop$field_map.put("watt_meter", this.watt_meter);
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
