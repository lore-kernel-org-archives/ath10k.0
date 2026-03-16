Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693C7F53D82
	for <ath10k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=; b=bw8leq2ahR0k3o8jOCn1+lvrUp
	9YLuv8rxs7/wC7AjhdHKN5TmmX6fMbn81jBs3b7mMGHxiSFXOB6E2pSRTRjN4DTXbipyxCVqmLnx3
	8hG+BPbO0YA+ptRx8uXhSTgG5PV/X8uoMJujPXBD/XFjkR095pxREtldrlNKpYf5R9yfOwSJRIUAA
	7oKWZtbadr1yMBabx7aKusu7CFNQ9pHixsAqPpx6ch1kFOyCV4Ir9yFrwFgxtyRdY3wEpD5pKVRgK
	xmdHydF1XcjurZthRsjkZ+i2y/2a1b54BXeYLk3vT/WI4C8Zl6snL3myu6wGc9hHFVb7cYiWNLZJK
	1ygObx5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWh-00000004WPa-2YQj;
	Mon, 16 Mar 2026 17:14:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWe-00000004WLZ-3mlH
	for ath10k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF2f3k1534032
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WFXy8rqV6ZJ
	yXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=; b=P3DU6dl3c9C+mKOoFj8fLnflTRc
	E4S7OufGIBneH7YqP+NWIVKQr0JamAB0ccP/h1Fu1YGnyp4csg0npjgoFeixW8JR
	Vxl/OXVJfgmTwzF4Vn7J2fQ1stksLuZyNanswJjCeX+tEvcw4wn+3J9ef+QTeG1n
	nsaaszMiZ/kCXgERsFktG+NFb0XemxxH757PA/JfVm3NnNUUQzrGnDx49KGDygK7
	pFlzs5B2WwtrEU11sYGr3Wy7XXdUOW1/NAVcRbrPi0lKxckc1uUQdMkQ34QJ+ljV
	4HrjH64gyE1cItzRHI72edpT4EBGjx60xlN9Izp4/hJP4ItIfIEv51VQ86g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k0gxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd858e8709so5191310985a.3
        for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681283; x=1774286083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=;
        b=CwiMDsRixXCWSns9lEm98qqzti/zREw61tTUTnx5Y7Nzfj9aEm7i296UvHBVnfL/Vk
         6qR6PvsZudccFn+FFcWspUPKzzI0Aj4kamFKohny/GeNrPpLDePYfea45DInRdzRGG45
         WLu+McLmfl0nh02VYB6HT0cK6ZIgcTzjCAC1jGLudj0+eBk5mPm00qGdB7dUVd0CEDky
         XQornDltC0JRGGH5ltks2Hnkt19JVDaI7nb6eOXOULRJ8GwUYJcpoA0bA6he3DS1Ny9i
         5owxQCsjLySeRZ5ebIzrC736ReRkpVmHYrV55pNO/FvgUssRHyjQWXWjbSxrZnk749b4
         cQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681283; x=1774286083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=;
        b=hc1Ti+MSrTmuRHb1wL4VCWpYwvMltOj5o87TiIe7QfMFdht9zcu8NjxoZZzLTR6AEU
         anG89bi3inWT2k1wMlL/MMY0bYycpmuKqxrmdXFLKlWI2Q4KX7aURBS2zyyp2RaaUDea
         sATFGfz4v42Go/mdbmgtNJPNW+5ZnIBLCotv+qSXQ04n2IzeJjYE7Od2SIIe6xHDz2cP
         /vOEIMcizD0gcbCwpkJRoiLA2v491D0UQDrNyR3pUOdkDC6YzN76pgM2THEUBdclRKMG
         aAS5lc3p7Hw3P5yWaYd1vkOhNpPUNCdahZ9p0Ssf4CPKdVXOM009VZbv2VzXpGyw+8SF
         kX8w==
X-Forwarded-Encrypted: i=1; AJvYcCVZLYddAhzPmhZSVWi3nJGmyQ/SURf5bN2e//nxE2hAkoCI0ScQ+b75Z5ddN6FEVr6+gq3S8FI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCfgKkKNlfSyIKkfu3N3csZ3etjuGy/CoKjmlPxmcLEvxEnV58
	RjmShNru1Hu8s2XCGAdKh5osQ3BJA/DOcEKJb0WVbJ+B7UzQoboGxVUFRekLkyWb+XD/TTNX1MP
	P+743xY++QZqnldHjSZjPzjTTWgHFZUVg0b43KMsEWNCEDSdRqxm6dKxTpKPL0M4z
