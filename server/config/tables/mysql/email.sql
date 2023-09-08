CREATE table email
(
    id             INT unsigned AUTO_INCREMENT PRIMARY KEY COMMENT '自增id',
    type           tinyint(4) NOT NULL DEFAULT 0 COMMENT '邮件类型，0:收到的邮件，1:发送的邮件',
    group_id       int unsigned NOT NULL DEFAULT 0 COMMENT '分组id',
    subject        varchar(1000) NOT NULL DEFAULT '' COMMENT '邮件标题',
    reply_to       json COMMENT '回复人',
    from_name      varchar(50)   NOT NULL DEFAULT '' COMMENT '发件人名称',
    from_address   varchar(150)  NOT NULL DEFAULT '' COMMENT '发件人邮件地址',
    `to`           json COMMENT '收件人信息',
    bcc            json COMMENT '抄送',
    cc             json COMMENT '抄送',
    `text`         text COMMENT '邮件文本内容',
    html           text COMMENT 'html格式内容',
    sender         json COMMENT '发件人',
    attachments    json COMMENT '附件内容',
    spf_check      tinyint(1) DEFAULT 0 COMMENT '0未校验，1校验通过，2校验未通过',
    dkim_check     tinyint(1) DEFAULT 0 COMMENT '0未校验，1校验通过，2校验未通过',
    status         tinyint(4) NOT NULL DEFAULT 0 COMMENT '0未发送，1已发送，2发送失败，3删除',
    send_user_id   int unsigned NOT NULL DEFAULT 0 COMMENT '发件人用户id',
    is_read        tinyint(1) NOT NULL DEFAULT 0 COMMENT '未读0，已读1',
    error          text COMMENT '错误信息记录',
    cron_send_time datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '定时发送邮件的发送时间',
    send_date      datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发件日期',
    create_time    datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time    datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)COMMENT='邮件内容表'