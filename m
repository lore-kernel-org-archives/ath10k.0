Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9046AFF886D
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EtjVuK8tfVE6lW6LjScpaxrDNQ+sqkyAA5l5tfy/xI=; b=wGsXqUJMNgs/Gr6G7VECgGArZ6
	dbxMulWYwcwJoYLQdRrLzFgW2tVZIIH/Z4Dl9s3iNRRERf/W8QyIrqiNebslXPOgJBQRQAWGb63uO
	R11oNk+jt+XWLgtLn1ef1VivzhwZC0X7798RmYGiMdgu9PoDay09XzCcxXkea3E4eIuC8deANWf7p
	mb8bs/5LxlYde3UL+viXxcterwG2eEEibcQBKsQuNWUetdMNkPFIhAga8iDf7JciUG318avHdwn7D
	q/QI4TEbYTnWWgIRBmRXRBnmQ9FvjA2ZeN+ST/qf9axzWj1vGo2FrTNif1k3CyMfbYWNpJ37C3j2t
	/bxitClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLT-00000001dkK-1JoT;
	Tue, 28 Apr 2026 14:23:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLQ-00000001dhA-1yJm
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SACOdS2928897
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0EtjVuK8tfVE6lW6LjScpaxrDNQ+sqkyAA5l5tfy/xI=; b=pV6jaFMtwD5NMekP
	nZgGZJa9bXjPxtiaCr3uI+//DV6UjSWPh0Ypf0f3UhJ+BlPYQ4HFT0U5Quh/yDYr
	V/aKdxN5iEj9NS95plMyA8u1V2vutmcvrpa7BL2JKvTXhw7ARLp9Sm0X7Pe94vJR
	U3SAm4VnBGjaBrBuPp9P/phSMyJS/yrNsJqcKGHH2BVOyBc1mdHkMG+Y3jCJJKmi
	I+LGPClg/nEkiiTtCBcacVkYHsOG0zuLfH07Q3u3OB5BaC406zg2RxOEZ1uam+ta
	siRy78avZU1ZRgTIOGLWuaPy+Yfu9ffQ3Ec131pVTWxFPLP9IPqwsyCIRBiPqUeT
	92h/FQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxh8wrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ef11518d3so20082221e0c.3
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386203; x=1777991003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EtjVuK8tfVE6lW6LjScpaxrDNQ+sqkyAA5l5tfy/xI=;
        b=WTtFl96wen5ttaXbo5f7zBKjdV6WtFhyI3TvHr07R1PT+3iR8or4CAnUg0H0n8vH8f
         jdfVktbVpYrMTyqwzSdFKaoxSCRoovZfxwutU+RRz5E3BYWNWh++mrl4s3t+nYlFrZeR
         NkkTHZvLxNC9dIXRInKo1GhRHfOrbLmgLx0qmJjEvuCkjPSjfSVtkUvVqy3tLybolVh1
         iANcuGvTV0UDzi8EItJso3InpChrCMcC8D/k3DAUpp6vbTKiOxZp3zBm+jQXS0nJGFCx
         6JihPDgv3dVjjpEs9jUXvjuVKu98wnZ9Zw30AnwaO6zSBrT5zaIU5C/JdZpV+OpXBZ+0
         te7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386203; x=1777991003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0EtjVuK8tfVE6lW6LjScpaxrDNQ+sqkyAA5l5tfy/xI=;
        b=idV4f5lEnZN6RTrHgVl4mzKku8Az87ivVMca7P5Stko+f0k2rDi6apCKVroIxVzmnc
         CzkofFWZvJ/IkUHkTX/GdIbEluSOvkI5X/JmhBrpuaPo3f2eNwaBb0/IhyFkZR3GrpQr
         89Tj+eRJoJEdhVKZA6iiUqWY3lOsadJ/FH7F9z/mIHoXmS+Qa7lVm4dWoKaDiremsMw6
         gcevO3hAa4DsXudAUYlyse7xDNByv3Y2FaXvGteG3d4t6V2hOlKD9o7j77sgUEE8pqs0
         rJtKfiqmj0yaw/aqth9JsViMHtg+hDbbRKWTMfkRPTJzyBaeyS6OJjEsYcxwMf2bhVq6
         dOHw==
