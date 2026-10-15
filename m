Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982B6CC6B3D
	for <ath10k@archiver.kernel.org>; Thu, 15 Oct 2026 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=PxZZ7ccghW10LuK7rYHj7eFMd/
	FQydqlfdcxfRVSTS9DkYY/xWwpNO16cBeeXp3TO2IHg+8ONOR8aZW/sdcfwJIO+U7vYBtuh44ihXk
	qRA2YZYAeqU0ZiG6w8WXeRemngco3dGT2MLLrJXiMD2o7QIOp1kZGFSG6Tz7JbmIxosxf3PI6D4Ew
	dat9Jl2ckMngKM/SSqsshcpD4BZWZ1cxW/cGLA6ty1VJQaCgxkr7WUE8i4ycMrOTeqbOtVYFxdxUW
	eF5qEXW6f+OXW0eRRqyH8+usIDqvIQHJGzTuP4vJtfBcAfB9GdO1yIt3Q0E2dfE5Z0rVX83kXmoQY
	FLyV73wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPa-00000000MGy-0x6d;
	Thu, 15 Oct 2026 14:26:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPS-00000000MBT-2lbV
	for ath10k@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jjDb1956177
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=DOuhrj7tQmzO4se0
	B6M0VuzNCKu4xPUlNYRkUVEipt1H4GDlQTqSqasCCFEfdXEOCTAvOHwmeBt7xSny
	IBDXPVOSQAnY5mZtoH8GNx4LJ+MvpH36fTfhY58bWk6ac9WP5TIR5RxMjqWVAHJk
	/x1I3CCjKd/DuPET7nv8ZfOTOba1zWBrgYhPw6ISNbuYfUfk6EiNk593eU6l1WEQ
	8G3HM3tTmc86SOgFP9HJ+HRRcwL7vGgSTIxhFKae1Soxq4C606Xq62uTF+No20Oq
	Q09M/QTl6S0WxXyxRPjBn4KlDBvlHdfZPrZOC4r7S++kunKvuFyIV8mZiX8g+yeC
	5rDfNA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeubgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:17 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e944179148so1655236e0c.3
        for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074377; x=1792679177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=dLp41amSQMJOWgz7rNDdm8mMupnX4u/FllUv53Qn1ooD3eDaLtw+ZFwrYTPTcWDKWP
         uE2I3ya5avP9TeVx/iwVDxCRKMU8UL7It4ozbsTFx/k+/AiM/AaGQFiCIb4r8WVuRMYX
         wLx9JFMaWasUUF6tj7MG+fqsjBRPGvta/IKOUREiRf5NGdq9bp33KMUPeNW7M+KVivyd
         IUPMBFjsxWCwgHaKkRnZQrKR26BAwoXZOB/fh8w/CXa1+6Pw8Y1IctCEkGI8XlNJcfuC
         /DFM6j8RTcrnc8f1jBlXvJ/fDvXtHLbnAcQnEPNYBaIGSwFq9kk6r7bfMP/xUKsZ6YWR
         +hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074377; x=1792679177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=kHczSxpj0NyBHowYbK2rr0U7AJ+Mm+oSi8TKR3w+I91Lxpx7KMzxowm5aoeE/u5u6e
         QGX+eSAKyK2SEMKSpdUSapu8rIXtzRKs2sqTYueBG6/zeNWsF9ZswLtfKxxLJLPjvcW6
         sU6G3F2Eb1gBznoHxtkN3jQZaK9VuezKWZ78MseMGcLtCpDAAYLMs6lrQy6V4ljUkMHV
         NSY+BkhV/gYlJCjuLyk4rWWpbVQNjAP4RHCUZXCK4QEzxpHCCqUIbMkgKwZCYnD08WRa
         cMFPjUV4oBRHJpxjOx7GnGI/XqET5xSqVKLP0t86NnmXLNL04C3BEgMazsN6ueKPp914
         RoFA==
