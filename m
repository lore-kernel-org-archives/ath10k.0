Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152BACCF9F0
	for <ath10k@archiver.kernel.org>; Thu, 30 Oct 2025 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBSYMbXV4wPo16RGwlAGSta0tp2sRbEpfdJq3GdZt0I=; b=2z59RF1nBmUoZFFknVWRSWitIn
	ceKkPXIGwcCHGb7oMao5XnvVRcllS8KxncQoz1me0qHNw+AUDEslqN3GP0yRyE4Y8cQChWAv9qMLr
	vgDlK/lTtwnbXxSkcCz1+d5rR+8/h7afMNU9VgRnVkbg4y1VlP4uXWh447+T/nRwnyExLvmfiA1MA
	FCId3f0lmxL0ixg55Yf3zoWn/6VSphAlQ9WE7BbwiGC4JicDhi+w4W1B1Kum8ag0ukfAtypp6F0Fv
	+4WUf1bqpMQyu3wLULlQbJKEK1iQ5oyqHccvW8OdQ5/6JMmO0RFlPnWNS9SPoigwyQmaItIJns/hy
	CpXW/0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESGb-00000004AcJ-1qSD;
	Thu, 30 Oct 2025 13:00:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESGX-00000004Aaf-3Vua
	for ath10k@lists.infradead.org;
	Thu, 30 Oct 2025 13:00:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7VTZQ1578742
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 13:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YBSYMbXV4wP
	o16RGwlAGSta0tp2sRbEpfdJq3GdZt0I=; b=Ldl8GfmUBy+qMs5f4/aExlHoCB2
	OnxBk6QH7mUDJrtuKZLarliPTm3O8N86zUXw/ydl4KgE7bxNEKkLES7DxCCH6XNZ
	xKeiZJ4sy649qK78+H4IY5zw5G/VUJZW32t0KVDSskRZkc2J8MnEb37T1nRfvSnD
	YuLnWXnBze7fy9gBby0sfw4sPTtErld2X+5zmnnofshJbuZxKrRXyRmRu1OGS0Uh
	2ho5L44zEwrTexQyT47DZ/DKo4VuwDyo9THCNDTi2XeeraDxByvUv81WmFN2CrhT
	wHIPjwhUhVOzGn6MaJMyZpcgxguqF2ENOU0LuxIHZHjVhnui1/lBingW4Rw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjejd5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 13:00:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7810912fc31so1103276b3a.3
        for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761829233; x=1762434033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBSYMbXV4wPo16RGwlAGSta0tp2sRbEpfdJq3GdZt0I=;
        b=kb39DM3xTrt6HIcZjiJw5J992fGDykIDK6wYBGzFviGAW2lPXfhAIYE6iQ+HQARbdG
         riudqKyKxPWma1uwnT6PZiSsm/4ks8+bwZ9lE4loYNlicYKmycAf3BoVIeOabYOi3gZ7
         HPxC8wACNSf2PE9qxY1KF8AnvsimbyfdeP+b1KMg25wGn1RHK4V9BJQZh0tgOcegpf4Y
         s0+vDvC3yp5iEzkxKYINM4HbJ76qvgTnn+SPw1XFUzESZo2us65E5hkcXl4k/a4TSwEQ
         J3PfKZrXcY7hG/3BjdmKEtxPObEc9qfQR2G6rRSWMWowOyU9VGZ24s84zKYjcQ+XjtGW
         bPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761829233; x=1762434033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBSYMbXV4wPo16RGwlAGSta0tp2sRbEpfdJq3GdZt0I=;
        b=R5PutK9YH2e4DlC/qC+sjTJ4Jncg7xysoSAw231CtaGNxvblVb3D475Gm0iiMbM+0D
         vticHfi0lqYE3cj3qNbZL9EV9uAcMIV7h57nUqACox9xtMQnTHzI7262GBlEY+hbwkdb
         C5hFzngzc6G/rC5Gnu0uJaGtRKw8eQFj4VeqK6AjUjMd07eZ1En88zEsumGKuECMOcKt
         wBMsZraC/8pxISakkOQa1/Hchso4QGv/RDj8SuwvqqxuSyALHdCvm4SdfJR+EXeRLeZ/
         J/DDmjfSNXSJW/nrcHHAJqeCWjj9CP3WU39wgFkDF2CnAC591cXDScbOfyxfXo0gQGVU
         Hilg==
X-Gm-Message-State: AOJu0YzkZoFmF/eJpb4tvK7j4+FzAmIUyMqKKmyILXcdg+ySsWVDazw8
	ybma9j2Z+ODtxT7+IaB6i3NKPL+f6LkuocCUj0RIImyb0Tz5KjEY9BIFJYbAEq13Y6IDgh5Xsvp
	Db047vqkBHWqBTfkrNa3SwLOINPjK6dCZaXVmrXJ7HgZYEzq5/EBFta/EpaS2O8Jc