X-Forwarded-Encrypted: i=1; AFNElJ/V7VctrkNbijJcy/pYuRXgt+Aqs6sXjYNWYDPMA+kmco2uvONtdlmBxV0DVGzLlN1+X5tACZY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmpcA3PPMKLB5qNb/4avC2F76apU/+a2aUn8bNiRrzv36SCzf0
	uEWnAJw4d1UMVv6iHD9MVYA2A4oKnc9IWt/eU2O+peOF75GEz5yayzxi7c8DClXF7m8UeVQk6sg
	rorAcFBQE2eDtXSVi7pdxjQYiZ2iynK35/ANMvfmTbizA58fVHRTvurTFSfttvMTD
X-Gm-Gg: AeBDieuty7yajYuw99+uJTQSXN/3Avs1HwMx7PhCq0Cor4GtKxJfOTmeGsGRvZrHw0L
	ZEpLGoPUuH0KIDTu36KBcqqFDuySxMtrZ40MS+HtC6rBd4pBm3HDQcRS1ZLYYVkqpJ17K+SW+LC
	Li5SmeIP0uZfaaIc5JIymgNL5YK5HXEGPoHdo7SpZE+22ozMXz3PcvJQLTgRD4tHWXvMDlYbySS
	PTRxp7NpEj8ixqD8R5eRDlZQC/7yYl9PMseYbszPAfnx8AWgbi9eqM35aOxr42dafta4Sf8gpux
	7BEaDjDxCNuYh1UFviGSwErbjihSLZUCJuFiPlRPseJKa1qYcaJ58HyX1q9gWbphnvNz4Oyj4Ki
	NvaPvjTYuiZf3qV0LhT3CFpOTQ3Le2K1NLJkdio1xZ4Jq0QVxnkaqP3ptWevv/N4LNibhjazxId
	M9lC6dtsoCiUKY4bS4BUeC5FDSQ0I=
X-Received: by 2002:a05:6122:3781:b0:56b:5893:d042 with SMTP id 71dfb90a1353d-573a56a12ecmr1637598e0c.12.1777386202776;
        Tue, 28 Apr 2026 07:23:22 -0700 (PDT)
X-Received: by 2002:a05:6122:3781:b0:56b:5893:d042 with SMTP id 71dfb90a1353d-573a56a12ecmr1637518e0c.12.1777386202261;
        Tue, 28 Apr 2026 07:23:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:09 +0200
Subject: [PATCH 4/9] dt-bindings: net: wireless: qcom,ath10k: Add NVMEM MAC
 address cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-4-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX7hSoMNhDKWqP
 ngUeLeaQRavh0ScCcWOE3Sh1F6N2xyE+YyjgQddfHLbMOb9dNyqGL5uqRYghYfQjhnXn1AyI8vi
 S/LVaofhpLG5id574JDwfSnqumHSL1zAKOxhFbcOsae523cSAVtkN4ZNPxOzwOxxNL3IYEx95dW
 qzF1qXG8qItXs8oIxuIbAT+Ezd14wrWE2GOXL73uPvYWRP45Ut/peax/g/OjR72UkXF6n94Lj7m
 qn8mW0pX4heSPGotOK7z/O6nCxqvmN1j318uz8Qh9Sdjo5sOHyicD/ke43r0Z8jeYRzSoAKD878
 /rkffhTWnaOROOw3BG5GbLszDoYNOcB0f4Qb/PInKYxAPXi+eKFmRqGH3i+KYf5nNm/k6NVgBCM
 E/M8xBFapeIszd/OPFEgby/HfsQtWJ/zwRIt2kSMtkVywPC7TcsfD4tego5BMI990HOft/hfvCu
 S2HM7tThfkQr1NZMrQA==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f0c2db cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: cFGy2g9a1vdHjFd6Z_AADpWayIpjyBXY
X-Proofpoint-GUID: cFGy2g9a1vdHjFd6Z_AADpWayIpjyBXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072324_682743_E6AF1A62 
X-CRM114-Status: GOOD (  11.50  )
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

Add support for an NVMEM cell provider with the standard "mac-address"
cell name. This allows the ath10k device to retrieve its MAC address
from non-volatile storage such as an EEPROM or an eMMC partition.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..7155d8b15cc145c3a7d703db0c9c3e056a54c07e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,16 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte MAC address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    items:
+      - const: mac-address
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


