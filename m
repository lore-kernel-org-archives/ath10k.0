Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B1A606A31A
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 09:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n13LXXOO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oBVu+MLo;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPFX76al;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fFXrmIAv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiUpylXz/olEgRUStRYj4xpwHKMcNRb0dmuXCZUzVno=; b=n13LXXOOG/02wCVnP57P2su1Gx
	3+SZPMSP9iVvCI/WePtEMPEFNaMt2dtsWSj/fCVQnHw/wW47BXXB5K4N13ZTLHF2NE4GpgSiOSD13
	WSTo6ZhcYYBEFNCRtFLRkRgA4WqgWYN/FPjx7WbTa+NoQ11rx4Iq5uEXfZEunD1Y0DGdoUy3AUCj8
	TuvL2CreBfVNY1Zv2MTbCIpjljQpYu17exJUThftpKmF9eMrntByHDM86Q3gtYOVTcpxz0GyL1Lqe
	bQ0VXztZZgytJ2ReiGIa8G723i1VYu14F+9ru9zH34zX05r1tc+8ggsU9L5Ez/qI17P3EGWCIP6nS
	nQrE+iSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKs-0000000BRjK-1LkG;
	Wed, 21 Oct 2026 09:10:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKq-0000000BRg0-1MJc
	for ath10k@bombadil.infradead.org;
	Wed, 21 Oct 2026 09:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WiUpylXz/olEgRUStRYj4xpwHKMcNRb0dmuXCZUzVno=; b=oBVu+MLollsVLbwPldguC023co
	uSDngrso/LGZE/x0u6Z1HnlWE0xRAbSB7q0mxwa+lXToAnF7nTQ30eBY1Vv7sKxwVCvtT2gYExbwO
	Qpclsv9fqjatMsE6rPyeUQplnCpXFsZf5ik5nPLN0uyQbpqP/2oETQDEJWLcPLyCIeI4B4eWeSaZY
	qubhAORIUi0YHuAkISvdBIQQBejr3hgzmn0nqMYcDhW7XM5I8cwmkY71MuGg9Aa7StdIp8ypcGJjW
	xXGe9VWifszrz1yMMQn09kn1/n17MxeETgu1xQPUFuuNb8aD6OxUQGSDV9iapHX8PkaOCf9vMPHLI
	MwBIjhFA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJSKi-00000005dOF-3nRQ
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 09:10:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j2lv3926471
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WiUpylXz/olEgRUStRYj4xpwHKMcNRb0dmuXCZUzVno=; b=kPFX76aluWrlYph5
	T1B+ke74pp2O3rxLqvII1slAZhq0xI9tNHPH074sdAMHzq6fK82KvxQxVE76oTp1
	ulNQTqSCBvmpb4TuXnTU/BvtDf/47UIVSvzz2g183efsd5/IowrU3lIlzISH2PCM
	KUBkjKsLJqNvwMpmMh+1/sCbyHmEqlortveeguFezKlA2Hu6EuokE9NEVmmpfL0Q
	4dp2DoFOzBFkEseGPLGNsmXhS5G5KnKIYfJ+e6OvnoXD3UB2qKueML69UxwzhvW6
	y8j2h2JAkqTzytWHJgfnO8Z6y/p5DS91s9xfOPLlyP4C0/LigfY8dWwleHEpAVkh
	Hh6yyg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2crk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:02 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b26d8d2498so630672b6e.2
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 02:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573802; x=1793178602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiUpylXz/olEgRUStRYj4xpwHKMcNRb0dmuXCZUzVno=;
        b=fFXrmIAvT5x3gJdkq9hB2rFu6aW/BSxAZtDKIt/87XKJTGcehtXfElTo9f0vFB55Fl
         lfKTFEtlfpTSmaNVD7F3CScwfl5+opGhKbfiJHoxm93/994jJ9pn/0xyMPLAkZT4iTVw
         aIyXsoSiq//XOG9XmyEIOKE6mHTVNIf31qgDwwq1ZswArR7o44+E58wbrNBZibo78ChM
         gToET9B4Eqlovw0KK/CdVT/PZE/qNkB9qutbEXgPVr3PW9kFn4R5NcCQ1ISz3jb4znXK
         O0e4aKcKhFNX2gDLjjxEzygVTAE+MNnbj3WhT/2e6xF5yxMcnRzEpRQrTZksM6q3kkHx
         jWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573802; x=1793178602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WiUpylXz/olEgRUStRYj4xpwHKMcNRb0dmuXCZUzVno=;
        b=kWTFl5C6vQy5zOTFIDYGdsq2kr/wgLeihBFDc3MMfyg72epSOuoEOyFF0DfqoK2MMd
         MSIhuLA3+GEtC/4hcIYiSchR6f8gPeR69pT9OoKb7fx0p8qBJY5f+aAHDpcOQM4gQPn2
         E1lxclES2trN+rTrCRPW4nAiOE81L8a/eH1m13XpyAeUZQYqCW7mds7v2cyHiIqA0tOh
         6jn2KgOb1ELQPzJ/xm5rOX0Btk3DqldJ7W7AMl0GKccd1mqH5BIVTwUPDSLUJ/BNNtB/
         w9YIOqrlhL4Lqw8EWC9yy3SvXvORJzgbjgtUdTJNaYSwxOHe/4K+bC+U51HuZuiwUVMn
         MAgA==
