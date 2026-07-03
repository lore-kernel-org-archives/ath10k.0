Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B3FC43602
	for <ath10k@archiver.kernel.org>; Fri,  3 Jul 2026 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=AcLl0a1HzC+I1w0KKWOviKNqL0
	0INbqNPF2/F5Kx1kr2cLtnajA2pre8UKmG500oQM69cWP0KsBtoGQ74Wu2tzeWOEteAURScFXHq6N
	K7nGcM0d6ozZ6ZiYMPSxiwnb/foL/S235MBf5LtBMfkjIWxTgiEuftINCshE+zejMQCqQ9w/4lAQS
	EAKIm3CqFWnFpu830eJCJQoAnwIw2MI61EfY1gYfibYXV3ymDMY8EW8J4S+qfrU/cQfQ515qGzdQC
	lwZJLILbrthnqiQ5yOn74iAsLgEbr76hrcdJu1txD/UYVD90iBWm1yIRUuDmZ4lGeHbSodTdjuwfJ
	HW0p7Fig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeCu-0000000785a-3OYw;
	Fri, 03 Jul 2026 13:45:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeCs-0000000784h-0t7h
	for ath10k@lists.infradead.org;
	Fri, 03 Jul 2026 13:45:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663D17u4053907
	for <ath10k@lists.infradead.org>; Fri, 3 Jul 2026 13:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=HamYwJftlF2U+0WQ
	8ZeaDZbNjDDayS3W7TsIqcAxTETXucyC0z4G1o4d/+ETQoYa39mqeUblscuz+VgR
	jV636xWSmpXDuBzmtz9fqW9RN4/gtV260m05QH7R9RGwWPQfHI+oTq9QGyxm0cgY
	LC082MkM1T+aqMGRjJcPF9fUgQRAqFopLYt3/ItSHHp0N6R+Jvp7d7H0mhds/5pZ
	dVLN/Kte205KojmTDX/q7hKwfEO9JR+7k8rJWbq7km3eB9DUIF6jMHouqfWuCBOv
	GPHfGAXTrZBlTlZLeWp5RHSaWg8JpTkgjaPniRYdTUQyd/FkcvETtxlI+R8DbV9w
	vigc9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkg4n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 13:45:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so40476385a.2
        for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086324; x=1783691124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=e1fpEZTmTrSURHEJHSWatlDt6E/o4BDsY3NeTEYmlKJC7+y3i7HSB/b0aBPNIP0rmG
         YBUv6X73PEua617r6ZTMe7IE5259gN6BkrhsYqWgNeO7AOrso9VJOllIz3AQ1LGmtaeE
         O9ZQUUJ0AxhpqmRLRyIbap6Ux2CyZG3MXu2v4YjFitBwgDHDu95BBMx9oOY22OozT8CM
         Wilqn8Alwtaua6d0F98m2EFiTSdwoKj/XeldzE57mpdWzRSNZu5uVr+9d0T0JKaelItN
         XFVw8oLcrQT0LkcNa5D7V/MMwdyfV5RdpXKMTVVxM/4w150nMPkLUsCT2h6Fey6vRuEI
         INRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086324; x=1783691124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=Qg8ld/Qpl4syKBPdD7NgHE6+uTnrQkJvCNUTsh1KSTGPdIgrspxcQZmBbYi25f5byb
         C/jQYMJMp69B0gNwKtwdIOivUm+d9wVZWv1AWXXBxXHBJc832HChv0K1EI60+Xzk7XYN
         bJIS355GdYhMjeyqGgZC9lVhoX0EnwU61WvxqmvOerspckddOg4tYbSAXBvZjDKUs6Gz
         t0FmYLVEoKuFLl/b0XnWRS4byusOfChxeUFb/gPVuHBnw6I+zosH73gkaMIS7nNcyxyV
         PUkGQFU0CXAw52Rb64VyoGBfwFMEWyLm9fD1MMhEBVJGqQ1SF76SsJ/sql8HPe1/OOQd
         XypQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Ah6driK5DY9kkWjXhfRjcU6eEqTQH70FjSMvUdsNl+0OC/swOquKTJxER5aQ4EHcChueySgw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMhUeKky826Tf+iBBPR4bA9ko7QusLFa/PlIKKPwl21dD6PFio
	WiEV7OaWtYaWnr/JXL1xfosYysMKBmjKGjrJfep1TlXUW9kgv4QOHmXzRJAKE3dMuuUVIGb03Yl
	a9EzZkiEurjxRPjtDTF6If0YWDLy3iAcdnp8Nx6XjsuArCaRzaovHJjG69eJcfzk8
