Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C99CD8CA7
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 10:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWi+MtCOvdURNk0hMiFLYvRu4fS7vb184xBw7cGri0Q=; b=uL5FVukgYDBdp2RJW73aavNiMf
	N84WwARjpQNPvoPLIL+UiuU7J4lnqFSqkEYb3pBojCLFb525+FKofdA+SOdhWwvFw6JoGzu+GDqMQ
	Rwun/OEYtttKbmgHYVzvUZytkLBRhIYmporOHawxsiv5He4nCetwmpykd7Z5i9OnJwrzolOcCw3Ex
	tfkeeFFpbdQu2b90+AOduIo90q8myg1c+75cfiGv4yQ5YM85NMSNRtQMK4iSqheT9fLVAZO5aGYGh
	Dyy8MmFkyxyis+L5sJtzMTBsUOcqN2dYN5VneucLX0uvMpCkd5JpaN11q6aE5mW8+t60QCNUltYy5
	g0nCumUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZC-00000003Mbt-14Wl;
	Mon, 08 Jun 2026 10:50:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZA-00000003Mb6-0dQA
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 10:50:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658AmixC2992400
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 10:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWi+MtCOvdURNk0hMiFLYvRu4fS7vb184xBw7cGri0Q=; b=DIbofuVLZ0OazGPY
	eM5Fx7D4dpdBevCAkSGgCG4FSIbgCFSVwfZW4LCQAntAgjPxORVNho5v1DCgfslF
	W9kj/1D7UKheGa6LNYtUnNLQJOOex1NVWxTPw0zSfl2lx2eX6JCUa7+aDO+bKy+c
	0rqCQHpy+l1MKNyCZSbY1v3ObgIN6qzypHWDb4Z0yV4PFVe9jK44lABrGw5Fjmsw
	PrwdFTEvzBigxfKLrzRJ5wPt7S6hQ3nCmbvRqXaFkcchzzBXhc48ggXw7gBo+OG6
	LwmZ7+R826Z8AO3t306GnuKl+gyzgYPbqTIR6jn3mGtVnInRVeLXvRIVySfZjkUY
	HJaGEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj807k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 10:50:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517615db531so115541611cf.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915846; x=1781520646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWi+MtCOvdURNk0hMiFLYvRu4fS7vb184xBw7cGri0Q=;
        b=DfFG0d4A2LkX6i4xkgEhBTaUgvL9yq23f8haR7ZLOCLbJRpDYi0W0yNz/8mIUiCSM1
         4kj/ngTCj++Zm8ksiWSWUiMzB0wqexADSBjtiNeeWN2XkQvRmut7yr3R2tpVtURK+hAZ
         /knrSvkwZ3xIH2IQLxkiu+z6Hi4RMojxlEqILM3NBZAMYMYXDg+GHJGaKnvr+u21hMjb
         3gaZOlicAuHwL/lG0AppDgEIZm0lmZeio2GZ8yEOyvwWkpDn2VkBaDqfFUjjezIlhPKO
         g1JHUiAUQF2ItlBR+PlZTSeS61v84xGJshbmgBmGSu8VM4aTMeQ9BKzb/XCexDZKJ++9
         MHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915846; x=1781520646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OWi+MtCOvdURNk0hMiFLYvRu4fS7vb184xBw7cGri0Q=;
        b=JD15v7LNRceM/ZzsM+p7kJRZxrv0K4OdM/mZTdAFgdh8vzU2vCAvxrW8M4vgVfOdmy
         ANMpk3AAtwmodEvbTyOTxx6/Tbsb9sXMhKXV6kKlWHSl7JYYTESY5xStsTq0Cy6slbFu
         cYTkEudfblzSiGrkAv5UCdgI745M2vguMRrW0rQHW7IudvKxWPXDHwHdgyZdlc4FJS3F
         qcW6lNDbUi6szDJOk0p9g/jEp0Q1GlA0+SNa0HtZIYJAKPmDT2kJkmYTdYeBexyO1bVl
         eGSNP1XiXI+8AN3CHJsA1jWrvyOePi/tIxzECKJNJ1s39DA6CGT5FCgkiT3zPXTeMU5P
         SNsw==