X-Gm-Gg: ATEYQzy86hU+XBRhcuMWwTEXLc5JBogFdAdF3BNjNTd68w5f4Cw6g5hMDo8F+TMiazz
	N+f/dKEgX32w8vH3E+FUTyiFMyQlHSasDN2lBlvBANvvM1fQBz22aZPMi7u6sKz3ovh+dhtHSFw
	VWapZPGn7KomaBr/H880lcy4tD5FfS65jdY597C0G8/uarqjYaCBgDnYu1+t0Gi0yipuuumB6ij
	yB8gIc6LfEDm4T2QFkNRZhJ497LlaHm33BWcnFPD//w3vli/nECmoQs7+M/B2jNsi4zpSwrZp1h
	7Sep7O2kWoZJteaxuRaAND87QgVhP4wYdN0Kt9pY2amgsy6f/V+xE4rHMHu5vtAMbIbBFwQuvnv
	dJBVxVgr1tpB9OdA4nsVoVJ8GEy+7Yf6OLP5JP1T2WqfoalvbnA==
X-Received: by 2002:a05:620a:711a:b0:8cd:b3da:5b5b with SMTP id af79cd13be357-8cdb5a4b098mr1839478885a.10.1773681283378;
        Mon, 16 Mar 2026 10:14:43 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cd:b3da:5b5b with SMTP id af79cd13be357-8cdb5a4b098mr1839472185a.10.1773681282736;
        Mon, 16 Mar 2026 10:14:42 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:41 -0700 (PDT)
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
Subject: [PATCH v2 3/4] slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:13 +0100
Message-ID: <20260316171419.2619620-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b83a83 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=PhtMypRRY1SmXJO8NnMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX6P0uwasIymUt
 xDu6ytCbWBmbgM6FMYifLrQJtf4UfRoZB/1yFbL/w+CjYwNe94+wxKIoXiW0CtCfAlKQVF2joHC
 9oK6HP88tNN/8eSLxOUArG4FZmvpx8YFUXsGN/AdEgipXss3zxrG7PTOACM7bkk9823nZZKIe6F
 2EUtfcHM2vaFW+Gb6+okxSmFPsWPQFZxsalp/5GIaRAzWbIxyqgULOFxrDxoDDXKqg3oIfW3hLF
 5VucFda9b8IndF/BQZeWRW4Cuj0BiQvO9KWDwpjNx1yCiFcNXg58coUnPQZExIQuxlZvdi1YTIm
 Noys/J2glE2XRWCwDA6qB37vGXSxoZQdRV0iKNz0Mhg5dFwQdQozdmKoYZtvLSu7/pCacbRcdc8
 T2aZOSWPUqiqW5H8mEJh1vwmsaH9+2TgrNR3zyPW2NzEU3ai+OpWmOd7HSGIN1Eh8SskBvyB/vH
 We1xRPU+Se+7Hf+aV9A==
X-Proofpoint-GUID: 5gZX25h79Bu-50T3kBSHyC-xzFkGOoAu
X-Proofpoint-ORIG-GUID: 5gZX25h79Bu-50T3kBSHyC-xzFkGOoAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_101445_060234_7148FB5A 
X-CRM114-Status: GOOD (  13.92  )
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
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..0b88b8577bdb 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -48,7 +48,6 @@
 				NGD_INT_RX_MSG_RCVD)
 
 /* Slimbus QMI service */
-#define SLIMBUS_QMI_SVC_ID	0x0301
 #define SLIMBUS_QMI_SVC_V1	1
 #define SLIMBUS_QMI_INS_ID	0
 #define SLIMBUS_QMI_SELECT_INSTANCE_REQ_V01	0x0020
@@ -1408,8 +1407,8 @@ static int qcom_slim_ngd_qmi_svc_event_init(struct qcom_slim_ngd_ctrl *ctrl)
 		return ret;
 	}
 
-	ret = qmi_add_lookup(&qmi->svc_event_hdl, SLIMBUS_QMI_SVC_ID,
-			SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
+	ret = qmi_add_lookup(&qmi->svc_event_hdl, QMI_SERVICE_ID_SLIMBUS,
+			     SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
 	if (ret < 0) {
 		dev_err(ctrl->dev, "qmi_add_lookup failed: %d\n", ret);
 		qmi_handle_release(&qmi->svc_event_hdl);
-- 
2.43.0


