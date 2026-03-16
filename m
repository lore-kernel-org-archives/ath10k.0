Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658ACF53D80
	for <ath10k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sttkd7eb2H260gtaHPbEBYrM3UtDNGNgOFfj96PH8fA=; b=qF95MPU3cAwBN7Iduwc4iD5Fzd
	9r1PIrlPXvuAxVBPgPXnrzX7VkC1Pg6H3DVlFrPMjysb/VfO4pCVh9Ut3IoDmigI4DL8/a1oxt48S
	HaH+HGJFav4n4ZGFq710sUmvJ979zncIOdWeLThZhCRUwDLpdPYLL2rtSBk5Eb+SCdd4zTlTvtAqJ
	8RJKNABACb6y5ozcM6Ypz7J4zidBH5p6ci0N7qy7JY6NpcbxCkTrR9PDH5C7shb+f05npQDhNNnTd
	qL4ktwOCFuei1LTbPnhtoVgiBXTiZ9f3sDwU930vM9+btIUUbGxIatafHPC5ls60iInbkHLY8voj7
	pW1aoopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWj-00000004WSR-2zdZ;
	Mon, 16 Mar 2026 17:14:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWh-00000004WP0-3hgi
	for ath10k@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sttkd7eb2H260gtaHPbEBYrM3UtDNGNgOFfj96PH8fA=; b=FDvBY1zZxzZJ8p2ipNWizEoaVN
	FE8Up1KCmcKr8HSFo8xfzrigKfNNL8FgBJbwEtk0kvH3tCF5Rt3C0x5RcFHhzyJLnZP9hyiHpHQIA
	2vsCBGfbVB82ysr7poooNWHNTLOpFMTRrXmLnSAmTEqBiK4bZj9QDFpMsjSIkt1nbtuQp2tQnUaeG
	BIafWqs2flJuMRwWMABICSw+6OMkAox7dXMLnZ5Taaqu3x7mHT38D60ukAhWD7kjFlQYE4lJamsSR
	QxS9qduxvoM/kFcR+TY1H0LExUJU7WoCyGGLGouKQUd2rAi3ordHiA2a2jykw5TBr8uFFpJVbNd+b
	AUpHrLew==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWe-00000007IOy-25HZ
	for ath10k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjhI91428758
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sttkd7eb2H2
	60gtaHPbEBYrM3UtDNGNgOFfj96PH8fA=; b=fJ6kkfYDn3KQ6shXEvD5Q3uqQR4
	8GNTg+aD9oSpshc1SUYkQ1DdIXsR0N/fcaeGfyoHV4xKEVFI7iiZXrR4hAPMskMz
	7tHgnRvZ9XXREaK5hpUww3cvqQYCIHWXt1CwDZ9F49eR7RMMwg9rYH2lvcW97zcL
	8HLQOmz75+EwnlkddogWCLGESPZIg8LjcTytuh8Wx0G1rQXbfdw8GAlCP7ZMCGjc
	1huqPLODNZdQdl4PMl8XW1afJqXFOVxIaFnaWoVN/4CJTqLXEQJS0ZYSYX6nBx5a
	6gqVa41jBh2roHre2gqdPlwNyqjeSYWQGddaUwADGLQfVlL2GccNKfDqzCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh999919-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd91c0262fso176604085a.1
        for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681282; x=1774286082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sttkd7eb2H260gtaHPbEBYrM3UtDNGNgOFfj96PH8fA=;
        b=AwkyvYLcJ+lzJX4krcGQv7U6eFI8ujCpH4mvaxJi7w1r9AelimRPaBD2uyxA5t6swz
         q5fuSIVp1uQ8eTswWAguHaIVQCJn/Eylm55v8se0ky49fi3UfjrGDybJf/F+bIuU2ovu
         r+17wY0yY7PDixw1zv4kFqczHhcHvyMbKz6jomJKVVDwuB5obo9MutGsFFLUxFmZC/QI
         Dcoofexe6upyn4rT3csd1mvQdb2L2rYgu0sMRIgbSyPFhfUvQe7aE6H2fYgHxpegH/J9
         AcE/vmoGzL0cHRJrs25G/FgVJRBwlSzLdNd6ERWiwQPiIWrTmMtOh2HgYIkCseppapde
         uq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681282; x=1774286082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sttkd7eb2H260gtaHPbEBYrM3UtDNGNgOFfj96PH8fA=;
        b=fe9azXB576UVtwnLgcPmcGbbS7o0+hiw9YB4vUtm8PNPSWYNqNAARQzWzI/MT3hX8V
         fNZFNcHw8dPEyQ4Bo3pG/LLFHUG4yRmBa7ZscEFIXClIi6iPIygLXbrrQ/KtGNOGSZ6x
         +2jfbiYyBja2Ky6vfxqD+3VDZMVTwhUZg4OLFKwjBPPDSFVLrCS291J2ZF8zJBRkngjN
         uX7dLHiKDz7cI0kXjd3BWJX5nTU2Scn0zNKS7gCdFX8v8nH3vYgks3CW7pOhy9KJuxiK
         TJKt3ZhzcpJhmiuB2g412jX+9ozplL34LU5TaR/zZ1Mxt/7VUzFk0syWgSGvpMFOFjCU
         U5sw==
X-Forwarded-Encrypted: i=1; AJvYcCXmf9qon2MEZlAiKzXyckpEdNAYzZGuxb0BW2xeTzbVlvsO4GH1tW44SlW2PEsrTRsHS+2RJtY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2wHNpZqnkcQ8cTk1L797Z+FGz7BI4ozPiRdPRohaXohopIUz2
	pNshbyJs9fVVNFgcjixImARI0r9gohEQM3rRJSBDZT30w5XtBMU0OAR4LBsOtvIdjmjJvezfhmF
	S3mybOQ9OiJEwEinLGKx1W05i3qcrBGKG+R4AX7q9gYeT18jUNDjAHLE7Qy1K02in
