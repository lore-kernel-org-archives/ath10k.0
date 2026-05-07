Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829A4CD3442
	for <ath10k@archiver.kernel.org>; Thu,  7 May 2026 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=; b=fPPLvwyVscjNM3RCMfT4m6doAC
	RD0f3l6fzl7dpOqQ1CQpB8k44cb7yDSO/3ghNTNs3BjhkQKuoiB3QhotUE6dx/0iiw2YoMxQJUsGV
	YaXPWu20cxqxXKMg9+zh36y6fG+BBdNPB7bezHQ+UzCXzVnYo7yXxB+3BbMtY8gybgRG7aTkxjiyZ
	/3xh3J+qIFd48w0dj9Mis5poSTvYT8+DtcjOEj9w+YnS4LP3c4kAeTmZFv1pWSj57yVGweyjBkxKi
	xueKcGYIKURb56KM4ZoqQekCqeSgahEtQzL+rqMN17VVZFXJR11fSZo04zRFnrGnwgOtc7vKFPxIv
	w2jHhXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0au-00000004Ab0-18IP;
	Thu, 07 May 2026 15:24:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0as-00000004AZl-0OPj
	for ath10k@lists.infradead.org;
	Thu, 07 May 2026 15:24:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AjgvS682765
	for <ath10k@lists.infradead.org>; Thu, 7 May 2026 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=; b=pngJchIUuTR6hnjQ
	lUECzDHVo3pz1dlhpiqmaq1DuAFQv80gbFnsc430vvYvth4mo1bwdyR6UWKw5WdL
	WOpcq2EHSqx0x7SuRWqWe2LCyY625A/6sKNH2CPBz1+ERlw6lSn9VmVhjg3m2AjE
	9xjqaSAc6WqXXEOq/Srh54PIvF9/IBE1T0VyqUIqyRFa90B/3Dgo/n+591Morvba
	unefJ2L0hLpbQtFvm9AZTpw+nb43cU0FWeITrCo5GCw5BvFhhlt8ia+b3JuFJtgM
	lcihyLA5QdlvrdltBs6JtiQmmkeQ7kGuSsh/wQ29S1Y3j4W5t0tX7JFr9FIvJpJx
	E+BCeQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhat8ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 07 May 2026 15:24:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d2303e591so1469784241.1
        for <ath10k@lists.infradead.org>; Thu, 07 May 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167493; x=1778772293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=WXRSjHngkvJgplecmPcNQguBjIdZ0TQl2Ln3m40gGklIEdPTtAO3Ew7QyLODhzJKWp
         slgT599Jn1iMWlQNDTzU6OzYEv/m3qm9o1MRjnc6Q+wMp8m6ELOkcjaWx6C9BbAxTyDe
         u/aonQu8NGvUie8qqkHSKFCa0XJ4rapJYNfW9jMHQO7oJAqVbPvfD01cMrvjnlM2zc8M
         dlm1OlfJ7+/EZt/GnKzsvoI7GV17m2H0AMdBWigg5wHB/F0zUekuIYt1Z8C01k7+zSeR
         go3CuixB1Wem7UTH78TcasU2UF805B1PYv2sQh0/+mjs1sRl5fv4GdjYROYD7cNL5Gib
         KVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167493; x=1778772293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=ecNrq/rMyRJd/s/qlvSgW3UKoBVuog/tCa945w2KkMUnVm3qRmyh9vNaKkHmean+DK
         yrxCIhNG7qvC30jY4SikM5jznyQglk3dhI7rygLaPFlzDQAOTgkqDsQkLN1p/eHxE12b
         bc7wSw2EZK6SPazOBoszJ8kd/k/QJ9ggSQRUb4wGUmGtwk4qkTDIm+965eNdG8WqwIVe
         jboCp1VrNtgDvw6HaPpW47iQdCc/R7UsgMcrG01JqLYeDroErmaRBEBC62+HVqy4IVRY
         W5hkWccNuWBjqER6m2k/4Cz0AcBzp6nschYRo/N7a4edAodpqOsiAk2C+oE4vmLbh6Px
         tkww==
