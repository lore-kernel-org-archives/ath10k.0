Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B21FFF886D
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jm6l6UTLyr0NGskSQ/0c9LsflcrnDGa1NCLAOOsHjZM=; b=CM5YQAjxXuliQtd5uqIgyH07q5
	ym0aAQl+O8C8zzlGA/9zyPL+ukqlJ9pdw+jSY7CeAMKHDODTBRLmJ8sbsqScQL44XxeV33PojWp1Y
	/XkgBy0pVk5W5AzLUjgwi9e89Pr11eXiiWTAJTQMXi6zsModN9k6M68+e3Fo5qkv7sOkSMStYcWyV
	8EhSFoVYzZObYXLYUOQeqiMjo+5C29BS249oO+DPSOsdcBKf87UavhO+PLrFv9ytMxAS7Zlnc78bl
	EYs3VsDUSqJmsf4wNZaTNm5+3FKND6J2+H+V3suQL+2luKyTE14uvXNzJJZIFq3vhN/qhJ7QB2pPx
	k3PVd7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLY-00000001dpZ-06dQ;
	Tue, 28 Apr 2026 14:23:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLU-00000001dlK-3wGW
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA4A8J3275594
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jm6l6UTLyr0NGskSQ/0c9LsflcrnDGa1NCLAOOsHjZM=; b=DtAn6knqeUmwx9Kt
	yl5DkawW+RQTgBprHQ4phVtcWPE7jBsnsjJgw/ee0YFczkz+EmS6GxaLa9qefrjy
	285x9ymwBvfViyaLyksWqIX8SLt243kvbWvUMVwKepOIXt/q/qaJ9msPNOIZ6r1v
	tUjKo1nOMMERMOKRjwq7/qWcfvsbLG4Upaacz7THphct2lW2FasJqtwVaLUNj3v6
	7k127p/VB1RiM0iltEkZUuyAKIAExZi2r7wUx48Nbv2PHdyeRxglifKabRP+lQif
	bnhT4R13shiAIqp2BYCpbPUNEvt7SFXSCSwyE7K2rxi3OJcPKm3bv/v3T13HXrIt
	JkSH4Q==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjgy6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:27 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dcc59fe0d8so9919978a34.2
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386207; x=1777991007; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jm6l6UTLyr0NGskSQ/0c9LsflcrnDGa1NCLAOOsHjZM=;
        b=j+w4NBWvlDYHMUMq/WsOsRc3ZvawM1sVUoNgISRMkrx5YpLQ4WbXOZ9oGqTtmOo+p4
         oiEfreC0K4W7Lt55NULQZuIUXfKSbcqCvKkfs3iba32doGfFaSr6JcSeyJ6NfgA7EAjP
         mNu9SPWtSS98fvVrqfgYTnvx/aJOZrPUGeaVwLbVlAOgC7UeLjbL44v1eBo+QIt6Hg6o
         vrU4aR3ddkcQT5a+6+N68Oura3Rcs/Y7AzfBjJ0Ic047+EdnZpEeIeJmkGB7AyIRrVkw
         Xwb6vhvhHpyNg/i/vOeEREnLKRTqoHEGahcBOkmNDRHf7S6CdJB6xbq6FRI0v/JNOriE
         JT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386207; x=1777991007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jm6l6UTLyr0NGskSQ/0c9LsflcrnDGa1NCLAOOsHjZM=;
        b=X9OMiftLUycUSQcvDdAeN9EWVbCx33ltzRNokVGP0ceGJmLO/TQ0uaqNOOj/HLxY3W
         gkDfbGHhg9Zdi4THttbsyjzJ9UcTkFUBjzdjxYYWLMghoDLDpZeRDRT/HKQmuovGnizU
         BAMj9C6Hb6V57Ty/f1j/W8i6fQYFNcyFgL/XucgnIeMzY+42VA8l+cr1fTELbJwjVR3C
         PZN6I53rb2GuwnIMEzSSciccOcEc4jwyG0smffjpEU1QLCd6jC0Uhk2xmyDO3XnSzq2e
         7g5Dvohy5nt3lbtDMxyj+19ek7nnwtJeMOeL0mDx+ZXNaTACplBjsR9r8PVoJtq0GgJD
         fD2Q==
