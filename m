Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744A1606A33D
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gwg9cQ5f;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XWIFqqDR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOnlt0h1;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GhiYJBwT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPVcsUgfs7OUGvpBli68749xFmB+62PrtmbrcnsPIas=; b=gwg9cQ5fh+vbqniyW3ZKAZTyeC
	lLC7Cl+WMdMuNuzNrlu42FbOxoIM8/EXO5ecq9bhrak02suaQwIh2N4riZ9W/l6hwbUp/okt7bnp3
	dgd/e+acxT9A+ekIDPz88jSBUJzS2m1grH3UzcQ0pMdQI5RpThvJ4l9kllaVjgPJUstz74vuwYGmM
	5Q3eb45A919xqB4vvySaUc+po48Mq4aN0phCXP7RA2jGPGr+lSJufoI//oQkm6UBtc3ypTlgR6ZSP
	KUy5SvPmImujLKfeU9LtsRY0e4Mfoo7Xr8rKYESwnQ5ykaJy/gs4Dv1RFQ7iC0b7161QOzkbv+Rzv
	jXGW8N8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKs-0000000BRiz-0hNu;
	Wed, 21 Oct 2026 09:10:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKq-0000000BRfr-0ukv
	for ath10k@bombadil.infradead.org;
	Wed, 21 Oct 2026 09:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SPVcsUgfs7OUGvpBli68749xFmB+62PrtmbrcnsPIas=; b=XWIFqqDRZ8HU3yjXn3wZ81WpRH
	2wDgPbInV3+r7lFcfrj0LtrsaQuKA8wlZjxbNPjSMi/K10sPuARK1JGJzcIF478bF+p3w8fmBukzH
	cRVhCQk9s0thv80O/L38BbAqn+iZeCiYPQLJ1sddUSL5+rCAETjDnDNSPQihMv/mS1ot8Cu3PCgr3
	5jYO2joO/wkOHfwAQHabK2OQbopaApOKS+erej+AV68jNfBz4TI2FDRt8PzNbNBJOD2yEMghTn8Db
	/PpHm/7vJ/l4/JpmWBrrkp7t0zVMMcWgJn05tNCWPepp1Tp5T6CayEDpU4ApYcOlEkmiIoqqWnUBc
	cbs9sPUA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJSKk-00000005dON-0dk8
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 09:10:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j61j3356102
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPVcsUgfs7OUGvpBli68749xFmB+62PrtmbrcnsPIas=; b=cOnlt0h1d7kKb+W1
	IVQvBkgrSep25aqhcWG+aMMBO51uTK9AsxijMqx3H4MdBqzjAI6yAkQYLYDSjaIb
	WPNjD2t6iuIV3/unJ+pwALGAKJrwfZYkc1IAAvHArTRrReYvvfN8zUlQM36KF/WN
	ioZE7efeAA/CX6CH6jkfUzI+W9Gh8KGXzw9xxYVBwvDWregJfULg/r1aI91XZF90
	5Tpo8ew8xl6cfFXZSmR0akxHcdLa8ep4/UK2fzAErLsa9EPkn/jnPlJ6ClqlnHOV
	xGsXYKPGYeiSnNm6YnNNK+S1/oHrquHVtE6rLdxfycLRPkzSWY75m6q7c8+cXq/P
	0tgD7w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0k5ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:04 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dab94dc3e7so788951b6e.0
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573803; x=1793178603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPVcsUgfs7OUGvpBli68749xFmB+62PrtmbrcnsPIas=;
        b=GhiYJBwThhMoIHgpVzBx6VoKzjp5NM/lve0qC7I08mcyJyy9yNpooHu+mIuxqh5oOI
         V5U24oNz6JcPtpCYZqnRiEmgvHNbYbomXlt5iYmkNW58XiGdBYD73ZuRjWanix/DVkTB
         KGxYBNwMs+q3RRJ82+5hlmMtGwAkvCgiB0z01G2KDlUsinJTl3bT5gzk1/q3TDJWsIAl
         ItW6CFiE9IPxmrykpxqbZ3idK9mwlXDzTb1fqy2lAiMxEIjwWsOQMlD3F2l0Yg8fwn7W
         0Z799HPY78zByP3lmzzTp/Ted2sOeeIBa8eP4iSSdRg4MlqXvoIfsGH+iUQiu0LFq0lA
         m4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573803; x=1793178603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPVcsUgfs7OUGvpBli68749xFmB+62PrtmbrcnsPIas=;
        b=oo2KfR4vjKPBOGb/duqHrwuPlEoRh/ENDeYQ3RYl9RgOlLTwbd2gDqXCrL+ORPm9UK
         MzfW70LGvyy0QT4487XHYgGOCWtkCzjnDM22YONhg27njOBUMBso9yTIGUE2q0O6jJQb
         rXq/Bmb4QYDDUNbcXoyvdd++03pR3RDQpovqVQfNa5eqM8s9ApAt6ZtyqAfiQb6Wl3sg
         K63FNXp5rx3BokZK4yaBFFFtnHP9sGt04R6T2e78H7FZ10ZgNSyAPOTboGTz8QlRiw3n
         bheOZpcgtKib9JctnyLG86CYUxUG+0ElAeXiLBsbAmLnqculK5a6vF9XysAIXAbFE7rF
         R4Iw==
