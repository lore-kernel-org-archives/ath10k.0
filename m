Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80CE606DE74
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQ1wCxEN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4RnNged;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OGea1WRL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=; b=FQ1wCxEN0TyFSK
	7E+JqGz57vcsFZa7w201zQmapWhAGe5EMMnmnMMKYVdWAzaquWbMlvv2IM+m/mG7eGEP8HH00M6qZ
	Z7jSxuzsG2Pw9aHb9R5qqFdOrm730BRhJ6o6HoFFlsbLJqcxgcqEWwFcEz0deeVMcqo0sKPfw4a0f
	jCHMLA9XntGOv8/Ai1Tzwe0iYfGtUAAxsGkItO3DjhQyScd3ZNpGpocxfyYqbyDJROQrYBUDGtrv8
	OJ7/hC51jXov4/8veqXY1Y0/UWZulViRVfhGLvduzxyoK01StDSclC+EQJEfLNOoqawYFFg4IOx5W
	RdR5Njy1HYEuK90+inUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxS-00000009hQj-2lKj;
	Thu, 12 Nov 2026 11:27:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwy-00000009h3n-2fQW
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8vWB04149282
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=; b=A4RnNgedtMnxsh1X
	sZ05vPE7I4lEMorZk2crxxQ9g+9pjjWqsSrNt/XBX1kFDUaOtdRDaw/N/yLvFMlT
	LNP+Pq66uh4PHllKGZJ/khPGQw8YFdgSRap46zvv22TJKGni44ICJ5OrrOFLAirT
	1ri9dcW0p8+f8HjiUeDlg7kI8njYuy77lLB+dEiZlGSu9KQc5NLpLVjUTWFT4cKC
	JrbmRQnQNTjKLSJMmgZ/ALieaEKdfGPY5WJ9upVmsNjzwbWYSNxFoo50r9f9HDA/
	RN/TbfHdZKd3nEJRtQFnNbmfQspONpeCWyUs093Xgc5HMkiyj+nCyNVpfPh2ABAO
	o8HEjQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc6361q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso2279035eec.1
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482799; x=1795087599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=;
        b=OGea1WRLeNQcFSL6fUmdnIJ0duM9V1bpFMP1AT5jWDUb3Y8Bo91Y4ue5lnbjufRVaQ
         R+pIeTof9DYC/O0TQxrdASg8g04qmBLlqGpJaj+E5RVAij1hyMwJl4t3Nra7M96GyUGe
         ZHqTTmtXtOqXgwdFzpB4/tik47l8FbI4T5N/L93gxWM0Os3u89bO4iyhpeYFWmQQ8Gum
         HxMoRrZuHULD9NMOf3Ak7Pe0R8qZEeabK0D4fOBpsqhwUjXK/5M5NW3ZSV/61KHVyCI3
         K+Ea13NEVASlm7t7PzZhQHCFQncQT60PQeBAquOYNa85oIcQcLmGm29N9eqwoz4RxaLt
         R9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482799; x=1795087599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JcVWKFH2X/oVpXttXxWRBBtj9g+uFqqXhn+4yOKFNw=;
        b=yv0ThpOqZheRaNckgiucoMITRW88BRS6sM1Xzft9C/dgje8cKatkrfiTncZxhw7JiG
         odGZRUwDxYWvvvsMFUAaBVSrMvnzihFRj8fIlpRzQu/FhZr0PTpIgs6NFkV8REuKXmYC
         vEdwEerQKIxGsgRAVTCl/aWaVqLrFmh4RwEq8/dtErfP3//ItyPrtZX027P5GK52T10S
         pETYA99ZOLK4RLs7qPH+6GkXmAROEpW+y9nMmIQ8qvpfBoGdJRmePvV9zB78hwtbgMT/
         NH3AZZN4vlSVdjgofGMOIfMp3iay7rl/iZbgbNbj/hWjwaMf48dI08zPUPIGbKtn3WVC
         troA==
X-Forwarded-Encrypted: i=1; AL+hErEM+HSGN0Tmg+64L3Uv1l15Uw/Vzs+u+AO82/03BH7EEv7F1rLiLLLtJRwLzTg/RARTCu04P/A=@lists.infradead.org
X-Gm-Message-State: APuU4Z9kIrE2ZtISXq9lQieml2jgTEWAyQN/cd9oFpzSdtc+pUfvtHzx
	FIS/aYlP1hlvWv/R6O3DsLcy+IwP89KRBsPUY730WNm1OP72Il8KX4dJVAj0jbG93LYe5vblzsz
	2BHk2LdafHQijf4Q5efyLCog2KfuarGTSxJXG6tufJIXWbi3m1IkkTHsc4gCbnbJI
