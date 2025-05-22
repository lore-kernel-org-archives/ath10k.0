Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC81C54E65
	for <ath10k@archiver.kernel.org>; Thu, 22 May 2025 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xv+dLfIlgEKxHBEJuwgEq4mtTaTF543E1/RXKGoWHO0=; b=K2oBxHHTFg/FWznx0yZlyvD1FM
	ZKkLU6uxfaRO903nrSc8EloLhZnrRqbdC2IN/iUYaovDg9p5SaCuL/X9h8PDkvQbBx6OF81J+5GME
	SwnHZR9Ara411ab7yMSoLBOqDc3ULXG5wTWKJIDyoeMmbjNKcXo8IjhmVRcuuxgJpQPxeCZmILyYm
	mYi2o9jCEb/tdUfoTy6HxNHuxfkrlWdD6dwGP4jBlgHSKuHUG/vH9ITjslf0mFTLTLLrpNiDMAvyL
	PM60XHzw4VCEAS0K3VbdMDnabDVApGp66Vz5WmzA5q2PzOXHh09LgoDC7viUuip64/inlYABx4uYB
	vfmufFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5nL-000000015kG-23Zl;
	Thu, 22 May 2025 13:17:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5nJ-000000015jj-38sb
	for ath10k@lists.infradead.org;
	Thu, 22 May 2025 13:17:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7hBis031739
	for <ath10k@lists.infradead.org>; Thu, 22 May 2025 13:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xv+dLfIlgEKxHBEJuwgEq4mtTaTF543E1/R
	XKGoWHO0=; b=Axp2lyKPZ5EvyB8wQzk3I8YCAa+nZul6ZeV3xCrRg8bR2OB2vJ4
	NbferIpAlpYLBKIhRC3XqumnWf4fZC5XrhvI00G2Zy00scnuLFNWJOYNO6QDYE/U
	bp5FwtufukFXS50eaIPn71HC0yhT5v1+GkIAR4SC7k4InqtYVLBtZXU+HIokINuv
	1CmyJUJlf1xVK2rWU9NS/cqneZcrw5iswuTLgLjXrhrm6JvziiQPXvXrsb76V0HO
	lO66hEwZjQ/iCEe/J+ytDcWJv1x2GjPuOKrcuoWjwIOn74L7a1GPSBaGNSiChQE+
	yg0lALTLM27ukK5mGTJJlAf9RE6cFVcsxTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c251ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 22 May 2025 13:17:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7cabd21579eso1392189085a.3
        for <ath10k@lists.infradead.org>; Thu, 22 May 2025 06:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919827; x=1748524627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xv+dLfIlgEKxHBEJuwgEq4mtTaTF543E1/RXKGoWHO0=;
        b=flQskhVt0cY8zgvZIq5N3v06Et/9NynuZsHD3ABWxsB3cJk57wgZFBdHQA9q0IySMW
         j7Aa9X14QygrhEieObl9YfypdBdcf+WkJD2cHx3LIxKxg53EWEcxbc8RNLcPXj9mLPWe
         AJ+JzZq2/81xg5ulBZK8xNtEd/fjFyWM4M+JC7vOBPxayf21Jcg1nyllDdzE6A14+CEA
         m3FyYEuf1dNB++zlmYz8E2JtxRWGYezXAUm3cj/TLjJnvdax8b27cUwC4m2KTBQfaygi
         /SgewYSEYkeE5h3CXnOE9QX6mt+0UbdzJF7Ru5Wr3c5YBc8LLfbiJSbKl8lvfejwMVac
         YARA==
X-Forwarded-Encrypted: i=1; AJvYcCXFdKKdMsjPPTZyh5duPG7g57Acf4zUnXUVda5rUt8ehWphPBjOe6U+K8VI0DiXjzytDilGEfc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJlp/sI4VuEXddzkd2xBuMTxvJ4NNixTmU49ljEmtupU1f1cJo
	MzaLLSJVG4DSG2Mwarsj99o202Xb6Q+DnMnIJLkALQ2Khzj1pDziyofZUY/FNvJ3ekFpMq2dy4Y
	RgjNE1jbhCWVkjwEkdzqwQx9IGtZYHFkRn7WZkfe1w5iBdy8NWAY5jmguprLEfBxH
X-Gm-Gg: ASbGncts3YZOTASwxcSOdei+tPVTqW2rJaUSEsqMgjDVRktgCdzF9wB/kjui1GkXwzw
	kWvfuX9mUemF2Bo/sbD1Yp/yS1mp/eQk+AvFEBhMdQycrZm2F22mXqNG50I0XqoOjfEK2L5xY4q
	ahH1xbeQyQ9A9mkE4tlTZJxftfkrI+rrG1MwxEl7Y9YC5FKJs/Wp7VjPXuok1W5jp0jgeg+BD7r
	jkaTYkuqFh9xKOto9PsaiPBfghEFutgytyeTu/pEcO/cIvLv2LjjLvsDiSJstnfu/0tn1JxYBnz
	dopfJFKT8gkLSd7ZcAZLtO264+PqtRXSwO/LQKq8EJ44klE=
