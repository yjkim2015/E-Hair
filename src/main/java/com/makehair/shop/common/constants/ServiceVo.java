package com.makehair.shop.common.constants;


public class ServiceVo {

  private long serviceNo;
  private String serviceName;
  private long servicePrice;
  private String memo;


  public long getServiceNo() {
    return serviceNo;
  }

  public void setServiceNo(long serviceNo) {
    this.serviceNo = serviceNo;
  }


  public String getServiceName() {
    return serviceName;
  }

  public void setServiceName(String serviceName) {
    this.serviceName = serviceName;
  }


  public long getServicePrice() {
    return servicePrice;
  }

  public void setServicePrice(long servicePrice) {
    this.servicePrice = servicePrice;
  }


  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }

  @Override
  public String toString() {
	return "ServiceVo [serviceNo=" + serviceNo + ", serviceName=" + serviceName + ", servicePrice=" + servicePrice
				+ ", memo=" + memo + "]";
 }
 	  
}
