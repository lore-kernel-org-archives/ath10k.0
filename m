Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFFCCA1005
	for <ath10k@archiver.kernel.org>; Tue,  2 Sep 2025 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WgIyomiDGYBeb6Ioi8MhbYgA0ptZ7Qj5Q0VJcD6VFc0=; b=IdnkI/AdVFSYOekV3QoyOpaOQy
	mSaWZrezE7bde/KbylxYyVA71oHcHWJDn5wc/zaus1QJmYA1W6CRpldyZKySJdEwLm2V8MFoQcc8k
	SNAdHC0EYcbkq9C9PxBKrSSs8sk2zZ352wSkUyslrdx03XUtmyGXi8DlwXMo3HoRBxC1fm9UO7BZc
	XbNVa4TF/R+YMm9dayQ8bfJyauX9ZeOpbzfrXC6BG7jKyK9DmU8cr8VyN4jAWqnAqUmYDilL26PHJ
	2pMpIu+YOFTN1a7s+b7m8MAWr8R186OM4K9CJpaFtfSuXyzHdPB0xTQQSSsN9rBhip5TghbVPmh2l
	cuLU3M3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMZN-0000000G7II-3kw6;
	Tue, 02 Sep 2025 08:40:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLzq-0000000FudY-3PPB
	for ath10k@lists.infradead.org;
	Tue, 02 Sep 2025 08:04:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rt6o010115
	for <ath10k@lists.infradead.org>; Tue, 2 Sep 2025 08:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WgIyomiDGYBeb6Ioi8MhbYgA0ptZ7Qj5Q0V
	JcD6VFc0=; b=St+jrdbInGJVPtY+eqAi8+mmpgllzP5yQmz3VawAPq8kIijP6Mt
	kYFx9ZONMCvlf48a8LtpkTwUWmlAWRdUmaP5xpM8hK7zBHm6Wcfdkh6mVnEJRBGw
	bk1YUaO01Op8vVzh2FM/Jg2vrYBQOMU7Cb8l+r7ZQQvpViDuexsbWQjkEyf1b1xu
	zw5pDUCyh4nfMaY9AzHenVbuwXBYJbd5FXqAbUSAjn7mhkcSh99tournldoO74eF
	Sxg3JfmefpdaJRwGOllR97Q4PSYlpy4FlPWGTF7cp11ixmnyx8pldOs2Ok20NHLX
	YXTE1xILhCsvbUKRWtTyWUuULrZMEqHlGXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjf156-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 02 Sep 2025 08:04:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-807056330b6so41402085a.0
        for <ath10k@lists.infradead.org>; Tue, 02 Sep 2025 01:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756800244; x=1757405044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgIyomiDGYBeb6Ioi8MhbYgA0ptZ7Qj5Q0VJcD6VFc0=;
        b=bqZte7UTJtPGhECACqFPJ5RdUq6HKAY/7XlPUj8R0sEPgb4YFgOUWpGRZr9rHba7eo
         GBM3kC0Zyu/5wm8qDFjPuc8uHmK8az2kgyltAyQ4lQmY/OdZRrAesjJadLfcYKXbHNuf
         e9GJ5I1cC6Hq7sB1YGHqlMwIQF+rPWaSHh+xeocUo1m6wUSBscjnmAR4KD4p1sRz7KQ2
         2jbkkYdrXyaov7TKn9hbtIKTJLxKEpbnd75KrIFxvIUKIJ4/zoocSrlYGmhYVEIm6r+S
         T1NZC7HJsIeIcmJMqaI1WzzwomX97efH+QhJc7Pqz3IxlZIg9UnI6MHhUj3YeGWT4AEw
         yBIg==
X-Forwarded-Encrypted: i=1; AJvYcCUMM+c8F2DwAykfaclce0MYVzebsw5pAdOlQRjKGN+kqIW5dTdR4iboZcbpO3ZWiAfwSdDAdsU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7cTu5MfX0JPeKQpHT0RhEh1yaRLNnEsEwhRi6QiAKphDKo2wr
	vyS0XunZg4Lmmq6BLgKjdAJTR/UC8BspKGYJq60nefLV8S8/ZiIyJi6xPt/OfgpuOEawGdViEbQ
	5ZQS0OEcG7M2DJIDZa3xyb1w5yrV986UsSslZp7lcJR1+tCoYHP/kelrErK2WZHIs
