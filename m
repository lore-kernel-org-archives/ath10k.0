Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211E1CD343F
	for <ath10k@archiver.kernel.org>; Thu,  7 May 2026 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8YhFkwRRG7HQCuWlp0zuKi3fIa5ZkmTd/FI4268HU0=; b=TfvYN4OhiJb5Gw7N7EGJ4xEBYS
	GNMofzUd44puvJfrDJQiAV677RdpavB0Qs18CfOMiLP9sYIXTtEB+cHFVLahFU5ZdV+9etW6NULYN
	QNkQ391itZFiQSJi30WU8sjRKfxe20ih4wEP1WDck2lvXHwhI1Kz/IQOcQIf5FEgzw+AJZJIQvm3M
	V4G40BbovAcIbRis4AodSkDc0jJJq3c2PAOQwpiiPSK8IB1ZgkzE3cM7dC+GJJZl/wA6aYc9O9LBs
	ztHrMmQ+XvpABy8h1+HrPjy18+YANNvUx9TyX1rf12tWN36wFV2qncLa9pqOb+jZjeg1XOwh8sHo8
	5bOAUk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0aq-00000004AZ4-02T6;
	Thu, 07 May 2026 15:24:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0an-00000004AY8-3UIE
	for ath10k@lists.infradead.org;
	Thu, 07 May 2026 15:24:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647FORIZ3464899
	for <ath10k@lists.infradead.org>; Thu, 7 May 2026 15:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8YhFkwRRG7HQCuWlp0zuKi3fIa5ZkmTd/FI4268HU0=; b=PHIaw8ljGKMKOyXW
	JOMO0FrKk7092/z3zBfZ51Z0eshaRXz/CQjQi3MqCNsDNbb1qyI6e1z8L6NOHnkr
	a1T9wEdg+HlOXoTK3j8BvpPkfYpIYnQpUUdIHv3nEYEtQ6QuuHUsOFBNOYnw/w5k
	G2dlYAXt7ffweosKr94E6p9uMOyUBDLi6BeLLgIrCIfN6eB3m4+vWiIyvLUwJqUL
	IeNMZtKS/iDJbuF36Egxpn6xYoL4qBCCYwivxpddkuSgwv+10CSYj8MbKhHJIe0U
	Vg0yh/yatuoRZzZWNG2qQ3C7Gm1F+6hc4NFRkzcjcFx6rUa0Rh0SVRfIm84CrLFu
	IbJ5LA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2s8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 07 May 2026 15:24:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-62ea6ff1ca6so709446137.3
        for <ath10k@lists.infradead.org>; Thu, 07 May 2026 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167488; x=1778772288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8YhFkwRRG7HQCuWlp0zuKi3fIa5ZkmTd/FI4268HU0=;
        b=NqHm0cLvFshXlsHvu2wSDl8MpFRedKglE9bEzxEMorYBdR+A+EQl1Nvam4MJ43zm6h
         hVpSzwH7W0giSfncPLhWUO5azcKmTAsk5FBmpZN6nF7ew7hBFPG5XGlUKwWphfUjz0Um
         SNjnVlNY3pxiO2VnHOrjBFG9mq+KmGqsmt/HuzPbCjvGud5Tu5esKO8Ip/HxUPnuDUpC
         ffk1rwvgL1GUs0QFKa9rRX93Kln6Q306caoPlpz09pvm6q3KdX1EQJJT9G3E898lag1E
         lxCZrUecwKfqgapH95UBm1TVptW1qHxy+qPCBNSRGWCJN70FLvB6ly6UVAaVCCMuPJTO
         bhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167488; x=1778772288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z8YhFkwRRG7HQCuWlp0zuKi3fIa5ZkmTd/FI4268HU0=;
        b=PVZ0YP65vz98z2+QsIH+eB9FK5OCdGkiKZMqtlhHqe3/4gU+2tnWw2gfMQk944PnlQ
         9GiuQakyxXo5AvRpuYzBLYYSTixnkxFW9zEeUJlapAcFdtHxnk4bJDIJ6E8RAQRhKlx2
         Bk94vLK5+H5MCOABX7/JeOmLBkiGnYWDzXwyFZ6kkpgaHekzJy6EYNkrRBaE9BeRVMP5
         xPgwetZfjNRp7DXuAgPwoRR2HPk59nK1Yociut+HUv1MLvlO6M1jyz51d76VuHWg1nSp
         V3vPgm42ADtEvC0kbwghjH48mvgJp5t2bac32yyVSnJGfJkuugiK2UJFq3AG89yudggr
         8Frg==