X-Forwarded-Encrypted: i=1; AFNElJ89jVhbXSO2srL+xpe5uzWf3EJGyRa0IU2BGOng2uJOJroDMf2yV6cFeaVw2ZFaYNfIVAUpWa0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAm1GM6RW9WNHfZbgBcOZtYbY30x93LAVZZqDjZkJul5wOGr79
	cffGKe58/ThlyXlYizmpQW4ZJ8TysDlw/RvK07YG79p2i3n+6BsqXyS9DIG0cMoHsWPyqMTYRGz
	uqjHfm8Ggfr6qV7fRDD07NCTWjWwI/FAArgAh+yLvAAvdLQVcbSeIa7Xm3FFCV4jD
X-Gm-Gg: AeBDieuIIR7UjyqRIRIWnRIYhsJCy8cdFqbq6BhzDGzt7WuqsC6wMBjeRepR5uuvlO3
	BwFHAZYF7rh3JcIldqcViZULpVLYZoG+VKl7Lzjis4Q7Q3ubVrKgsKUTtKng3OM8VddDZR5T9jh
	hgaX0CTeyk5W81WVoSUJ4drDi4JqxEQ886biIYajbMlyWWsO4UGYkOGM4f+04rHWvYK8FUC5Aqv
	Od5FbJISbudV3+OszIYUPiIyZt+WCnkaCamoG+rlG+V8GoRBCo/KeCPB96d1+h231W18HuwlkUP
	9RHDyr3wBSodoJhiI9LMVKtAXc9OHzze6dlmyEWI9taeQX/284iKmb3VZ6v9Ila+dwdFkUYa4D3
	DnuV/t2xg3Haxyx5xmXLGpMWc5v3/UkU3fdl9RGEzM0eEnx0Z1M8qAmNxs5NvhQzdfQ48LsUppE
	c68fCHISqXQoe4j47X2EH5PqTK26A=
X-Received: by 2002:a05:6820:2d0c:b0:694:a362:e3ba with SMTP id 006d021491bc7-6965cb93af6mr1550275eaf.48.1777386207307;
        Tue, 28 Apr 2026 07:23:27 -0700 (PDT)
X-Received: by 2002:a05:6820:2d0c:b0:694:a362:e3ba with SMTP id 006d021491bc7-6965cb93af6mr1550261eaf.48.1777386206866;
        Tue, 28 Apr 2026 07:23:26 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:11 +0200
Subject: [PATCH 6/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-6-6ad23e75190a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfXzMTzVtrnG5vp
 VHtr71utiDwt5IEh9Uxhj23pk2f+fcoKhZrVpc8PdHMj5eeoWNNzWg4Cnyhh1noaUwA+vyR/2jX
 riLYduD/WWA7oHX/SYw/I8jJBxT91N1T4lvNQtzrbU9OOf7JP52FWuFk0kH7GunXRpu6HirEhsM
 QvQrH0z7hczMfrh6Te9LiCCZTbq23lA7h9oRgyg+k+jjNl1ovn2P2HilodKefCmHe5CovUF/5cy
 ovI7JwyWajjFdrHFt3WITvh9etM+avs17woDLWUOUwimsnQ+UDXqiSDcQsKsXSHVTgOdbEKLMhO
 Ihjx9LtgzePIn/3Unw+xkWibPGjUqo+Yz9isqXjI4tLccGp5Pl/xmWMvtKoWwcahk6lys+MEZKD
 U+D7COLSoGDkE+jHnyqlaiDZ6tNGG2sojseS2kU/qD1pmDRkQTrg+5bq34WoijazmHygO1Qv3oT
 biocBMhYY4YLQaGQLuQ==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0c2df cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: 70nZwpvWuoFBO2AGluiY5a_rvH7J7Nox
X-Proofpoint-ORIG-GUID: 70nZwpvWuoFBO2AGluiY5a_rvH7J7Nox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072329_130893_870FE725 
X-CRM114-Status: GOOD (  11.99  )
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

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/net/bluetooth/qcom,bluetooth-common.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..ecb3de65506f7f0f1fc1d0b9bbd316163b7c26e8 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,14 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    items:
+      - const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


