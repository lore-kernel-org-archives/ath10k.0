Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E32BC54FD2
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 02:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=897I7FKgCTAsVWazYxO3OxwbnSDtjMwV5dgnaRD+8qA=; b=H+HU9QxJk9jwKMAs27KsSMx/Lt
	R+/Fq7KRTAB2hAos/8gxJUFM6zOa1m1rpJ/u+/ITWQfqclhtKmhXsNEVnay0fS4NiiRqtcBZJdyo2
	hQOz65DwvnjcVfPx75NkmhgXv+7LSC9S0ZtT8nCfE7LoJCwQd3TZ/yGXywPBGemW8bBkjgNifa2PD
	4dex+zYCGXvWP+HO7tMc3pMDnbP+wvQXqGZtBMF9usv8uKeL5Qdkzl68+KzpYGdr62tK2JKietJkB
	9MrwnyDYxyIVThYN8RnuP3WGgvnKnxiMsYH+5elr+CF5k8vL71zOD29LE2a4GrMP6JFL7G3MPbeay
	CQHGQfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGZb-00000009Lxp-36KT;
	Thu, 30 Jul 2026 02:32:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGZZ-00000009LxH-20WC
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 02:32:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U2KOiU3536777
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 02:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=897I7FKgCTAsVWazYxO3OxwbnSDtjMwV5dg
	naRD+8qA=; b=S7elofE7LoOVniZ8nB+cSjjBRuDWKrJ0EbSczpF3GtfQAX6POfd
	uiKJrUQSP6HWj82r5MFWSzZeKwPOxp2a9IW3ogC+SAiEEf74GlE/GoQsBbhH5ttI
	9ykG+5qtIbXsQpIz59k0wtT24FdmipLw/7a1owyOXzqbvXIXbVHKS06sdsvV3r9V
	PZrvJ+PdNGUFHg8KicXAL+XKYSuWwc64QE4QbCKvSRSEUQbTiJ8PqZaBZ9v1sJQE
	lg03BT47aUuKH/bEFTlXEblSSpWO3+ktyaXPrY4tuM88JIOitNmiHYvTqL2I5TkJ
	h+kxTSPv8fn+jJGHnuGhCqbOL90lzWTSVYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqwr8r165-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 02:32:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cae7a8b9easo1760775ad.3
        for <ath10k@lists.infradead.org>; Wed, 29 Jul 2026 19:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785378755; x=1785983555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=897I7FKgCTAsVWazYxO3OxwbnSDtjMwV5dgnaRD+8qA=;
        b=MoTUTh1RPkAkcjR5UvKwKXM9zaw+EVg23FiUtCcpRx8O/Opss7foE13oPpb+Q+sLiH
         5C7BdOwSTt6JVuXzHxsbbwOA2fpG9tYUy2XYDTLniAFPKDOhoQpKFHKQix1xgmuQpDjy
         Bh/37NbMCdNZDsQ44C7RxBUbwrTdJvktcDrN6S/TNCFQcUhIYtUKyvklHvEBPU5SrYHB
         s9MYOmMsrd9oTNJAnJjcXwOKb1c3YdB55cLs3oZlIKasssbbbE4GkHUnBceNH4lbUZ52
         IOVvebMe4a3y6VQvRKYHd2ylBmxOnf9v+IY+BYl+2qiJwtZMn9N6Gm/pQnrwIasTgrnJ
         1Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785378755; x=1785983555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=897I7FKgCTAsVWazYxO3OxwbnSDtjMwV5dgnaRD+8qA=;
        b=PAmMnwKsUfyuIwxr3hejgH7MEUIlj9RL9vS5KUyUCdhkli9fuHoESDLxzktlWQYxdP
         IzpmDu7LG6bG7DCmqL00d66Rx0wzNiDQJzNOQBWzkaM2VQDWFoYgtt2b11YFDGoBuAeN
         FimJs49rMUwSlX/WVv0/HGU3zSEYSefSSjSQMG4UMGJgGc8juZe4g31gWNFBZvTil1CV
         2mET4sEh5GQGvBP2/ggdwv7peUCo1TrDL6WDntMS/YelbTGJgYT/JYfDouked0993HY6
         iOFAEDTGRq5/d99M/fR7/BGvCbDon13gFmbiKAk9uH2ytrp3tb3e4sI8kfGVDUMpRQOw
         43sg==
X-Gm-Message-State: AOJu0YyfH8JUasEdZV01n3FOeC5vfOgiJeanuT1eHt4mhmLxJrM61pAv
	7Jui6aiiWHHZ+6t6HXZ+dxoUN3TrwuQY7y4ehCu5E+uIsTsn4KEou1hcNtKHooWjROazlDDCUF0
	4C/KanFkoJ+LilqnZf41xvuNQu5OAq3rhUFSZkcSVoW1aY+hQtsyFPD4GHV3VlJ4XE8O5f/bRUM
	8=
