Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA6CC56208
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=; b=Fp2q7J181GB3WSMHlQ7yRe2x8+
	+pezYQx8RXbTt10D5dSSxazA279tqN36R9c+nSbzQaAef9dYtf9uaWRwxmbmzifdm0LSsACc18t6H
	99EE6KMO/CzUIqm/3BgmHzS65f0JSCKFRK6cpXv90nUNPhRIiv1Kxc78iW+4v5H5N7TB1G1HJDWo/
	EsQbUgqqJWT8Fg3IfPA1BRCdz7hbSA8kUId6wKM/ISsVGIgtcFQI73DO3ARpWrhivRLYxqKfdmX60
	T7VEUOPgoAoRKat0Vz037psrrFsGazVNghXG1uw/UElNJSzl629/2de91biqOhOyeW9d5p9cwHi7V
	JvMDpQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFH-00000005zUU-0iSM;
	Thu, 06 Aug 2026 14:38:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFF-00000005zSw-0SGR
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:38:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ni3l1534178
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=; b=DY8zLtgk6GRUKKXH
	ChvACXmhsf7wRge6WlyJBT7d4hVgvki94RA1N7o53IJ6WoMzYGRCarNMLpYLFwzG
	3nDXtEuYF3/p0zimY+tOUUM5+tN0nYnD3xU5yZ/JKpuk36jd8krQwo64bxdmJ3G1
	jPbL5DM0gz+L6MfwAQZpZwkHrjMzuTadkrWryDvyz/EPmH0GgWwxAcPX05E6xxTb
	9WvNdUp0TG0BznJspN/B7I+G+o3oGERTHb06nLVFrBuew8It9V3CJslxKhYZK1ec
	EzgD7VRnZwvDo51yH8+rP0bFF+mHqxw/xrDqg4XrzMAFpH0odyAqNQ6WaP3UVRl2
	PxMeCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8pt36w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:38:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so25632111cf.1
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027131; x=1786631931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=;
        b=WBJ2Q4fkfa7rxq8LpM8b8O6zHT/hLD0jvbNbvzPPDPdhw/D54pvu/GoeXFZzjkM94w
         JlAN/diC4JyplJNCydVjVtXeXhS01RfCyRBnEuD8VcPflsahp6fmHXmpU4+CtBpHj/wP
         TMOnMCs4x42JNSnBnqeXIlGVxPo1kGehit3yDaiezJrrnl8Z9+qzLmJh6fbdD9BM+DMt
         OzcvlkXxmo4fLYLGGs0+V8/f4l5xTnfeAhHVM9JY3fHbOJwakfZIjKo8ZqcEouBwwTTd
         3p/dkQojlGochAGbziJjCuRgEAFLeAnjeEtdSvSns+surRGQUMNIIB4Y0ZHgcaUgNPXF
         XslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027131; x=1786631931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=;
        b=tHqxq7RGUAABwvbRdfmQspxECM49WZ+QMd0sKQEAzkeMopvvy/CRxVKclIaYxiSqCG
         RLtnQQN1jAM9DGyvf8T8LR7/HdrXhJCmVFsfI4C4V/WNojJpvDpIPYbemSJ47y2Q/utV
         jVZn9/W+plZLGozH2NsqUJB0tVQ9O2Sms9lTTv3fXViowiS1+HDuCrHxzHUuCdzTxsve
         zkTpD0dKmyECxpxQotJ2eEnrMUnM+JABiqcIRKZJWwpkiwy34GWmpy6LKadOcQdS6MVT
         QsvaOeYbv/OinM0wYTZZe0QyW38+EUCZPDN2ge3eMiVkO9w1U2vfRJ23y3Q+x6N+FJNM
         76nQ==
X-Forwarded-Encrypted: i=1; AHgh+RoR2orTmjI02qsQiKXrV0OT0V4SgtNML04w/CnL5rhkiuqQ7uo6OhREexFzwkQWr8iAHFNzRpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFIFA7q83nz0141c3sTXa5wKsewFr03Iwh/fdlVsWHem1EwGQ+
	pyekEplXs/7pJTohUSMy4ogkRTgls+1EDAiA3k7KzVUVTskCD4deB0Jk3kwezXWUYMqoxhhvZl2
	+BFWgkThJzr8wGP/hO2y+GkQLtbRQwkGKA2WWLGt1JNWj5QD/pow6da1rOYXpJKEkq8qrvIeGis
	Y=