X-Gm-Gg: ASbGncuMds4yVl1Nq2pB5e8RmRTNpGkirGitKMq5b9/sSdolexhDqfO2zrs/Mc0czyB
	N5DjZKg/gkaaUYfPlzusomIh4MTHb3j22vDfPHiye3wXvlMWXDQ0efS1ol1aLT8238UcKJkVqZI
	RGf0QE8lboXAm8/bMcxg8EbQR4pdiw/0XG5v1KgF5ppHPQn7PZieav7Z1uNeruuG6OU/XTaDsgn
	SD7ZRbTDg2hOwEvn2OvgByhwwEqc3aQc0Qc+LcUdcqjR5Zai2/VPj0Yvacy0ZnOiV1bXmPujMmG
	zIYOm00GLRT2ZbwPf5PRL58JbLMtlIc/2NoIEpAXReICXngL5lusnDGvA3UlLR9D+rCsIJN3DTk
	=
X-Received: by 2002:a05:6214:1cc8:b0:70d:f64e:d499 with SMTP id 6a1803df08f44-70fac6f8a66mr145364456d6.4.1756800243724;
        Tue, 02 Sep 2025 01:04:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKUomnfMNjYM9WFOvNk1clEAei1+fpKQQfJ0feRVEWDXTGiUE/1odwLcUTyZXAzdkg0MGjWw==
X-Received: by 2002:a05:6214:1cc8:b0:70d:f64e:d499 with SMTP id 6a1803df08f44-70fac6f8a66mr145364016d6.4.1756800243034;
        Tue, 02 Sep 2025 01:04:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:c58f:9eab:48e7:40ef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff9918dbd2sm831672366b.103.2025.09.02.01.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 01:04:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        alexey.klimov@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath10k: Fix connection after GTK rekeying
Date: Tue,  2 Sep 2025 10:04:00 +0200
Message-Id: <20250902080400.635818-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6a4f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=shBBdOEUAhiFnM6U-_8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: k7Q2ftZai9TloumeDTKO0vktTbjdajJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX1YFS7LB/p7uF
 wIywvvDtNGP3ssbnBvfc2rjNknWkiMtr27gomEAuffB96q9cZN8n0k2GVbJSi2wavj+Nlg94Lp7
 UHAE0/vGdl4NAct91zqzRqmJzlUvN/MXytXGimH146saiWbFfy6qBtzOIGS3kcPV/vs/ST6aah6
 NelbjIe3qrruLN5EkfzQma4G3d/DA+oR6mGsX/iweTnlNEgyEo2eawXOyatkuq6hqchRm+DJ3TU
 1mMIAwmIynaRfIbE5BCNkxjnaWQFIqhBH2K1jXIOtQ/jrcMIEtcakXBa280cuJIi2g6aqELyZr3
 WcBEge0BgpHTEPi/nOL8OU8DE3LJO4NSTjtXZtsALzciZ+wpsEiMSH918h3qLk/Z7YjMOakf7cq
 5tRxlTj/
X-Proofpoint-ORIG-GUID: k7Q2ftZai9TloumeDTKO0vktTbjdajJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_010406_969787_81DFE3AD 
X-CRM114-Status: GOOD (  14.39  )
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

It appears that not all hardware/firmware implementations support
group key deletion correctly, which can lead to connection hangs
and deauthentication following GTK rekeying (delete and install).

To avoid this issue, instead of attempting to delete the key using
the special WMI_CIPHER_NONE value, we now replace the key with an
invalid (zeroed) value.

This behavior has been observed with WCN3950 and WCN3980 chipsets.

Reported-by: "Alexey Klimov" <alexey.klimov@linaro.org>
Closes: https://lore.kernel.org/all/DAWJQ2NIKY28.1XOG35E4A682G@linaro.org
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 24dd794e31ea..f33860784c82 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -290,8 +290,15 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV;
 
 	if (cmd == DISABLE_KEY) {
-		arg.key_cipher = ar->wmi_key_cipher[WMI_CIPHER_NONE];
-		arg.key_data = NULL;
+		if (flags & WMI_KEY_GROUP) {
+			/* Not all hardware handles group-key deletion operation
+			 * correctly. Replace the key with a junk value to invalidate it.
+			 */
+			memset(key->key, 0, key->len);
+		} else {
+			arg.key_cipher = ar->wmi_key_cipher[WMI_CIPHER_NONE];
+			arg.key_data = NULL;
+		}
 	}
 
 	return ath10k_wmi_vdev_install_key(arvif->ar, &arg);
-- 
2.34.1


