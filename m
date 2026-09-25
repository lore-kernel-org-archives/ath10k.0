Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C886C9832A
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOlAzcduDBu879TeeEcD66AvOyeFfNZAYLZI8TH4zSg=; b=eLi+A3F16zrEit9UZwKqOxCl+J
	VdvUMqE+34Dt0+XYu0bow4pUP1hu+hftQuX0aqFBcbrsqmc/cmihqtWeFW5PL3tQ+W+CX9KjgeeMQ
	xusQIzXUam/nq0aS3x/gC6ihREEZ5gosnRlRd6nywI0T3MODsmHkEkMB1RgDmRLcK/O98QgPxP7w0
	cSvkCUDNeb+vKDWY72F513NLyOFkVM5bsYKJc7dPRc5wTVIRLwPVu1s/c18LLpjQr3aQGuCztgiGM
	y1Ix+Lw70hxPtr7Lis623AvyMDnljpR4IqdC73vnCVVGbtqQ6WKV5+CLffJdr3Io15DApixZv5FIz
	XRUoyr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50x-0000000DJTt-3lTE;
	Fri, 25 Sep 2026 12:26:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50v-0000000DJSB-0MsN
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 12:26:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ykrx3532318
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOlAzcduDBu879TeeEcD66AvOyeFfNZAYLZI8TH4zSg=; b=ov4uWTSt84Ug3x/y
	/P+fvewHfdNate1hWb877D9DKQVgLwf3KTma8SU03Dae1fzuFRNts6Ig3js0J/Qh
	y/ca9GTaaKKjM62B1Ock9/AYGKogtO6Klrn9FicA1PbuvLrtnpMwk4TZGKy6ffGV
	kTsQ6HBI2LSe+Pz5SCvgcn7pic/nwWT1iLxIny+bThdDXt+kuY7euhgkWL5wv+TS
	HxYLVDKiVh3sBQCpf3mqnZExu+JiZMeE9xK5ByEfbcTDkj+YsK0HlkCxcZ3fkqBA
	11NN0uedK0Bgi8o/yh0UmszrUTox2PuEDNwR398Qs0JHFdkoAU0XlgKnpgFg02i/
	25PUYg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kb4vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1436767a91.1
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339212; x=1790944012; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOlAzcduDBu879TeeEcD66AvOyeFfNZAYLZI8TH4zSg=;
        b=GNTgXM7LCYvKk3/b7+Wx6+GY9DpFIwDFPShKO1TVSdht02DCz92lTq4zQV/AdYm2Qp
         Vz6V8OkcLudIqs7EnTGm4VcS3xUFvclc0ScL/Ix3ThC1yCpsPQkPhO8YHn5tohg1XzF0
         0U9KlMfq5eMswYx7rUatYXEl95mz/+LJEXrVNv9aozF/O23D+aCTUlLwHwOcQEJ8gzx8
         qewdKU3aIoUgEHKq2BnMxNW3Ex5CmQWxbDoPInzaG2Jy/RmAUb/RzzdBlWum8FPP0pSh
         GcarJcyzySTjuGF4R0Hn+3uitWG3e2BjbBvkzmDWmSDGhHv8tW96pVMLVcTFkW3l/qXN
         tWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339212; x=1790944012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOlAzcduDBu879TeeEcD66AvOyeFfNZAYLZI8TH4zSg=;
        b=lzzTRykWR8nbG+NF9XZoqfBK88ip7PFoCWySHUIIP8PIuNhFxDVorqRogz0OoSLpZh
         h30fi/6ApEYuF8QGv70syw2B3ENtEpGjPPaQZSvqJHe49wT6YRurtICrRRd5Tv46qomN
         g5TgJ74dTkXUAYoKA4P4931teT+sa73crMbqam/4I1O+EOSJjyVOpJdtHbqtvbEvEhq8
         wVdzX5nF794O1YnOIXYMDhTLEqOqsRHd1hLNfcL3xw93pz3/BpY/ftTPCi0z2CUfBo8f
         wBbhHkKGld6ILiTpIvDcnMcp30fcOSFEMsC8vYMhPATzzj6REbJVu0AXI2wmRz62qrnT
         DGHQ==
X-Gm-Message-State: AFuF++nCrGZEIIOudFvSo7ecFfrITjO8ef7i19WvVeQka6nB9S2F4ZIQ
	aJtOmJ0IaxA/+URPezULaI5b5RNngbY1k1Vdgd20nDJMoIblQmtpA5axh+VaUaNdu8R55jNhIH5
	D3Hq+zj4TSoWPlNFaGfB3IdTR+mB7ic056wzPsN0I3rSvmiob+N/npM72fKSgR1k1
