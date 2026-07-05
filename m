Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A71C43458
	for <ath10k@archiver.kernel.org>; Sun,  5 Jul 2026 17:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TwGRgga0mvc3qxnE3GKPjOkFPsDuJ1dPcXEFmaTASCo=; b=lpHXpVNdO9w/+vr/6/W5c6Qg0Q
	dSL9cak/n1udxoa4jXRRvCiBpUj1PLeSss4avC/Hy8+HE0btOFPJ//5GF7PguLCoPNoqIiTVgHYwD
	fGFbMqSSIZG07AQHA2aeLuNE2JBU3YR/2KZhujXnHNSUx4mbepmZCKlwPe4nGUWFV5ZNpgUHQbyfF
	bZ3yaQbZKz2QFhw5NbCIl7erQanmvXKMjY+aHm7rfg97bg3kKNP7tn02Fycn1mZVi6SOVzIqlskHc
	Ep0rJSr/YWr+Bwi4MDFl7pgrGWbq3hmybnR0isqF0t9m30SPtnqqG0cnDwQ+rB6hz1nt6Mpc5Veur
	TwJN3BoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQZp-00000009Vsr-2wrj;
	Sun, 05 Jul 2026 17:24:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQZn-00000009VsX-1Ojl
	for ath10k@lists.infradead.org;
	Sun, 05 Jul 2026 17:24:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655pmaC731359
	for <ath10k@lists.infradead.org>; Sun, 5 Jul 2026 17:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TwGRgga0mvc3qxnE3GKPjOkFPsDuJ1dPcXE
	FmaTASCo=; b=gYrvjScAPeDdg3iPTLNnZGPvH+No+rOisiyhui/H5hbmSIWBzlD
	g8PAAdUy3u7cGna2v8QLucNAWy77y+yHBvQs2o5xqcAZeF3/zyiw55lojgYULv5k
	k0uaK12pJSJkoPfG8wJdzJF0gZ/k3RIbHCAHwK+9jvzRkKEVGYjfq0cVthbZ1bL1
	IDP5qYELibXol5V99z+TT1A31/NJYcMKTjAl+sCTOXOBOXO2oWTkpZ1vE+tetGek
	bQlvi6akC8+PhWSyKCff6ATrUjTe6mWUtprymeZi8O7ranrAJDF1dW4If4Oqx/3A
	/Hcs9FRkj4HRq8TXq+cFu12BTqXNP5nTQGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8k1n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 05 Jul 2026 17:24:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55721a8cso215140285a.1
        for <ath10k@lists.infradead.org>; Sun, 05 Jul 2026 10:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272258; x=1783877058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TwGRgga0mvc3qxnE3GKPjOkFPsDuJ1dPcXEFmaTASCo=;
        b=exCPY4k7dGF3/WwCapqU7J2MDwY3pNlvTz6tGGYma7pYKN5jQDcFsYVodwTYHDWsu8
         lDK8KXK6UMu19lpNDTyUKcLY4sVv87SPzp39PwECPDCJUuUlmdWfe98CIyF3Zldbx7Yn
         DuGf8S9pz68UkQdzUmje2BaG9gEjNL2lmLacu9bvNXdAPgT25uCvRo94+qlYGo6mRYlI
         rT3W1zT1UxHa/lKdp0cn2c0IJf7hfPBm4cBkdKqE+zyxDD6E00zuwea8WHYUFGaDs3J/
         ipewuWWi4shUpaQ7Cx+eDMdnoLUZrtTi9hFH8ArauX0pIUgZetYn+s3thAXyruabEKZg
         yBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272258; x=1783877058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwGRgga0mvc3qxnE3GKPjOkFPsDuJ1dPcXEFmaTASCo=;
        b=EV9ICgizwd03DuHed0y4Q7+FbubI9QEfYN1XdwwBlqKZhdxy30GBYxtY6grRt/3Ps0
         O/DmDW859JNNFWTf3z/NdM1IZ2usdRZVLFaSE2EuncMzxZTXtXZFk7NtRUhTrWkXQu7R
         9yE4KsDxEedy2lp4bXeG73g1jdKYgunEiR1tP0nn09QD6/tDD2L9cAp7OnGeWylnTyW5
         lUYF5uDg5g5yMz7i5SfrvEonBEk/7fS5whxy2sgAZFR7KYDXaa3FPAJyx4OJOuXPrVcN
         2vCw+FhnFDPzsKlEQg1rA0Ymzi2Y5k4HsbpnnIQpp2H19iQmmLT0ejgkRwOZpjF4i3XV
         qB9g==
