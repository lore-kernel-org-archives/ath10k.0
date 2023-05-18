Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A2C77B7A
	for <ath10k@archiver.kernel.org>; Thu, 18 May 2023 10:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Mjv6HEHfhfBgAE9/wKIfI/hLnQzxv8HUgEiAUp/wxU=; b=1BeimXtL1rbI1f
	wnHbtvEnu6S6x5mwMq9mNEzU5qlUB3wSwHvb7rCHVfVE2/JCPDzgsmK5r744LvMsBrr9HYDNEPABm
	47eVERZXgHbzJvOtPKpo649nmEfRb/FnlADrXpN/K9kTo0sxkuxgPzrmeC/E+Th49zaMqUwh5GK5e
	Bmdt/A49xXpuY5bH8hJgK4YRBKyN9HhO/K2f9G7rrlcBuKoY8tufvbvXfD1BtjntSzXQoV3lwAXaC
	ARA3JQN5y81Me14mOnCkJ+d1XlrRMoSvsXEz7kOaXNOVkbRa/X6/g/P8T7KyCGNLIY7Ev2SbR0QqJ
	BSJgiED0S66rmG9ymWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzafv-00CYmH-0z;
	Thu, 18 May 2023 10:15:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzafs-00CYko-0Q
	for ath10k@lists.infradead.org;
	Thu, 18 May 2023 10:15:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I9lVQa012027;
	Thu, 18 May 2023 10:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=dcN+4220TMTISoGzML+7Qx5uu4pIw0lq+Nsrz+AQF9s=;
 b=ilTWcMv6wyJ+netH2RGWfqy97ClvN0EOJAYomiN24x5o4ukGhH4YM770OvrT1Wx+jZpJ
 xRXwRU0x+7oqchh4+ZatpwMFrkKxkEL+UutrsUoe4WGZA0Ers6E+mM3AQZwf83p3rtvF
 Fz0JFQM3JSIbwT2KsJfO0ZTrbY+FURZlN7DSS70FDVMgPgyyj3Qu0j5LLi/RNnZcSLdj
 8p1gOv4ktbx32tUTIPFTe6xfpmNO+j6FLLIjhHA615H+BBbPeyve4V9aVwDL9xxS2+V/
 /QHhcKex/ML0lhgPy8neZK7j6f8pNCdrAORxJUPuMBXx0I58rzVtW/+FRx6Yp65Dpt8d +A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qnc30rnxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 10:15:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34IAFpFq004835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 10:15:51 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 18 May 2023 03:15:49 -0700
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH] wifi: ath10k: Trigger STA disconnect after reconfig complete on hardware restart
Date: Thu, 18 May 2023 15:45:15 +0530
Message-ID: <20230518101515.3820-1-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: glgPWhpa2swMSDRImm7wieI1PJNqX3a9
X-Proofpoint-ORIG-GUID: glgPWhpa2swMSDRImm7wieI1PJNqX3a9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_07,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_031556_204802_BF5DAA81 
X-CRM114-Status: GOOD (  18.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Currently, on WCN3990, the station disconnect after hardware recovery is
not working as expected. This is because of setting the
IEEE80211_SDATA_DISCONNECT_HW_RESTART flag very early in the hardware
recovery process even before the driver invokes ieee80211_hw_restart().
On the contrary, mac80211 expects this flag to be set after
ieee80211_hw_restart() is invoked for it to trigger station disconnect.

Set the IEEE80211_SDATA_DISCONNECT_HW_RESTART flag in
ath10k_reconfig_complete() instead to fix this.

The other targets are not affected by this change, since the hardware
params flag is not set.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1

Fixes: 2c3fc50591ff ("ath10k: Trigger sta disconnect on hardware restart")
Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 9 ---------
 drivers/net/wireless/ath/ath10k/mac.c  | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 533ed7169e11..6cdb225b7eac 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2504,7 +2504,6 @@ EXPORT_SYMBOL(ath10k_core_napi_sync_disable);
 static void ath10k_core_restart(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
-	struct ath10k_vif *arvif;
 	int ret;
 
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
@@ -2543,14 +2542,6 @@ static void ath10k_core_restart(struct work_struct *work)
 		ar->state = ATH10K_STATE_RESTARTING;
 		ath10k_halt(ar);
 		ath10k_scan_finish(ar);
-		if (ar->hw_params.hw_restart_disconnect) {
-			list_for_each_entry(arvif, &ar->arvifs, list) {
-				if (arvif->is_up &&
-				    arvif->vdev_type == WMI_VDEV_TYPE_STA)
-					ieee80211_hw_restart_disconnect(arvif->vif);
-			}
-		}
-
 		ieee80211_restart_hw(ar->hw);
 		break;
 	case ATH10K_STATE_OFF:
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9c4bf2fdbc0f..ab12e3e0c515 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8109,6 +8109,7 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 				     enum ieee80211_reconfig_type reconfig_type)
 {
 	struct ath10k *ar = hw->priv;
+	struct ath10k_vif *arvif;
 
 	if (reconfig_type != IEEE80211_RECONFIG_TYPE_RESTART)
 		return;
@@ -8123,6 +8124,13 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH10K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 		clear_bit(ATH10K_FLAG_RESTARTING, &ar->dev_flags);
+		if (ar->hw_params.hw_restart_disconnect) {
+			list_for_each_entry(arvif, &ar->arvifs, list) {
+				if (arvif->is_up && arvif->vdev_type == WMI_VDEV_TYPE_STA)
+					ieee80211_hw_restart_disconnect(arvif->vif);
+				}
+		}
+
 	}
 
 	mutex_unlock(&ar->conf_mutex);
-- 
2.38.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