X-Gm-Gg: AR+sD10oHckV079NYsSFJLfq7UKlYi+s5Mj307/jflyEcAgMHdQfbOi8V3VNgjfkBpv
	xUKv3WFXwYC8wUnlJ1hvk+boTO/psDXGgn955EYDQNPMUIkrupiLqVNQB/RU/ibJX1+/0C625wW
	4IUhFAdn/HZOp0t+sgernBzRML3I000cqw4EhC1rBr5kUCOukkzqplfzk6hxzEahKZ9wum1vZgC
	1xDOusrC7kJBsMl4K9oI9sAmJi6TPNFYuRoXKYFARH6UGm9DV3Rn8/amB4pltquanxYHwvFB6fE
	TvXWEbwD5IN4Lf9+ZQOzERBaqapNExAQ97TLr5R1w7Vm4WaD3wQzpmFFguxlVX+j2ac8NCOb/wf
	g/Dy2YhpMdsfysZwrWOP6F2fhXtyoAE+KfQdv/CddR9X4Gap2Y374V8ecFCqVyYrS0BqtTbUvEu
	HcYsmsE7LvnOs8DL8593f8qxkhA+FAKir/dpJCdvWrh267SDE+gg==
X-Received: by 2002:a05:622a:1447:b0:527:43a:2f30 with SMTP id d75a77b69052e-52ce5f6013emr149751381cf.1.1786027131396;
        Thu, 06 Aug 2026 07:38:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1447:b0:527:43a:2f30 with SMTP id d75a77b69052e-52ce5f6013emr149750561cf.1.1786027130781;
        Thu, 06 Aug 2026 07:38:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:38:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:35 +0200
Subject: [PATCH v10 02/10] dt-bindings: net: wireless: qcom,ath10k:
 Document NVMEM cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-2-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfXwY7XjeSRG1Dv
 DqFF3q6ui2UJEzIq50jgx1CjUhD2EXdoqdGnqLkmus7Z2zQOmYgxqXOqLRJLYrdHk64z+MczJsF
 BfN8uKrVksn3x/7AP5PbqCTFUDxBkNM=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a749c7c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: m-wcr9YGMCz7D_a55ecSxWe61g2h8E_v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX83ZXTN1IwL1o
 PgwG5U9JrZegJqduTstUjkvzB0aZacHG1OgC7ivEMFeZ1kyapzNLtSQVEKCUf+/lucVzaaL30sx
 qfJqEAaE5B7q/siLq7wAwrB6pZ8EnbDPUOQv8k/yJJb4kohYMqXafq3AV20QwUFx0UhKJpXPQbw
 wfZAv5pa7BddBoWZVT04Q2DcFNoRK88CNEgjLUKhDWyTDMUgtTnQECDKQaatvBk4nEy8/2mseWY
 44n9paJSj2R2/uGojENyTaQ8nTZaW1u/6H5qTvt5DWnfVBbmIv6ojbT6Smt12xPW/FVj1uQeEUB
 j7cNxI761Osf3pHbjn9xJGkCJiER0j1n8mgwKBsbciZttnu++mITw/3soOxd6Iwi3MtCtqcTOqz
 Mvz2jSOi5Z4J0H33E+LB4zrV+lqEky5ddQlBUdpLDYMqFM8M7M/RMJoCsAXByKGRlqHrFbBh/To
 nzZW8PM/atYfnPkEeqg==
X-Proofpoint-ORIG-GUID: m-wcr9YGMCz7D_a55ecSxWe61g2h8E_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073853_276194_92ECAB7D 
X-CRM114-Status: GOOD (  11.55  )
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
index d4f4d72ee0d388f43437fc5a3047f90b464a5274..7f9d16cb7c14330e11ce7d567d585b5e47793bd8 100644
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