X-Gm-Gg: ASbGncuhbv/Mi4CDmFK72Kqj9zdoLJFE6wZPX3Msk8h7QKA7SM/M7EuoA9fOVnOLinP
	RW/2it123UylcITR4AcfkrlxeM/ew7PSeUTEmfBDHSqgzLyxUs3ToIvD/gWPiqdjuMO2Yl2pl/h
	YqYL3SCRIvgQDEtPfAQWYPZU97DbBycnhcsq7xdkFqa24cjZIhqZqI+ny/Ec6sbgR2asK9xhyns
	pjfZbry2klTDmlrT99IsuiAN8LJGFzCq09I1UaJHSbsFdPt6EW6v/EobUlssm6G5Y9bPS3jup8h
	AGV9iBtFTGhFmfXydksI64dGIxliZBQwC8RUIgbLknzDSPw9dhJUfCFCgeuaxG20mXa7OewKmAk
	sMX9qUnvByE5iPa0isU85Tm/GfGhEdlNFMlRSlo5F3nwIAQc5CJ8uW6W2Q/nIz4iAgg==
X-Received: by 2002:a05:6a00:14c7:b0:776:1c49:82f8 with SMTP id d2e1a72fcca58-7a4e2cfc4f7mr8535172b3a.8.1761829232274;
        Thu, 30 Oct 2025 06:00:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwUbo2rnq1u5I3smURzqZgV3UkEDWSY8iTqhS1M3qZiZ/dcfDt2ClBHzvIFP5gbjiY99BDhQ==
X-Received: by 2002:a05:6a00:14c7:b0:776:1c49:82f8 with SMTP id d2e1a72fcca58-7a4e2cfc4f7mr8535091b3a.8.1761829231545;
        Thu, 30 Oct 2025 06:00:31 -0700 (PDT)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414068addsm19078757b3a.44.2025.10.30.06.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 06:00:30 -0700 (PDT)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 2/2] wifi: ath10k: use = {} to initialize bmi_target_info instead of memset
Date: Thu, 30 Oct 2025 21:00:23 +0800
Message-ID: <20251030130023.1836808-3-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030130023.1836808-1-zhongqiu.han@oss.qualcomm.com>
References: <20251030130023.1836808-1-zhongqiu.han@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: apwswBJr6utVPLEFk1HCnk6TMtxuQ2gx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwNSBTYWx0ZWRfX3pFs2Y5D0e17
 T74knSDWwriVbYIv5HfOipvSYpFHpNv7BQ3bMXvv1Q55pIZnrJpHLdSRxBNHSVokMgSkEdFQVZD
 7Kdmy0GZeLOjlOPpPXkvFIiO7CyNH2WabiAEJbi3811ufGXfyhC6JUVyIhb4klQhRf/VTZYA3RE
 uaVYnchMJDe89hokkLeDkqL4QlWOn2ILgmZkUyzvdPgO1dWAvMGlNXXJGq5yGyYTYzragc7T8zz
 W/jWa33SbNVnH82bMqcIlwUFsP7U4zgS175MaisiqwWjQBGEJu7/nXCFGAZOrwgzqHG4gF4Kp1v
 ZCg5y4tdKmBSTMOozKbzsjk4hGH+9bKwW58YdKw5mw3m4jW3INcuznXdkZj6hLjAB8pQiAsB7if
 9qrvLwpuDCrlnw7z9x2AlkBmfW0GzQ==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=69036171 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vBECTLBiNrBzeQB1dycA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: apwswBJr6utVPLEFk1HCnk6TMtxuQ2gx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_060034_417434_543CF26E 
X-CRM114-Status: GOOD (  12.87  )
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

Initialize the bmi_target_info structure using = {} at declaration time
instead of calling memset() in each bus-specific code path. This
simplifies the code and avoids an explicit memset.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 670c31a52a12..7c2939cbde5f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -3352,7 +3352,7 @@ EXPORT_SYMBOL(ath10k_core_stop);
  */
 static int ath10k_core_probe_fw(struct ath10k *ar)
 {
-	struct bmi_target_info target_info;
+	struct bmi_target_info target_info = {};
 	int ret = 0;
 
 	ret = ath10k_hif_power_up(ar, ATH10K_FIRMWARE_MODE_NORMAL);
@@ -3363,7 +3363,6 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 
 	switch (ar->hif.bus) {
 	case ATH10K_BUS_SDIO:
-		memset(&target_info, 0, sizeof(target_info));
 		ret = ath10k_bmi_get_target_info_sdio(ar, &target_info);
 		if (ret) {
 			ath10k_err(ar, "could not get target info (%d)\n", ret);
@@ -3375,7 +3374,6 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 	case ATH10K_BUS_PCI:
 	case ATH10K_BUS_AHB:
 	case ATH10K_BUS_USB:
-		memset(&target_info, 0, sizeof(target_info));
 		ret = ath10k_bmi_get_target_info(ar, &target_info);
 		if (ret) {
 			ath10k_err(ar, "could not get target info (%d)\n", ret);
@@ -3385,7 +3383,6 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		ar->hw->wiphy->hw_version = target_info.version;
 		break;
 	case ATH10K_BUS_SNOC:
-		memset(&target_info, 0, sizeof(target_info));
 		ret = ath10k_hif_get_target_info(ar, &target_info);
 		if (ret) {
 			ath10k_err(ar, "could not get target info (%d)\n", ret);
-- 
2.43.0