X-Forwarded-Encrypted: i=1; AKwUvBzsB3nnPGbFwwZqmtgrnjGxL1U2cXe7NRVqMDv+prXC12b2ItVPfTrW5kV8ExxI4wMnRZBRyBc=@lists.infradead.org
X-Gm-Message-State: AFq9FYIH7NFhSkK/xMrvERxVDSNjxY/SI6aT8GzK1pOVvgjJ5xEIj14H
	E+ix+H0+pZnYBdE7rDhq9xfgmymngefzjkuEGtyK33K7ZBhYlD+mcduWri+souIcZXRasXuPXuj
	rLaIveZTBWkYsUrAksQG/RRqRjomhxqU0ughBw2IsKmsXJYv83iOkeEpzmE5aPpLJ
X-Gm-Gg: AYBFou2A9QzVazOjA3tp+eYpqXTSZQ+SinOAmoFanvgfS6uFAeCP4JJe2RsY78mhd5i
	oUEUY0//zWNn+6z0yut+3OtlkL0KqcGZ1CK8v/ejUm9ymDREtjwPvR8SLqTf79VS+KrB4ebW/pZ
	kTScd6ErtPt7tw1bQYFbl99s39a4WOsTYqjjrJB5+qenjpxQDXvBNouX1EVJt1ioM/kgXi4eOWE
	FwbFxRh0WjgRTtbU1l4tuIxsCKRV7YMgF7uRXIAm+TpqZWikLVwX1hAqUOEP9S1wtxRHdIWg2mf
	pNmOZcGJV5c2cGRq3h6o3qDdFlh3dS/bI3lgy/j5Z/ps11UzIb3xAV1fg9wnk9ZCQ6PnAbAa1f9
	KazXfij4mwbRUuC9RlaKJhODWWvJX2lcC0E1KbPJtenOn/3Dgxw==
X-Received: by 2002:a05:6808:2226:b0:539:df4e:2d25 with SMTP id 5614622812f47-5535fbb86a4mr911523b6e.28.1792573801707;
        Wed, 21 Oct 2026 02:10:01 -0700 (PDT)
X-Received: by 2002:a05:6808:2226:b0:539:df4e:2d25 with SMTP id 5614622812f47-5535fbb86a4mr911505b6e.28.1792573801246;
        Wed, 21 Oct 2026 02:10:01 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:00 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:33 -0700
