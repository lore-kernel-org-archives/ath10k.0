Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912F5CA0ED1
	for <ath10k@archiver.kernel.org>; Fri, 30 Aug 2024 03:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WnLv4pdq+EyUjJ75h9GulTycBwILJtRBraCLytMa3p4=; b=zt2O/3WkctVeh0nxSHFJTmmr5k
	3XGAxHOB7Zp5y6BCt9TBKuT4EnMC6jrhnDao+vX120ZT9qNDyUn5yAIzfi4fQIsL/jk1Hkov6P2/i
	38rHprw5sRKoHA64HD+lXOEUnCcusvWFpxkTJTWJUk6LueT1zUn4v7TkCtjTSNDDgeFLz3X248nKh
	0EzPotIoFT1fYuWjeDNuZg9/pPTqrDKViFggiRbCq0Oc54z6tHeMeQCk8yEvW9rZQpLCBR/EiJhh8
	oPSek/FSUBhTdJMYdeDHfuLn1l8rOZMRPSIZvRrgl7Ax4YmHchWd8PhJZdZT9rQbBNNelG+Sm2Xn4
	xl7tWxpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjrsn-00000004SMJ-115C;
	Fri, 30 Aug 2024 03:01:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqqF-00000004L2d-2wWN
	for ath10k@bombadil.infradead.org;
	Fri, 30 Aug 2024 01:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WnLv4pdq+EyUjJ75h9GulTycBwILJtRBraCLytMa3p4=; b=OMyMtjU32XldInHRPa/KZ61ioV
	iXgZRMOKT7jgTNJ7iq4ZHCSgkPRNm6w6F7Bav9Ry+PJ2+IisnquPu0TbwfA7J4Zsagin4hSiksCQV
	ELhBUPH2nvSd23Ef3FK6jrZ8WZ2T9/bSWHPNH7ZEx1G86qvKBAK3QfufmibBP9VWS/S/YEiLJHY9n
	vORwl2cM3WhdrS2qqNcaky6UiiRUToGKmDnMX1sR3Gni4TrYLp+tuDvCR/z1N0P9p9p6IofWi94Td
	wNPA9Y8ETzkzafNXid7ajQQUFFq6K6bL2ktCv9toFZ3eL00nOWYIfBfg7p5M4/uvxvHThh+qsK0AM
	Uitcp52Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqqA-0000000BWgh-3kpS
	for ath10k@lists.infradead.org;
	Fri, 30 Aug 2024 01:54:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TIGtr7028780;
	Fri, 30 Aug 2024 01:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WnLv4pdq+EyUjJ75h9GulT
	ycBwILJtRBraCLytMa3p4=; b=Vfnbx4HX+NdYvjVWUVB7icBC3dQd95ZT4GB/3j
	/PMYXo3bBRoubi7mw3RKH/qvnmi554kvo0DEByOg2ufwudDmxD8+IZWv9lWTpx9G
	FPTHL9jWh8DmCKdBaCO55m8nLxmLCcomqjLzSYYPq7lp5n4UzfONzPuHDoj+WLC0
	+wUXlu7WEmvNwW/PMsRJVrOrXAWtvHk0BCY8cNB/o/od5PwKTaDzIYyiFudu/47F
	PjPInNjdOZemOWZ54kJ1BzMGZSLDyh+jT4+YHk8yb2yhb31tgXPAiBjMCTmsEC4N
	V8Kx9iLljUv7O5N+J5OTze5o6SHOBVWqDKZcHUowCjxqdWdw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41ax4mgtpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 01:54:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U1s9Me002460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 01:54:09 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 18:54:08 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH] wifi: ath10k: fix the stack frame size warning in ath10k_remain_on_channel
Date: Fri, 30 Aug 2024 09:53:49 +0800
Message-ID: <20240830015349.1083226-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: U5elr_1K-dDnI5PrBxac_BZuhzjeViFZ
X-Proofpoint-ORIG-GUID: U5elr_1K-dDnI5PrBxac_BZuhzjeViFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_025419_935981_D4665514 
X-CRM114-Status: GOOD (  12.44  )
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

Fix the following W=1 kernel build warning:

drivers/net/wireless/ath/ath10k/mac.c: In function ‘ath10k_remain_on_channel’:
drivers/net/wireless/ath/ath10k/mac.c:7980:1: warning: the frame size of 1064 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Compile tested only.

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 35 ++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a5da32e87106..9bfa55dede31 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7899,7 +7899,7 @@ static int ath10k_remain_on_channel(struct ieee80211_hw *hw,
 {
 	struct ath10k *ar = hw->priv;
 	struct ath10k_vif *arvif = (void *)vif->drv_priv;
-	struct wmi_start_scan_arg arg;
+	struct wmi_start_scan_arg *arg = NULL;
 	int ret = 0;
 	u32 scan_time_msec;
 
@@ -7936,20 +7936,25 @@ static int ath10k_remain_on_channel(struct ieee80211_hw *hw,
 
 	scan_time_msec = ar->hw->wiphy->max_remain_on_channel_duration * 2;
 
-	memset(&arg, 0, sizeof(arg));
-	ath10k_wmi_start_scan_init(ar, &arg);
-	arg.vdev_id = arvif->vdev_id;
-	arg.scan_id = ATH10K_SCAN_ID;
-	arg.n_channels = 1;
-	arg.channels[0] = chan->center_freq;
-	arg.dwell_time_active = scan_time_msec;
-	arg.dwell_time_passive = scan_time_msec;
-	arg.max_scan_time = scan_time_msec;
-	arg.scan_ctrl_flags |= WMI_SCAN_FLAG_PASSIVE;
-	arg.scan_ctrl_flags |= WMI_SCAN_FILTER_PROBE_REQ;
-	arg.burst_duration_ms = duration;
+	arg = kzalloc(sizeof(*arg), GFP_KERNEL);
+	if (!arg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
 
-	ret = ath10k_start_scan(ar, &arg);
+	ath10k_wmi_start_scan_init(ar, arg);
+	arg->vdev_id = arvif->vdev_id;
+	arg->scan_id = ATH10K_SCAN_ID;
+	arg->n_channels = 1;
+	arg->channels[0] = chan->center_freq;
+	arg->dwell_time_active = scan_time_msec;
+	arg->dwell_time_passive = scan_time_msec;
+	arg->max_scan_time = scan_time_msec;
+	arg->scan_ctrl_flags |= WMI_SCAN_FLAG_PASSIVE;
+	arg->scan_ctrl_flags |= WMI_SCAN_FILTER_PROBE_REQ;
+	arg->burst_duration_ms = duration;
+
+	ret = ath10k_start_scan(ar, arg);
 	if (ret) {
 		ath10k_warn(ar, "failed to start roc scan: %d\n", ret);
 		spin_lock_bh(&ar->data_lock);
@@ -7975,6 +7980,8 @@ static int ath10k_remain_on_channel(struct ieee80211_hw *hw,
 
 	ret = 0;
 exit:
+	kfree(arg);
+
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
2.25.1


