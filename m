Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1D4C43458
	for <ath10k@archiver.kernel.org>; Fri,  3 Jul 2026 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=4Wc/JQlq9yevdFeiGkl5SyCOV+
	tWZ/7wRTTVo0XUCV3z2bjPr3X/ncpQy7ps68LgPJg4/TVaj7L0I3Z7Ybe55hq+50kPoSIFo4PrLvY
	r5NRW7z6Q55l8lLAQHW42LUeqO4GmMb5v+sHpZgU4rPX/CS7xqWydkmRvzU5Q9wjBxe94e1SrkeqQ
	/GCfUqd3pxGFSPkR441gSGCRMOZ7dK0c8VjH9ljq6MkXFP1tfV7aqGPwuMolXxxu+0ZcI1iNXj6ng
	Ni1GLX3l/41XMpsP9KeIcjWnDpfwGbX/X4vc+/UwfPmXftQUcO5rX/HRgoh9CN9wqVJlXJAnYSL5a
	87IpEVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeDC-000000078J2-0o6V;
	Fri, 03 Jul 2026 13:45:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeD9-000000078Ey-2oRP
	for ath10k@lists.infradead.org;
	Fri, 03 Jul 2026 13:45:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BHT9s3110488
	for <ath10k@lists.infradead.org>; Fri, 3 Jul 2026 13:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=BjEwQ7KXV91y6w5K
	VaQIfEuSxIf16eWd1haiwUtC/PYzRYiVxl1j5dXjqMoCiigcwbu0X+8vL/TExdy4
	ZgaYvX3s/VjRfFmnLJ2HAxVpoT2At/uvdsGENm8WOfnOSljYzXiflbVP57mea2FX
	KnQYVBSaRc+RTVmHc1S5LvgQFioMJfP0+CNEuyaeFSePaW2SyzXcOQyNvMVcGtyj
	FwwWkbyB25zHbrgMA13dzHUKe6tPQz9z0YNucycudgyRDEQ2qG4QyzaE1Utrt5uS
	gNyLrQaSn/7xmzjyveth3rLNCkQC+OEimnMLDr3jt7aY1uQdm/4UCnx8933DfJ1O
	dXR6hw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eybab0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 13:45:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e632390d2so104358785a.3
        for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086342; x=1783691142; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=kHlkLUPHiO5rg/YqhcTlxvrI3B0F88XZ/74TYJBAvaw1Equ6J4ZXVc3iSVb0Gq4k9o
         EWTu8HoMGEr6/LTW0HvrxU7iVpyvWvK21lMcSYrlp+xDWlxUi48b4UZG+US5DUdyr2El
         KwRAz4jm+2axiw+ifwoMfdkh7/NrKDG7qKcuwucb793oi5wRGali7Q4ttCSdKQOXv1Tf
         4cuSJOjs48AzsFq7erm/ixCk19xF2+K9fMclE8LCIOs75lN6WEh53FieGGyW4mVhl3Mp
         vRuReRJPo/enjm7oRxrQQXb9XvANKKupcjMNtRNDU8cXpfeoXGSMSPE5eTxO2VNhRQbS
         VTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086342; x=1783691142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=EfgTUAxXUE5HbFa2xoFViCt19KladJHqpPBiERDoTHJdpypz9oRKMUfNz8MFJIU9bi
         sb31d8Nc0EWO24X/MDWpE55eW4+DtOFCRI1WE/4EBB12ggzHtyeCc8wWQsZQ9L3/RG3T
         pHN7dIQ6SpDF1EwB11EpB+vc1jMGmBt0ZD2AIZY1RHle1nnyrNTl8ys1W3UM8olkh/F5
         g41UH/sLdOARgF+Ua9VvwMiRvNd+nPPw0zl98q6KuGMGX/OQtVxuiUhQK4DzSyMd8+6m
         2qG/B7Rav6o6EyPHoKwxS2iR49J/rK9Aycuug3/s+Mf33GM6rVq61mpjdNnRBdebTHTA
         kHzA==
