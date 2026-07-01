Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4D3C43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=LnfUg5v7WNDIc1+vLGfIPGhfvM
	KLP9KGhhU3PFS/bco+f5qNbV7RUQFP8op9Z8DcuHvdKIwQF2Wd5XPlScL2iIJ+UxOeIsDfyZfvYpZ
	ix49bQpwId8BSjdw4SezSbSC3gTrReJ/FQyb2IUnTar+8lTk2tm2FwIWyWYIffgucag9tTIIkAGnB
	e6FCmoQI6ZfKu/OardsNou1w4CgBb63hhhPZ+/Ign+2FMC1UtKpPtFClWneBJ4tQR1Wc6oqF+btnm
	3Az6IEzcQGh+hob0cDztNF4GnE1EFHcUG7BURB1MXrpUZM68xN5jE0ElTujwGobH9YhBCplQIqNfQ
	583pAfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMt-00000002Sjf-2pKa;
	Wed, 01 Jul 2026 16:00:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMs-00000002ShJ-0Q5O
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 16:00:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo9C31531950
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 16:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=NbIMQfWk/M75Jc/m
	JJcsFsiD2oORCimjwwYEEgLE4CCbKa8/jk6TtZTAo2x1Chq82xjvwdmFs4twAiDE
	VmDSeiTYXtYJ39ntpwwchbR4xciMLf94auLLm5dXenL6roE2PUu4b2pcjDlKN9xr
	Tmqt2K6wYY4XM7zkpb8EEBtYVMordmmk8cH//v311NIYAS4Ewqa30tp56XPJEkxp
	NnUVh1GPoJ9JUr24MaNvUObsxb/pYWhBmwiTgocSru7GcYIPCxOqTEcs6tMXN12J
	Yoiz/RgXGsjpYOtHtjdn03/y2bD6I/b9+OrJm8s54ZTFl7pmFxudXQyCt6fIC9on
	tk9Efg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tjccw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 16:00:53 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44aeefa1c36so382654fac.3
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921652; x=1783526452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=I1wwcdAb9MzkOkxwQty0J907wgI+GpVZwEgsHgWCUqv59zpTz4eJaaOwJkFZzEpXz2
         CcDAgYWYtv/JLKMbiFkzC6Ua2oaQ8HMRITAiG7Z0vQf/xAJOaZ6OBFvaMa8WYETFtOXO
         JYiEqfrGdzrJHrTgJTzGSDJW0X/pZNx/a632LhTnuILnYsO/yPTFI9JuvajmDq/yrMqL
         X7BLs6cmd5NSUQhqD5Z0ftB1xuChFWBHew06Hxt8NdUGONYFOAjlhYzbqDzQ6PUDsM9y
         tObK+kronB6rP3a6RHNTSJdyiJi0baPPrcJRTfXbk+tLBmlJG5cLcFZKjPq/uouqD7a4
         UvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921652; x=1783526452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=cpVfG/5v0E8/raIWgr2tJOZRhvm6/9DsW3/6mD1gIQMYxistAaswHuvrlXXnbUYW2P
         grSfTSiN49kqSGKE+PVuH3bHUbxi1weCzHhTT+Rsh38xKAKhJsP440n8DLoAsiNnfI4F
         bCkYhPMJduJNDQW7KrkefFIdKiBG6jQhYpJMIt0QZLe8nXp7c8RGyGnCr5qR+WL27nGR
         BSGf/JDDNrvZADQgGXWPUcustfmdk5zzF1L7gGOy2c9HHTOokUgRpaKuW2dKOHWfgXHy
         yW/ZV9yENRBWyeUAlidWQG58a1fS4ll8nA/Z2nX3IZoAdZ159VHRHTRHpViVykl4CQQO
         Pk/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqKJSaZPWD3BkbUxlSiAdUXn8gCalg9cHp6VSlHXaU1m8kNOcYNrY+u/qyA0wNlUDkSaL/vOd0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQkYpnWuskT73ay1he+hBRI8TDxlowmGySknLu3fPYA8EWx1yC
	CQKw7rJB2oQAlPMjAPc1osnqvnhtW1UbLET69zfcbWxbOrkhss/ajXVZwIbonh84XLYWZrrDfoZ
	xwyXd+I91XGljlmz+tC0A9Zx3nLiSSO1tFz0fFkj7KUF0FwqqmoVU1rJAdqlZ8xxG0iP3kv99Ew
	l0WA==
