Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF2EC55164
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=; b=qIf1i1MGLVvJ3vzgHYkghKT6SD
	S5+1MVHwcVOAFmd3QW+TtvwbbnV6E0fHED4Ew+k2mXqduMJgMyVezsWe1whFk5ROSpoFAn6Qlo5KW
	IvWmBgGfn8cbtnD8cDgLpHPAjsAPqIszNFBoj+sJ1sDr4KqHgubUoLAJpQI42M7giVVNa9O9HJDzp
	LDwMO+1J3U9nG1OuPSPjBF7ue9rYDUNJmbXKbtQ+be/Oi4KQpSxmuZhyOah+ONDrbpdOUPzlULqT2
	1I3+d+nvJzXPpSH7y0lruZ2RODnBKlZ6UZs4Ru+zapcQzslKgW+5Ly8exxPgErjBluixCd9ECwfMh
	xJ9/uncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBi-0000000AuLl-1yB9;
	Thu, 30 Jul 2026 16:00:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBd-0000000AuKM-43gy
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:00:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQiuV1680273
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=; b=aQ/naMfJL/eXOSkY
	sW4u1BsAtcWL4xBVIXWzOT4Y5OjCS+pcvEQoAayCe4obG9b+yJDKdV8HcIuPeyL8
	g0moUS6y0529FrLk4p2d7OYpHyAT6CZiRoNJHQL/odMCeNjb8kZu1MEXEANETa3W
	QXJc98GHfx6AL/F/8cOsjtJQUD32au1niPzUo2HT3GUsr8EOYJS9dlEgIm4MRfwb
	e8O33IUym52qZ48RHx4dBRj4mlVCQz/LzhYUTN1LD4+4B+ryFTwzPZF6wRHv4HVW
	qhcHL7Sh7mlakv7rTdEbKii9Es5IPyOvUTZLgYG0rWm08ZPiMUJv6hk+AbWNOH9q
	OQkJKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8gy0fnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so22081081cf.0
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427244; x=1786032044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=;
        b=iIYtLUU9HqNa5gNnYFxINiSYAiT0bwvddB4Ot1y2JjiboAkkk7NaWCTEuqcEHx7JIm
         dG17y3MLHmkDeQffD2bqqagVR8HE1C/UJulBRsQGElTtDAP4G4GQKhvW0yXPrfFXL6CB
         tGEdHJLShmt/okHI+QwfDcxv7uB2CB+SmExGygBuG6PnLjqzURYF0d50gRmAi/BzJ8H/
         bkel2EfhbR5HZksGcQIoLOjE9LIeQjDiA4OrCMUz5Xknb+nbp/gHXELd5r5TDezuxueU
         gkR/oSi46XG1u5p2V4neJQFR04LbQ0ptv8UExBb+oUeE5oZhc20LedLo0NiUHER3Phjq
         bgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427244; x=1786032044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hE5vnyYn1cQDkxfnxwPBASs1NDxIF0ypO5EEm3REHf4=;
        b=CKRw6UGJsOV7YzMsCEcImOWX/dsNqYv9bJyS36VhgdiThPzhDooDCH0HjkuUE6Rk9R
         8OpPNY+vKlSa3Fq8dgaCSG90RWK+MDE/JlIA2y434CdtHYvOuJVvVSLVGVnfu8kW/8nY
         lgMZCcnweNmUf9qjjuUeVPhRz852/78RfgOvBSUh/GPp45zfMfVg/3+hjIqysont6nSx
         gI2oc4xS2NDL5JVeUqwt1EOkM6xanDig9Vlz/edru7vG+QAPz13UOugVbadQWj6IG17z
         GdbM64DCFpr1chIY897mfuLQlDo/gGCz19JYzOmYqTU9eG20GvA5mdDjm3TrFn/89T/s
         wunw==
X-Forwarded-Encrypted: i=1; AHgh+RqfBBrr/qdTH7PlHn8P2SRsc9xv3/gWVWFYhSM18O4E2YcrEW32myAZR3wuQ3leVHd4DvyjVoA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwBQws+gKzib3PE38PpQ4PprjmMc5e3jsB1WZhV2aEzidJPJAu
	GKd4vsL7uMvaSpjjP6G15xAXDicNSa2uRjDy/xuvqZUAHtX+Kqmn06mEeJbuRz6C0iHrDUE1LEe
	Erwd6KpYzmVGheMDYKCAUMZVEWLBu86sAu9apVBpM0Xp3FGkJK7TEBgXNyE19xrDL