X-Forwarded-Encrypted: i=1; AKwUvBwWl4oknJFz4PV8Gbe7HGZCr5poyWeJZMtSjttZtQsbWEEwPNOMhFjz5HRBAqiOFhZdscjW9ZM=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4rDSI8sod3sCgf34sSOXXq2IoGTGYXA4D6des8a5iXOIHN325
	EWPVHjYrxsfE2Wsl4B0HdyHPFsGMB+xXV1WaJb/uAMG74EWd6tgL7PDmu2ft89I6bpcQTQ7oXzk
	QoUfZBSUyTQqSsPdkbL+RuASGIILUzmI0BVAaLodtRjJ7+eGgBlsfj2v0h6KTfOC4
X-Gm-Gg: AYBFou1cDhe2RCKX54oEevHCCfBdz3VCyYwIx2BU+qZfLCrrw1GPHLt6djZREfbskTt
	Dv6Ano3lUlHQj4faIfpPe8/jeJi1RSSPA1ukeY0/zB0JuyysmGDS7fzQRPNSjGrSb8mi0Iq93AZ
	f0E+lHFR2ka08hzcI6auO/8hkD2T0JNSrfvRCekN2RI6Sqicr53+r52ZKZepIhZlmXsHCOzJAi0
	/c0ySyZwbpJhlnNv3m75qjhAXBd1o+0if3yKHVhLi6eik+TPcfWQ96pum/VzAB0dS9dL//+c5W8
	xxj41LcAwuUm9AUa5oDHsiJd9VuNag0HOJw4h0zOtomgon61eS04/u800xRV5y1zHhatPVQQe/1
	CkPG4vu9dPIxMhirEPTetldYc9TZAKuN0Q8QBicvnq9c8shaOCmUIvTAO07MPlu0oxM0NjZ+nOC
	Tjov9iv+RKklm2rsGwa96VqjQKBLLjLSmLTJQP22JbC6ITpVnrDKo=
X-Received: by 2002:a05:6122:46aa:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5e91f4dcdc7mr6746944e0c.17.1792074376607;
        Thu, 15 Oct 2026 07:26:16 -0700 (PDT)
X-Received: by 2002:a05:6122:46aa:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5e91f4dcdc7mr6746873e0c.17.1792074375948;
        Thu, 15 Oct 2026 07:26:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:00 +0200
Subject: [PATCH v11 1/7] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-1-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
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
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0e289 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: bcQlgDs1tA1cGd2Lhb4PBZ86N7k9-VL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX7zgKJmjPcT8o
 ROxsfYLF+8RLPc9xJkLO+ggHpk94DMhlzJWH5cULwZVbzd3tpjSlsB3qdGy3bGlZncKV1SuA2dG
 Woc3b8ixClb3eVHy/cPUYWbWSjWBhMT1h0LH1MEvHwd4+fHlLlOIYudj99bQRrpaztP1MlrHAbz
 kQao8WPsM3ThogIcIUE4TskM4KuBbtmoXHx2X2CkovkfcjTRxVTy+ffel9ymq3YMoI9g1LM7PrB
 Xcjl77I5Yt1JKM300CIxjEqIK3p3pJYelCRn+dlxsmPqI3PVGNyoPfXeJGVYEtDf3WBK/spMq+p
 6ukODF0Nf4PFzBWf27s1iqVRS/dYm9BRW244+aPjZYNvHqqZH4aVv42BTe7Kq/uH2+aVEYtIu/0
 XDu40iQXB7v9vKXqH8eBFSWZKj7sDtKgvj3KzGttrsRsbLURNSKkJL+UiwxDBhuFhO2gxZtCkci
 VlEYsbfcB8fNtjgK80w==
X-Proofpoint-GUID: bcQlgDs1tA1cGd2Lhb4PBZ86N7k9-VL3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXyFARtSzoBDwY
 ZHBI4AevqcLGX3Ad5aDYH33K6gKP77obMDoTrL+whiMhnTYxNjFSBInhaR2FDTkomCbZCxHULMX
 fwbI+KJCeJzyXKckcMSsRO32/sqIfwg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072619_142103_A9A5F025 
X-CRM114-Status: GOOD (  11.80  )
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

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