X-Forwarded-Encrypted: i=1; AFNElJ8XlclwvyLEEq+sd1P+q/6dhSpI8cpI0daAsGC+ZqRdsZ7Vevc1qQryo7tdO57N8+KuxsXEUEA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl8uQUEb6bc1J0wcjGviyOemLfT0CuF2Q8TL8TYSBEjTmTXqAl
	e4WQYsRLSx4JzgRYchVle1x2C/sIDHC/34bJllwPQvmmnb4b3QcD0noROegwuFFcgrC7mmz4iaL
	79HvlAEeSVITcGsU8lkpPMtQmmtVnao08xtfV0O901H35D585yZuST/b7Nvg4mLAu
X-Gm-Gg: AfdE7ckTODWfJLPX0bWveOfPBVjXR1me6GB9nuPrPrnjozluOLTjT2yN/J9H5aEvezy
	i7pP/bedTTGUToIXkw0yofiQYEW6UrRa7bhB0Q+ySuVKYZICUTsOJEZ3dr9PO+b37X6Lt5WVUzJ
	JFziZ/n2R8wemnCnhEZ6xv/4+dneSGgif/twgURioeClsZnbGYHKUXnnRQRYsKqvXox7hXfgaAI
	7G2OtfoVSJzke3RQcXfedyZjS7Vo+2P/f8TMK0jV/BtG+6BsHzDZeF58Zqmy+bOLaPH5kaJ/fBc
	rrnDIa4WYnzgrCcLtzrEqicJgH6EdYBKjUILIKT8QWJUu/FPLIOMueo0mMFwGUQWaXUSWsQoGt/
	GakjzgWmMZ4FGAwtslBvWsApRcoTUoSABIXtgNvP1OzYquo4on0REKhOmVGzzH0//4XGApsLm69
	7epzCM+u3ydK7qFZ6OA9KYZH7S3Z4uzhzfueTf9nbd8x226DFlz8iZPmX9b8lHyrw=
X-Received: by 2002:a05:620a:2725:b0:92e:6a8d:38ba with SMTP id af79cd13be357-92e7b3dec02mr1223919085a.56.1783086332696;
        Fri, 03 Jul 2026 06:45:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2725:b0:92e:6a8d:38ba with SMTP id af79cd13be357-92e7b3dec02mr1223818485a.56.1783086327285;
        Fri, 03 Jul 2026 06:45:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:16 +0200
Subject: [PATCH v8 3/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-3-98ae32bfc49a@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX2GWRhFgDDnuz
 Sh4QCbC/pR/A/6JQpjKpuduXwT7Ae4nMtjMfMxHEJZGj1BzjEDeS2jyqM8T5f5WpbZVw7dHMEnr
 uWpW3PdhET30mbW4MnIqGHlIUT9fIZUA3veu+zCvDjsPKUnJdXw+fYDixV3RAn/uAll0eQ4m1aC
 EJi+nSK21ZpvYOzsURGys76kSaJRyNZbjqcOou0OQG7q6f1+JmgEGL7xpL/Zc8rVHxqDzgDajwU
 XowgfBuBubRCXpRHjoQ6oAEfJkRgTTnQAgRcw84E7IInON7XzH2y84R7GpC+ynISTOAAr2avkSX
 d1X7JL9C+PqTk9p9v/2Pnx7JsMVt0EyAHb7AfmE3LEm5aVJXJV1WHxspoFJ/KGGQWY4ai3C0n2s
 KepKU3mUzEsxNnJhSWdyvBqYu+e/pt0Fd5AljJ5qtqv+XOdFda7mIV0ZjJXmWXBFBHLy8oXrGtg
 eav0nqNIDwP3cx5wzvQ==
X-Proofpoint-GUID: -CYs0B0qSecwTD54uNXKJJ4SFE4AVKBW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX+aGiLuOhzutj
 YnM6ZMRpia8N8lM8evLqCJ6fhgSMtlOnbI3Bo3xGY/7Na7U7CObcMHEq5kDYvapMWWw5cyQ02Cx
 u9V93ZmMLA8VGPO6DfKHgXbB+6vPkPQ=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47bd06 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -CYs0B0qSecwTD54uNXKJJ4SFE4AVKBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064543_820939_0C0FF408 
X-CRM114-Status: GOOD (  11.58  )
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