X-Gm-Gg: AfdE7ckE8tyoqDUBWjRI/O6hDeIbfB+fPXRUs6emHx2/PkumkeUJFTIUJI6xpyDxn+u
	ZOH9goPpbmcPhn4+lhuNfOSaieZVP9MZH8AJMDNL4nXl/zezdAbc7LaumoQ+v/9dYrsF+htAVaU
	SBlslCVOg7GIJn8gAjDdtaAm7cf1au9RAjZFkyKdnH8+rAxVOFLJucfCodL52KNaDMgtQ3UWkFQ
	G0gpMJBbje0ccqnQQj6JscnGZX8A5xEiaY/C4gDLVPV6aUqLhtRS7dgXUvTfn0EpUqVB+fj2+OO
	cJuPcubI/LN/7wQpiGPyt8ke0Y5j4JEPqatiFbqwOzFYRu0uVSOEHR+wl/Lta0b/vXl/OmpMM15
	eHZyGmBuQE+t2jv2i1LP+bSq2Kbse4tWoZC9AVtu2uvm1zOt0L1G49LoJFyxGLkKlu9CWG9qs+N
	Ym7IquM5DgiMNmeOwJ4Jdn6agwXdyc54d9pVBi+tnTyVA3KlCPojKsKZsOkYT6lxo=
X-Received: by 2002:a05:620a:2b45:b0:92e:8405:7ae8 with SMTP id af79cd13be357-92e840591damr804130685a.4.1783086323927;
        Fri, 03 Jul 2026 06:45:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2b45:b0:92e:8405:7ae8 with SMTP id af79cd13be357-92e840591damr804120985a.4.1783086323235;
        Fri, 03 Jul 2026 06:45:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:22 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:15 +0200
Subject: [PATCH v8 2/9] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-2-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX3IifL/dQ8Nto
 Q9ZoxfXVaUKyApHfAIUlrv3IkWQNW0pooyX5g/lZiOz+qkFJWNGYVav/kI1JlIN9U1lKTdxNfvx
 UopsoIXHKxlmDFIjm2luIyH4/s9HmRlWzsxlp9pkoCosIOsgxcRSgKnUkYYK9Rui0KtVAsYcmUV
 aXKf76o8HrLb3hO36NBtEzM6QrprCmr5wp4ubWSjb+oIL21EgEiTUE9ks5Y69aItz9hoi+sPCeQ
 QqYOfHq7jP/sIjDH+EQ+kcC35ZFZyyAPuHsVK/oytl6obd47nFF5Qg3nyLCnqCNQhibJfv67Yp+
 UvssRthDp4YOnnld77E+SxqxsxXOCoX/U/7Llo6huaJWkE8bX5eo+k6AtAAAsL6EStxGM+rFpLY
 6oi3F2HEt0Mj7iXbpNEQUOPi/Kdgnv0IMfQ9lUEmx+DILUwgCanc0LTm2VOCMiaXKSiXgdf/pye
 60Ziy2UxupcuaFisUwQ==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a47bcf4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gzXZ0NlE8PyRWiE0FOxMq_nw_yONjyrL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfXzCrN6HfFo0ka
 0S2tH7yX1KBC2Vs0xiii5wJWOBi4DGJjtzRIgpHgx9TeZ7+GuOIjCM4eQSgwAkwYVm4kOdozWtK
 C7ktrFTctLBVKQ8dp6mmB38g9zf7Yp0=
X-Proofpoint-GUID: gzXZ0NlE8PyRWiE0FOxMq_nw_yONjyrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064526_365986_8F50793C 
X-CRM114-Status: GOOD (  11.21  )
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

Since such data may also originate from chipset OTP or be supplied
via other device tree structures. All of these cells are optional
and can be provided independently, in any combination.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..878c5d833a9cb073520c256c1b72d0f1489e7f4a 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description:
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