X-Forwarded-Encrypted: i=1; AFNElJ+0eFcc9U2y6g9jN9s0N0RoyiqEL9DfjSzHHkYO6RnDARCW/pDbtXnf+mVjtRipq/2uW1ZUYfA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7TpAx+UTp8S/TL8zaQ09WKyyUvJPzWKoNFEsqjLdigXS5otns
	1RDCEP9N2+9ApuzQnHWdsxfj792BCjKHUPvpUSNCr8jMvlP4BlBZDgEdfLFp3CTU7xZn+7x3K6v
	SSsBZ/YTQVbCXc6AlG5u+/ZETrCtsSZaVvWddOGdk7ukc7Amy9m7JPdupaNOdTkgz
X-Gm-Gg: AeBDiesdU99NgcatMq71MiG4ops6l9WUWleFyNg48jtcRoceILpqx2+MpDqNRULExG2
	lWLga/ooMdYoVkKIQj82TireCJDRU8T147pqLjhsceRjOcdhhvwzxGZPbj1WiEsVDBSf4J3yF/2
	+dFIEZWx0zQtTZP54TpVv9qQA/fWjJEjt/19N72JMPx/4sOLnWR/NRJs5UPmYkC6Ut/Aj8AO+cp
	sv3DbtbxuRVhJVWdGDzqA/DGXkmFw8sj0G6lr3qEGTwnnLfHVk613ReLT9elp9QbrOPWpSSUOJs
	uur3X5N2pbmarJLiGYhoCdW1s+fetKO6VLtPvu1pGLGuaYXYMOfLiOmk1wghvaVNfF21/S4xSVw
	ycbYf+d611bWePst2gJWaYkXJ5xY6794+BfMkOQqWnLCJxc0uATuNaSArmXgRIaUcBw3g/7v+69
	IaOTLlvhA0UgT/s+EFDfSNmoHCuyE=
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id 71dfb90a1353d-575591f7b22mr5439005e0c.0.1778167492593;
        Thu, 07 May 2026 08:24:52 -0700 (PDT)
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id 71dfb90a1353d-575591f7b22mr5438965e0c.0.1778167492169;
        Thu, 07 May 2026 08:24:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:38 +0200
Subject: [PATCH v2 3/8] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-3-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX30Ay5k3UEjrs
 vXX93DL9Cgxg6F4qxtcnlHxfL7tZPRhVJiALcuiiB2Wah0BiZjgexf/nINDiv6zn4y+eKqcCtzl
 eBENw+g9EVnhZ+9KuS2V/9QC6jXy+R89/+8fL3b0ijE7DqrI0U23eJEJbrfNRqhJ23H3CZA4Rpz
 TpeFKVAYcSm/HWLWzaYYUxgIKqAZM9W5WxsDnx2X14dpXqGpbhfkyihppr53jqDObpyhYHpHpJh
 RvMXLlHXevcQan6puCw0pPHWUUw0eFADrHC9DlfwgoxGoqi40H61fYAiyYsdVqhF3MUcrV0Jgdy
 de2x2N0wyVih7/0KIDEz8cbTLqefAxWXoAQLGfnsdNG2iFEYYhZ8Q9ndYTPJgnxv2zBzuBBXmVk
 ValSip7Wf1GeAZE9zYYo0FIqa5rDMWSnvJhffbafEDIZBNLi7zWMjIKCrZJMK0eE130tVBm8p1d
 eJTpYZpx++HQ6dVfD3g==
X-Proofpoint-ORIG-GUID: BDtIz56MoP2GbrrR_JfCawQ3Fiucjw6x
X-Proofpoint-GUID: BDtIz56MoP2GbrrR_JfCawQ3Fiucjw6x
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fcaec5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082454_163505_9538D0FA 
X-CRM114-Status: GOOD (  11.56  )
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