X-Forwarded-Encrypted: i=1; AHgh+RoOeZfjME8udKkg3lV1a2y37n9jQVrBBCmPBgfVl0L07t+Hv0gZ7CeIp1IEEhmmSQfRh3yCIe0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHIBlPyFKjTZj9HZxqRGphndmZFofNRUii/hXecB+a0QkHjwW/
	T/U9wFBlXM1XhJDQs15hYTl1GnGkWhJvZ8qOkOtQjGL26ERZY0JefpBovjW4VHzH+nrimu/z0fo
	LE9FW3MSlf0Q2SY5oN9ZtHFAw9/S/23JZooJIC3tb0DwAtpxe2fcgapfbIf/90jLx
X-Gm-Gg: AfdE7cnNML1Q/b0YauzhutlhcbOKMWTVZWwvUgCWVRNl7DfaDIQFZb0+7i0W43jR906
	ry+DvC6hvN7JLC17t/x+dH+CbMx0iPqrLBNccDG5JWKoJPmpeJfAMJ562gKphxFhtdQaAtEvR4H
	UcGTkX7bh7UxCLotqPaENJTGGTbA2wG22E06jeZ+b3Pn2VQcVNByjrnkP0IK1Cq5hPqZiJIEJoV
	9m8jlvC+1TZYoM0KTaqwHbJEejEfEP0J83BQpDqUgG+vplrJsFNvtBpdPTCDQR0mSYvliB9yiQs
	+ICwxPBsa8cjexrS4Qy1U4dxcLA3EiHeJCV1VJ6rVzRuWPRX/9kWqnrFKtdXMKY+jwMUroZgGWQ
	GtNbCj52co+dy6AgNIjSX2sO2jak=
X-Received: by 2002:a05:620a:31a7:b0:92e:7a3c:add7 with SMTP id af79cd13be357-92e9a3753c6mr953329385a.27.1783272252723;
        Sun, 05 Jul 2026 10:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:92e:7a3c:add7 with SMTP id af79cd13be357-92e9a3753c6mr953326685a.27.1783272252305;
        Sun, 05 Jul 2026 10:24:12 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce11497sm226179235e9.12.2026.07.05.10.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:24:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] wifi: ath10k: Drop redundant NULL check on devm_clk_get()
Date: Sun,  5 Jul 2026 19:24:06 +0200
Message-ID: <20260705172405.119084-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=uiuszvPty2XQ6RIkE13BPFdZyUPom/HeObIFiARKQeg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpM2+LM8QP+1/e2Ud2aU+CQkyPmIoe4pSGmg9
 kS5UteLYOSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqTNgAKCRDBN2bmhouD
 13yMD/sFY1waNaWOBExVMy8wvWVtcfCXDcfyhUBn7iqz3dxvgnxrOP7ABcDvVpJeIiwuiUm1ks3
 nMfS8hIt97Mj0nr2rlldAl4d+mRx8z4N0pP5lM7U/KQwhJmBDIq9qyGHDgP6yo0kdRU4nRfzNV2
 snt6ZpoZuTs39Ed9x92ToX9P0etnK9C9wqfwsbQkzC1wSjRiBgdk+hS+PaK1BxrnjFgbytxW6QE
 fz8YkLDgTYusXCcUXO6Pw/hLhtzBBdGThE6fotoZCjp65z0kXmX8GEXIlecIVxzcUijKMyYcdpW
 A5PTcprY125w0KSKy/rgHIfe9XVZVbluLKfaUnMyODm7nLEZzb029wIVZnuJ39deeUaTyHpp4gQ
 AV/6XtHk3tkjqca0oh5WUMDhCr1koromJLqha1htFyX5+eRAVQmQMPMXVxbB6/v8m53QjT1ua66
 LZquemYfvCEADJgjisgLLdNXlMkSg9aEfig+MQ0zew3UEUvJqh7XgnwewA+mpogyJNS3JSv1u2y
 nG0aVB6R0uDqXidkaUpQedgaxpbJB9Qe7CEhjdg3PI0JEWtMW64AZghfmY3NjzCs+Eqs0ZOjD/u
 7cR1rGl0Nx495BoKtH57QhagWhjz/wQEiQBvfxGddWWcEC9BzzDUmb+NFda6/NYYi7pBVFymAFo +h4aR1jS6uwj1rw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX05aQ/brXvnYN
 s1RHUy3hmMErhJT1AMW5wegD5W+Of/lnecPAzagwqU8DG2O80TYm8+dMEbIYR93IVLqY83/Xxl7
 3rleOcv8xS/OE9AnoLTKvdHRUnzw3dLuBQs9/2KXAZ5S4TPOiC7d0Iwjvxi7IMzacr37g7qTjDf
 K+HLncVt6hL7zmdC03V8bw3ePPLiwksAxGpaotZIADCHXkKfmcrgSdnklBM4CDVbOTNzhxc80qi
 4JEQLlK3HJfyYMCoKuZPXVch/zGrXUNJmKwIbPkeCHrfHxhmZd79Ty4FgVd60riFpzE4+BVDPSh
 58LV/IhOH6sAAudRl/WOb00vGrSnua0PtP/eAcf+aW19mNa5bi9MFxFkzZLCuJQDUjjGXy2PkEF
 +GXKlB6yehuBrfxYFFNxwGTPv5IBZXZZBqFpVRNSHqJkSlnDtMVEICBdS66Oi4ZB4QHyxk1mpEf
 fymIh1krKQjWlqZEGsg==