X-Received: by 2002:a05:620a:4493:b0:7c7:6667:ade5 with SMTP id af79cd13be357-7cd46733233mr3097575985a.27.1747919827518;
        Thu, 22 May 2025 06:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF50oZ4KZSZvY1ONbiRasISJNNHhay39+Eu0obi2aFnFlLHSm2lwNV6tT9/2rbZj8GX6Bi7IQ==
X-Received: by 2002:a05:620a:4493:b0:7c7:6667:ade5 with SMTP id af79cd13be357-7cd46733233mr3097573385a.27.1747919827126;
        Thu, 22 May 2025 06:17:07 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e5bc:5c94:e4b3:3c4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm23677256f8f.90.2025.05.22.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:17:06 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath10k: Avoid vdev delete timeout when firmware is already down
Date: Thu, 22 May 2025 15:17:04 +0200
Message-Id: <20250522131704.612206-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEzNCBTYWx0ZWRfXwy9yFz/fgYAq
 0z7IXubs5pTwAV4RYZg6PaSCSGY+m+35pWF3VjFhJ6PvNIVySM+a95xezzymN3wiMrR5rk7CMSH
 bT30hWOpL+Aq9Oy5F7jEYdkUvGZQ7m+BWH05asFC71WimBzB4jQ6evuDp148Anox3x46KOl6YWp
 MfXsEAb3kixGDfMENmQIsIRwrEsBzrPuL6TsXh2Rue8r3e49S2ksmzQZ2XKLo5cnXeZgftvTYTL
 4Meir6xYmeGfA9N5lNB+I/YxKOeKO5aGDkhRni1aPsUKBCkxI2uW1CdE2Neu3O9mr7GMIb8zk6Q
 Uw3Yyg6olcCaB2y8/NI+pmaZD6wKZkGZ8CG53t8ZxmFkhsbCjtyAdnr7XskP5Oe1dMI46ighls7
 FqBkE03UMEKwR2OXuMG6keLVkzwVWmDNI9/E0OxBme9Lfct2+VeENibROTMe4+Pk7NXIVzZl
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f23d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=IzHPsgMo9mJ7Fn_I8X0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: EW2-ojcvmkYYWfwas1nd0gNrsuqSxiGe
X-Proofpoint-GUID: EW2-ojcvmkYYWfwas1nd0gNrsuqSxiGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=834 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_061709_792635_4DAD3406 
X-CRM114-Status: GOOD (  19.00  )
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

In some scenarios, the firmware may be stopped before the interface is
removed, either due to a crash or because the remoteproc (e.g., MPSS)
is shut down early during system reboot or shutdown.

This leads to a delay during interface teardown, as the driver waits for
a vdev delete response that never arrives, eventually timing out.

Example (SNOC):
$ echo stop > /sys/class/remoteproc/remoteproc0/state
[ 71.64] remoteproc remoteproc0: stopped remote processor modem
$ reboot
[ 74.84] ath10k_snoc c800000.wifi: failed to transmit packet, dropping: -108
[ 74.84] ath10k_snoc c800000.wifi: failed to submit frame: -108
[...]
[ 82.39] ath10k_snoc c800000.wifi: Timeout in receiving vdev delete response

To avoid this, skip waiting for the vdev delete response if the firmware is
already marked as unreachable (`ATH10K_FLAG_CRASH_FLUSH`), similar to how
`ath10k_mac_wait_tx_complete()` and `ath10k_vdev_setup_sync()` handle this case.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 32 ++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c61b95a928da..1df2617a82c0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1022,6 +1022,26 @@ static inline int ath10k_vdev_setup_sync(struct ath10k *ar)
 	return ar->last_wmi_vdev_start_status;
 }
 
+static inline int ath10k_vdev_delete_sync(struct ath10k *ar)
+{
+	unsigned long time_left;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (!test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map))
+		return 0;
+
+	if (test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags))
+		return -ESHUTDOWN;
+
+	time_left = wait_for_completion_timeout(&ar->vdev_delete_done,
+						ATH10K_VDEV_DELETE_TIMEOUT_HZ);
+	if (time_left == 0)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
 static int ath10k_monitor_vdev_start(struct ath10k *ar, int vdev_id)
 {
 	struct cfg80211_chan_def *chandef = NULL;
@@ -5900,7 +5920,6 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 	struct ath10k *ar = hw->priv;
 	struct ath10k_vif *arvif = (void *)vif->drv_priv;
 	struct ath10k_peer *peer;
-	unsigned long time_left;
 	int ret;
 	int i;
 
@@ -5940,13 +5959,10 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 		ath10k_warn(ar, "failed to delete WMI vdev %i: %d\n",
 			    arvif->vdev_id, ret);
 
-	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map)) {
-		time_left = wait_for_completion_timeout(&ar->vdev_delete_done,
-							ATH10K_VDEV_DELETE_TIMEOUT_HZ);
-		if (time_left == 0) {
-			ath10k_warn(ar, "Timeout in receiving vdev delete response\n");
-			goto out;
-		}
+	ret = ath10k_vdev_delete_sync(ar);
+	if (ret) {
+		ath10k_warn(ar, "Error in receiving vdev delete response: %d\n", ret);
+		goto out;
 	}
 
 	/* Some firmware revisions don't notify host about self-peer removal
-- 
2.34.1


