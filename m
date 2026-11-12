Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B88960A6F60
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jqW8QsGc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ky790TIC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jylwmrK6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=el2CQuyn3pQhfXRvL5ji5Th3JnhKYPAJEFvX5LDKFb8=; b=jqW8QsGcU9KjM6
	PAn/1ifsLB/7wCywDwCjgi75Fm1tn3N/lqBTLpuwJIrQbCBicY4Ul+TJvaRjNNZXiDRv3k0NHhXL4
	8qsAhuES1GhEc9avMg0sEB0TAl/eopcpNyUsiwSt7IgPXdQZVpJA/51mcqfqgKq5IuiKnwgvA1J5Q
	Kse5A6ndi9dh/OabuSv5STZFJFxPVSdAT4nix3RQfoRaNGSekNSfY+wbsss/sjpveemQKS8gm9Mt4
	b8A3UI9oQkh9v9HnQIJIgSzgayRjZ16o8sPRn7evXETOOZeeaHZ75wdYXsWdITeYs+vrSaJzSPJtM
	IOUDGxmyexzD+0eMEfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSx2-00000009h7l-2UGm;
	Thu, 12 Nov 2026 11:26:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSws-00000009gyH-0b6g
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8uhip4149288
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	el2CQuyn3pQhfXRvL5ji5Th3JnhKYPAJEFvX5LDKFb8=; b=Ky790TICLPa5wO0n
	zd/ylqFL7cFNXHqtZYU6fD792bV8DN8I4lHhjee0DX/yBJPhH3SqqkaBm0ns2fNe
	vdRjhjL8sW3hd7Ve+C+N+USbQhgBBjZkI2YA/5Wm+dYRW6OMtVZHYn7boJIm50GB
	fMceUMm1hTdPfm1OiUK+NFuuWD7pzNQHC5dOuc1LppvDy1FYcMJU6yZtrI4oETGm
	9Ehy4hUFqHAOO7zJaOGA0+IOIgmsMTXMx05gMjF7V0CmHMjnTdRNGohcxBxpiCwx
	zhF2kiIHxd1u7fYI4n4K9hhGZW90qVKyyP0eTaASMkLyrHhJa4rGxv8pWlvda8jj
	b+sjpA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc6361c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so7984671eec.1
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482792; x=1795087592; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el2CQuyn3pQhfXRvL5ji5Th3JnhKYPAJEFvX5LDKFb8=;
        b=jylwmrK6zUPzanyCk8qtbsLqjHmkQPvyf30EjH+7F1uaEzXN03o0psrrMXaOrB2clF
         LynhirdhDZ+skxCOJhPWzuRAJgeyvpYs+CCCToNlBZQmkt4O5e0xLEF+yh3CTk+wsWzv
         Jza9hiXQhKb1nlTi5MCloEU2OPJ/5UFXGHfzGt6Bo1TU10oRg6uLu/ygaEhMfXFQyA41
         S5js8SWJ8QaeEqR2HieDnyhn2HhWuliuc1QHXvGq04tC5ri1WFYlmfZuGCJcNBCzlh6J
         P+xlhyn1e7OqOaNqp2f1IhgFuCggQckZY39AID934tTx6Cze5LMn4LeJX89wna5ZD5TZ
         LeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482792; x=1795087592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el2CQuyn3pQhfXRvL5ji5Th3JnhKYPAJEFvX5LDKFb8=;
        b=QvKTh0tZXGf+NDY+GXYxANsu2Iyy5P4n1lwPCxvaOwPN582+fofW6oS5Y/jX25Ht+i
         S9imKiyk4TH/B5wpWewcWd9Kxn1DNAanq/qsApv2P8lCnI+dyt10Sp7CXdjvP13biAHD
         JsvyR1kMnGoAyxFstWmbB+tcQbY09KnPzQSu/yjlmOXZiNpYFNrvLs2IBRYCqcX311dh
         F3wQ/0BbUzuJ+okFQDuaUuXMvNo2aVoTbsWRcNQnR3q/oq14bK51eGtT4KSVnUE46DM0
         LmXgHnaJTzonI0bQshMdOiBfrPPKHQiSFztG28WdHRBe/+87g0kOoLh3lmmf1LBq/GL9
         glTA==