Subject: [PATCH ath-next v2 5/8] wifi: ath10k: check the recovery deadline
 on its own timeline
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-10k-sdio-crash-v2-5-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=5132;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=Zm1I+cLC0VNPdJGg5JTNbho8Qm0AKnQRRx3GT6kI3Fk=;
 b=IIfx2/kiO2eEwv2ja73Os+qHLV+1i92khTHC/Z3H66kVZU8OoGrLul3JF+hJJo6LDN6+7dTus
 O4Un78hiyBMBNP8Z90ts6XnMxcsrMLUjvaZy7hEDHpKuebLt2dbornd
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: MFuuztVQ-wG_Pko6YFv7_GQzLETR7AgK
X-Proofpoint-ORIG-GUID: MFuuztVQ-wG_Pko6YFv7_GQzLETR7AgK
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad8816a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fAo9eQ8qjfjkKEXINywA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX/HMsEYjq25Bs
 9Boc3zzQsNBxVSAk3KhuT7SV91tINqBvjUjtNu23/AbB9jAkj46yHlyxdTzuOG0GySLULq5S69L
 eOncQpwkbeKemUH22uP14LacNHf8e+I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX1jYm2cmx3vwn
 ILfUuCQvE8Nr5MCk31+gUymk2yZHVI2xsc/FGcCOeg/bs0smeZNfl4KY+FZVTsyXZlNB2t6Gc7e
 ts1M7ExNKr7jvN6iZ81kiIQbSsY/sOSnacnhi5kOIETB+mZ6l0P/1GklffBVK5s/VXVbMgPSIXQ
 4sueSCMBynVtvr07n9gtZc0YIIPw9/TkUhUbNJEUgCWWt9Z3FC5Krnvzvjrzo2vLKlVw7JxpnxO
 bJEbRvc/Ncd3AE+3xIvQeVjPMS1FTPM8mpJZ71G+cHcB3OnU3yMeZEU3Dszch7zQkvRSRNWdCLq
 5aXPKu/18bL4XgoNzeEenh2maHdFyfyVHReE7N87WH8PbeJixrfzk6tCttzLFHa6IbUc8HVRfKq
 ANEWxWG5u1gTgGxdoPJRPpkxQKRELucFA8l6cG5SEyp9Xd0x5YPT4FMGRHVJGJ3Wcg8pRF2LHWa
 C3OcBSysKxQTKj66rMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101005_911638_79346645 
X-CRM114-Status: GOOD (  16.77  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Recovery timeout enforcement currently advances only when
new recovery triggers arrive.

In practice, the interval between triggers is not bounded.
Additional timeout handling, workqueue congestion, or other
recovery-related activities may delay subsequent triggers,
causing the effective recovery timeout to extend well beyond
the intended ATH10K_RECOVERY_DEADLINE_HZ limit.

If recovery becomes stuck and no further trigger is generated,
deadline enforcement may stop progressing entirely.

Convert recovery_check_work() into self-rearming delayed_work
so timeout monitoring follows its own timeline while recovery
is in progress, independent of future recovery triggers.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 18 ++++++++++--------
 drivers/net/wireless/ath/ath10k/core.h |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  |  5 ++++-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 25e9a8f0ec8a..6b6b80242cd1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2525,7 +2525,8 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
-	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
+	struct ath10k *ar = container_of(work, struct ath10k,
+					 recovery_check_work.work);
 	unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
 	int fail_count;
 
@@ -2539,9 +2540,6 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	if (!atomic_read(&ar->pending_recovery))
 		return;
 
-	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
-		return;
-
 	/* Record the continuous recovery fail count when recovery is late. */
 	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
@@ -2550,7 +2548,12 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 		ath10k_err(ar, "recovery timeout %ums, fail count %d, shutting down driver!",
 			   jiffies_to_msecs(jiffies - recovery_start), fail_count);
 		ath10k_core_enter_wedged(ar);
+		return;
 	}
+
+	/* Keep checking on our own even if no further trigger arrives. */
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
@@ -2571,9 +2574,8 @@ void ath10k_core_start_recovery(struct ath10k *ar)
 	atomic_set(&ar->fail_cont_count, 0);
 	WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
 	queue_work(ar->workqueue, &ar->restart_work);
-
-	/* Start monitoring after publishing the recovery timestamp. */
-	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
@@ -3755,7 +3757,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
 	INIT_WORK(&ar->register_work, ath10k_core_register_work);
 	INIT_WORK(&ar->restart_work, ath10k_core_restart);
-	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
+	INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
 	INIT_WORK(&ar->set_coverage_class_work,
 		  ath10k_core_set_coverage_class_work);
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 0319da3ec022..a1ded2cba103 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1213,7 +1213,7 @@ struct ath10k {
 
 	struct work_struct register_work;
 	struct work_struct restart_work;
-	struct work_struct recovery_check_work;
+	struct delayed_work recovery_check_work;
 	struct work_struct bundle_tx_work;
 	struct work_struct tx_complete_work;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 45a3082d5a64..693b935536c2 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5428,7 +5428,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->set_coverage_class_work);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->restart_work);
-	cancel_work_sync(&ar->recovery_check_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
 }
 
 static int ath10k_config_ps(struct ath10k *ar)
@@ -8173,6 +8173,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH10K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 
+		/* Cancel the monitor first so it cannot bump the count after reset. */
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+
 		/* Clear recovery state. */
 		complete(&ar->driver_recovery);
 		atomic_set(&ar->fail_cont_count, 0);

-- 
2.34.1