X-Proofpoint-ORIG-GUID: XO8lOHwhQE2_rmTNaDZg7UEM3KgfrOpu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX43cVv4ngmTZn
 oNKA4RHx/q7IltvKWFWimF5u5I6A15X6IegMuQRwrbrEsykL9WFNyLnS/mfw4At0nKhLQKaciML
 ZFuzmDBG/kIEjFaMKejsnfXkSXkkuew=
X-Proofpoint-GUID: XO8lOHwhQE2_rmTNaDZg7UEM3KgfrOpu
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4a9342 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WP6Ezjl_j04BIvCI5BoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_102419_488607_F590BBF5 
X-CRM114-Status: GOOD (  11.43  )
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

devm_clk_get() does not return NULL (only valid clock or ERR pointer),
so simplify the code to drop redundant IS_ERR_OR_NULL().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index eb8b35b6224d..7456f885d2b5 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -87,24 +87,24 @@ static int ath10k_ahb_clock_init(struct ath10k *ar)
 	dev = &ar_ahb->pdev->dev;
 
 	ar_ahb->cmd_clk = devm_clk_get(dev, "wifi_wcss_cmd");
-	if (IS_ERR_OR_NULL(ar_ahb->cmd_clk)) {
+	if (IS_ERR(ar_ahb->cmd_clk)) {
 		ath10k_err(ar, "failed to get cmd clk: %ld\n",
 			   PTR_ERR(ar_ahb->cmd_clk));
-		return ar_ahb->cmd_clk ? PTR_ERR(ar_ahb->cmd_clk) : -ENODEV;
+		return PTR_ERR(ar_ahb->cmd_clk);
 	}
 
 	ar_ahb->ref_clk = devm_clk_get(dev, "wifi_wcss_ref");
-	if (IS_ERR_OR_NULL(ar_ahb->ref_clk)) {
+	if (IS_ERR(ar_ahb->ref_clk)) {
 		ath10k_err(ar, "failed to get ref clk: %ld\n",
 			   PTR_ERR(ar_ahb->ref_clk));
-		return ar_ahb->ref_clk ? PTR_ERR(ar_ahb->ref_clk) : -ENODEV;
+		return PTR_ERR(ar_ahb->ref_clk);
 	}
 
 	ar_ahb->rtc_clk = devm_clk_get(dev, "wifi_wcss_rtc");
-	if (IS_ERR_OR_NULL(ar_ahb->rtc_clk)) {
+	if (IS_ERR(ar_ahb->rtc_clk)) {
 		ath10k_err(ar, "failed to get rtc clk: %ld\n",
 			   PTR_ERR(ar_ahb->rtc_clk));
-		return ar_ahb->rtc_clk ? PTR_ERR(ar_ahb->rtc_clk) : -ENODEV;
+		return PTR_ERR(ar_ahb->rtc_clk);
 	}
 
 	return 0;
-- 
2.53.0