X-Forwarded-Encrypted: i=1; AFNElJ/4D3B/3616v6Q3sHrn3xTV9hVq/dsMmo0jVZy5064fv4sfTJDkaR848wvTAJ1y+gTLe9wPNFg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/fDnjAe6M5tWacqMvKrdhNtEFIbSOxEYoVfLvqGWLn2XArUZ5
	cb/VVWzueKkmfnWtl7hjkWOlkKVf4TVM2T8T384v3RIwAibPqNNn1u4Qv3M4qEQMsAAxHzj30Gl
	pAFvx9UtU/miG/GZ3VQ9gjN2rPN7BKvS6MXs5NWcfQQjgJnbSrZsqvVWtslqWUczo
X-Gm-Gg: AeBDievJxsKV2+J7l/ONof2Ue05Uu5gt1QoZ4DZBjeS8nMNhxxZpWuPgyQHc2tXa7Ud
	uB+7kVzjZksX15cS3QEk5cbXHsSn5XYdjRImdPgeRJyY44MEbfjOBF41551gRzc2VuSnyktT53d
	6LVqQS8axUZ/z4Wl66pEp5J2kaM50sfjRNKfPwCY8IXJjWEblwyuvOZXkwoTHe36L7QiqwFz3VG
	XMa/5Z0hACsE7e+9EHcp94CU+g97x2xQrOQukLAP4jjrMUmVwhcjDF6Of1XGVAWq3on5MnOepxR
	TVhrm1yQz3TWrHMXsw4urxLke09awkYez2QHP2HiP2ymNKUhhWe+byZRaWz3jvbU8aoxbbhlUEa
	h22QFfWqqgz2EWTb5UU8afTlWasFg6l3G8S815Jzc9v5Q7Ou0xCzefYVNlrK2Jzx3LogMeOo8Lx
	2YFilj7WyVH01dbuNUBsf6jy4DyjI=
X-Received: by 2002:a05:6102:1614:b0:62f:c97f:aec4 with SMTP id ada2fe7eead31-630f927f4fbmr3735570137.27.1778167487881;
        Thu, 07 May 2026 08:24:47 -0700 (PDT)
X-Received: by 2002:a05:6102:1614:b0:62f:c97f:aec4 with SMTP id ada2fe7eead31-630f927f4fbmr3735537137.27.1778167487442;
        Thu, 07 May 2026 08:24:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:36 +0200
Subject: [PATCH v2 1/8] dt-bindings: mmc: Document support for nvmem-layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-1-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX3SaI/8bptNRg
 rOhmT+Moj9Gr7gHua7rUYNWa8xZYNfhwGcAHXDLyYX2S14biY12J86k8RxfBUwnsxBWMi3Ob6r4
 e2eGc40euns2BXAlgx/Mt7kHiCH2tp3rT9nmyvvJeeFBdYVwVgPqE9SPvIPTgPAhZjVlq3uWow7
 VNO0OLJGwPpXoHXabbtfXiGLN4TaBCFs9GkOiqvmYvkeMVWAc0dR5h30p6niuyNOYHD0P6MsYKp
 ed0JsJh2aP0AID0Rj/INz/hT5HXHRjd4yeTwRDxZdcv267TJY4h/p6JPqv5CFMpBJneAGsTVn8Z
 Z/e+LcOGNdD4vXmhIVrntqT8A2j8FNvqn8wzzAXlVvmIsvUXQOiCzU95gjLj8V7E9rMPR4DjOV9
 /HW/tneDjoPP1Of2WFR4jPE8n6sE/JzlCkp+gRXcr8su9Riy5+wLe7OUAW8wjc35bE+AxQUEpUZ
 s/B+tC1QnVscllT7kYA==
X-Proofpoint-ORIG-GUID: C70cB5IkPMSddAaJzpY7Mr3445Mf7giW
X-Proofpoint-GUID: C70cB5IkPMSddAaJzpY7Mr3445Mf7giW
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fcaec1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hFPe-bIbDLvfECHHD4sA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082449_877028_1E87EE7C 
X-CRM114-Status: GOOD (  12.51  )
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

Add support for an nvmem-layout subnode under an eMMC hardware
partition. This allows the partition to be exposed as an NVMEM
provider and its internal layout to be described. For example,
an eMMC boot partition can be used to store device-specific
information such as a WiFi MAC address.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..b21426a49cf1d9aae5b4e8e447b5be11b08c96bf 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -40,6 +40,9 @@ patternProperties:
         contains:
           const: fixed-partitions
 
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+
 required:
   - compatible
   - reg
@@ -86,6 +89,27 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                nvmem-layout {
+                    compatible = "fixed-layout";
+
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    mac-addr@4400 {
+                        compatible = "mac-base";
+                        reg = <0x4400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+
+                    bd-addr@5400 {
+                        compatible = "mac-base";
+                        reg = <0x5400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+                };
+            };
         };
     };
 

-- 
2.34.1