X-Forwarded-Encrypted: i=1; AL+hErEYQB+gCTnnyfcJUI+ITwPnpJqm0cgT3niyvaLWXb68bcqJ0hnW5sVwBhGf7lQ4CaISMTurpzQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z920T8kufQNDgz2NVzoDDXNUuMacAIddqfvWhnU7JHCfdseURNm
	ulQaf1+mRY7ui8fTKJVXS9zyLRbd053//vxHYNO0I+tehoVP7vnM8t/o5rDEPS/rcmwklXTKLLA
	mBGg6qkTCVlIC8GHTIG9ho5CubdvQDJeOx5s0kiWFJKtIKj4GxZQTHue2iL1hhMgi
X-Gm-Gg: AYBFou2psIUvC120Y10u/1zDvyoojJt1o3Q+0okSzxVW1Q7siL8kCN0dT3H8VP4cyTx
	u0/lkE0kWrgxRFRXCKhcXhvE50613oIMjvEKmfcUqgNnBGIFB8YFfORh7QuhletrK1KkC1AM81N
	nvOeHzoJtHSHbesk/8C3foUKaREi/v7p867H2Cont46Kt/D5Qb9DdSB4O/P5csShPEAcLxeuavx
	FOQWgt/XiX7/m8lH3rvJfHWj8k64MY5xYNK6nXg4trS6F56OniMgjrTJYw2eaIGf8B6+R4vRBkq
	Ds79eYq+w4FgMVVzdmC95shcFqMv2rLDhjfqXlWwuDKvgjvMlwQ0wXuZr9+BVwLb3FXGDNMj6BS
	Oy5tb2fHLo5NGZ+tqsjgrFcv1H20Pgr+9C6kA3qY5+CDpDa+szgmR/x5ElV0sUhF/VXyWgAGzJP
	YMlgvGrgq2kO0BH9vGp4RvsXPu
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr5153706eec.26.1794482791829;
        Thu, 12 Nov 2026 03:26:31 -0800 (PST)
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr5153682eec.26.1794482791222;
        Thu, 12 Nov 2026 03:26:31 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:30 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:01 -0800
