Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B178DFCA191
	for <ath10k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=; b=iFbp1Xp4ogVm2MxiGUVC0BKv3D
	+SsvAxaP2R6FRZFKOTdQaqslAr+T4hBtaaS0viRmAGC9cAllX329TCBjO4Xk3sCvwGqVvBM+p4G6O
	j7a2yAC6LvmYEzl2V199QGO/SRgSwM6p7pCzV21cDZSaiwmKFnPBz0DCLUahnH9eoFYp0BAU4T8AM
	BA+KA2vB3nFDSGEAqnWFGIQxdBgxWfzQ8pvNqkg5N95501KGKPij3uJ3aEwBbn1wwqdyj2AGI0PP1
	2PUjz/hQTildgR9KvxMCNYRrATeunaogw5I/9vZ9/nw4ANsPeXmfk5eIVbeOZJJ8MAkrTAwaIL5yp
	jLMWw7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjg0-00000008HCS-0go3;
	Mon, 09 Mar 2026 23:06:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfw-00000008H4F-41zm
	for ath10k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=; b=UOOznTufR7rRDmicpTnUpsOvxg
	OQXy+oci05oo2UHeZeirwesvvRl25ZvhISuG7JfTf6Rep4IbMoR2D+Urb4RQW4+XjaegsyxbmWPbM
	usoD817DBw30dOoZF3qwg+C9I9gR71ck2FYtMHuwlYmXxbHiA2WiqI18II29Eo6v+N6H4u5mYiiw1
	I5BZaneKpZPPS/1UnC1ksEvucd9vfV03rOjqKJEwOUsGJ8tcn5L2XnjMJhb0ii6Or46JAd397LMPW
	WdEQJ88Rb/16CHi9g164dR2CbJTbQ5qvRGLRmbXbRIQym6kLQnMWUGlLWNhuAJgD3ytnynJVypU2h
	M08Jg3vQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfq-0000000DJqr-0lLq
	for ath10k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBl40296194
	for <ath10k@lists.infradead.org>; Mon, 9 Mar 2026 23:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o+8grnDyx3a
	Y04II25yHs+DhlQHwGyE329UXeTulGfo=; b=EnmPJzaXDKfHbBKit2i6OzOm42b
	lS7sFWuQdyT6nOJsixiASHIu6RV+GBs7xstRQSxbPvjcChqJJ9XpdtxtEefvRUJ0
	/vzUYoWy6seDLrKnbfnBzBZ7VHyqTEwYNlJxSa42KZQ35lhO+qqrwgr0MhgF2v2u
	XIUOlYcxN0l/SiTaVR+/4vyGrXSRUNY4xGr02/UBTsA/bgKRuSiv0R0QaNzhBiq4
	c9maWi3bGH5wkaI4/sbRIvQcfqVK9l5BSHbTV8yOOhJoz5OsXsJifEfv9WwX4F3p
	jdImAMabQQwyG3m/dV4KrPkxvDG2ukxU3wSswURC0mqLM6NZKINavIDuW5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1rwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 23:06:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd900cd3a7so454500485a.0
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097563; x=1773702363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=OnTymdilkYNAzzNqAHl+rQeqDUDAFAorSl82sM4b0Xs+dKQSerTTIPuMWAIkTa/cmI
         gqaImpNvr+KJTpLOR0AoUVSm9RY0WpvljPhHvH8Z+1Cc+jUuHCOZkniv8QpR4c5obDb7
         f14BZ1ykpWnDZyjJcNtzePEPdRptRVX/XVvqFt/4iojXppURdRWyQ5BzqElT7CO4Ru1c
         USn9jH6eFl2nfk5YhZo4cDYWTGa6+zyt9ifJmgsuznXDPaoe8XyQCVo69ymys04Y6oJt
         P+9zmJ2ALL5n3MBgaPyRlNJJIzC2EedupVMG/uC9pKH07xfKFmHk8p03smo/nJLvEwjs
         TDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097563; x=1773702363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=krVj5E7XIOR2SumudM5B2fUNnlXM/ImXp1UupDYGEu/v/IU7C+h+r7I4X9UDE6osQG
         q7De+paeGgEEC8qJXZwAhDMxtEg/0uuMiZeo99TE7M0ubXs7AUOZ1wM3vP2lwQDedmKV
         YtMl1YJ2AKvfWmaX/TOx5jYdHDA9tkhgvLKXeIlg9Ipy6XQ3XuQb0ASdqpxwAKUqsNtL
         eXRhHWnhl3f7ZbiTDx//sT3UyTgu41YwzwvWE0J18R8tejWMR3EcRg8EWs2wY0sKzNEF
         ppF06IhPON9mwRn40z/VrHckgw8bp0ZQ3ZQOxDlbJDuLbE+cQlY4kdkM1apfNIhTkecZ
         ZhgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWySROB7h9e4f8Dn3N1caYLaEnWtSQKrWGQRBJk8WigxMDbV29DI5kMIRy4ocRqhj4QvOmbeJI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8AbFP8hzl7hz4ozn0Iy/mqFpUnlgoWyYv4Cuz0l3NsVfc6ukr
	5BsR9EJQECkYEfviP7QA3muvRJiyy66pobpLwc8Rr+GnXM9g7Lfffp0k5C0GeEqHncx7T+Unsbi
	zE0uuiuuNLiJB5zGkWlAL63haz5m+S+D2nmtlrMBT6MEX/6tOqXRVDi3qqhFjIDLU