X-Gm-Gg: AR+sD13RnpHDWYCXXhqSblq81lnMMx7sK/gAM0V5jSf+aCmDxxBLd7RrZMQwpMHg0QB
	fG/yQdsfbBlfOD21YV+bIZBszKOPzaFK7iNX5mA0wAKp+IK45U1ZjT8ufPRLD6yQECZOKFOWdb2
	LqdJQMI6O2Wmx9e4qVOliywy1Qg67R90CuDBIra08UOGtQZFF6qRBgvN+7Idp1Gqc4f8LC39Z6h
	+pv6/Y1rCKgsJLW1WnXXIRVHpwemeKK87UOdw8EGOXyfKX+ut1h87jEUSVSXoFjRnM9IRv9TDoA
	5VjwR6hmxXreNIMK2joSwOe1c4aqQ6tPftdJdKDm1hAJMMUA9tE6tPAElUjsmL3T7+GVQK9A5xF
	HHoEkXRR6eqHXu+/4xN8nvi5SW11N4yiOw3UDanj8Az/TgLn2gCAaimTtxjpm72xA8T1NMPRrX4
	GgP8S6AqxaXvg8VXwuoWi8f5gTEfcpXFXXvGP1EKVvW0/dmiSk4Z/A
X-Received: by 2002:a05:622a:58c5:b0:519:efea:cf41 with SMTP id d75a77b69052e-52b384abc72mr32749311cf.28.1785427242988;
        Thu, 30 Jul 2026 09:00:42 -0700 (PDT)
X-Received: by 2002:a05:622a:58c5:b0:519:efea:cf41 with SMTP id d75a77b69052e-52b384abc72mr32741231cf.28.1785427237652;
        Thu, 30 Jul 2026 09:00:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:31 +0200
Subject: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: yLdHC3bx4skbxzB3WzHkAxYJBMFdBp2_
X-Proofpoint-ORIG-GUID: yLdHC3bx4skbxzB3WzHkAxYJBMFdBp2_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXwV4vJF/+zyXq
 bxwckwZbUPbfqSSKJeSTLvh8UwrqMhMWcUhU0tMy0U2XIowfQxCxZUQ4GHrM9VFzP22520R+UqL
 /YgDt4Q0ShAq8mImaV2n5aCTApnxFATaM0Fk+M3ns1+AlJtVgRhbbphdBvxdBSizAGemmEGSnq2
 jnXPGefuS0YodAT77Rko+5ptN3LR+GS/u+YAgapeM86wO1fvgzZGJN4K36Aaf7bOW6JaqtluR5E
 2K0Fg7ITw6gYh1nOtFjFihkk2hHgELogYjuZEN1rJfjRUVbCZTaEga+PfLTje80tePBBd9cWEMq
 IlCd5hMUnQZQ4/uCfB8R3VuLaGb6krp7bxHgI7TRwzODXCjwJslvCr9c/rY3J21Lm7rQfSMHfN5
 hyfKGO8Nyr0O3XfYmI20X4s6x+V+iXJR7W1hqCRsZH8tjIAwzlQ5FUK/ATmH7VsJZ8rIk5i3ZMR
 ZSSnIlSUxSEo3bm17Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX/j+7FgU88PiX
 HYEVIjp80yAvnU+DQ3K1k/Ubm7IkfbbfFfQr6KHn6qDTOTF2C+YEGZQNjT4TQhB+q84mjtCWymW
 wJ9nsoSWWZ8c2SRfh34XVmQENt+3hh8=
X-Authority-Analysis: v=2.4 cv=MuliLWae c=1 sm=1 tr=0 ts=6a6b752d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090046_018004_B583B894 
X-CRM114-Status: GOOD (  13.85  )
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

Allow an eMMC hardware partition node to describe an NVMEM layout so the
partition can be exposed as an NVMEM provider. This lets a partition
(e.g. an eMMC boot partition) store device-specific information such as a
WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
cells.

Accept "fixed-layout" as the partition node compatible, in addition to
"fixed-partitions", so the layout can be described directly on the
partition node.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca68292b58a5fdbee218358 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -38,7 +38,9 @@ patternProperties:
     properties:
       compatible:
         contains:
-          const: fixed-partitions
+          enum:
+            - fixed-partitions
+            - fixed-layout
 
 required:
   - compatible
@@ -86,6 +88,25 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-layout";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                mac-addr@4400 {
+                    compatible = "mac-base";
+                    reg = <0x4400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+
+                bd-addr@5400 {
+                    compatible = "mac-base";
+                    reg = <0x5400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+            };
         };
     };
 

-- 
2.34.1


