Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036C60A6F79
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RnP64pVn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LmF0wkuo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUCbHfaM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=; b=RnP64pVnNRktA8
	8dDUrCEt4smluAhOjM3y3iuGLlqAxAP+RWOoJTxSemOYIwqNVLyd/9pNfNuGQsqsBTt+nO+XDKa5M
	xRbzR+AxZgr+lIJlqVpWakoJIk+en18Q45LvrGgIlRsprxVZySjq68/3UR86b3dgsxv5UbSyJRkI5
	AfTiLyQG/C7kbZOJznkFNQp3x63UmV1zVplRWh1nVdj8bhisrmPTzymdPKeorxjpamUCO1rBp4X8c
	uytfy6MevZDkIYAgXiRqXyf/BX7HRZdhcjiMW73lT9YpUI5YveVyvRhn05uCHJSpO0dd4AqL1j8dI
	CSDQXWhaIjqbOUfRE4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxH-00000009hGj-1r4k;
	Thu, 12 Nov 2026 11:26:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwt-00000009h02-1E6A
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmiEa2555142
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=; b=LmF0wkuoImZ6K5Mn
	CoMcB/Uwe6ghELLqCS1Qfg+3j7x/sXZC/jpKp8GcYAj3xW33cIXDlktbsaHYUHv9
	Am/yApWRxRfXp77II0V7SczhyJ7LS8o1TUWwvqxO5r1AEY/Z3lPJdxz4nLMmLOpK
	GN9+fX8sLhv86GDjJBOBrVKOGDfMG/8dmA7HI/ozopsetFxZvBXNrLl3+36aPnl5
	qnmtcoRoY2fJc7MZs2Y0Wr/jJ/ou5+KyB7En24kDjBYU5pXZFyeuZMte+aSNraxq
	lU2Pgcms/HpU7DnqumsvryZW8ucFEaxG9vyn3X3L/0vrvCaX1bwGKN0E/6SkKL+Q
	ByFRHQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j03t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6581815eec.0
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482793; x=1795087593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=;
        b=QUCbHfaMygez1cSQWlTjAS7nXNjNkmNmXV5bFMdKpR2f6SvIg2oplCxihJoYD1iJFh
         +MgdmcS1YpW9itpdwgV4Xu1gPo0XbvikDKmdYsROUOKQRf68ppB0IU5kj8aIjRzzTce+
         o82w08413LtulPlNYAtlow326kIFljiC8PlqCqXf2DWakH8Lsa9APISkyqprW3bMGjhH
         3IDsuiQoopNBlVsP83Z2y4VObda2LRwUDbfuoNCjJ+jFziWfcJ8TMS3cK/ZYA8o4FiWE
         PNw+YBBdSqQ0MfNgO+WMOrNbfsxBA7LunEB3rkAwpgqVtl+6pya9jf5YANA1DljNkmBM
         qzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482793; x=1795087593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=;
        b=xun/n22KvOioNWljPtCDw570fmaGYYuA5WY7Yi/7L/ROC3C8smBNOdrMpxIFdG5B2c
         a11ST4JMXAcoF7wu2jq2smpHRuEOvh05VV472bdZnUbAsdby+C+mwXPYO1UJOlgS4Kqt
         XXr25fLCgdXUIFF8u/s9WmPhsUBgRH5BD4rvjaOmuHujYZx7cnfImQqa9cyvHIocpEu+
         I7WLXW824uFl1r8J5JDy3RHIEUe3WYZ5LZKkAPMssWZG7x3t+29fRv94gPlX/XmNlofd
         mwL1BX9IXxEljPmKsMMHJTJaCKQNw646uG/tCiz3K5+bX5opxIQcywtqA5YG+sPWiOM4
         HkmA==
X-Forwarded-Encrypted: i=1; AL+hErF056PA3IQgOkt6LuKKdgWLHSOiJJhgunrzqvi+AHy8sim4AkuyMEc7kwt7dENrzV/CQfFvgD4=@lists.infradead.org
X-Gm-Message-State: APuU4Z9D7zAoOP3Fw840PUXSwQDVjs03r1xgHH9qqPabjAhJBojW8/79
	69b+nkG4GXPeyhpa2ukHlPUWPbo+Pz930/pGqqb04mS2KrqbHvT9ZcJfqnzmx0NyROi99/LoG+I
	kBJhscJNH1e85feyLlpgyb2PdiiydFttlEokfabeQLvyWmtLEhNyGAjDAw6yeIHDX
