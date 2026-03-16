Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1B0F53D7F
	for <ath10k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=; b=s2e8/mdqqhXl0yLYRMZl5Z7jIK
	hzHaH5V554kpyeUr0uVFtIq6H9twT7N8gbitmPoqqSlVBqXuCjLV/E6OhcFb35xRh2Gr+YmPYjvKh
	o7Sw6NYDOCoyiNmD+LEUvOs68DHjmjll4ozKXbN3AVDUjFOOAF6c0uynexuPxeCirH8sckjm/jD/h
	qDvR2F1iX5gEYyP3m8eJtPaxU/n5MAmud1JvLA0OF3m+5NbdTENUm2KKHN1gIkfFY/f9Qso+jcffX
	tCIsDMEmzAzqc0GwqvjhAQsu786ow1UyywJGbiSGxVH18oPoZ5HW927/XTFENSalUWJQTxQuevqS8
	+nM+VfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWo-00000004Wb6-11Rg;
	Mon, 16 Mar 2026 17:14:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWl-00000004WTs-06Np
	for ath10k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GFMxcl2315159
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZoAGvqbvmk8
	WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=; b=kfegwWmK+oeYWJpckng+sZks14U
	rsp48Lfzham+N65Zre+9ESiRr5oysAv2RkJYK7Y+U1U3MM/CnD8fkCkDZkAOrGUW
	Hpx6CYpG+On9figKHVPAr45yictYQnhXhAUrutjya7i9Xr31yLY/RKA6S+hzO5ZA
	tVsYisIr+HoXh9INI1/BlXHpPS0mSWQneF1qU4EmtOOvJVzdC5r7dKj1v6MmYSNe
	MiNWiBBVxfLFnBIb40R0DteoqRIwA7azcqxzpQp9Jw3OycFuhBKR6sDy8FoVAiun
	FX7nQKMr8eGtigtM96RpSP4VoX/itwoVqd0fo0XuZ0vROwJT3T3e8omsNSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf28e6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd849cd562so3173781985a.0
        for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681289; x=1774286089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=;
        b=ISXPfDxWzNmKd0OQi6kB256dtBx4OKIoVoaWsRPYp9kSEmnVh+B8gAJMNVYbknOIAi
         kNQnwL7NfCfzHaBIx4cmt+Xq50hx0OE5sNVByWIkmF4UErkZttFJbxZjX/Gw9sCLcFuA
         mOUmeFxmPx/9Z7UHmuu3bi1oylrGrqwjckTRpnc96sbfo3im/xl3hTZlhInyzBbBcKhl
         lLb0T6Je+6FUvrK9pGWf+7XieaZfkAGdNtOuPfj/r6pzwUggNH/OroCmYvHfhODXNsBg
         xnX4Apu3ESBiZIY8hG5uEZx8xsPHIEv5y6FmnNXsT5qzsqLfxE/26egDMKVIWA+wCSJq
         vDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681289; x=1774286089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=;
        b=fZAvh4Nx/37BKMGU1OCnf2hDZo47TKwptF8xBjOyuGxnd3E5uqEOGF/6ZhhAKx8nwd
         4OWuuR8ZgY1UjVTfTAIQaHd4pzDa9tG7DXhDe3D6eAdYEP+QqJFFyPot04vq5LLdkJfI
         5B8NEQblDfepjWwECjZ4hQt5sYITgZgx4z9CW+BFPPdy4tBNyXISi1zDAqLSqbKIFHrW
         wDZAqy0iLfj2wx/Qd4ZHj+oU8G7MofeGYjmg6MUrzCUh5uhzrzLLUl0lzmKlQRJ9xoLA
         +kG6jgzKuAX9pBmjn+kqIYln1ko7BPylP4VXTTgxG29zw/ZG1DeiVJjkm5SETcAecBf9
         2IUw==
X-Forwarded-Encrypted: i=1; AJvYcCVCFXbsKRzCGl6fbkyGEyBKG68GRdsdYQylizOJ/2/KSUDLVErB613++d9DS1xhz21/peAqghs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7y9hEJkH1UM8f5XSARNNjjh/IPTgLiyPeOrGc5ip985PQqdf6
	onQD3wszRLPKNm+xagMZJQWWM1oeeEXYYNKpc7lKFDyeqaR0CofbIchW18JK7uFpbequLlVubgm
	w6P3x7hd/DH9h59XhFCIl7nVNS35/PkAw1qgWNLwl2qUKkhvR5r3Driu5tsxvXZT2
