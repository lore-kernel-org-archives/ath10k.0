Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE180CD8CAC
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=fRpBIRvNb+X8W5SJUvemkpTS76
	K6K9HJUGMukEK6JrlD/f1woKT/aq6RqY4LtQcet8oB38KazhANagXFVpEWiCKWz7ZeaYHSUK+7Oip
	pp/gDbULwkyiwafGEqW+GLuQyOWLEgngGFrA2cfZnm0Gt5n3qEVFLLRz3EJEpunUBNjitN7DHHOaW
	LV/z7y+cKb/5LI6xDJlL1uhyC3qCeV0I+Sx3PV8M6YJf3F/bX98m9BKjaaf2crDIAyRBth2EFigH2
	MH5vVXAST6OHvC/slWjtWDcX2AArMWySmgsPXqEkK8q5gCJ4QqJV32OERAOpFMgGDF6Ql88JbnSCj
	RxJXftig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrGy-00000004zhV-1I7n;
	Tue, 09 Jun 2026 07:53:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrGw-00000004zgE-0HIn
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 07:53:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wdoh1498231
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 07:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=SqtE24s7100dyZVA
	kTClwnOzW+aY/y+IrQvA5ZuVMmk1ZOt1sngQs7WnSevZ3aqCRg5Cihoa/loxIg+u
	t3Ru/iPPVx61+14JjwffwlWZ+cKt5bOzhddi9aByGOfrSA0sc0Ie9aB3VDpvhKaF
	AiDEm4eplPJ+c0qRUnpRGz7DnmIl7lhYgv1Z7+QcMGgR0aJIlUINw7yrp+76RSlN
	4zeRYaz0U+6sWsAMDijaGiT5YVm8P30VNOGvyfJN6I+uHpugUFRyJSsROI6vKP6h
	qWd4kKHfEXmpsaq18yY1I0kyTytX5hjNTIlTvzqqQhk/0DASXo4/pgwokj0YDOKn
	7WZBDQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8n5fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 07:53:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175a1e32e3so147106841cf.0
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991596; x=1781596396; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=iShs+LQzoLfwGzj4b7qEAc3GQNkSaZG4zK8lJe0yTpQFbDAHGDpBTw1OsEFNyoufFF
         7u5UmutqgBCHKLZ7kR+7CIpgpnIGYt4lL2Dp95P719i1eKi5B+8EgDrfHGwcc16jg+fG
         /+0DrxD4oCQ2phchSlACcoIpXwyhzTqCo3Bn49AXVjFcR0jIm47QsDzxHpBxnvNWhTAZ
         dj4trZ3Toj/FIHjhxDKdQy0RCjg2xeOVT4MZe0WpBarh9ifXDRaH1LVGZZqBgzSkvSbA
         CeI8A/j7yRyBzCnNiydmqy8gZokYDfi3X8mudLPwoDlLWgvKZyUH119EF6M/WogHzvox
         hR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991596; x=1781596396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=m7o+JrKu4Zi5E70JNyLLH0pXke2QaaTVx7AvlSu+cC34MN44rknM+xyKNxRQxQRjXC
         cw8MNgApg353KGV977d64q1vA9V+DnL/teKYeWBasjtOFuR84DaeuSWdYUrHveq1UB3o
         D7LYDFP+r7v90esjaABHltwveqfO3X/Zyq37OcCyR4cE3/a5y/QTA0QUDIdfLGA38Ste
         SO5d0ekcU2pLEh20Ogq+oJg3MA46eOtZRHEnR6LlUSByarJ7ExAM4E2H/jvjQdzxC0yw
         f2SpcUUzcY5fKDLjADifjpxbzlYbbFX/ZnhfuNz2ywD77NSi+u8+K/klST6felx+JCrq
         CVPA==