X-Gm-Gg: AfdE7ckUzda9ju/Ot5S2OpWNlNHCMPHOwT03kNXZ98QtQXjxNtSLL7TVaH3hsXy8sWn
	cLCuu1yU9rJJ9ww0j6dzpVZKQC9SV8xeu3gwe0qGTSn8mBSvj0uYMAOTx9jqQWAZUg9De79NVsR
	zKvgweH9uawESYUm5vBsx8DcmppahTUc/qoRkgzjPyD4rdea2EaWFAlqaunPffQRt/qBHHRFS48
	kZKY6yVCZbWem9LDUnKb/1Ch+f0IW6X8ed/vuY94QXqQQ+ItjrTYBbSnDCrNTdXeCeKcyjiGHLk
	yd+ciPjFA4NMyw4wLfGx3vX3Xw2yHIOVw7D7golTC7Xy4P+i1QUzqjDrzQcgAYXvL2HuQm94Dpc
	hec8ysbOnEWPVrZwLhh21sYQQJTIxsyaClUnqPZetECW9NxcKJOhliQYlG+BE11SpOx76N+R9sA
	bF/pvR2VbLD8cOxhSQTo3w/6fmTznI9YesEkzsNyvNPRQNC2NUK7J+WtCfxL7NLOU=
X-Received: by 2002:a05:6870:8899:b0:44a:e965:b9dd with SMTP id 586e51a60fabf-44cabcb3840mr1144068fac.42.1782921652329;
        Wed, 01 Jul 2026 09:00:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6f02:b0:915:afa5:725 with SMTP id af79cd13be357-92e78206c88mr299831085a.6.1782921639993;
        Wed, 01 Jul 2026 09:00:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:27 +0200
Subject: [PATCH v7 3/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-3-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: g7z-u_NnV878DMiAeLt3_o_3G8E9eC0f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX0oIsPtYWGReL
 M+7MhWtDKhmo6QNdOhSWMGHe4gUk8BpriLjM+wQfO75jhmeEi6hujYt8Dgdpq5axvllPZQSIRPz
 cqXR58YzKGgu8Rc1bFf3Mwh+PZURcr0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX22TjezJHdmEs
 Qqsh3DnAeAwxF67GrrxlEEm7hIinqXk8LUeUx3eRkOObkEEj7xV/BaNp03mfSZn5Xs3cTbriHbe
 HU3Ra44HPjZLC4ijf983wbDb8rD2VGlOl+iM9MTDSupKesbtLp+lI/G7D85Q6le9WMPrXkIvxvV
 WHeKnDeqNbqVoOj0vWwL0Ettq3RghsYJ6MpIyuWIHDAlZkxpbYuvZrkqvMZRhB4EwCIYJdO8N6/
 8L7vzWvhAOIsUyLKRsJfwY/hWr1pkoTucw38Hnet2PxXYNScnAXpFxxe9tWddWTee0romWRirKQ
 chUdoB38e242Q4QKjOCj9r7bbJOjbKNg/IQYLDtLWCC4K2IDJ/9liG+LE1iomnKQAJsEdFyGo76
 A/AnjAvb97cQK8evvR1/eEsMc79u21A76gD5h8j9xMhCtLYzQfcxJ0yNaH6snWcZ8DgzX9PdLlM
 8YTbZxHwVw+6Wf6vcug==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a4539b5 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: g7z-u_NnV878DMiAeLt3_o_3G8E9eC0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090054_266769_68E6E03F 
X-CRM114-Status: GOOD (  12.55  )
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


