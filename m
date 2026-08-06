Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7232C56208
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=mttZN+DAlqsJ/scTTUzwmvf8Fp
	+BFD5zwlomN+IIr2wGKLN9oNDVAT6rDQjn1GaJVqr6zbchIGagNkjwC/wMg4sDaEb1uX5+5dzLUVo
	fnewxUAIJ5KWq4pnv4FydbjD3TimtYVVMN4Z3hLbeWLbaDVYeapE6q/ZDuZdPyTiekc6xOFKp1tRp
	quJqtjMFibWO1CvKc72F4/PKgy9xVqFCMXwjip361Q2GwJp4F1SlnOvyHQcALAGWagjiWpBdKrx1b
	BS4znSXEOEhjbpTaDnSlugpZomvrLzcROQV5p+LppkHfcq0T4p5+VUbZuVNvz0xEbomhUKbfWknYL
	JUVr+vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFK-00000005zWq-1l1f;
	Thu, 06 Aug 2026 14:38:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFH-00000005zUw-3SFG
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:38:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nj5G1625880
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=d6ElbH6PPCz9QX/b
	BLbUMMJyIPdBUt6nC/OUVYRJu70FjQUJAa7LpLyG7zhEwsScwo1NGcXiHmzKgeSg
	DYU8w0xqtmCJIWKYgCXBfDx/xfUTJCdzL1u29j6IC+sObGK/yHh50oe8eSIAOlvk
	976M3BEoKD5MoE4SNLDq7BNxKXvDUfxcaK1YJAd6nzdZwvKiZFSXQ9vzebS9sYel
	KFkMqqoT9+O0OtQNIpNFVm1w692AacBXnc1bZO2Net0oojLqeyRhN74XIV1ZKHFG
	Axe12rUOHhUNYN1nxi/bgL7bUO6lLRce7AcRCt7F/rgvB/jLDwlU3Zyh+00QU14W
	HuUzJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntnhxpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:38:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283df62d68so25619151cf.0
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027134; x=1786631934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=SCam91mXIwlAtu54Dt8u2rTINkx50rlYVspnxzWq+kyhfjpxxRD0PGdOu5ehp79QPK
         MPhh/PiISEy/i0ewG6skxjF5nTyRAsQBpFN7hpSudm3XHoiU7FtudrJ1VLC2d10ODVJf
         RQi7ozXNeiDst2TYv36EnE3OJuU4U6rl48HhMwOIfdbyGThqp7oo9fKasGfgmd0XVZbJ
         FM7qQ/3FC4I9vHxnoHJBRHuDK++F1OdMN9HMzBBvTeO8PfIobrGXROs/rxvmpSONXV8a
         OUh4yBnLzLqR5vchHQzpxoj4Y29ijgXlWRUWa+Bv1UJ5dCLbYjqwoz/QBEYH+pS/4zjE
         j8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027134; x=1786631934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=dy5rU1A/D+gG9WwgE10hNJ2sSquvZ2dR8Cd4tOoCe+eqAgFaoa+3tMGlv74/ck5Skm
         SmQcXG2ZyMxwy5lE+rnwkAmYWp4jVkjuqp/SZgkiJl66DhJ3NuRLV9/mcENFqhQa1alY
         LSXo7WSOdgmFkFT2v/mo0YwYXuCLHDtXYqstoRBvRkWjLGETmvPGgB/xkqhkHXo3rjQ1
         AsZg2orqmM7AvvmRcniQAiU2fP7mOdXPlrzV4F2TM7zhhZWuca4K0gByA5m6+5PGVIRv
         4bpsFugmPhE9pTmHK+r291cdgCfKK5WV/mHhQCOFS1sMpFl2LOeELYcfveadj+dRFhMq
         k/Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rpavby7a92H6AsH0wJhk0Pvvh8H1aFOJyGGHTAA2ZmII5IzQK5A6h7PrfYUmfUinJaAWKnTfqk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeqO3YBlL9jIdmRDWtkMtUit9yAA7JdDh7xX4QbfamxAFz7se8
	3G3bRaH3ORk+Uco7OaUqoKt1XzQkSjq6a17xK4l08PQqzm3B6XCW0FWTCmc2f09Bxv/ZtTaeeIM
	cltuuetZzT2es8HMhsS7rwkJSlPIfPuY3jBa9R6ognbbfDjHIhmO8ML/FB43G7ERx
