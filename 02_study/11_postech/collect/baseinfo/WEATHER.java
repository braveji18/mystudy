// ORM class for table 'WEATHER'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Sun Oct 29 23:07:32 KST 2017
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

public class WEATHER extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("area_do", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        area_do = (String)value;
      }
    });
    setters.put("area_gu", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        area_gu = (String)value;
      }
    });
    setters.put("area_dong", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        area_dong = (String)value;
      }
    });
    setters.put("base_date", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        base_date = (String)value;
      }
    });
    setters.put("T1H", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        T1H = (Double)value;
      }
    });
    setters.put("RN1", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        RN1 = (Integer)value;
      }
    });
    setters.put("SKY", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        SKY = (String)value;
      }
    });
    setters.put("UUU", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        UUU = (Integer)value;
      }
    });
    setters.put("VVV", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        VVV = (Integer)value;
      }
    });
    setters.put("REH", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        REH = (Double)value;
      }
    });
    setters.put("PTY", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        PTY = (String)value;
      }
    });
    setters.put("LGT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LGT = (String)value;
      }
    });
    setters.put("VEC", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        VEC = (Integer)value;
      }
    });
    setters.put("WSD", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        WSD = (Integer)value;
      }
    });
    setters.put("A01_2", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        A01_2 = (Integer)value;
      }
    });
    setters.put("A07", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        A07 = (Integer)value;
      }
    });
    setters.put("A03", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        A03 = (Integer)value;
      }
    });
    setters.put("A05", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        A05 = (Integer)value;
      }
    });
    setters.put("A06", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        A06 = (Integer)value;
      }
    });
    setters.put("A08", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        A08 = (Integer)value;
      }
    });
    setters.put("A09", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        A09 = (Integer)value;
      }
    });
  }
  public WEATHER() {
    init0();
  }
  private String area_do;
  public String get_area_do() {
    return area_do;
  }
  public void set_area_do(String area_do) {
    this.area_do = area_do;
  }
  public WEATHER with_area_do(String area_do) {
    this.area_do = area_do;
    return this;
  }
  private String area_gu;
  public String get_area_gu() {
    return area_gu;
  }
  public void set_area_gu(String area_gu) {
    this.area_gu = area_gu;
  }
  public WEATHER with_area_gu(String area_gu) {
    this.area_gu = area_gu;
    return this;
  }
  private String area_dong;
  public String get_area_dong() {
    return area_dong;
  }
  public void set_area_dong(String area_dong) {
    this.area_dong = area_dong;
  }
  public WEATHER with_area_dong(String area_dong) {
    this.area_dong = area_dong;
    return this;
  }
  private String base_date;
  public String get_base_date() {
    return base_date;
  }
  public void set_base_date(String base_date) {
    this.base_date = base_date;
  }
  public WEATHER with_base_date(String base_date) {
    this.base_date = base_date;
    return this;
  }
  private Double T1H;
  public Double get_T1H() {
    return T1H;
  }
  public void set_T1H(Double T1H) {
    this.T1H = T1H;
  }
  public WEATHER with_T1H(Double T1H) {
    this.T1H = T1H;
    return this;
  }
  private Integer RN1;
  public Integer get_RN1() {
    return RN1;
  }
  public void set_RN1(Integer RN1) {
    this.RN1 = RN1;
  }
  public WEATHER with_RN1(Integer RN1) {
    this.RN1 = RN1;
    return this;
  }
  private String SKY;
  public String get_SKY() {
    return SKY;
  }
  public void set_SKY(String SKY) {
    this.SKY = SKY;
  }
  public WEATHER with_SKY(String SKY) {
    this.SKY = SKY;
    return this;
  }
  private Integer UUU;
  public Integer get_UUU() {
    return UUU;
  }
  public void set_UUU(Integer UUU) {
    this.UUU = UUU;
  }
  public WEATHER with_UUU(Integer UUU) {
    this.UUU = UUU;
    return this;
  }
  private Integer VVV;
  public Integer get_VVV() {
    return VVV;
  }
  public void set_VVV(Integer VVV) {
    this.VVV = VVV;
  }
  public WEATHER with_VVV(Integer VVV) {
    this.VVV = VVV;
    return this;
  }
  private Double REH;
  public Double get_REH() {
    return REH;
  }
  public void set_REH(Double REH) {
    this.REH = REH;
  }
  public WEATHER with_REH(Double REH) {
    this.REH = REH;
    return this;
  }
  private String PTY;
  public String get_PTY() {
    return PTY;
  }
  public void set_PTY(String PTY) {
    this.PTY = PTY;
  }
  public WEATHER with_PTY(String PTY) {
    this.PTY = PTY;
    return this;
  }
  private String LGT;
  public String get_LGT() {
    return LGT;
  }
  public void set_LGT(String LGT) {
    this.LGT = LGT;
  }
  public WEATHER with_LGT(String LGT) {
    this.LGT = LGT;
    return this;
  }
  private Integer VEC;
  public Integer get_VEC() {
    return VEC;
  }
  public void set_VEC(Integer VEC) {
    this.VEC = VEC;
  }
  public WEATHER with_VEC(Integer VEC) {
    this.VEC = VEC;
    return this;
  }
  private Integer WSD;
  public Integer get_WSD() {
    return WSD;
  }
  public void set_WSD(Integer WSD) {
    this.WSD = WSD;
  }
  public WEATHER with_WSD(Integer WSD) {
    this.WSD = WSD;
    return this;
  }
  private Integer A01_2;
  public Integer get_A01_2() {
    return A01_2;
  }
  public void set_A01_2(Integer A01_2) {
    this.A01_2 = A01_2;
  }
  public WEATHER with_A01_2(Integer A01_2) {
    this.A01_2 = A01_2;
    return this;
  }
  private Integer A07;
  public Integer get_A07() {
    return A07;
  }
  public void set_A07(Integer A07) {
    this.A07 = A07;
  }
  public WEATHER with_A07(Integer A07) {
    this.A07 = A07;
    return this;
  }
  private Integer A03;
  public Integer get_A03() {
    return A03;
  }
  public void set_A03(Integer A03) {
    this.A03 = A03;
  }
  public WEATHER with_A03(Integer A03) {
    this.A03 = A03;
    return this;
  }
  private Integer A05;
  public Integer get_A05() {
    return A05;
  }
  public void set_A05(Integer A05) {
    this.A05 = A05;
  }
  public WEATHER with_A05(Integer A05) {
    this.A05 = A05;
    return this;
  }
  private Integer A06;
  public Integer get_A06() {
    return A06;
  }
  public void set_A06(Integer A06) {
    this.A06 = A06;
  }
  public WEATHER with_A06(Integer A06) {
    this.A06 = A06;
    return this;
  }
  private Integer A08;
  public Integer get_A08() {
    return A08;
  }
  public void set_A08(Integer A08) {
    this.A08 = A08;
  }
  public WEATHER with_A08(Integer A08) {
    this.A08 = A08;
    return this;
  }
  private Integer A09;
  public Integer get_A09() {
    return A09;
  }
  public void set_A09(Integer A09) {
    this.A09 = A09;
  }
  public WEATHER with_A09(Integer A09) {
    this.A09 = A09;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof WEATHER)) {
      return false;
    }
    WEATHER that = (WEATHER) o;
    boolean equal = true;
    equal = equal && (this.area_do == null ? that.area_do == null : this.area_do.equals(that.area_do));
    equal = equal && (this.area_gu == null ? that.area_gu == null : this.area_gu.equals(that.area_gu));
    equal = equal && (this.area_dong == null ? that.area_dong == null : this.area_dong.equals(that.area_dong));
    equal = equal && (this.base_date == null ? that.base_date == null : this.base_date.equals(that.base_date));
    equal = equal && (this.T1H == null ? that.T1H == null : this.T1H.equals(that.T1H));
    equal = equal && (this.RN1 == null ? that.RN1 == null : this.RN1.equals(that.RN1));
    equal = equal && (this.SKY == null ? that.SKY == null : this.SKY.equals(that.SKY));
    equal = equal && (this.UUU == null ? that.UUU == null : this.UUU.equals(that.UUU));
    equal = equal && (this.VVV == null ? that.VVV == null : this.VVV.equals(that.VVV));
    equal = equal && (this.REH == null ? that.REH == null : this.REH.equals(that.REH));
    equal = equal && (this.PTY == null ? that.PTY == null : this.PTY.equals(that.PTY));
    equal = equal && (this.LGT == null ? that.LGT == null : this.LGT.equals(that.LGT));
    equal = equal && (this.VEC == null ? that.VEC == null : this.VEC.equals(that.VEC));
    equal = equal && (this.WSD == null ? that.WSD == null : this.WSD.equals(that.WSD));
    equal = equal && (this.A01_2 == null ? that.A01_2 == null : this.A01_2.equals(that.A01_2));
    equal = equal && (this.A07 == null ? that.A07 == null : this.A07.equals(that.A07));
    equal = equal && (this.A03 == null ? that.A03 == null : this.A03.equals(that.A03));
    equal = equal && (this.A05 == null ? that.A05 == null : this.A05.equals(that.A05));
    equal = equal && (this.A06 == null ? that.A06 == null : this.A06.equals(that.A06));
    equal = equal && (this.A08 == null ? that.A08 == null : this.A08.equals(that.A08));
    equal = equal && (this.A09 == null ? that.A09 == null : this.A09.equals(that.A09));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof WEATHER)) {
      return false;
    }
    WEATHER that = (WEATHER) o;
    boolean equal = true;
    equal = equal && (this.area_do == null ? that.area_do == null : this.area_do.equals(that.area_do));
    equal = equal && (this.area_gu == null ? that.area_gu == null : this.area_gu.equals(that.area_gu));
    equal = equal && (this.area_dong == null ? that.area_dong == null : this.area_dong.equals(that.area_dong));
    equal = equal && (this.base_date == null ? that.base_date == null : this.base_date.equals(that.base_date));
    equal = equal && (this.T1H == null ? that.T1H == null : this.T1H.equals(that.T1H));
    equal = equal && (this.RN1 == null ? that.RN1 == null : this.RN1.equals(that.RN1));
    equal = equal && (this.SKY == null ? that.SKY == null : this.SKY.equals(that.SKY));
    equal = equal && (this.UUU == null ? that.UUU == null : this.UUU.equals(that.UUU));
    equal = equal && (this.VVV == null ? that.VVV == null : this.VVV.equals(that.VVV));
    equal = equal && (this.REH == null ? that.REH == null : this.REH.equals(that.REH));
    equal = equal && (this.PTY == null ? that.PTY == null : this.PTY.equals(that.PTY));
    equal = equal && (this.LGT == null ? that.LGT == null : this.LGT.equals(that.LGT));
    equal = equal && (this.VEC == null ? that.VEC == null : this.VEC.equals(that.VEC));
    equal = equal && (this.WSD == null ? that.WSD == null : this.WSD.equals(that.WSD));
    equal = equal && (this.A01_2 == null ? that.A01_2 == null : this.A01_2.equals(that.A01_2));
    equal = equal && (this.A07 == null ? that.A07 == null : this.A07.equals(that.A07));
    equal = equal && (this.A03 == null ? that.A03 == null : this.A03.equals(that.A03));
    equal = equal && (this.A05 == null ? that.A05 == null : this.A05.equals(that.A05));
    equal = equal && (this.A06 == null ? that.A06 == null : this.A06.equals(that.A06));
    equal = equal && (this.A08 == null ? that.A08 == null : this.A08.equals(that.A08));
    equal = equal && (this.A09 == null ? that.A09 == null : this.A09.equals(that.A09));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.area_do = JdbcWritableBridge.readString(1, __dbResults);
    this.area_gu = JdbcWritableBridge.readString(2, __dbResults);
    this.area_dong = JdbcWritableBridge.readString(3, __dbResults);
    this.base_date = JdbcWritableBridge.readString(4, __dbResults);
    this.T1H = JdbcWritableBridge.readDouble(5, __dbResults);
    this.RN1 = JdbcWritableBridge.readInteger(6, __dbResults);
    this.SKY = JdbcWritableBridge.readString(7, __dbResults);
    this.UUU = JdbcWritableBridge.readInteger(8, __dbResults);
    this.VVV = JdbcWritableBridge.readInteger(9, __dbResults);
    this.REH = JdbcWritableBridge.readDouble(10, __dbResults);
    this.PTY = JdbcWritableBridge.readString(11, __dbResults);
    this.LGT = JdbcWritableBridge.readString(12, __dbResults);
    this.VEC = JdbcWritableBridge.readInteger(13, __dbResults);
    this.WSD = JdbcWritableBridge.readInteger(14, __dbResults);
    this.A01_2 = JdbcWritableBridge.readInteger(15, __dbResults);
    this.A07 = JdbcWritableBridge.readInteger(16, __dbResults);
    this.A03 = JdbcWritableBridge.readInteger(17, __dbResults);
    this.A05 = JdbcWritableBridge.readInteger(18, __dbResults);
    this.A06 = JdbcWritableBridge.readInteger(19, __dbResults);
    this.A08 = JdbcWritableBridge.readInteger(20, __dbResults);
    this.A09 = JdbcWritableBridge.readInteger(21, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.area_do = JdbcWritableBridge.readString(1, __dbResults);
    this.area_gu = JdbcWritableBridge.readString(2, __dbResults);
    this.area_dong = JdbcWritableBridge.readString(3, __dbResults);
    this.base_date = JdbcWritableBridge.readString(4, __dbResults);
    this.T1H = JdbcWritableBridge.readDouble(5, __dbResults);
    this.RN1 = JdbcWritableBridge.readInteger(6, __dbResults);
    this.SKY = JdbcWritableBridge.readString(7, __dbResults);
    this.UUU = JdbcWritableBridge.readInteger(8, __dbResults);
    this.VVV = JdbcWritableBridge.readInteger(9, __dbResults);
    this.REH = JdbcWritableBridge.readDouble(10, __dbResults);
    this.PTY = JdbcWritableBridge.readString(11, __dbResults);
    this.LGT = JdbcWritableBridge.readString(12, __dbResults);
    this.VEC = JdbcWritableBridge.readInteger(13, __dbResults);
    this.WSD = JdbcWritableBridge.readInteger(14, __dbResults);
    this.A01_2 = JdbcWritableBridge.readInteger(15, __dbResults);
    this.A07 = JdbcWritableBridge.readInteger(16, __dbResults);
    this.A03 = JdbcWritableBridge.readInteger(17, __dbResults);
    this.A05 = JdbcWritableBridge.readInteger(18, __dbResults);
    this.A06 = JdbcWritableBridge.readInteger(19, __dbResults);
    this.A08 = JdbcWritableBridge.readInteger(20, __dbResults);
    this.A09 = JdbcWritableBridge.readInteger(21, __dbResults);
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
    JdbcWritableBridge.writeString(area_do, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(area_gu, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(area_dong, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_date, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeDouble(T1H, 5 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeInteger(RN1, 6 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(SKY, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(UUU, 8 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(VVV, 9 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeDouble(REH, 10 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeString(PTY, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(LGT, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(VEC, 13 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(WSD, 14 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A01_2, 15 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A07, 16 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A03, 17 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A05, 18 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A06, 19 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A08, 20 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A09, 21 + __off, 4, __dbStmt);
    return 21;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(area_do, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(area_gu, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(area_dong, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_date, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeDouble(T1H, 5 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeInteger(RN1, 6 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(SKY, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(UUU, 8 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(VVV, 9 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeDouble(REH, 10 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeString(PTY, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(LGT, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(VEC, 13 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(WSD, 14 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A01_2, 15 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A07, 16 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A03, 17 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A05, 18 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A06, 19 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A08, 20 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(A09, 21 + __off, 4, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.area_do = null;
    } else {
    this.area_do = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.area_gu = null;
    } else {
    this.area_gu = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.area_dong = null;
    } else {
    this.area_dong = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.base_date = null;
    } else {
    this.base_date = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.T1H = null;
    } else {
    this.T1H = Double.valueOf(__dataIn.readDouble());
    }
    if (__dataIn.readBoolean()) { 
        this.RN1 = null;
    } else {
    this.RN1 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.SKY = null;
    } else {
    this.SKY = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.UUU = null;
    } else {
    this.UUU = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.VVV = null;
    } else {
    this.VVV = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.REH = null;
    } else {
    this.REH = Double.valueOf(__dataIn.readDouble());
    }
    if (__dataIn.readBoolean()) { 
        this.PTY = null;
    } else {
    this.PTY = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.LGT = null;
    } else {
    this.LGT = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.VEC = null;
    } else {
    this.VEC = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.WSD = null;
    } else {
    this.WSD = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.A01_2 = null;
    } else {
    this.A01_2 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.A07 = null;
    } else {
    this.A07 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.A03 = null;
    } else {
    this.A03 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.A05 = null;
    } else {
    this.A05 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.A06 = null;
    } else {
    this.A06 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.A08 = null;
    } else {
    this.A08 = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.A09 = null;
    } else {
    this.A09 = Integer.valueOf(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.area_do) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, area_do);
    }
    if (null == this.area_gu) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, area_gu);
    }
    if (null == this.area_dong) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, area_dong);
    }
    if (null == this.base_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_date);
    }
    if (null == this.T1H) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.T1H);
    }
    if (null == this.RN1) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.RN1);
    }
    if (null == this.SKY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, SKY);
    }
    if (null == this.UUU) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.UUU);
    }
    if (null == this.VVV) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.VVV);
    }
    if (null == this.REH) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.REH);
    }
    if (null == this.PTY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PTY);
    }
    if (null == this.LGT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, LGT);
    }
    if (null == this.VEC) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.VEC);
    }
    if (null == this.WSD) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.WSD);
    }
    if (null == this.A01_2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A01_2);
    }
    if (null == this.A07) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A07);
    }
    if (null == this.A03) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A03);
    }
    if (null == this.A05) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A05);
    }
    if (null == this.A06) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A06);
    }
    if (null == this.A08) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A08);
    }
    if (null == this.A09) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A09);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.area_do) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, area_do);
    }
    if (null == this.area_gu) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, area_gu);
    }
    if (null == this.area_dong) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, area_dong);
    }
    if (null == this.base_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_date);
    }
    if (null == this.T1H) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.T1H);
    }
    if (null == this.RN1) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.RN1);
    }
    if (null == this.SKY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, SKY);
    }
    if (null == this.UUU) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.UUU);
    }
    if (null == this.VVV) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.VVV);
    }
    if (null == this.REH) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.REH);
    }
    if (null == this.PTY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PTY);
    }
    if (null == this.LGT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, LGT);
    }
    if (null == this.VEC) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.VEC);
    }
    if (null == this.WSD) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.WSD);
    }
    if (null == this.A01_2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A01_2);
    }
    if (null == this.A07) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A07);
    }
    if (null == this.A03) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A03);
    }
    if (null == this.A05) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A05);
    }
    if (null == this.A06) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A06);
    }
    if (null == this.A08) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A08);
    }
    if (null == this.A09) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.A09);
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
    __sb.append(FieldFormatter.escapeAndEnclose(area_do==null?"null":area_do, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(area_gu==null?"null":area_gu, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(area_dong==null?"null":area_dong, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_date==null?"null":base_date, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(T1H==null?"null":"" + T1H, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RN1==null?"null":"" + RN1, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SKY==null?"null":SKY, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(UUU==null?"null":"" + UUU, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VVV==null?"null":"" + VVV, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(REH==null?"null":"" + REH, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PTY==null?"null":PTY, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LGT==null?"null":LGT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VEC==null?"null":"" + VEC, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WSD==null?"null":"" + WSD, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A01_2==null?"null":"" + A01_2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A07==null?"null":"" + A07, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A03==null?"null":"" + A03, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A05==null?"null":"" + A05, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A06==null?"null":"" + A06, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A08==null?"null":"" + A08, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A09==null?"null":"" + A09, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(area_do==null?"null":area_do, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(area_gu==null?"null":area_gu, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(area_dong==null?"null":area_dong, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_date==null?"null":base_date, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(T1H==null?"null":"" + T1H, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RN1==null?"null":"" + RN1, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SKY==null?"null":SKY, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(UUU==null?"null":"" + UUU, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VVV==null?"null":"" + VVV, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(REH==null?"null":"" + REH, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PTY==null?"null":PTY, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LGT==null?"null":LGT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VEC==null?"null":"" + VEC, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WSD==null?"null":"" + WSD, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A01_2==null?"null":"" + A01_2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A07==null?"null":"" + A07, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A03==null?"null":"" + A03, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A05==null?"null":"" + A05, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A06==null?"null":"" + A06, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A08==null?"null":"" + A08, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(A09==null?"null":"" + A09, delimiters));
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
    if (__cur_str.equals("null")) { this.area_do = null; } else {
      this.area_do = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.area_gu = null; } else {
      this.area_gu = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.area_dong = null; } else {
      this.area_dong = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_date = null; } else {
      this.base_date = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.T1H = null; } else {
      this.T1H = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.RN1 = null; } else {
      this.RN1 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.SKY = null; } else {
      this.SKY = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.UUU = null; } else {
      this.UUU = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VVV = null; } else {
      this.VVV = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.REH = null; } else {
      this.REH = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PTY = null; } else {
      this.PTY = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.LGT = null; } else {
      this.LGT = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VEC = null; } else {
      this.VEC = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.WSD = null; } else {
      this.WSD = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A01_2 = null; } else {
      this.A01_2 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A07 = null; } else {
      this.A07 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A03 = null; } else {
      this.A03 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A05 = null; } else {
      this.A05 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A06 = null; } else {
      this.A06 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A08 = null; } else {
      this.A08 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A09 = null; } else {
      this.A09 = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.area_do = null; } else {
      this.area_do = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.area_gu = null; } else {
      this.area_gu = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.area_dong = null; } else {
      this.area_dong = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_date = null; } else {
      this.base_date = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.T1H = null; } else {
      this.T1H = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.RN1 = null; } else {
      this.RN1 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.SKY = null; } else {
      this.SKY = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.UUU = null; } else {
      this.UUU = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VVV = null; } else {
      this.VVV = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.REH = null; } else {
      this.REH = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PTY = null; } else {
      this.PTY = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.LGT = null; } else {
      this.LGT = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VEC = null; } else {
      this.VEC = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.WSD = null; } else {
      this.WSD = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A01_2 = null; } else {
      this.A01_2 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A07 = null; } else {
      this.A07 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A03 = null; } else {
      this.A03 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A05 = null; } else {
      this.A05 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A06 = null; } else {
      this.A06 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A08 = null; } else {
      this.A08 = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.A09 = null; } else {
      this.A09 = Integer.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    WEATHER o = (WEATHER) super.clone();
    return o;
  }

  public void clone0(WEATHER o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("area_do", this.area_do);
    __sqoop$field_map.put("area_gu", this.area_gu);
    __sqoop$field_map.put("area_dong", this.area_dong);
    __sqoop$field_map.put("base_date", this.base_date);
    __sqoop$field_map.put("T1H", this.T1H);
    __sqoop$field_map.put("RN1", this.RN1);
    __sqoop$field_map.put("SKY", this.SKY);
    __sqoop$field_map.put("UUU", this.UUU);
    __sqoop$field_map.put("VVV", this.VVV);
    __sqoop$field_map.put("REH", this.REH);
    __sqoop$field_map.put("PTY", this.PTY);
    __sqoop$field_map.put("LGT", this.LGT);
    __sqoop$field_map.put("VEC", this.VEC);
    __sqoop$field_map.put("WSD", this.WSD);
    __sqoop$field_map.put("A01_2", this.A01_2);
    __sqoop$field_map.put("A07", this.A07);
    __sqoop$field_map.put("A03", this.A03);
    __sqoop$field_map.put("A05", this.A05);
    __sqoop$field_map.put("A06", this.A06);
    __sqoop$field_map.put("A08", this.A08);
    __sqoop$field_map.put("A09", this.A09);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("area_do", this.area_do);
    __sqoop$field_map.put("area_gu", this.area_gu);
    __sqoop$field_map.put("area_dong", this.area_dong);
    __sqoop$field_map.put("base_date", this.base_date);
    __sqoop$field_map.put("T1H", this.T1H);
    __sqoop$field_map.put("RN1", this.RN1);
    __sqoop$field_map.put("SKY", this.SKY);
    __sqoop$field_map.put("UUU", this.UUU);
    __sqoop$field_map.put("VVV", this.VVV);
    __sqoop$field_map.put("REH", this.REH);
    __sqoop$field_map.put("PTY", this.PTY);
    __sqoop$field_map.put("LGT", this.LGT);
    __sqoop$field_map.put("VEC", this.VEC);
    __sqoop$field_map.put("WSD", this.WSD);
    __sqoop$field_map.put("A01_2", this.A01_2);
    __sqoop$field_map.put("A07", this.A07);
    __sqoop$field_map.put("A03", this.A03);
    __sqoop$field_map.put("A05", this.A05);
    __sqoop$field_map.put("A06", this.A06);
    __sqoop$field_map.put("A08", this.A08);
    __sqoop$field_map.put("A09", this.A09);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