X-Gm-Gg: AYBFou2mMohzc3njlE81GKzr99I+B+cAnPQNiyvxCkXcrIuDHI0sQNcTM9j83vQeT5Q
	cpI1TR1vNY87dEAVWL2mOBiAmuEOpTGYOsKKS1pKS5rWHs/+kmV+qHY3hc/v9TJEv3fgWhmEBD8
	GP0AWjUXd9Hazv0hD5sNhupnK0VgLwolImwfjg5PmhDxUdnVI7JArb22cDdN8ibL5gBRuR0oaWu
	NRCh25odJBR82fCXIdFXVldcP6OecPY7ZTMCpG7SklQG9k8h8O0ON66MdrCLWc5jPrHEpfxGKrt
	PNwacSVG8ZrKjc4n/h/7/jc4Kp6dPD+X9QswleAAoEj5xmwvGlTiMNYy2aZAXND5xDGNKb0wO0p
	2+EAc/D14SOPPqM9lb8wlot0aItv47zlzfMRjD35MkeKPfnrDonU9Zt1vEI0tLaDQh2QaOpJOTS
	581MkVu3XWrR4pklBKoC+QVEry
X-Received: by 2002:a05:7301:77c6:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37682f94242mr5567240eec.1.1794482792692;
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
X-Received: by 2002:a05:7301:77c6:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37682f94242mr5567223eec.1.1794482792057;
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:31 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:02 -0800
Subject: [PATCH ath-next v3 03/10] wifi: ath10k: also wake remaining
 blocked waiters
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-3-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3115;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=lDNxJn1DHSRkmNxna6PrmHJkPmD6XPQRW8oNa+Sh5QA=;
 b=ssMZwuMKrv028w7u1BxJ+eP4EBOzZMCmHoHHaWAawSaOZ2CmFi4amXXN6/0lJl+bJLyGZjp+2
 ucYt+nLpm7iB8INxGzmJQ+KCdjP5J0idjgjZYjdq7dSUcg0hvhReiWn
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX7Ob6uR2oukQV
 0E75zP0VHExGAjiKKtBmaUQNribjxvp8Z9eEeKCPZPro7sPnF4wYNO9XBNL+wwA9XtS2bPMdkW2
 VLHpWOGqUGYUZoBXFckOTJtaGEhdS1U=
X-Proofpoint-ORIG-GUID: 1u6g6pBG2iLh_g7UJFZPD7A8_5v94zwF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXzMGAF1YOCf+F
 nML1ZkS1bzMkewDKWLtxJ4MWAaoI5DXd+u6MqOb2BEdKUQC9RnXKrnn/VlaVDZQQgc9ITPtNnmV
 I6fjXqgV2Mk366uXBHCUXiP/T7/uyLcr1qhidHZYCIebknXsFPb4yMfD/o6XrhtOZ2iBr1CWJZu
 Bo1ShVmRCo9QtcKwbxssvWSzFZ1O+be2bfdAV1ELCJf74MxwQWBwW3SMP+rywZYLs5QHWr86cyW
 0+973jXRfEETzjlSdr6mmFFatjYwwt6q6tBkQKUbb4NAXGklupvFdvItEbCOiD+oD20tWgucz2l
 5i3bYPWaGcWO2vFrciX8BzvQmU2Kv74vP7WvsfxdZ7hDL2uReDQdc7Hqzg7qRmFy4SvauzUAJMt
 GauNjgMOYSXaTiG2Z+mBDfbcujl3/OeAr8opg8z0XCh0T/xH4/aHvh8m16MpjvMoCDRmmrjugFR
 csmXDY3P5i5Fmyw4NGw==
X-Proofpoint-GUID: 1u6g6pBG2iLh_g7UJFZPD7A8_5v94zwF
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5a269 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IOUMnZVgalWeg46eWFIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032635_505134_47A27392 
X-CRM114-Status: GOOD (  10.88  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath10k_core_wake_all_waiters() still misses several completions,
leaving their callers blocked after the driver has given up on the
device.

In particular, callers waiting on peer_delete_done, target_suspend,
wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
continue sleeping until their individual timeouts expire even though
no further progress is possible. The WoW and suspend waits are on the
suspend and resume paths, where these delays consume watchdog budget.

Add the missing completions to ath10k_core_wake_all_waiters() so the
callers are released immediately.

peer_delete_done is not otherwise reinitialized before every wait.
A completion left signaled by recovery would therefore make a later
peer-delete wait return immediately. Reinitialize it before sending
each peer-delete command.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index e32bacf5b771..d86c4ead06e6 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2500,7 +2500,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
 	complete(&ar->install_key_done);
 	complete(&ar->vdev_setup_done);
 	complete(&ar->vdev_delete_done);
+	complete(&ar->peer_delete_done);
+	complete(&ar->target_suspend);
+	complete(&ar->wow.wakeup_completed);
+	complete(&ar->peer_stats_info_complete);
 	complete(&ar->thermal.wmi_sync);
+	complete(&ar->wmi.radar_confirm);
 	complete(&ar->bss_survey_done);
 	wake_up(&ar->htt.empty_tx_wq);
 	wake_up(&ar->wmi.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3c45e5483b60..6179a029914d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	reinit_completion(&ar->peer_delete_done);
 	ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
 	if (ret)
 		return ret;
@@ -5898,6 +5899,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 err_peer_delete:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
 		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						 vif->addr);
@@ -5960,6 +5962,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
 					     vif->addr);
 		if (ret)

-- 
2.34.1