X-Gm-Gg: ATEYQzwqTAU2w246hlhaqeDSe38EMoeCzxE4MTmgOCg5Liu/wWRGhihQivA1vEeGgQ+
	MeUJNmEyg+HVxJHFCbqzEB/3BxF62Qcejr2zcqC9cLGiRH56mhVR+F4HP6OtU/Q7K1cil89KEYG
	z2l7k2L9+hdONYq0pP6RxLdAluggu9omYfnFEUH8rpEKr1atHKw8KK10bm154hwyowrHCdaM2Rw
	fZ6SoPq39RhBA4Nw//gTQprmbDhM6NTgvryKZ5bPvdiqaJi6QSz9xOOQxvE00gHHbRTHpFsx5vv
	IrwjNrNgKcjJ0XY09GD2CnZz263cU5MPhUZjyVDmhy96vDLeKlGLrkkJvkoB33azF0tQiq3r7bN
	IM3cG8snW+Dv3tS+dIoGGdSBNUwxHkvjJlwIc4rOOPFQrsW8kPg==
X-Received: by 2002:a05:620a:1707:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-8cdb5a0c51bmr1603121085a.10.1773681281498;
        Mon, 16 Mar 2026 10:14:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-8cdb5a0c51bmr1603116085a.10.1773681280946;
        Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:12 +0100
Message-ID: <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b83a82 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=DFXFU3FfpSgEbJi8yTMA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX1pJKjhUNw7mh
 CA5bWl1KKT2l5hl3Bj23XV4isDQGGx06+Oy/3L3WXVOY8IIKYNNGGwBbewRu4lWbL8MlcNnusB3
 pLd3pqbeNOsQEA4AJ1VejS4IPQNWhvsUgaIzEe5KHqge/Hs12u5sR306EMBOOgr/16xgUFHZtv+
 5O/XJqrUExgPcMLUhRC0XjeIWa3LoRtSo3s6bjVG6tudmjP5RtsnEqh1oCNqNJtSgVutg0n/n2K
 PsMW37P86FDhpQZxx0D0iMvP+3QtihiQzkhwG4oJ8oMqn5bsruPjDptalANgIyJmq5iFfL03fAN
 +l2XjrSf0Ajl5rUtBB4qWGLxwI/q8eNJ1A2eXT23wyf6AXzG2yx9YzzAQdI1TbmRrMWAJCudodG
 D8FDQEDTAiCj+NANxLp4Iez5E+pOoSG3TnnuPozE4sqqCnQV243Z7g3/U7t9+eGvrvAFIavJBZt
 mw0LM+FpMedKV5GeLPA==
X-Proofpoint-ORIG-GUID: c_Q87VpAVSgVouZhCtEmoLuvSrTnxyIn
X-Proofpoint-GUID: c_Q87VpAVSgVouZhCtEmoLuvSrTnxyIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_171444_932027_2EF16117 
X-CRM114-Status: GOOD (  14.86  )
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

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
 drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
 drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
 6 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index eebd78e7ff6b..4fdd0af415d5 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1105,7 +1105,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	spin_lock_init(&qmi->event_lock);
 	INIT_WORK(&qmi->event_work, ath10k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&qmi->qmi_hdl, WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&qmi->qmi_hdl, QMI_SERVICE_ID_WLFW,
 			     WLFW_SERVICE_VERS_V01, 0);
 	if (ret)
 		goto err_qmi_lookup;
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
index 9f311f3bc9e7..88d58f78989d 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
@@ -7,7 +7,6 @@
 #ifndef WCN3990_QMI_SVC_V01_H
 #define WCN3990_QMI_SVC_V01_H
 
-#define WLFW_SERVICE_ID_V01 0x45
 #define WLFW_SERVICE_VERS_V01 0x01
 
 #define QMI_WLFW_BDF_DOWNLOAD_REQ_V01 0x0025
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index feebbc30f3df..1397756d6251 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3337,7 +3337,7 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	spin_lock_init(&ab->qmi.event_lock);
 	INIT_WORK(&ab->qmi.event_work, ath11k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&ab->qmi.handle, ATH11K_QMI_WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&ab->qmi.handle, QMI_SERVICE_ID_WLFW,
 			     ATH11K_QMI_WLFW_SERVICE_VERS_V01,
 			     ab->qmi.service_ins_id);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 7968ab122b65..eae416db8b52 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -15,7 +15,6 @@
 #define ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH11K_QMI_CALDB_ADDRESS		0x4BA00000
 #define ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
-#define ATH11K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH11K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390	0x01
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index c11b84b56f8f..f31cba7af722 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -4061,7 +4061,7 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	spin_lock_init(&ab->qmi.event_lock);
 	INIT_WORK(&ab->qmi.event_work, ath12k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&ab->qmi.handle, ATH12K_QMI_WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&ab->qmi.handle, QMI_SERVICE_ID_WLFW,
 			     ATH12K_QMI_WLFW_SERVICE_VERS_V01,
 			     ab->qmi.service_ins_id);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index b5a4a01391cb..2a63e214eb42 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -15,7 +15,6 @@
 #define ATH12K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH12K_QMI_CALDB_ADDRESS		0x4BA00000
 #define ATH12K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
-#define ATH12K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH12K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850 0x1
-- 
2.43.0


