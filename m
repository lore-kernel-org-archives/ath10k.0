Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A2ECA0ED1
	for <ath10k@archiver.kernel.org>; Fri, 30 Aug 2024 01:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9FNUXs55L6FPOGeQppdseAQdixfkkyD+EfcdGOUY7S4=; b=E1YwP+h1dVlVk9OlV1vHiGWWmM
	J1BSVXtJwmupTekU0eVZUt1wOtoH1fbyUTfLrxBpMP/n1sE+DRnOx5oJQd1ZM7lxDqUUS8boE23Ik
	W2f220eKgf7GlYI+98aInHKAQ6pTb+dGMI/rCs/ZZilBOvZ/fOsOdnYECuPH9cyE6xW4Gf5WGmknN
	T7DqZ81bK+yFhbKuT8sF3Wfd42kAFiPXFryYJK4RaJ+an+C5pvJ5swyFaLvdn5V0RWcvgJLv3BEQ8
	b7wARFIskWPPsIm5DSuxSVLz9buPAtjCXDn97WMO8vefvMgXwluTxAtM/N9aw3CX1jbDjsvueDWIB
	0dMTxn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqsu-00000004LI3-18Mr;
	Fri, 30 Aug 2024 01:57:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqsr-00000004LHg-1zOJ
	for ath10k@lists.infradead.org;
	Fri, 30 Aug 2024 01:57:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TNNR56025857;
	Fri, 30 Aug 2024 01:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9FNUXs55L6FPOGeQppdseA
	QdixfkkyD+EfcdGOUY7S4=; b=kB5wzqLlrMqOxaqixtmsTTHVvGC4yazc+8NJPX
	5ZfMfNVFsGBOQGeT4aRcP0Qd8TapN6rGoj0ezqU2PiZat67ch6XZyrWP+s9nS92L
	IB2Tf0iHHxZ6EYl8iPamNh13yTtveR8qSvhHr/tM6Vrh5y/utmes1cZUkfIgNTVj
	xYdFytjWEDuW9C5t3rxG705AwcK/XFTDrazqrIYyYrjXjzqD82HsIEdMtk+F7UoI
	rnoq1rCOTU/TfeZD9RmFC/RHaqi+OnHacvlRVcIL4q+sGgxEMgHkpxTAgSiXiFVW
	syPxtxVVGrR/imilLhk11RVDPrKOqmycgnZhnIJCDMK2quJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41arax2174-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 01:57:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U1v0dX001064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 01:57:00 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 18:56:58 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH] wifi: ath10k: fix the stack frame size warning in ath10k_hw_scan
Date: Fri, 30 Aug 2024 09:56:49 +0800
Message-ID: <20240830015649.1083758-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SeZC64OIH2DFmfHblPH4PwKTYK_WeV8J
X-Proofpoint-GUID: SeZC64OIH2DFmfHblPH4PwKTYK_WeV8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_185705_652993_16173CC4 
X-CRM114-Status: GOOD (  15.69  )
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

drivers/net/wireless/ath/ath10k/mac.c: In function ‘ath10k_hw_scan’:
drivers/net/wireless/ath/ath10k/mac.c:6468:1: warning: the frame size of 1064 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Compile tested only.

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 59 +++++++++++++++------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a5da32e87106..9772f2c18ba1 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6369,7 +6369,7 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 	struct ath10k *ar = hw->priv;
 	struct ath10k_vif *arvif = (void *)vif->drv_priv;
 	struct cfg80211_scan_request *req = &hw_req->req;
-	struct wmi_start_scan_arg arg;
+	struct wmi_start_scan_arg *arg = NULL;
 	int ret = 0;
 	int i;
 	u32 scan_timeout;
@@ -6402,56 +6402,61 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 	if (ret)
 		goto exit;
 
