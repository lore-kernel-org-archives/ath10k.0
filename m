Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688E3CD8CBD
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaVv9Eurf6ixxwY7bJNLCZAXbfQRk7/8Rh3U8IOXpwA=; b=02OLxUykb1337xX3Oj2Tr4ndL1
	LPkmpB8dsnGc37hyb7GVFXnR44DgXEQRDG7f59XSs03nzFaOWISdatwsl6g2QyUroD3satert5C5G
	Mwj6ge1xDPceAYJVUPQXeDf1ceCCnyBQt9LBf8++H+g9snpjC0/7FapId8ZUaPUQ6fvMm8IgvXet6
	vWxeJplGXKVJBlyrKUjVNwewbDJztIx2e67vP5Ar+p2FATYiVIhLfZJ5fl7dQSATaBgM7tFozFTNJ
	CDEaWraGPzxS5CFO5ayhcDzfiBObD+VuJ2xwDbjaTCBSABytq6AR9fc5cCoLgsRFNimOF0Hhwis6M
	Ybrejp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrH1-00000004zj1-1fqt;
	Tue, 09 Jun 2026 07:53:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrGy-00000004zh0-0UVr
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 07:53:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597PfDH1973170
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 07:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaVv9Eurf6ixxwY7bJNLCZAXbfQRk7/8Rh3U8IOXpwA=; b=oGK78Hh2GvSSk3nx
	gRnEthzbKV089nIAjT+pSAu6UIWXHONVitXv+kCiYNajab87B+rFJbZw9tkGCq5B
	j1v0xQtK8QFmGL4AiAHzvO3DrS1j7d0IIx35SbMpvtzTsRXJqzsPsFplwmJ/7Uik
	xha+82hUokTCipYZ1DCkQE+tum05qEMgwTeSbTBu7/e0n4Qky/Kv7swLuSX18C0g
	g6uS3XehElds/iQla4W4q4foq9qDeMYFes1lTTi5O9+qZi7jVPiUZhNLFx1xcdtm
	WR4lK1+q0aM/KbvRlQQeCaaUEpY4u+rq/tDaV0fQr19uQbHeaLK8b943DzeCPHc8
	vbkc3A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeear38p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 07:53:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd77414afso70926316d6.3
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 00:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991598; x=1781596398; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaVv9Eurf6ixxwY7bJNLCZAXbfQRk7/8Rh3U8IOXpwA=;
        b=Vq2++SOxhWSSmqEJMaFbjoj7vVw0AdOfGEjhzkVM9zCN/AQmrgD5SBX51EDpNCuFPy
         5jmOZIPZHaDIRALL4R8DU1ZOAvD8oC9Abhi/Ld0zleFP+vdp+kbiBEVlcJYo0oTnjkI5
         +3HMCL9EQNmjKXov7C0ic9tvOVIzotu/48PwMU4hkzZgaAX8mnZ4psGRzqeNFQOI9h4n
         B77gPHIXvVBhbmBSI57+cp3mbR/J7Pung8kVAlpsYsXqS2V3885hggXz9KCAapmkx5C9
         K10T5sv/u88UTWuObm6dchlCI2j0ykmbXhQnDEHT/u1oST9HelAnX45WTkmk/XjzUGh5
         1Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991598; x=1781596398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aaVv9Eurf6ixxwY7bJNLCZAXbfQRk7/8Rh3U8IOXpwA=;
        b=S/F+ZGOLUpyax2A+xPedas7keBMgqUvB3AaeehSfC3jvTV0L3m7HxYYRyWMW2tWBKX
         Uc35XgJ+szv/lRk1XwC1dJbQ/JmE5tIVcrEc/cmy/ZFhRlAHjdXI0WA6vjLlydFAGzXe
         cHCDY4zi5M5/6DXfSthzkDrGan8WOpQOMvMQBihK0M0EYsrkf3WY6Y+uOICkCm7p7NJJ
         SH0CgiFIOEAc72ElarQ0CaKQbk+erFqL+STmHcmMnjswNzfJWdej1bMVUTrRqvlw+I/+
         Xk1W3MnLIyldeDVpFAPZTgN9F14PKO8dXU+q/jveIGzQP99hQF54QBj7Vgmao+G1aSm+
         sCBw==