X-Forwarded-Encrypted: i=1; AKwUvBygP60Mo/kjBsRl0mRB4eHDhC21qnR/iI0Uv2rBDWMy64T9B+QIpqzjPGAiJFH3IwCeBC2Ame0=@lists.infradead.org
X-Gm-Message-State: AFq9FYIVZmTvuv1VipWKLEOKxM0DxG5KosEJrztky7BIo6DP8Av2inFh
	2vp/SE4d4WM6Y4qnF9WVv19o+I5AaJ33MTOPFhZA3L9yxIPXx/4VmfMmuC+foUs9opzyUGSxraQ
	VdheRjMKa/JCy3sDByDAj+le8Yo9cXA5JoCgGmV2KtJkfPuLMWL+ll9VHvmgTcqRmLi8HDb34Ja
	Y=
X-Gm-Gg: AYBFou1xPM4YAcZjH2gllzRWKS2hllkN1GosRIiRO6FaK2gJ38U/eWUsG/JQAKjMNKh
	Ybf1Q4ZaR2LWD8z9q3u9n7wmAEqaqd3M1WyKBotg3hu+LefDB4JLyONWH3Cg/xzYpaZ1dgkyFBf
	vfo5IUCeP9xXp+5ttLQ3/U/k+rQv1JX0/zy6VKpRjsN4VV/f7h6gVYt2WNuSIRkb2xbWXjI2yt8
	42lj+KB4fOkGbY41ReorbUt8uCwlD2TOhp5auNOzAgObPNnqsOK+j0oTXQUMRQ4875chrZJ1LKT
	o8CgsufRWN06Gq2BIltRaAX55UCl1zI4gYtckzk/eS4OJPKQ9aScGg4xwuOmxkWxA9vrVE5+rBu
	TxLHVKVd89fjPuSpyxXvwrdRRBghkFN9UoZxfLYPq14yTsQGYTQ==
X-Received: by 2002:a05:6808:6d82:b0:4d5:295c:a82f with SMTP id 5614622812f47-55364d258b5mr732738b6e.60.1792573803429;
        Wed, 21 Oct 2026 02:10:03 -0700 (PDT)
X-Received: by 2002:a05:6808:6d82:b0:4d5:295c:a82f with SMTP id 5614622812f47-55364d258b5mr732726b6e.60.1792573803034;
        Wed, 21 Oct 2026 02:10:03 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:02 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:34 -0700
Subject: [PATCH ath-next v2 6/8] wifi: ath10k: hard-block the radio when
 entering WEDGED state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-10k-sdio-crash-v2-6-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=1618;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=6wQOkQ2hXX9hGjM/vuhKeWn72iJTqSx+IKksWMLSs/U=;
 b=CzZ+VAhpbP/IGkAFZ+AV9iboiPWbMFmvSs0lxqlueWoldNAu9/IyQgofM5dHnMG1CA7F2H6Ef
 oqaTgWyEYL4C9tb7TByplY7sck+Azv17w+IK5C7cpGpPVqKpHwsggGn
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX2Hpox75racFL
 KScalQIIWrxpdcosMCWs3FaYGBn3yBFgadXVMDibI0srVvJTFnfmpKEcBEitbpy7m+J+ekF8dJd
 Qh/s0/5p4lpzuxDHn2tuGB+FspIzpBs/VZ26NIx43zfGBmPh1Vrs8hkNOR+vayUQ1mH9YXyA9r2
 f7J4FSwbOWyFGYNG0pBxxXd9gcUEMn7MuYJMN7/kHabymS077B997dWwPlHJc5fOGp3Dqw1cMNy
 +YBnWukFBEWJ8OeDHNsVWfTZo9a7pXZGpqCWG+XxS31OBd7WX/itGDig4NB0XNOfY6+/9TceGhR
 1Z9BPzOTA/nbDl65GgYVVgx1jHqvNCxFkONoGWAKIwzr1GIETwe4obiXFHGiyo81OYdqQwN09Kz
 ePMk5j6YzoC2GoAjXyxq/uhywY0UjHUprOiV73HeNB4QvtALJRHbLtrBJ0mKg/mCjIZ4//SKRTQ
 VLX6t21XJ8NET0QYCbw==
X-Proofpoint-ORIG-GUID: OPrl_ZpP6DAF9Ml282_QuUKOHp1_X68Y
X-Proofpoint-GUID: OPrl_ZpP6DAF9Ml282_QuUKOHp1_X68Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX8CxoeoUdV+Xy
 /4A+l8xi3FhfX/Sn16RaAuX4XjQrpD8sfePWpCh1eviEgJ49+Uhi15IVpO353hFm7RINeB/sAKo
 pKcB0cPRQtRBm1h1LSoIntICzzM++OQ=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8816c cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F3v9Kh8TxewD1bH5_NUA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101006_777255_A19B5109 
X-CRM114-Status: GOOD (  14.31  )
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

Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
longer recover and remains unusable until the driver is
reloaded.

Userspace daemons may continue issuing scan and connect
requests, which the driver can only reject individually.

Mark the radio as hardware-blocked through rfkill when
entering the WEDGED state so userspace stops retrying
operations against a device that can no longer operate.

Both WEDGED transitions already route through
ath10k_core_enter_wedged(), so adding the call there is
enough to cover them consistently.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6b6b80242cd1..66585cfa6d96 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2521,6 +2521,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_core_wake_all_waiters(ar);
+
+	/*
+	 * Signal the radio as hard-blocked so userspace (e.g.
+	 * wpa_supplicant, NetworkManager) stops looping scan and connect
+	 * requests at a device the driver has already given up on. The
+	 * state is cleared only when the driver is reloaded.
+	 */
+	wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);
 }
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)

-- 
2.34.1