X-Forwarded-Encrypted: i=1; AFNElJ+OwhAIuclDYAmYgRWVfUxE2sBR/2FRKV2eKZ/j8BlZPUjyXn3qBYi9qsQbwjqD9vnUq8MQul4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyamTlqJGB/BPqva3LwNTZqqrfbeMRKflAuKLyCU45kNKjG9Kz4
	fvUPIoC0T+W4KS+kF2mVryosiQos6oH2R4X7OJBODWAGbDh8ijppB/BJk9poSc/go6U5A9xoqzm
	9IZNO3ZdfCrjeFMRVeozl0w22i7mPeix8fSUKTCcWrMZkb8BlpQYhYZdcgO30wj4Y
X-Gm-Gg: Acq92OFaxToOWeL3uidhfJBCdglFOfChbMLtQ85JYg/xKq3PsgrQsfZTitYhSoR+cRy
	9hGUbQwTDg4LUbZ/9FNoyB9Pu9bDbA0sAxzW/BWWQt6p0sxbYi2BZLWklDAiDZQweCNweDgdlsM
	W/zHoN6uCxNiQXmEPeHwaCBnIbF6VD4SJ+Ky0vYmTj4mkUYrM2UpKl9Y9RclpCELr8bmtTdSutL
	DhB+y3C4mzbSzlJcfWIReCzCe/iDgaNf0/d11rt1df5wLx7lS88o8gk26sBh1eRCT9eXrDHpvtS
	RXUaipBqTa4t6BGCXEJqosP16eD1uMF5H3HF0Otg/MH5J8moOJnwLTpTU6S8uuxHFlNntSVVv6Z
	+1TdxdEaUevIcRC4RGW5vN6nIgRx0BQJ8tie3r30eZN4v/t+pHlVeP8UyV3lDFrF5ZIbFtjR98p
	XlHM3+hrPIR+HLs9hVPswdeglWn0tVg9Y/h8a52aS2U7SUHAPgrOtoJm1Sm0stpX5pT5wAyCTj2
	O41xCrRSZ96
X-Received: by 2002:ac8:748a:0:b0:50b:6b21:2a83 with SMTP id d75a77b69052e-51795b7322cmr169214081cf.3.1780915846633;
        Mon, 08 Jun 2026 03:50:46 -0700 (PDT)
X-Received: by 2002:ac8:748a:0:b0:50b:6b21:2a83 with SMTP id d75a77b69052e-51795b7322cmr169213621cf.3.1780915846226;
        Mon, 08 Jun 2026 03:50:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:50:39 +0200
Subject: [PATCH v3 2/7] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-block-as-nvmem-v3-2-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
In-Reply-To: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: suqsDVAf0NX2MqzDWSgXrc88sIb2Jd1f
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a269e87 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: suqsDVAf0NX2MqzDWSgXrc88sIb2Jd1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfX8roMjeee0wSL
 +n18rTopOEangNeTxf9GZBRX8ypddGDqLeY5xgKa2UFXM0uush0ICaT72q4galKaZeZmUp/tybx
 ag68R5kWvwLlpgXsLebI3wZLYIddJ1AYDGhDz4vRwCkshbH0D8M/itWFp6xOFeqk8Ror+aYFXjl
 7BOAuEQPTVcBobvN/vAqiCxU1+FWy0/yPC9JHpe6nvtqaiHgMOgVvofEz+GSlUKBBJAg2Q1sXke
 mwUd/ZfDy5D1wComxkDQurUdjHEuV+o3gj6MzPMfQwNy89f6ue726yhpbUwRSGpIiPjSJrPH6ia
 nkvBDLIDNtgXTthjqlJHbA8oSQAYlDZ3wgotrqsQGg4BhJk9QHhsX+y03HQEZe0EBTgiGm0CDF1
 W0HXf4Qx1j1PQ8+GISACNtKBU4HAsfWleaoCIXjhZNgDdaYl/UkgOiwZd0+JzTGZJLlnt62JDFq
 UCeyywYf1+r+ba3yb1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_035048_221874_1D314629 
X-CRM114-Status: GOOD (  11.75  )
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