X-Forwarded-Encrypted: i=1; AFNElJ/H+EAdlyp3sgmF0w4bO3vzchFO2ySAJ8pojj2NxXcS0ODg6JGyyXteuWeiovqhXi72jG7c0ec=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWtLVeHDdoTybxUoAe6xdtop5yYadtI2sSt19mW4gh+BEvXKpF
	Px50C6qXS09vEOD0iHdVCUu/LFk9QoCAkxzCAq9HU0CWDAuR9Jt8bVEezn78xNuEL1hC8a7LZEo
	WPjGEjH9h0J/ZgStxHJdMWIQ7SG3BQ3krHZadAZRCEvQQ2Fg4lKANToIFU7OwLdCs
X-Gm-Gg: Acq92OE5UuOXZJP/ayhNvUMhwxNAaomFUHFsj8+6qoaTl20EYl9976eF+t+3FKgw593
	EKlwPeySKU9ptOjAIMYBDE++osTsEVL/LzHeh3T0sP1DD9EjsaJUzWhDOPMexxpH2SfHTSn3GqY
	0QQLdFG3bsVfg/hq7fLYEuqruIqHeEAxLz6TQQMvxVS4mI/t62z46jmXV42/Ka5NYKeIHdljNza
	Av8FUmX7Bbp0TRPnK53xSON8ZOJ4VLlybyOCWclXCYunC533CTZGs7Lp0uoMCg3ahjY3VAi80IJ
	KnqBsh4W+A/KcbN+P8ni2H2XZU6uHHxS/EqrHtQzYbiDvzmi3m7WAs+qInKR8SLfLaqza9hSJwy
	veuXlSCntnTpnKzX4ZR0C2OIhy5a9p7hpAL3UzYBXQmAgkWMvEL+MKCFYqNXInw+UZ/VRqWBfJU
	Tds/+5G7oL3kCbCJBYf8bJAj/IyqPeTq4NdWHbZFO0NdnvVfdk9sbIfFJGpYYWW2KOf9GxDR4KO
	HldGG8KDS10
X-Received: by 2002:ac8:5852:0:b0:517:599d:ce19 with SMTP id d75a77b69052e-51795cb7901mr276093901cf.48.1780991596136;
        Tue, 09 Jun 2026 00:53:16 -0700 (PDT)
X-Received: by 2002:ac8:5852:0:b0:517:599d:ce19 with SMTP id d75a77b69052e-51795cb7901mr276093471cf.48.1780991595695;
        Tue, 09 Jun 2026 00:53:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:26 +0200
Subject: [PATCH v4 1/8] dt-bindings: mmc: Document support for nvmem-layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-1-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfX+1UgvSNrRQyS
 gN9dO1k6hGWuYLI0pAJUYBmQV/x0Od7Yk7PkKM59EM+ZqltepbdzMNibK8K9LMXq89temikYEDR
 bFHbqxi5XKU3iskT6uwAseOIrGXw+vWJuWoLWxIs9/mHEAzvRDQtFSu5Q/tvEuw0w2GsPoyPbzi
 cw3QldSXsEH9vsk9gTD0XV1cOV+qs+wFD62UVx0hUVBsta4A5jkVlvp2xbXpY5yzdL8mbtQplA3
 pKFGqPn66V2KpMs1KEZbbU6VQcKvqgCT2sN1ajQ4swoQTjwZZ+4dcQI/whWwbdY1jnzfZ+yz1dv
 HVtHBla/JV/fkSzmBZPjOjdUz9LdTRziJxMEjWRvmERsua4geSVyP7z5o8tbPZovWJS79eNuJw/
 VlSDNNgB8maVMKVuNuToMgyYeMrv+ugPicIQg7vhpcO1Vbtrdu5A0pJC4cAsrhokldvpNx9aXGH
 EALO/mlAsxjOJ3ISIIw==
X-Proofpoint-ORIG-GUID: lSPwt8xXruiczF4H38LScuZKsjsFLCrg
X-Proofpoint-GUID: lSPwt8xXruiczF4H38LScuZKsjsFLCrg
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a27c66c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9i5gzfhGLSn5NVSMExYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_005318_232373_67B7FF64 
X-CRM114-Status: GOOD (  12.44  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..ca907ad73095925b234b119948f94ae81e698c86 100644
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
@@ -86,6 +89,32 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-partitions";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
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


