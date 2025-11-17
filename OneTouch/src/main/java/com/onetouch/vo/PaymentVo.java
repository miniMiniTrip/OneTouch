package com.onetouch.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("payment")
public class PaymentVo {
    int payment_id;
    String payment_key;
    int order_id;
    int amount;
    String method;
    String status;
    Timestamp approved_at;
    String failed_reason;
    String cancel_reason;
    String receipt_url;
    Timestamp order_time;
    Timestamp order_update;
}
