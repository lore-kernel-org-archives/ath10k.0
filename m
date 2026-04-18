Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111F6F99C81
	for <ath10k@archiver.kernel.org>; Sat, 18 Apr 2026 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w7Iwo5uHe5C9OO3L3JZKR1TUNA+oxWQTPxdODdb44PA=; b=HbeMtBis68jbgs1i0g4yHfpEn7
	rcZJ1kbTcd0EpQrs8Gs6uIc8S4RZ5u6IYFZU5em/BneF1FeWbbWMyXeZsd+jqjHMcQxU6w+ioWeCJ
	8JedLFXlUOl/9C9dq7JkICkJRKwGh+SC7DlFaJvDA3C5Im1IkknOCZeBCFz2DlY1c4oYOL5k1XIFv
	amaANDV44SasgQ50toQV3DDcvGLQLvMoNx5aLEBxIZpZ79nims24hocucxW6zuBpfOWFGFR+Ly4BT
	5zPWQKIk/bvl2HzOyyTOEaFnxH3gbHrK8CUTl9dYc2Mu+7Xo9JJINV3RdNU5+ezLEwJAc2TIQy/tA
	jaj9v6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEBTX-00000005B2A-3aoO;
	Sat, 18 Apr 2026 19:37:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEBTU-00000005B1n-33sg
	for ath10k@lists.infradead.org;
	Sat, 18 Apr 2026 19:37:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4e2du327735
	for <ath10k@lists.infradead.org>; Sat, 18 Apr 2026 19:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w7Iwo5uHe5C9OO3L3JZKR1
	TUNA+oxWQTPxdODdb44PA=; b=Bb0cWBk0qN3EObrRaZwxLm2Sf8yrWmAImXsJg5
	sE3ZiQjYZ6uqlKKhL+8lR6tUkuvtWD2wRJnew9n49UowTtH/AHW1w9bYYN+2NjDq
	lSbng52fkYy5sUyhwJMtbC4MwVhBVObi4RWuSKihBqqyg720aC1V2+Wd9A5WvT8Z
	7lpACaK/bKHHDK6dozAs33REwKH54FARjA3tC58htmuczxU9pQew8cEQpsMwsswT
	z+VhaZQuqrclkMn7/39Ebl86s1FFlIfe7nX+w7M2iME/aB75y1LB1j2M37bBkAp9
	mdZeaZDyuS7jdq/aSmJhgXCdcoLndsfzrZHux6IYuBsLzouA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34h99ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 18 Apr 2026 19:37:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ac566014e0so49546046d6.2
        for <ath10k@lists.infradead.org>; Sat, 18 Apr 2026 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776541022; x=1777145822; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7Iwo5uHe5C9OO3L3JZKR1TUNA+oxWQTPxdODdb44PA=;
        b=TQdiWjKThroCYkffFd26flBfv3iOdIyXcS0aJ/lgogjwgwkDOm3kPRpPipiq4UveX5
         ltIa1kk7z88kVyeX03Ap1bQkuI3fWtViLuXwmE23K9h6Et4XUBvge88FRahHurPyCHhp
         GhQjXqDc2nVqdgc/xBVn85Vjhfzy8JkLKkKrVbRxilZiJn9iqU1lSSTTabjlnPB3QrMW
         dU/5ADukqyZmmsDfC1uUdieaXe1lRyRfMfEK4m6KtrJ8DCPmsDgH96eWsTHcz5YRD1Gd
         SYzVZwHajCNQvKnrwXazw3QSCecu9qr4Vl2W8yErNJs/9UGt2HLGL8muF9PkA3gbQWTo
         ugTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776541022; x=1777145822;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7Iwo5uHe5C9OO3L3JZKR1TUNA+oxWQTPxdODdb44PA=;
        b=eVNOhIv2J91nECzIg+LQG4zL2vJflirX1xtyIGHIhrqou9nqdu44smYNHZK+Wc7pMP
         Fzf0gwivHEZN+O6/D6GEa9XDyeKxjmvHTL5QbKKFcQ3050+Txf5eFl50ZigtcL8ZqFdB
         9mzIUnVnZFQiYdJzsCHkKhIcnLtPGOh3l4+Rswb4EOSmiifiO3XBjnW8pYHKFbm3W9PB
         J7+oNBA0r3ZIwlkvM93DIGsKEt3I/H8nrQ0CTpeoZXb2WwSECENaDyQukaKsMFLoFBlQ
         sGNcomhZedr51KRmsYq5u2j788APoO7Sqv3Liszynpua79XiaXvfqHoWazv14Dd1m7cL
         pNEg==
X-Forwarded-Encrypted: i=1; AFNElJ/rDfUlnVpgeOQ0sTXcnv7dEiINyIr7WHRzNycz4B8a+VrfbCc/JIrtV/bqoSsyuzUMvo4SCwo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsckxcnrNKQRftS8XKC4f8XvEUzscoFiIyyX1ldCaAjUT5IpHI
	ZMJy/j89tXRYumwaSiN/TMMdSoxKwwu1GW/2svKrXYzRAEG8X2MVLTxQOGa4ldKWdKHm5r4v2OY
	rxHzbDBD6kwKGUESJefiBqmSlq07sV2dWteg3p9lAq5TvZ7w//z0D0q4kV6s+8pE83eCt6IgQ