X-Gm-Gg: AYBFou2mhF6dcQAMGv9h+WRhHm5AcNdkPDr3ax277PJB2tFvpI76vBsgEbRl8+aA2Lp
	DHHmCn2FOOkXLXOEjQuyrS29ON7i483YaBAWe6qyI8UBH4+aUDGtUPUaIMx+fjvebq0NAf+DOAm
	OVqnj2sFRN65AcSu2j8bo5PqzdxxjdFlV2VFMdDTdF8oOMzeU2j4eaQA12tepUDQOs128JTHavH
	QhyhCUAicjlR+fpMGR74/z5AvY+NfPGetj3Ytrp8njAa/GL1bR+sLg7iqZtPeSJMB/OVmzexp3l
	cE4moClrT/ZqPJqGBxoJlmbNEMoc03LzgtuLlXlNNF4qvtGz9FyG9SqRbRlFhiL7XHoiGlOK+1Q
	16PFSiWW56G6dqOlOGqBir/ziDtZxfCyGu5G6x6c4GsYvZf34BYLNLl1dXZY4XbMxNkZwbN8UvZ
	haYdI7XuOk+u6NFZNgonE3Zp+E
X-Received: by 2002:a05:7300:6919:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37685e6b287mr8016153eec.25.1794482798666;
        Thu, 12 Nov 2026 03:26:38 -0800 (PST)
X-Received: by 2002:a05:7300:6919:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37685e6b287mr8016127eec.25.1794482798228;
        Thu, 12 Nov 2026 03:26:38 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:37 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:08 -0800
Subject: [PATCH ath-next v3 09/10] wifi: ath10k: reject scan requests while
 the device is not running
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-9-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=1796;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=3OlAgrDUFHL3A+JcQy/qTiJndb2c3k6VOquH9i/CJ4c=;
 b=Xhxb4xKzf/WvcXjgs08OLZ5zCxODoNOwrJUny0plJjje3IwaChxj3eE5a7acIetTNb8+f/pFM
 yHZdOEwC+VRDzUOHUg1rO0sqUACq5N/BbJcJ1cPKenS17V7VN8ZzheS
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: caN6C-SP_NJfPBuxZJLUGccmnRKCqcZv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX6Vxaxru4x/Xc
 JGaevTp0rBX9RBtNG7MMHERGaO5wIOL+zYL/+HEX0ZYK95Og+jITIOcqxo2QI5XAxsmfOW/J+48
 9PV9cbpDBlGtJmbmRxelYKjDKZMxpc6Po00TebJdfW5XpCXXfBJLyU15ZeY11LF532UxHBO6rsx
 LRSiw08bYsj5GKchEhigUD3aCkHtehM+SyMEYod7TN/56KdtQJ9oqGQTx5Cq9mWVehiFbtOrN/B
 xk7QzMl/HC7l4FXX7ZfZl4doW5epiNwN6HKj0DHiNSdy1Vj587mBmREsismnvRBCv78/6lOnlee
 VGOJDdmskYj3gk/KMwd3rLELTiWkDVYFwulTM4YH8W++NzP5FrcdJLyPy47hZ2M+DRxfWp1dueQ
 eF7SQQm06sI98kA6myM+WAqfIWAo9iyFs2iOzc0h5VYuzl1qz2AzTlYnpZg0KMS1h/TST8JyR8N
 AdE0PcpaRmIzmIpc6wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXyBp4wJEnpo1g
 ZU7pSoml4Pzs57GhgjBfwLIsSNpWllFJYFaWf7k00CK4SC8P8nInvsTLfLI73aNILLu8j6Jlxn0
 MPWzLXfVmSL2LkmtaxZHBAc8zOCj6mA=
X-Proofpoint-GUID: caN6C-SP_NJfPBuxZJLUGccmnRKCqcZv
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5a26f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bVNB9YUvG8vYEfrUsegA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
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
X-CRM114-CacheID: sfid-20261112_032641_426896_D53FE550 
X-CRM114-Status: GOOD (  14.69  )
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

ath10k_core_restart() releases ar->conf_mutex after halting the
device, and ath10k_start() later takes it again while powering the
device back up. ath10k_hw_scan() does not check ar->state, so a scan
request may enter between these operations and be sent while the
device is powered down.

On SDIO, ath10k_wmi_cmd_send_nowait() queues the command on
ar_sdio->wr_async_work and returns success. The queued mailbox write
may then run while ath10k_start() is initializing the chip in BMI
mode, resulting in errors such as:

  failed to stop wmi scan: -108
  failed to start hw scan: -110
  failed to read from address 0x868: -110
  bmi communication timeout
  could not write board data (-110)

The BMI initialization then fails and the driver may enter the
WEDGED state.

Reject scan requests with -EBUSY unless the device is in
ATH10K_STATE_ON or ATH10K_STATE_RESTARTED, matching the state check
already used by ath10k_mac_op_set_antenna().

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 50eedc078c12..de466752f988 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6416,6 +6416,12 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	if (ar->state != ATH10K_STATE_ON &&
+	    ar->state != ATH10K_STATE_RESTARTED) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
 	if (ath10k_mac_tdls_vif_stations_count(hw, vif) > 0) {
 		ret = -EBUSY;
 		goto exit;

-- 
2.34.1