X-Gm-Gg: AR+sD12bB0BGBgzM6wHoqeZvdbKwe3+AQPWT6E22b9Th3ONQsozXVj3CUtkp9ilS20i
	ICn/boUmdoU+ERvNqUpUdvna/4ovjFDY4fEafE6yKdStyiY/qVfnJR9LgYpNX5K0706Fimspbo8
	tt26jET3gvlala+e5T3eT6S1//GSEkaI0y8WIfU87+5tYw0c3Z98Z7bgVGECeNPxUNy+nTJ/k6m
	JouDAOihkCWNjhLweTvYnAsfvH1o3g140CNlVyjKHh+grAf5j9I3IYaMk7JSBT4SliiWlln8Q/N
	tKolKCSURRfI1di/WKEdrVZ0X8F4bEYWjGuhOlnEF13SX9kZRfiqU+FWO/U/nT9Bli8jPRT6i9h
	XK1IkPGrMG67OnJ+i/BsHUm6SPQ==
X-Received: by 2002:a17:903:1ac3:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d035d1e176mr11188495ad.4.1785378754697;
        Wed, 29 Jul 2026 19:32:34 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d035d1e176mr11188195ad.4.1785378754301;
        Wed, 29 Jul 2026 19:32:34 -0700 (PDT)
Received: from hu-lingwu-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b6d14bsm13986723eec.10.2026.07.29.19.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:32:33 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath10k: filter non-UTF testmode events
Date: Thu, 30 Jul 2026 08:02:26 +0530
Message-ID: <20260730023226.707008-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LFpT5GaiJN267zdsJvA0rZlyU8OFDMtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxNCBTYWx0ZWRfX0+vTK3JAINz3
 F2l4LVeig8U7Feq2c9vgEA0IEyHzzvOP+hD6wDMyAnx1QcuY6P2bloV2x8oyDtit0gbJ2TSge8Y
 jo/9EVrk9zawNo2NQjlvQf6o07c6K3Rpgby2Ct5a8UPn6ikmSLKdi2/H+lUqCv7O4UKhDMHRvEO
 8A6N6zz1kIgOsEYpascj9U7gpu/AwfK2LsGlW8sIgIolao/1xifXw+235yxrZioVLWrVT7+ufcO
 bxu4Izy4fsb8R/VZ9rU1QEpA7/2jSmOVbJvOhdHkCPaKtWRg8wiGKw0bh48gTLgJlEoXYz5Ws4e
 4udTALKGJS/uOTjdiS3gY/l8NQDIouHYM2lhXc8XUpr7K8ba59nJsE6DJUYNy9z8idN4iD5nmkh
 +SSvehutON11Ww2Uv857byQoyHFVed0MMX49dJjGttxBBBJ9fTlk6z5Yqx0RRNP5LFBmGrkNxVR
 7RIDD7RDYSQb1rXNKyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxNCBTYWx0ZWRfX3cDvf8eu1bqo
 bfMI4nqqZ33G/kUPSlZ8S5SfMl/qBrfh/8omklz0XVzllpLiCwvKu7keqQOKjjJM/Qg9dqpHQx5
 ugviEWIKT37BcpeLMGvYLQN3sBkF8tk=
X-Authority-Analysis: v=2.4 cv=Qb9WeMbv c=1 sm=1 tr=0 ts=6a6ab7c3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=O1Ui7m3IpNT3MPDsLiQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: LFpT5GaiJN267zdsJvA0rZlyU8OFDMtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_193237_646601_2C89C5EE 
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

When UTF monitor is enabled, ath10k forwards WMI events to nl80211
testmode. Non-UTF events can therefore be delivered to userspace and
confuse FTM tools which expect only UTF responses.

Only forward known UTF event IDs from WMI event namespaces that route
events through ath10k_tm_event_wmi(), and drop other WMI events while UTF
monitor is active. READY events are still handled by the normal WMI
receive path.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.3.7.c5-00093.2-QCAHLSWMTPL-1

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/testmode.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
index d3bd38569..282ae6e20 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -156,6 +156,14 @@ static void ath10k_tm_event_segmented(struct ath10k *ar, u32 cmd_id, struct sk_b
 	cfg80211_testmode_event(nl_skb, GFP_ATOMIC);
 }
 
+static bool ath10k_tm_is_utf_event(u32 cmd_id)
+{
+	return cmd_id == WMI_10X_PDEV_UTF_EVENTID ||
+	       cmd_id == WMI_10_2_PDEV_UTF_EVENTID ||
+	       cmd_id == WMI_10_4_PDEV_UTF_EVENTID ||
+	       cmd_id == WMI_TLV_PDEV_UTF_EVENTID;
+}
+
 /* Returns true if callee consumes the skb and the skb should be discarded.
  * Returns false if skb is not used. Does not sleep.
  */
@@ -182,6 +190,12 @@ bool ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
 	 */
 	consumed = true;
 
+	if (!ath10k_tm_is_utf_event(cmd_id)) {
+		ath10k_dbg(ar, ATH10K_DBG_TESTMODE,
+			   "testmode drop non-utf event cmd_id %u\n", cmd_id);
+		goto out;
+	}
+
 	if (ar->testmode.expected_seq != ATH10K_FTM_SEG_NONE)
 		ath10k_tm_event_segmented(ar, cmd_id, skb);
 	else

base-commit: 913998f903fb1432c0046c33003db38a9e8bedb1
-- 
2.43.0