X-Forwarded-Encrypted: i=1; AFNElJ+DVdambEXCE9RV5e0c1gilDcVBXc/NwotuTgm5Y/mdwiVRIdk71nrQWu+g560C7jqwo1H1xAM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9CMZRBKDh0hR6/KV1mc01bG+Se5DLAXxmC0HhEQiIAgsQnPsD
	KyaioW82T/9Bech6cZB+FPfO8QTT+8w116ujGvLpBZ7WptZ01d/i8mzzT7aD0rSC+WbARxL/2MN
	B+2XvLyR+szrfbOtjWGGbrYQxipCUUli2TODDWBD90zBTe40nNm/gLAgMiQ677T0I
X-Gm-Gg: Acq92OF4FogWw73MsP0CnSkYoPHjfzRarRgWd0PfridTC88wQbDBDjlCHk2ZHI2hrIx
	AEdXdzkdIv2bPJhle7tAdpCY0089g3NdTSINQjkgcqHUzMKPCStyHsrKGns1L7j8EfV+7I/+MTH
	0tru10Oi3xMOpOMonvVxYM/jdMbaXiAZSMbPlYh8E79nah6bQcqyffB2N1uuOmw97Xa68Jr0L4s
	CLaGnUb/uDx8LC+60Wk5DBhQ3M9cPCcnap5ptzvPYhbhiCxzpYBlkPjQbltOSQQOLVe2IhJxTt6
	s1GnpaN23gDLayznKKBvegH1zGFLHjtxuynGCntBx8xE+nb77iLE4iLp75SxGQ8B3AL0YfY95/K
	0K2vgXXyYU5okGEB0C45sfbM8+llnvOvIBNe8qXan9bFD8rNQRh01I2hR7yMB3faae15ItTBU7S
	KpS7EnVJ1hVWFtxsaxveBh7UIJ/sFbRAoaQfmXx2yBHaorXjHwbl7PU+Y/qBkpxj0AL20dfBAVn
	VLm6u8bLv5v
X-Received: by 2002:a05:622a:1a98:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517a9efd0bemr186043271cf.24.1780991598485;
        Tue, 09 Jun 2026 00:53:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1a98:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517a9efd0bemr186042831cf.24.1780991598097;
        Tue, 09 Jun 2026 00:53:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:27 +0200
Subject: [PATCH v4 2/8] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-2-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 6LkZhlCBlYH2LY06ST_xJsZGUnfwaWy7
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27c66f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfX53da39a577N4
 LEUR6j0OARlgPWBqH8FmlF/gR3BfP5bsbXg2CKeer0Keez63A9To2zcymkS8V4QeduxTm5kKwI0
 jBM5dAJEyuJTnzrfzTKNdHYYgaccGv5KPzFTcAUGZEqzon1hotqYyXG3s6rSgmeIXcrftILQoWZ
 doSV9bNSPzSSXflzKyQkZfSkbBh2jhwzELn3eamWLMFYeQT3QEU00MvQVapoWaK1h9QlQwgroSx
 4p2T7LpDIlcxw/9sLYlM7+e3fMJrCqaWZVdnVtcsAI2Qex/USG9DQlVcVbz3F7r9IVcNPBicSx6
 e2HiGQTALlEFEzTrD6ggzkaRECznFbyiAey3fXkn1jxPUakLUMk/dyQw3QURYNM+sY1T8pXdyOM
 JHuhrgbinTECq1Q2FxYp56kKsMlbNBnOYG08/7Us8TEl7RNinmlZY7PqUd5xESnE3Rj3n5kNkos
 g/YDij5FjODbNQ3eZsQ==
X-Proofpoint-GUID: 6LkZhlCBlYH2LY06ST_xJsZGUnfwaWy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_005320_287179_2EB4192B 
X-CRM114-Status: GOOD (  10.84  )
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

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..7391df5e7071e626af4c64b9919d48c41ac09f1e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description: |
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