X-Gm-Gg: AeBDievfoi42uGKefcdBlXd8/I01e9luu5rz0ZbmbuiD2O+H3mBvkC09H5Z1Q69Yccm
	gPVidNyWEEHuGGz5J4do1JuAlGL3xSroKwwpIattCPg0DXWSqEGXdceSYQjSIjTZ+gtrqMhfvLh
	K5vUZH3jd6R9mR1+53FjzfSPpi1n8Xu3NU+BsjpG92EHI3OM34wkbAbboV5Th286qaWF4UEZNbA
	Ls0S9cBiI/4kldDV8Ihty/u8WyvXOYRSRydF+urF/Sv2qrjxUO6Yp9cJ0PFGEdd+mQhr5XRn1Lt
	bn6p6ouC/cWmnDv9ikcQ2t5svgtZsyh+S3hVOdbs1BGKllpFGo/Rs7Y3x9wZqssL8fnKkBsCHPs
	Lxz9/7VjUYrtDlGD+7YRMwy30vOGS0Wp5wLr8/q2EHfN48LEAWXnwMBEcpMI9JGb4q2JxrScD/X
	2hT8l7BcvE7lC1GXhvlykj8b6htr1Q9KmmJQ1LURFPGg+AbQ==
X-Received: by 2002:a05:622a:199b:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50e36b3d8bamr118926631cf.14.1776541022552;
        Sat, 18 Apr 2026 12:37:02 -0700 (PDT)
X-Received: by 2002:a05:622a:199b:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50e36b3d8bamr118926161cf.14.1776541022093;
        Sat, 18 Apr 2026 12:37:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm1586143e87.7.2026.04.18.12.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 12:37:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 22:37:00 +0300
Subject: [PATCH] wifi: ath10k: snoc: select POWER_SEQUENCING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-ath10k-snoc-pwrseq-v1-1-832594ba3294@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFvd42kC/yXMQQ6CMBBA0auQWTtJS0QbrmJcQDsjo0nBDiAJ6
 d0tunyL/3dQSkIKbbVDolVUxlhgTxX4oYsPQgnFUJv6Ys7WYTcP1rxQ4+hx+iSlNwbmhl3v7NU
 xlHBKxLL9prf737r0T/LzcYKcv101BdJ2AAAA
X-Change-ID: 20260418-ath10k-snoc-pwrseq-dff5f8b8178f
To: Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aDR9hNINvNxqpRZmj0QpzoMu3SykIFvwvCMbcZncM5k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp491cGBWz3WfcTYyPvEr0U8zRHA0y55JdJWf2z
 jtgVYxnNdCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaePdXAAKCRCLPIo+Aiko
 1Z5ECACHXHx8lEt4Xus33W1KCWPew7OFmum6qixxBGoy7UOF/hkhVoWxVZfT/5g/BOOCtq7j47y
 cMh7Q+KsVxwc+7V4k6XEV81VCXI0Xg1lndP53px9UyywqKBeSSeIvKNuo8VuHS9EapoGkjbEA4x
 AEl8MtzASaZB7d4Hiiiy6HsWOlgWJz7vodXgQruhHeyKnc64y6zlBVf0lqcLJQ3VpGTYGeFdK/y
 OQikkFNpwagGqcKI8KmF5Z7/RTnCUyQo2BGLIOIqnO9LH8WTphXn/LGk/44itDc5bU8i6CouJ7v
 y9wypiCxVw0c+B3w1+xY0RTyRQG6Ba9owUG4qknh9xbZKPti
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e3dd5f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=AUALJoc_gh5xkgD4DrgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ZNTPCgzIq-SKt4cDGarHxFz0DkXe9msS
X-Proofpoint-ORIG-GUID: ZNTPCgzIq-SKt4cDGarHxFz0DkXe9msS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE5NiBTYWx0ZWRfX3k4pjXExPWSG
 b2u6jP4KiHx6aVdV5XfcntL1oy+u7PyxgUou7FSUeDUyn0gxNfpkEr1VFPigYXkYM+Q1pSdJEL7
 DdKIgk/6aG3HtDAbvjyNMeW3J+56yFr2E7c2L/PRMv2h++dcJSVnGqbY9KkpubDAlnfdkRvDEL0
 SWhZTPx8UVoygyQGdtfhXnd8W/WoUeETg82tEp9+N4L634LjKB00IVECvMW0+Pqi4/qafKnO4jx
 9aawnKIJw5jTzBeaBgApm0yDa5+jsL869JXJ4Tv2BKHbBVzIGUFW0WklxJZkKFXSLq+l6ztYaql
 8xeXp3+SZfDzajtVzHo98r479IbaMD/7JNXD4wzgPFguDh7zOvU7YRV+B5a8FuoDsPIDKCt0Tus
 hAet1PpyQGRMIb6MsIF635shXq3a0ulP3oEBGZL519muhAtF673IzJwvF4LhRN06M6gFWS6N2K6
 YL1flpkqClB9Pyt9ykA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_123704_819561_B244A886 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

The commit afcf3ec615c9 ("wifi: ath10k: snoc: support powering on the
device via pwrseq") made ath10k SNOC driver use devm_pwrseq_get().
Select the corresponding Kconfig symbol to make sure that API call is
always available and doesn't return an error per se.

Fixes: afcf3ec615c9 ("wifi: ath10k: snoc: support powering on the device via pwrseq")
Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Closes: https://lore.kernel.org/r/DHUHU7UIT487.139L3KIVRVREU@fairphone.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 876aed765833..efb9f022d8c6 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -46,6 +46,7 @@ config ATH10K_SNOC
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on QCOM_SMEM
 	depends on QCOM_RPROC_COMMON || QCOM_RPROC_COMMON=n
+	select POWER_SEQUENCING
 	select QCOM_SCM
 	select QCOM_QMI_HELPERS
 	help

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260418-ath10k-snoc-pwrseq-dff5f8b8178f

Best regards,
--  
With best wishes
Dmitry


