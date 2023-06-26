Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EC0EB64DC
	for <ath10k@archiver.kernel.org>; Mon, 26 Jun 2023 02:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jH+/b7mkM4ifgF/SJZhy/7BOo7tbEoloRcS1kOQON8Y=; b=BdcJunNiyLU9Q4
	W/zeAmoalox9xGNfZZj+3KPDmkg5HOL7xRiL3kQ/9e+Gv+OjZ+u+WKcTUK39RPWxcCnFe8K8Lgm6Y
	KM1kkqBpLytIDY0JfsBR4ap0St2neMw2H+Z36RULoJdpaXrCgBekIh3Ct6mMtVqn6RZMwkf7ooYWZ
	1GVu/NTdlBjEa+RLBXzPHc0Bz36GOQprdl3voRkSuew58vJvadtYYo8z/bf8GXoFAkxTws+N8FMjQ
	qyxJD+DNFE09XRKAAllF/HkZRVfIAUkz1XG+7lCK/ATOrUy/ZqN4AKwR+YK6OlZZuSQSokAw7nsup
	dgvbvCtmkfk71RztPbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDcBx-009ASb-2a;
	Mon, 26 Jun 2023 02:43:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDcBu-009ARV-0z
	for ath10k@lists.infradead.org;
	Mon, 26 Jun 2023 02:42:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35Q21jSx011022;
	Mon, 26 Jun 2023 02:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=YUHdgf3PzCUbbrU5PgZQ+33VeZimYf6Bv6NUP6dDX98=;
 b=UeXgh+0za+LlVHvnOql4WyhAeVrAdJtVtGM0sehK+KYnBKBjqsINNeK9YrsKQRiY+wtn
 /ko05VHapVCN9gT4t+UxpCzBG1JEOniS4e9pbYY3Puzc+RtMRYAAQEu3TxQepUeSeQDB
 siwM3R3CrPSZZuP9sK6Ihhn94FGyLrPKr2Gsav4XPtaN5I4adc3hZfnIPJ7lmRXLesGE
 VQowOgaD1sLAhSf/c13jfedoDDgCVhJztMAFoSQxuGSNtult7JCFvEqNEqjCVWB9jrAq
 lAalpx44wdHCyeOt3m2TSuWvhQCjv18zM0k2yF10UX13g+iOQWwJSlWs1prIP25V3FXy Gg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rev820bmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 02:42:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35Q2gtCl016684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 02:42:55 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Sun, 25 Jun 2023 19:42:54 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath10k: indicate to mac80211 scan complete with aborted flag for ATH10K_SCAN_STARTING state
Date: Sun, 25 Jun 2023 22:42:32 -0400
Message-ID: <20230626024232.15579-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pXzqzKFmHNIp4bcv8swHypuYCDLMmOiL
X-Proofpoint-GUID: pXzqzKFmHNIp4bcv8swHypuYCDLMmOiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-25_16,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1011 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_194258_376353_E44D3AD6 
X-CRM114-Status: GOOD (  18.25  )
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

Scan failure can not be recovered from when running a loop of the
following steps:
1. run scan: "iw wlan scan".
2. run command: echo soft > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash
   immediately after step 1.

result:
scan failed and can not recover even when wlan recovery succeeds:
command failed: Device or resource busy (-16)

reason:
When scan arrives, WMI_START_SCAN_CMDID is sent to the firmware and
function ath10k_hw_scan() returns, then simulate_fw_crash arrives
and the scan started event does not arrive, and then it starts to do
recovery of wlan. __ath10k_scan_finish() which is called from
ath10k_halt() is one step of recovery, it will not call
ieee80211_scan_completed() by logic currently because the scan state is
ATH10K_SCAN_STARTING. Thus it leads the scan not being completed in
mac80211, and leads all consecutive scans failing with -EBUSY in
nl80211_trigger_scan even after wlan recovery success.

Indicate scan complete with aborted flag to mac80211 for
ATH10K_SCAN_STARTING to allow recovery from scan failed with "Device or
resource busy (-16)" after wlan recovery.

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00174

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7675858f069b..c77837b50aa8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4503,18 +4503,21 @@ void __ath10k_scan_finish(struct ath10k *ar)
 		break;
 	case ATH10K_SCAN_RUNNING:
 	case ATH10K_SCAN_ABORTING:
+		if (ar->scan.is_roc && ar->scan.roc_notify)
+			ieee80211_remain_on_channel_expired(ar->hw);
+		fallthrough;
+	case ATH10K_SCAN_STARTING:
 		if (!ar->scan.is_roc) {
 			struct cfg80211_scan_info info = {
-				.aborted = (ar->scan.state ==
-					    ATH10K_SCAN_ABORTING),
+				.aborted = ((ar->scan.state ==
+					    ATH10K_SCAN_ABORTING) ||
+					    (ar->scan.state ==
+					    ATH10K_SCAN_STARTING)),
 			};
 
 			ieee80211_scan_completed(ar->hw, &info);
-		} else if (ar->scan.roc_notify) {
-			ieee80211_remain_on_channel_expired(ar->hw);
 		}
-		fallthrough;
-	case ATH10K_SCAN_STARTING:
+
 		ar->scan.state = ATH10K_SCAN_IDLE;
 		ar->scan_channel = NULL;
 		ar->scan.roc_freq = 0;

base-commit: 0a00db612b6df1fad80485e3642529d1f28ea084
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
