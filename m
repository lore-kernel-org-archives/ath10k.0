Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9E9CD8CAA
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=; b=fgGGET7ql3dAooLKSpwgXxchhl
	diTKKWsHcG2kFT+REKG4errGIoE/gKxLmKuKcwtY9R7tIDEFoPLDOCiPcdXTBrmTvaUY+HwM/K2Mg
	vAEMTQZFDRhP+FjZlbZ7QwzqQzMthNS36wrGe8SuiVphqwUAkoMNO3YGMNd9gnZhtbndQ/m+TefrB
	bnDyxEKF9kTq1YCJnGgWEozAy86U9bzybdj1J94a33osfif/P9Rv/bm/fNdqBPYYMLJdq+XcUQPuw
	kMmPFZ/x3iNaH2q/XTvqrsvn4hE9qS46sP6QUb3k3OGoiwSAIg0R3tYzBcdecyLo6jCDbMaQUg+Wh
	N74I1pWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZF-00000003Mdg-1mIM;
	Mon, 08 Jun 2026 10:50:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZC-00000003McI-3LYF
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 10:50:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658A3ZxO2848214
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 10:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=; b=aJ+fkT9RztRhmNf0
	Hs5tso3nBk7AfTBl5tX3u0dCwDsl9/+VUa5mSGG9+pqG3on1RpVlRxxHdc8wJFb3
	zY+XWpCb3vdIvPtr7thAx0jSUCumKMwLb+NuB2JkSon19TshTB5qEr60Z+VQQOl2
	0Ftfi7HVQyOgZMxV/XpVVoNhemQSEOBdCAFpNHFm9yBqoLJLHhK9CZPsCWUWx0Z2
	EkIaWR36t/KgMuA+GOQILSaEaeGK9mxr1nbCC05CbkC0gXgp8gzhB6eomjuEVy7h
	7GlHDYTYulnr540njGieZEuBxy6pxRkvl1rQ4DX4aQRU/dAuigSm+YvefB+ODJgX
	lTiN0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna86pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 10:50:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso49170821cf.3
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915849; x=1781520649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=kHncRPxWuInvbav67jw8SCKDj+AUdtYdDxOhJMDjGHfv0TquU6YXgsznLNQHdOeAfX
         Es2e/b+aaEWRCenNZ1Z+nMLrGnWHE5o4lbvi5rUadaK5RD2zeQqZ6t/EfkX+LclnAHmC
         gkUGnZFPzq+0zTNAhbMoe/XUBAN2uorKnaH1BJ9jFYEWvkIT3OjQ63bfGPvlKilpdtM6
         UJ7KzfjYTjLOCmU45uYmhoVBR2hpxo5Il9iIu8pMYrFyW6kolXYeRc9z9yhSv/KEceSB
         9mAsAwW/fGyYbgUXK7nVUxeDs7edC5u6QNVrmYgQuGZWqgWirzLV5R82pnE+Ru+C36E6
         ZC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915849; x=1781520649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=sgOeGEvLe50b1CQ2ZvoSsM7cvFeY7UldYShtBVOFrbd1lH8Xfg7q92J6hx6vinZNse
         roNvVfSfQO1zvsoWeAfyDuaEsGeX05xLbIeMVlqrnTTiL/cnH5yA3KycPcMD3/+AvBSZ
         7T107c91Vj6twSjXguuyKTdt7s5noxc4SJ+ix/STSgN4OXsP0xttxPlI0OZ783O6EtiF
         KWy5SSGPVwib1/qNs1/PQwR5vuYEwUapLbayU6tOs0PeS5DlsfULXflCgIsAta0K2nO3
         0y2X55Obo45jTrO06vkglaYOkNygRhNmDq6RaeEbFfuTtDP7K2KupHzsylzEPey1kxyW
         LIAw==