X-Gm-Gg: AR+sD106eDr4AYy23IbcgfYLvvw/anJuXVOX8sbaPLYJrcusAdor4E0EQpPPylrXWlj
	jrZEuBXpR9Hj/yyYphoO9XEHuhsMGUw6IQqWKorbCR6qxKcgEelQFjws3+tJJn5lOZaepw/8w4y
	4rSuajFW2B3+jJmAyfbAhPviB3BpQCRznT1999Fljcn0FJzJCZRWunypXBbPqdGQKYeAr3B9OkR
	7xABZz3u9E8ZzcgScSUszewJ4mN8m/158XPKc/d1+2W9PUmCKzzskU3wmkEcekYc8u6M5TEA1AT
	Tfi5eInvDTUIVZxfPJGgEapYvWVYNm6TzvNSYsXq5eZT4P1lgcMbZPsdM+p4c0hZwFnLjSLm5dV
	yomlEjQ6IXQvj6vf/PSdS5t4c1XsBVWjLPmNbcnXPbX7fC+4puI29OB/GZhtu2VYMhlYJxoiv7Z
	VbR6PLrHQXwK6Y8NOmxNdbC/sR03M79yM5b4ycOFF7cwzIqFn3Xw==
X-Received: by 2002:ac8:5cc3:0:b0:51c:1532:ae93 with SMTP id d75a77b69052e-52ce6146122mr164305781cf.26.1786027134401;
        Thu, 06 Aug 2026 07:38:54 -0700 (PDT)
X-Received: by 2002:ac8:5cc3:0:b0:51c:1532:ae93 with SMTP id d75a77b69052e-52ce6146122mr164304391cf.26.1786027133693;
        Thu, 06 Aug 2026 07:38:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:38:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:36 +0200
Subject: [PATCH v10 03/10] dt-bindings: bluetooth: qcom: Add NVMEM BD
 address cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-3-be598b2a5606@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfXw44XuqfIfFaA
 ZOpkFWXAGPwTViDwdr4SgKb9ywiA9SFLP+53OzMzPU0ns5GBAEpjKe3iDxKn3QVsAAMuC64Fsqf
 ZeDrrJyiiCrJ9A2XkoPhgx85udj83gotLOqaYxtM7sHRBcNTGjjNznC5Yvhhkp7XMTtnwm9yWSH
 23JkrOG/V1W2WhWYWf7pavrtcZzPKGuW6zYgQ6RikpmF9bsdecLTqysE3EtKYWSteKQUFxI7QFU
 +phPJ5bAbiNCp3b4RNB22AgBtpy5z43i4UQTuvKSRnmYMr7kVfmT8aIji9y0bxgUr+z29bupcJU
 L1pYz0r0vlt+5eLNfWl8B3OkcymHIA/7mkyKHrCVjUji+o489HAm9ACsDZ3bpRzg7WwLeMBVInO
 tPVxn6gauReBfb+KmdkmKEpPlexN5f4WKQHCwoB61enfgoFb07KOvPtQqGQUGU2i1REvZW3NdI5
 Lzst9aGbZ1LI51w665A==
X-Proofpoint-ORIG-GUID: MvIGLkaNkrU8Xu5WyFvDmgM4tN2NWB_1
X-Proofpoint-GUID: MvIGLkaNkrU8Xu5WyFvDmgM4tN2NWB_1
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a749c7f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX27RL8Vkx8Nqr
 VuKOzVod5O2Z0GCw/NoTiYIOKu5Wu1qIjMQwg6xR1Z3DJWSpL8QrEPcV9ENI1X3qSjtWEj7Wltx
 fYvwzEqaHf3g3eGAr3gNhy27JFr2TO8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073855_869910_C5B394FF 
X-CRM114-Status: GOOD (  11.69  )
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


