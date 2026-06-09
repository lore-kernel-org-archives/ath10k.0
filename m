Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C000CD8CAE
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=j58Z0PbJ/pxZSjPQwvxn5QfQWm
	XB88YW/W8/ox2/Aad3mEVlGczRmk/I1x8UErvlhxRFxVQaK2fvAog4tPWEKkObxKptbEyafNTvkpG
	uLYV9fnzEtYhUSc6LsTTxuuwf11r87vEu4WeiMfw+et4Z3Lwmy6h2iMOqXS0Q8xHf5VclBh+JbQBd
	0S9zIZ0OQuFnjRFVAnSxLTaWZPQAyGfrggn7wTs1Qrv4yA8j1U9lIGtqF7qX6pGGLdEJ65K9smSN9
	pAbcKR0Rhd4LY4PCDj144B6vMcN9DvQdxUwmVC2bXtxWKIjuhc541KMRbVDVNsqxvBq2sJCtbdjNq
	qz8Qixqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrH4-00000004zkf-0l3g;
	Tue, 09 Jun 2026 07:53:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrH1-00000004zis-25yI
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 07:53:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rJCX1585631
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 07:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=mFktGxKub3OBWZqq
	WmvRXRbzTgMecOXVAW0uD4F7zuze8xHExVrgprxqAAD7nDnk/8EbCmQf42UKmaVv
	EY4ZBOIPvyl9sX5iMKvzypi8hRZZKJKBb7fv/MiUGCAi0cmCcarSKpmQIUEtxmh5
	QgowqOHnsq/aP6sjmDd4q8r5Q2PJBXf3axT24MnJAfg/UJzurNToZi+fo+L8qwaa
	iWg4gFPSZg+4uQ5Y2r3nngrJ8whTX9lqDc0KFnMn8p/0mUWMs/OL0HLKL+LtqVaB
	ZC+xgpButnyvMGf7bvxTB9NZZljIe7A3dgHWBaIxrPwBMljD6kczacpfglUutKMm
	PmVrag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgg15k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 07:53:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ae66ff3so86222431cf.1
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991602; x=1781596402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=kIbMAhxBi83iexhSRTxDe4NJoPmIyjuBWLBy5r42uYEbpNn9JnOO1NCk3Mchc6Ik1v
         /NccesG2xdpHobe1rxGtDZZPibIJeaHBDzaoC6FZ12VW3kVTud4y3A3Hzyg/06CyRj6U
         XE/X42DABCNpUFmnP5WuNO0LuKCaRExVQyYxVDrHdRBMucz6H6BXsn8ixGnFKp6vHXON
         J1z5XqZ7TTfeAiWXDRszAfSi9yZLorcv6xTKKvem0LGjAPUOWZk8+5PXNfKfgnTAgUtS
         G2xVzc5JVxwsxVu3O838bxvMzXeZMNU8g/KioxVVsPQo3qKnfrQB/+uqiDlv6WIrp/Hn
         BHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991602; x=1781596402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=mrVVH/HpDxhG8CxxGw3kCxuM37UmLrugobKOozno0tUOtiQq2MztP/bX0yvpnizDPL
         0Jo5pFYWAJG3BaP+XhTmfdAuc4W+uek+YHyf+pXDnbT4eXcv79o/lUk8d1RalB4/DdqV
         GSPgPClR6P3YB55HvmMFggHhSoY4IU55mt2Nm6ciUZR2nWaEu7sLStxrw6fZk5SM2x2o
         E7XSZHR6fBQpAU91oqoszCWXQ8YZscXF1pp8q+7GmVzZSmhBWzfKEtUSyaQ4YLWlM+9W
         I0ujVh7SRj/ZoL151OpDl8Si/axxUMMiyqZ4yeatREteAZu+ZpTkiu8InO/gxuyx0EsK
         uw2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/DwEF+dyysuImb2DlKRqcX7WXVFpZcussV4LTJrIeJkgCkF3pvc2xaC77+FXFN+C/UWhhUC0U=@lists.infradead.org