-	memset(&arg, 0, sizeof(arg));
-	ath10k_wmi_start_scan_init(ar, &arg);
-	arg.vdev_id = arvif->vdev_id;
-	arg.scan_id = ATH10K_SCAN_ID;
+	arg = kzalloc(sizeof(*arg), GFP_KERNEL);
+	if (!arg) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	ath10k_wmi_start_scan_init(ar, arg);
+	arg->vdev_id = arvif->vdev_id;
+	arg->scan_id = ATH10K_SCAN_ID;
 
 	if (req->ie_len) {
-		arg.ie_len = req->ie_len;
-		memcpy(arg.ie, req->ie, arg.ie_len);
+		arg->ie_len = req->ie_len;
+		memcpy(arg->ie, req->ie, arg->ie_len);
 	}
 
 	if (req->n_ssids) {
-		arg.n_ssids = req->n_ssids;
-		for (i = 0; i < arg.n_ssids; i++) {
-			arg.ssids[i].len  = req->ssids[i].ssid_len;
-			arg.ssids[i].ssid = req->ssids[i].ssid;
+		arg->n_ssids = req->n_ssids;
+		for (i = 0; i < arg->n_ssids; i++) {
+			arg->ssids[i].len  = req->ssids[i].ssid_len;
+			arg->ssids[i].ssid = req->ssids[i].ssid;
 		}
 	} else {
-		arg.scan_ctrl_flags |= WMI_SCAN_FLAG_PASSIVE;
+		arg->scan_ctrl_flags |= WMI_SCAN_FLAG_PASSIVE;
 	}
 
 	if (req->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
-		arg.scan_ctrl_flags |=  WMI_SCAN_ADD_SPOOFED_MAC_IN_PROBE_REQ;
-		ether_addr_copy(arg.mac_addr.addr, req->mac_addr);
-		ether_addr_copy(arg.mac_mask.addr, req->mac_addr_mask);
+		arg->scan_ctrl_flags |=  WMI_SCAN_ADD_SPOOFED_MAC_IN_PROBE_REQ;
+		ether_addr_copy(arg->mac_addr.addr, req->mac_addr);
+		ether_addr_copy(arg->mac_mask.addr, req->mac_addr_mask);
 	}
 
 	if (req->n_channels) {
-		arg.n_channels = req->n_channels;
-		for (i = 0; i < arg.n_channels; i++)
-			arg.channels[i] = req->channels[i]->center_freq;
+		arg->n_channels = req->n_channels;
+		for (i = 0; i < arg->n_channels; i++)
+			arg->channels[i] = req->channels[i]->center_freq;
 	}
 
 	/* if duration is set, default dwell times will be overwritten */
 	if (req->duration) {
-		arg.dwell_time_active = req->duration;
-		arg.dwell_time_passive = req->duration;
-		arg.burst_duration_ms = req->duration;
+		arg->dwell_time_active = req->duration;
+		arg->dwell_time_passive = req->duration;
+		arg->burst_duration_ms = req->duration;
 
-		scan_timeout = min_t(u32, arg.max_rest_time *
-				(arg.n_channels - 1) + (req->duration +
+		scan_timeout = min_t(u32, arg->max_rest_time *
+				(arg->n_channels - 1) + (req->duration +
 				ATH10K_SCAN_CHANNEL_SWITCH_WMI_EVT_OVERHEAD) *
-				arg.n_channels, arg.max_scan_time);
+				arg->n_channels, arg->max_scan_time);
 	} else {
-		scan_timeout = arg.max_scan_time;
+		scan_timeout = arg->max_scan_time;
 	}
 
 	/* Add a 200ms margin to account for event/command processing */
 	scan_timeout += 200;
 
-	ret = ath10k_start_scan(ar, &arg);
+	ret = ath10k_start_scan(ar, arg);
 	if (ret) {
 		ath10k_warn(ar, "failed to start hw scan: %d\n", ret);
 		spin_lock_bh(&ar->data_lock);
@@ -6463,6 +6468,8 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 				     msecs_to_jiffies(scan_timeout));
 
 exit:
+	kfree(arg);
+
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
2.25.1