X-Gm-Gg: ATEYQzyI7jw3LyXbLJICS2el2VGcY1PalUffWSOFjDBkLJYzUbdlTjTa1oaq3g0KGFt
	phfKcrV52esF1H6pae1lBMRWPQp92uZF5WGWWhBmrGjUukgNUQwqsjJy+7sknfnjsVXappPwjt4
	RxTn96L9VYu6TNObKS80r0qonAxA02lY4oBcIX1V32yqTAu88hQr/vFqHYmKjMCWFQXo/Jzl59e
	C4Uz6fV77LR/prhZ+d5SUdkJXaEnqbSmYnnlunTYsfHot+bf6qqBo+PJm0V6LDJ1QSRDJtXoFAW
	fcLCjhnuFikuscUBkGgHtBcNRMZPUVQq1DBOuLUVcVcbfjncf9OztToUvsw/L0Hkyfoe+MWrSvr
	gCv4x/EWuuM/0ah3zIkMZ1HSL7wbfueH51c4ZLIGQ6kjC5ABkjA==
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr1319002885a.46.1773681289294;
        Mon, 16 Mar 2026 10:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr1318998385a.46.1773681288653;
        Mon, 16 Mar 2026 10:14:48 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:47 -0700 (PDT)
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:14 +0100
Message-ID: <20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UrqSu380ZoYOTGMcJm8_L7WOAwMAxB1a
X-Proofpoint-GUID: UrqSu380ZoYOTGMcJm8_L7WOAwMAxB1a
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b83a8a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=GLuZV9TbpKr0kWuSc8UA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX/Iz5OAITpRXF
 UK1E787jRX2ZpI+oxf3KH/BV590eBn8qQjkTh2l0cvdi6f4D4rX/3Zp9O0fephexg1c23Ci5dy5
 Bg9vG+kwEra/ArNGkp9LfyZx0N+CF6uTlr8GN0FJeS/6lACS1Hht6Z+U0/QkCBornFzGa4PlVg1
 wIq3pciOdoJfmXBJUtjZHo1FMP2K9qTUlAztRQgMl5m4R2w2ApdqmKHfcat6tYUKwQdeMSzVLtH
 dSgX61+tS+QS4pecrNDA1R4uYqHvkOVtqkBxF/s9V3ZuFWGyNIbAUhr7JGUdL9inG8ScT0TANUb
 gHSG+fcwUE3ypENgXtFsJ9/LycWjsYy5uU6JBgQvByeVqFbwPbsScA0sIu5SLRwORJgoi/Fz/Ua
 /kbguCi40k7j6cw9KEadCeX4OFDVYVAJ3KAhl0B65krGlPQQaODwVbggHglypzRVaTuVmotrDMi
 2e+p+P7Py2bVFGn+TMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_101451_232203_AB28C94E 
X-CRM114-Status: GOOD (  14.55  )
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
 sound/usb/qcom/qc_audio_offload.c  | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 01e6063c2207..38d36397bb40 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1927,7 +1927,7 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
 			      &uaudio_svc_ops_options,
 			      &uaudio_stream_req_handlers);
-	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
+	ret = qmi_add_server(svc->uaudio_svc_hdl, QMI_SERVICE_ID_USB_AUDIO_STREAM,
 			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
 
 	uaudio_svc = svc;
diff --git a/sound/usb/qcom/usb_audio_qmi_v01.h b/sound/usb/qcom/usb_audio_qmi_v01.h
index a1298d75d9f8..c7eee03225ec 100644
--- a/sound/usb/qcom/usb_audio_qmi_v01.h
+++ b/sound/usb/qcom/usb_audio_qmi_v01.h
@@ -6,7 +6,6 @@
 #ifndef USB_QMI_V01_H
 #define USB_QMI_V01_H
 
-#define UAUDIO_STREAM_SERVICE_ID_V01 0x41D
 #define UAUDIO_STREAM_SERVICE_VERS_V01 0x01
 
 #define QMI_UAUDIO_STREAM_RESP_V01 0x0001
-- 
2.43.0


