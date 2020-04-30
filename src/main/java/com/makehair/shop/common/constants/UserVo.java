package com.makehair.shop.common.constants;



public class UserVo {

  private String userId;
  private String password;
  private String name;
  private String sex;
  private String phone;
  private long age;
  private java.sql.Timestamp insertDate;
  private java.sql.Timestamp deleteDate;


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


  public long getAge() {
    return age;
  }

  public void setAge(long age) {
    this.age = age;
  }


  public java.sql.Timestamp getInsertDate() {
    return insertDate;
  }

  public void setInsertDate(java.sql.Timestamp insertDate) {
    this.insertDate = insertDate;
  }


  public java.sql.Timestamp getDeleteDate() {
    return deleteDate;
  }

  public void setDeleteDate(java.sql.Timestamp deleteDate) {
    this.deleteDate = deleteDate;
  }

  @Override
  public String toString() {
    return "UserVo{" +
        "userId='" + userId + '\'' +
        ", password='" + password + '\'' +
        ", name='" + name + '\'' +
        ", sex='" + sex + '\'' +
        ", phone='" + phone + '\'' +
        ", age=" + age +
        ", insertDate=" + insertDate +
        ", deleteDate=" + deleteDate +
        '}';
  }
}