X-Gm-Gg: AYBFou1ESqqR1g40ILRUCgpje8JrLLispOjURn/6m/b6HWp5LzK5w2hZpxJU27I9y2h
	0jCbtmACZvqmABL6qtZPCcX/+t1VuZnV3OfCJ1iXc9BUmm+lLX1EMpS4D9CItSm2NLEqyOgYOA5
	FWO5+Rnq2luPMCGUtB3ye+ezXKSHmbHO/wUfq6/94W/amXz6JkUxhf/gW8NzvCRKzAUPOpo7s2A
	D8WjmjR1Fx3qQMrF9hRyT6D+84pQHVq5x2d5cavrwB2lDXTln+IRqQeER3BU9MYgbjsQuD/mfYh
	VcUXOuEn1VWxAYeMDnm4j1DCKo3UWcCVQDvSv0QZIDd6upnFwJLzH7xDkgn89QVR0E/hF2aGNeG
	Im4yUbarmYczgI15YdQ35oHRKeeA6BGY4TchPJzqwwGYyTFyVz04=
X-Received: by 2002:a17:90b:164c:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3a098df465emr4661908a91.30.1790339211610;
        Fri, 25 Sep 2026 05:26:51 -0700 (PDT)
X-Received: by 2002:a17:90b:164c:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3a098df465emr4661895a91.30.1790339211057;
        Fri, 25 Sep 2026 05:26:51 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998dbf2sm4401671a91.12.2026.09.25.05.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:26:49 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 05:26:33 -0700
Subject: [PATCH ath-next 3/8] wifi: ath10k: also wake peer_delete_done and
 target_suspend waiters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-10k-sdio-crash-v1-3-14baf913df94@oss.qualcomm.com>
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790339204; l=1336;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=jml3lvp+3CFd4TeoXSIhb+oy6y5WDw8fujp8rNYu/b4=;
 b=JCvplzKOMxUzqU7rrdllwJoBAblVwHyStRqSsUlQSNPQZEx42wEqH/YLM0PQJMF3NWUBJr+QR
 FQua3CsmqSeCW3V18yytwyqhOYpH9C9nQXZSDkbgRnp/Q0G7v9xVpwp
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab6688c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Jce_KJAP8yvPnwnb0b0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: J_BaxZuINFJmZssVKE1Y_KB3aNDFmAPr
X-Proofpoint-ORIG-GUID: J_BaxZuINFJmZssVKE1Y_KB3aNDFmAPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX25SslECb15o9
 kenpP/aEJSkPXDQ5bnfRis4KaVTcQ8XQv+rlcuzw9wimKX/Ns+10R3RyFCPuPuuyTRpSHvLkyL9
 l987fq9ccSGEYXJDndqUs9iU2Bdgw5SAVkVEtX5pVE2PKnMVhQ5RHgV3FEvthwNAIqbvXt92we8
 JHsp0iM2rlnjMQmh2ABlTkHB+XYp/+aUt/8Z0NeotZDEqOFlnCwKbqFVy/FMmH3iusTEAjBDz5c
 ZUNI83MTZOaCf8mcSXjlGVW/xJ4mEpIE6DorRvg153oYNYvCZEzjIMyQyOw51nMEDwN0/GIj/TT
 Bxs5QJXb8v5NN66+nSUGMhREtrFOzPT4Mw51EIrZglxtTIylQ02VzUV7nqVrD0CS4lyQP0joNz5
 HUHMSQs+lRyBA57sXnyORNiEvvAXoAdEUj/NYggjo7+HaQWPbufTuPGnOg580VnHr0IwpIduXVY
 yJ41KnyJIxr4Trnfvog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfXznc+E9YTd8Vg
 I+pckp1EjVgv6/7dkXUCPsMazqI1ofeI8iQY6l+h2BI67ALauQO90YNUBpu4kTvaxt6a3tjb+f/
 NEFWPpnNm8FggGkOnfGkbyVFRKrjxKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052653_161031_9587974B 
X-CRM114-Status: GOOD (  11.91  )
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

ath10k_core_wake_all_waiters() releases callers that would
otherwise remain blocked after the driver has given up on the
device.

However, peer_delete_done and target_suspend are not included
in that list. Callers waiting on either completion therefore
continue sleeping until their individual timeouts expire,
even though no further progress can be made.

Add both completions to ath10k_core_wake_all_waiters() so
blocked callers are released immediately instead of waiting
for unnecessary timeout delays.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index be516dc32c1d..f2e457a0fcbe 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2500,6 +2500,8 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
 	complete(&ar->install_key_done);
 	complete(&ar->vdev_setup_done);
 	complete(&ar->vdev_delete_done);
+	complete(&ar->peer_delete_done);
+	complete(&ar->target_suspend);
 	complete(&ar->thermal.wmi_sync);
 	complete(&ar->bss_survey_done);
 	wake_up(&ar->htt.empty_tx_wq);

-- 
2.34.1