X-Gm-Message-State: AOJu0YyskYA+xXWDojgtUTtRKSeWIjHF9oTI1X1hZmB7d1oEVKM9HNp9
	d2A2uJ7O4TA4L8c1CYxiJAHdhMtMTcRF6VCXuGAPf1TSabNyaMmRMp1kNYS/sl+ILchVaXLq8Vc
	sOgz4Kb47Ru7mzYuwbNCFh+rMSP2bP6S0SThK/1e8BTEbNCWa+QjavemAKYZaYk6x
X-Gm-Gg: Acq92OG06dL8dG3D3QDpu/GsDhpFZP8tE6c32PvQ5N6jFfsWKfwROoEQJEqLRK+Qrc2
	u9s6KtzeaRjxm8Z0W9+b4TKwF/LUE01AIlTaKr13JAC0YtfhfssyPW6vGl/fV0pKl4e00jqJGWz
	6VnBMEwe8OYCPq9tJvNtSLMDH8Jo7kB3+r1xFfoFSQdVmp7Ld6G5rUoG1BTgRQ27dKDjubsG0Vh
	0O9BMO7wcbJNkKiKe3aGcXM7o4+rcVTduqBdPZIfYS+pWd/gUDhzPJLoUVx7ccjqeYaeEoa06i7
	MsAsasuudxo3FDqFQelQw6pQD+4OB/5XSXHskVFLAGqgBCeb+0pbTDF3JhELJTHTc1K97JHDhJl
	OdOLqeUR0NmvjV40ZjCxOBNjfY99Yo3NSapUup9fZoWkVnODc7jsNXE/3gwrzFWfH0+CWDEHf1P
	Oha0IjPYa2VhzodnGXwXwkWpf5jQyMO59hB1aSrIpzrApGVnvj9u71BJbtJpvcFiZoaUkyOx6Dn
	ncVwAexIiBC
X-Received: by 2002:ac8:5c83:0:b0:50e:6313:6e13 with SMTP id d75a77b69052e-51795a829femr267704111cf.5.1780991601798;
        Tue, 09 Jun 2026 00:53:21 -0700 (PDT)
X-Received: by 2002:ac8:5c83:0:b0:50e:6313:6e13 with SMTP id d75a77b69052e-51795a829femr267703571cf.5.1780991601346;
        Tue, 09 Jun 2026 00:53:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:28 +0200
Subject: [PATCH v4 3/8] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-3-45712e6b22c6@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NCBTYWx0ZWRfXzejJN9wVY6G4
 fcA9eeQKF0x3VcbpFOgr5FmtjmSVau7RnobzVhVJbzQSz7AqK6chrmp+B+jzz033sm91MxOj389
 79dW027apjfi47K2vv9Q9PVnDzC0TsNU9HkAR1YKof8LdSKZXJrOO7sd0bTfeG4qoUz/HUp3Fv4
 IuCotBoqAF1TSnNs34RM0UT3wo8fkU31NreU0MD1+UzO6XunfzKtowG0Ayqjbzb2H4Y0qmVK8r4
 Ti5tDZfET5XqpK2VHbOWbjvSS6otYb2hbsVD3zUhchRCwXEvodQme59KHwqMdMfDsvshP7SkcZA
 07IkWvltde9/tGBT7OV/uEBwIoMi3jKxJZZPlVih1Dt4FtOFN0y5iehl6Vf/NzUHxygI4xCx1NV
 N7ufA/i7049OfMlRiwdnfYAuZVq3FslGp8+PSqCTsaNEIclcxW3tHgSaIO7tmaYEcHzT/qKuzBr
 AI00cg+pHPFLKFoZhFA==
X-Proofpoint-ORIG-GUID: VGLDArcfYvY8YnXlXrA2CS68uCZ3yNv_
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27c672 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: VGLDArcfYvY8YnXlXrA2CS68uCZ3yNv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_005323_553783_D648A8B5 
X-CRM114-Status: GOOD (  11.22  )
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


