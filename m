Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAF4C3DA7A
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OZamUWw3Cw/vs3z6jyDIl3qQ0eaP3fRUmZ151FveOY=; b=ySZK9JRVzEl7wLbtlkzoIOgg2p
	kUPDyoOKCIMqpJjJhpTxbcU44m58uIQB0OfRN79IEAOh/sSP7/6TtqW5nF2mDMScS7UZl4wRZjD+l
	kuAuV8XzKRkSOPMYVuHp998zbgmckP7o8oLjDTOpHVZOIf+KIIf7R/0drHCUKLDnNmupXIWRlIjne
	8QX8AEvWBbuKaUQgs1EF97f8+8tK8rClwYrxcjk1TFcW3/8kC0BJxVsNr39+FO8Uvv57pjGQvEqN6
	DbI6H8l7F9UzXKbpYiDlj/IdC9rCE+PmWnnEsvL7/bzGlVOuJgQinwmHezmmWa9lpfgMxroHdcvzn
	2CRqWwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDShd-00FXLo-1Z;
	Wed, 13 Dec 2023 17:07:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSha-00FXHJ-0r
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 17:07:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDCvukr012797;
	Wed, 13 Dec 2023 17:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=7OZamUWw3Cw/vs3z6jyDIl3qQ0eaP3fRUmZ151FveOY
	=; b=H/BcYvcPeDNr/Ymv2ybIoK+avFIj/b4dM6uSIZenbQiLRBiusM8vM31Is5H
	E+RgI9EZgWZcMRr4wok6RkrufyoyA91XVWtrlmZOVE1HTyUgIeECKu7orRqwK/XQ
	TR/w+jMpELybdRAtmg1NYYeQf+Oib3dnraqkfOZ7ASau1BQAfYE+rNiVDK+c2h7D
	fomnx6/IsvkPo3eDSWmkzuNMs83zN8SKSa2Tw24+RTzYIO71dl4zrlY1kHI0fSHm
	7xynOKRamByNPgoUDRsxoFJmxglnRBPsFy1J37a/RjP9sFMa0zzdPRGYg319tmZx
	5paf4tH2GCQfgIhM6USkgDTgjpQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy9gd15qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDH6fVl008894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 17:06:41 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 09:06:41 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 13 Dec 2023 09:06:41 -0800
Subject: [PATCH 3/6] wifi: ath10k: remove struct
 wmi_pdev_chanlist_update_event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231213-wmi_host_mem_chunks_flexarray-v1-3-92922d92fa2c@quicinc.com>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva"
	<gustavo@embeddedor.com>,
        <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OvSn-JBmwLd-beZCsjU9vyiQNPb04lbe
X-Proofpoint-GUID: OvSn-JBmwLd-beZCsjU9vyiQNPb04lbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=806
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_090718_429895_6E7A0718 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Currently struct wmi_pdev_chanlist_update_event defines:
	  struct wmi_channel channel_list[1];

Per the guidance in [1] this should be a flexible array. However
during conversion it was discovered that this struct is not used, so
just remove the entire struct.

No functional changes, compile tested only.

[1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 52a409ff94e7..37a7d421bd86 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4256,13 +4256,6 @@ struct wmi_peer_sta_ps_state_chg_event {
 	__le32 peer_ps_state;
 } __packed;
 
-struct wmi_pdev_chanlist_update_event {
-	/* number of channels */
-	__le32 num_chan;
-	/* array of channels */
-	struct wmi_channel channel_list[1];
-} __packed;
-
 #define WMI_MAX_DEBUG_MESG (sizeof(u32) * 32)
 
 struct wmi_debug_mesg_event {

-- 
2.42.0