X-Forwarded-Encrypted: i=1; AFNElJ8a5xG5TaMbEqYN0OQq351oHMHeJ2l0kr9K75Xr9Bm+ztR8rXUTpSDenimuro2OEWlV+zMP/I0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgMiEtTts0WekbV5+QsB1FKVuubhs+gCquoZbUpBZSlXIfvKDV
	FcamYrDUpMulyKeBOBRNahsuPVGIb7uhQjeUvUyynEdRenb84oJIimsQHjo9osonX0JsoEKg0Ji
	HDNldxZoq0by5+gzsd+gq1CEzg58r7QA41ZysB65yby3Myl81yNhzCeZZZnUGeB0/
X-Gm-Gg: Acq92OFTuTWcbMfVsTRNUB9n0wd0k6o46yrJ58crRtFpOUhuZ/XNmPpsvt530urU+3K
	p2/lhpF3QG9Pl6ufnGhjuOXcrE3Uzz92QFYCoNayYiT5dQ1IGPMDOcDvl11dxs2x2t4j/Kg1wJF
	YfWBh+45fq+qLfiCsd/MskhURmnmoRg7oz5LYcpiTUGp9t5Ur0pcR772d7Wi1wadNC29zPYPivQ
	tDAXIjdEHvAFlbpKgpFasUiFzKQHu5aSbeAjbKumsAkan0UnHiwXVVoo1z2OOTxaZr5d3Eqs14Q
	MuF6HA8z66/H1Hc2yxmQJwX4viSa2iH29Fg80TSDMBYp2ikQC152pJ+VjogjdiJKprtk6/iKtOV
	uHbId7eQk6QieHED4TKUEPkQklVvFjDhrWExeA9dJORCAtfGqELOBNam/4nPXyakypAnrbTv8OV
	DRQ+Evcuy50Z5FWDwOkv28VFiTy6zQ+D47iTPNSraHWhgFc/kFWJtjE4/k+xm6HTUubaYWJKpsH
	UVDGreC+HZL
X-Received: by 2002:a05:622a:1a9b:b0:517:9157:ecf0 with SMTP id d75a77b69052e-51795be13abmr201563521cf.29.1780915849280;
        Mon, 08 Jun 2026 03:50:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9b:b0:517:9157:ecf0 with SMTP id d75a77b69052e-51795be13abmr201563041cf.29.1780915848772;
        Mon, 08 Jun 2026 03:50:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:50:40 +0200
Subject: [PATCH v3 3/7] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-block-as-nvmem-v3-3-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
In-Reply-To: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfX0S8DIU4L2Vvq
 edYnegcSs7RU5WlgNhLOmaUNtLXFVbc14eUvGgcrxhHYK0HvhiCCSCVThIhWYNmF/H1DVEO2KOI
 FJjo+BZJIZyzKBmt09x9TCyuSA8i4cGGbDE7bLxtAVQs2eIYFuRgYzNPcsljOI+vRsDW8Udqncy
 dppCyRxU0UeVIPKsr3Ycy6pY3CA6Lv1UA2wZ3UHE0JdAODKk1+e+rDcyvq8GjNFpQqIh12cau9m
 3D8wiAboP9wesNkG6ndRsOWZE9moKIg3GRtP0SiAtV0cOK5QjvOsdEMBicdp5qUSOjljBlj2f55
 6sOka8aSlr8ee0qWqHNsu90L8kw+4nHpfM0W/ItFqOGv9C/7SeJqcVgCEqtjDJpf9W5Lj7kP2oM
 PO8ClcyLpiq/RbDN2Zc0wsU0vml2beq6n5rN6q6rSRTNRHPz6MXc0k7Y/xfZhDsJs4d746EjJtg
 MAX/hbYTYSLH3A03/Ig==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a269e8a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8LqaC0Kkbxl4_4KvdnLSO8PJEaUc6D4Y
X-Proofpoint-GUID: 8LqaC0Kkbxl4_4KvdnLSO8PJEaUc6D4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_035050_853762_557A2057 
X-CRM114-Status: GOOD (  11.57  )
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


