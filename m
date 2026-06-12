Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42566CD98D8
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=4eV8zEOGYVGCndf+rJy+Lh96sY
	0/hEqpi+Bt2y3Fw55u9+0xwYPESP3YxnA1kllnUrh/2c6gc2Xp4nxYjSVOPct8A1TcdLAzzDCawLp
	um07qh4XBkGHsIinu/hvylIJgU7quVYlvbjWt/9GBWIVzLtxmzvz3e8tprufl/Puywh3Mi9CNbpZp
	xBckBYge6RNn6GdAowUDkz4iygd3cioB7vob8tvhlPxguAVATsjD63k3HuOwaiyv4gzk5qYXob17Q
	urdVun1DvhM8sX8Rdl3jjb1BmzlI74a/ZxGzasBD8G2A7msecPASkEzbXmP+8u7nb18pvMv78wcNc
	ka/R12bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ow-0000000Awsb-0XhP;
	Fri, 12 Jun 2026 13:21:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1os-0000000AwqF-0mpI
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCjeON2164089
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=nrzk1bMa0A1H8jjP
	R71lHkiApB3IbtsXXD6BWzg4CBdLkhL2ePAs7944vvFj5cjExAWYRUYA59Bh9NlH
	HyyX3XclHJv52sf0k3NAq8dcC42z1lryIT0xNC++cxmPXdKkjbONft7WN2nhWvam
	4z4OJ0WJUh6IgkRRjqHYUy7cm6bwBE1Wb2iCNd2foaUMzSCTHOt4iVWF2XcUEBG6
	NeF1Zc4+BPoZwM4xD2ILoSrgowEuGgpOx9u9bTI0/qTalm/g6VivBEV/cmUZeiUD
	79ygZwqnZ0Jf0NNJageQqMlD27bss2GOzAf+PHic7+O7VubQV0emhlu92FPFKCea
	h5oHzA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014kx7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6ce6f8465a9so1032354137.3
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270469; x=1781875269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=gAZKLZcCSSR3FqriYc9MdsiUg2Lzbj1KZ8FnVw2tgZ0jDSzPIoASkaRVRKFF9gESB6
         YcsazEv1wHWT+dWZmCbn0UjXOOZhOLg7L4z6R2w0LxlHwzLtWihruf+MyAAy7S3tpiLI
         OeEUAmwP+ARgmD3xSIwm2HI53CM3l6T1CcU71hWjA2vEAMZjYra/6jlh6S/OhdchdZAq
         7Z6fkIDzvpo4m/m4tFyie8SYGcx7cpm3EtoHsHuUuMttXKvBm7OPSqJzAeERKyuM7JOf
         s81SNhVfM2fkKyB7MtvHIUC++Ct6l1BEvfwL6r5bo0nfFYsGjHfg9fa6PwG2KTuYtmW8
         CAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270469; x=1781875269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=jgXuEhN1CTYOE8/v7gQiu6PjoDIRZISEWEpqrE+DeA4XC+w0XZMiPhqIuT/n1Ht46w
         f0qVIzq5HlkMNcS+1Oil1eoZ/fcwb7Ns+uFHVE09r1sUs7vlruwGMRzkHra92jiaSVwN
         cfeI8roW72Urjj10sgSt/f1Pag+0kJRQTf8r37b2Wy660afatOvduRkg6j+3XgNktDg+
         wZszs+Oqi9s2Qpxmb7A83XqC4hCfh2uTXUL3IA4HLtuseeSPP6YCO9dyA4cTiKZwa//n
         DfPgtFgSGUqI9w/+mlZgjVP/MGhWu6fd677qIFi/7NiyATgFYQsr+M/OrqusWi/jUIlu
         TBBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ng/Qw1SaWI0wjF6K1UNN7l2DwSPvCwG7r3spjvangMgBLdxJV5oXYxl7idvi4+fWMo1lIqHY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5822rF1y+R1qQ2rmOKOJg65Af7Smufczf/xbvmUXt9lO6csUb
	ue/6fCjqusG0FT4TGhxJg1JmVNVwsNyFy+tPo5U6LuqDbg6mmB35uNuw3VJay0qxYcrvOmBF+7w
	5+LcvhFvLZeGIN7JBIjEQh4RdBLEsJTDVTLj1GppgXMMU7tY0mFpZuOhO/J2fTHuC