Subject: [PATCH ath-next v3 02/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-2-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=4066;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=WdXy73ueVmpONtOum+Ij/PkAOeZy/dAa9fvCK9SxjuM=;
 b=fwfA3kI+S8TKbq8zCOla0+nWrmNWS3cDFKROXDGAfpaIBgZ1u3N5Ihz8qLsh67mXQW7ayasZi
 +frthQUAjmQCzPdjofZ8fp4VJu+gkR6leeLEYKd3WMpfcyhMYCPSqPs
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: 0oPaIGnYIusgcFliIgbqmGKtqPQxZrV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXz9iRdjJCDnsL
 7b6bDXvDaPWgILEVmNzTIhOI33sbTu442VzFJjz04lMmcqi9E/LNlZl8IdyfvtjQLoxWCjQFAoe
 qAcpLONrAbsTI+yc+t/OGfIueKlpvLCPojU8kUzdNy2wI/IdKbRYuXtvsFZdl4Lov8UC9n/skvX
 /x95V1S+JPCyo/OWz8NoMLG9XVVlepgPPXLtZFKMS6kYupxG9r9l6DvjoHZReYGEWXNrsNrYv3n
 2TLRTNoCvG3RIMgchrMPTqFvzqdh1PRx4qrxgGPoMUrNH25pBFAawpmqEfdWlcqcSITtQn+4GcE
 nijPDq9aSRv2knJqYzJYFeC9HMUe/UyMlQp1CRv+nhpVbnURL/9wCM2HntSmKJHrBCY5Mo00Qw6
 Ed2fKCOG02L4KPjpyTRccUR5ZdzApfgydYlYazJWXO8/ikrSyvo7+kVRfdM8VUJCp3b4vNH0Q1R
 Vq/PATBJ6nh4CcEwbOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXwRbwL+gHLNjp
 FQ+oCF11M2Zg9BJRip3zAfbQEbQ+XAyvDQEgDXsQDe+mBJhWzlkgUHMpR6IePQl60g2YhQIGZfV
 HOoXGjXfhpq8NARBUxukBbctvnnjWZ4=
X-Proofpoint-GUID: 0oPaIGnYIusgcFliIgbqmGKtqPQxZrV5
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5a269 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6QK6Bl5UZFK8huMW9Y4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032634_503128_DCC83ADD 
X-CRM114-Status: GOOD (  13.87  )
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

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added a fail-count based transition
to ATH10K_STATE_WEDGED after repeated recovery failures.

When recovery starts, ath10k_core_restart() sets
ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
the time the failure is detected. However, additional waits
may be created later while the recovery attempt is still in
progress.

If recovery ultimately fails and the device transitions to
ATH10K_STATE_WEDGED, those later waiters continue sleeping
until their individual timeouts expire even though no further
progress is possible.

On suspend/resume, these extra wait timeouts consume watchdog
budget. Crash logs show cases where one or two such timeouts
are enough to cause the suspend watchdog to fire before the
driver finishes shutting down.

Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
handling when entering ATH10K_STATE_WEDGED so blocked callers
fail immediately once the driver gives up.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 82bb0bb72dc7..e32bacf5b771 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2491,6 +2491,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 	return 0;
 }
 
+static void ath10k_core_wake_all_waiters(struct ath10k *ar)
+{
+	complete(&ar->scan.started);
+	complete(&ar->scan.completed);
+	complete(&ar->scan.on_channel);
+	complete(&ar->offchan_tx_completed);
+	complete(&ar->install_key_done);
+	complete(&ar->vdev_setup_done);
+	complete(&ar->vdev_delete_done);
+	complete(&ar->thermal.wmi_sync);
+	complete(&ar->bss_survey_done);
+	wake_up(&ar->htt.empty_tx_wq);
+	wake_up(&ar->wmi.tx_credits_wq);
+	wake_up(&ar->peer_mapping_wq);
+}
+
+static void ath10k_core_enter_wedged(struct ath10k *ar)
+{
+	ar->state = ATH10K_STATE_WEDGED;
+
+	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
+
+	ieee80211_stop_queues(ar->hw);
+	ath10k_core_wake_all_waiters(ar);
+}
+
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k,
@@ -2513,7 +2539,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
 		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
 			   fail_count);
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 		return;
 	}
 
@@ -2585,18 +2611,7 @@ static void ath10k_core_restart(struct work_struct *work)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_drain_tx(ar);
-	complete(&ar->scan.started);
-	complete(&ar->scan.completed);
-	complete(&ar->scan.on_channel);
-	complete(&ar->offchan_tx_completed);
-	complete(&ar->install_key_done);
-	complete(&ar->vdev_setup_done);
-	complete(&ar->vdev_delete_done);
-	complete(&ar->thermal.wmi_sync);
-	complete(&ar->bss_survey_done);
-	wake_up(&ar->htt.empty_tx_wq);
-	wake_up(&ar->wmi.tx_credits_wq);
-	wake_up(&ar->peer_mapping_wq);
+	ath10k_core_wake_all_waiters(ar);
 
 	/* TODO: We can have one instance of cancelling coverage_class_work by
 	 * moving it to ath10k_halt(), so that both stop() and restart() would
@@ -2624,7 +2639,7 @@ static void ath10k_core_restart(struct work_struct *work)
 		/* hw restart might be requested from multiple places */
 		break;
 	case ATH10K_STATE_RESTARTED:
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 		fallthrough;
 	case ATH10K_STATE_WEDGED:
 		ath10k_warn(ar, "device is wedged, will not restart\n");

-- 
2.34.1