X-Gm-Gg: ATEYQzxCRETtt4t6bn02N1JGQqM+3wonOHZvYmWcSHNKu7FrIxClKyrFXaCSu4dZUXk
	FD67skw1Cn5640oPgsR8N8BkfVQ8Rz4EVSmCuSBP8WrJOln3vQnh7yY0CU4J6qxsJ/IWiGnP6OA
	XXhOpWGDZeGfLz6dD/l/wAm6QVJFITy5WJz0yrQX5FFW6MnAdXiSHc1RdztaprWSVhaJwMM482A
	BslppF3LPAjZiyIqMDUoiGVl33tNWA4vL0izspviFpqUBE5eY2Ty8k8sqrwO67BmqFPorUQ2bEB
	w//HJeiD/Kgcg/ngkjFw1ThFux/H2NQGVO8/4pZha6vecTfmmXAXF0ZqLr9JtDwlcQ0t1GBGcOa
	duVidlzTOSOQHzaSCmYV1TYhO+swmymrb/II6Awhdmp60LQ0L+g==
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568427185a.2.1773097562694;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568423485a.2.1773097562240;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:01 -0700 (PDT)
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
        linux-sound@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH v1 7/8] ALSA: usb-audio: qcom: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:36 +0100
Message-ID: <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX5GW7LBLZxr/q
 7nZuWCiDfUIdJTYMd51ze85asLgNlgBKqJO2c0YGbHT51aS99iYmYggFOwKy9lFXG1TRBNxD5fa
 oRuuwcvsBVc1vVQeGFr7C1jj1UWi71XMcf1niDGe4CsOdnmHuccusx0vUUX9UtLAUNuvvQfSr4G
 DTyQ60SBXDF1lpP+x8QAFa7lNn4rE732+fOfRtJX5I0BpATO9z47vTvHZq5w8qwdNqYDZMaoB+h
 YByX9e9AUK9ZxvUefHz/E5srTDBFBHT+SwUn6xc7zN6vzxV0XmcNwWPcmBWd+9hX9oNVnIGvuej
 6Q/KTxtBvKHqLqeQrDjk+E5rGe/G8xyj/2lTv/OFiL7Nnf/CYjVpMsFU7HKlM/axQAfSC9GnUBr
 7AVguChcGT5+qZ3gmp72+kMK/jMLYRV5ff20nJKCH5VpDGq0uFbmsQKe61d7NVwpN+J6LcZSRBq
 wqzwak1fgrCKJ3pZYCQ==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af525b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=GLuZV9TbpKr0kWuSc8UA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: TheJYIm5PiPHKKo6ZXehyWLedNV2BrvJ
X-Proofpoint-ORIG-GUID: TheJYIm5PiPHKKo6ZXehyWLedNV2BrvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230607_729708_32B917AD 
X-CRM114-Status: GOOD (  14.98  )
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

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c  | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 510b68cced33..bc4e1bdacaa8 100644
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