X-Gm-Gg: Acq92OHPpm1+0HvTuLe5cI8G+e4yamvCt9iQqBTBmCudGq3GvzW/IB9qITekOOWYFhm
	zA+5BrHoI8UST4WjJHVXT4Hrxs4UNm+R7O3VOfljbZnqU2g3mx85jKvhXlZHIbrAT9c5XX7tBXz
	XXtQKDwoXz19x3BWV/OD+cIFt2j4bV+MuBN5WL4KQVrOhUAmc62pkY/J9UkNBlBQQIlSkX4k+KY
	KgW3S+pqdqAJbtoJKrzq57fn1BAALD4nhW/nS3aAUhAWHbRgz73UkET7y7fGmSPwNAMqm2KaJwo
	P0CYvQLedPkswnIF+jXsdqkyWYuber20cFyLfFoaCtwVvDib5c8AoxQeQSD291dFadCSYA2sNSe
	zpW2+8Ckh2pNmQtQbmfYA3tfF+Xhhuj99Wr6crcCqy2776CCV10paVPo2QDKVy7qp+wHeYeeFtB
	rDriQACFaajptbTFSUja2uysh4C1ZZPCwV/NVYKu9apc5nuYPmohuY9yEf0teW/wRfl7E3SPX+
X-Received: by 2002:a05:6102:5087:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-71e88aeb96cmr1414590137.4.1781270468748;
        Fri, 12 Jun 2026 06:21:08 -0700 (PDT)
X-Received: by 2002:a05:6102:5087:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-71e88aeb96cmr1414519137.4.1781270468317;
        Fri, 12 Jun 2026 06:21:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:07 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:55 +0200
Subject: [PATCH v5 3/9] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-3-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: g6Q9C4-jSwtP3sQykHVoGiq7pHntOzk3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXw20eNP4jVhD+
 GjJuotdEDD7yHyQj/RN8fiWChOsbrm0NzmBwO3DgztT0G17Ty+cB/NKjZ5PXzUgR8AAg1HF0J75
 rVPAo6BjJzDQAho+JvovjrDGvrAOYmQ=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2c07c5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX2sz2FjULGQnG
 dsx6FrlsvtRakrG/EDwh+q21hbbKxx2JjnLr7KhITO1Hn8aIxjnXK8rizDKyI4BHfIykb9MvDEF
 BH8rLctSInRViq/rs5PAvHRiI/q+qk+k+m7bNYFc4l0Bjwj2LK6tuQLAmoNTESrfeh6zfm+Zgu+
 0X6SCB5XqibCQZh9SnktF41fNNUr3tt1Q549GtvyIJ2Z2PQqaLQZMa0G6EH4d8M65DTXu1CcHu/
 5Q4AcMdKLIVIazc7JNYQlmZTHPs71M7uWyZpSiEGXYpVNGoWGLJirCt6myXhnqNBWp3ndLsbmwV
 KXEAuFGkMMGfj3QzYb8CmYrGJLSeDX5SLA5IGCg1LSEQd9tMPshYXhbpwnwxPW53ma7awpAMSmK
 MhvzHQUR4olv2p1my/NPCgxg6PzyJauMrViofJ6nX3Jokw4spYGJ9+PCqqgivpgOF50hlrgV5Qx
 m+w4aDutgPHrlW/Kp+g==
X-Proofpoint-ORIG-GUID: g6Q9C4-jSwtP3sQykHVoGiq7pHntOzk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062111_224650_644F40BA 
X-CRM114-Status: GOOD (  11.16  )
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


