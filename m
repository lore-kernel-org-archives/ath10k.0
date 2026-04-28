Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E208DFF885A
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=; b=14qKBNtySAvScxuM6v7NVNDjxV
	x7JTfkEjKTwH3zBnEd+BkD7YV0KPShl1Cd3lnnMuHZmRErKHjHr9gvRMTNMUTqbGfqU1GBhT6hKcf
	hMfkhoN7iAdR/vqe4DqVP+RhbUqRfKSzO0f/99ywPyuNZxLyJG83ILZLWvEJ8f8cjsR97rv0H8FaE
	YloCiROK6jtBRtTq0EShtN9aLM6xLQi15Cd7IjZeiolv2hWzKm5djpPiHRyt/VrtXLrXI/80aqA7J
	tB8QO8SV+ZLgPWS04m66g+A0wyFRrp67NonwNvHOYzmc70WHqMy1PEATtRjesI+OHuZnniuCfCowY
	AkF+jI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLU-00000001dlV-2hT7;
	Tue, 28 Apr 2026 14:23:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLS-00000001djb-3W8o
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA2twS984988
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=; b=pBY9ODjKd57VJ7fQ
	8wU/+JYQXlY52h6b7nn6uMPFeERqAXOixtsF5OYvZ74ld3CJoOYU2kPGd7y7VQ+M
	jJNjX9Trr3O9rvHejYSwkFdrhuAIVUTI3/HKqJE6irsxU/2muTFYon2sJLuQufuB
	xzXXwihPXe4EqPnW/R940HTBX97jdm8/0Gz0up51kSOncR3Lk1BOOq/iR5mY0/PG
	4GWrSof4ZxgaFXS0UGC3ZBKpMKz0NW+ARMW51icCCqtzdqdPJzB1Wn9iRtqzh9mU
	8Flb8meUeZH6O2LQWgvl5uJJ0OXiPrjj4tNzmwJHJlT5Rx8CVCsXv7c8/vTQD3LK
	p+pGsA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2s29j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d849e9277so20834156e0c.1
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386205; x=1777991005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=;
        b=OttncXgqakhBz9L6gFABLde4hg2fAAzimAzRRqHinS6Zj2bIsy9ittvdDXwaBOjRHx
         qJQZiIiJSuTTM7AlWCakttifIrOMDCnpZCIBkOJIMAhqGkF2pfI44Yvc27dxxWuBwROy
         RfWW9IOsyMvf9iOZP8GYkNT2fplpGF+E78B9aGyW7DoSC7mi8KuZxiv59IPpiIkCMF/n
         BbHZXxriw2PkhwVgeM8HWIidrW+RIHf3FSZueuXrKHWM3Lzz7PXMeTPosVPHmLo4+Mii
         +orIof8rOELOoLRk7bubf5Zi8kYB09GT4PaesAOAHatc5hqDIkCUXlY1NhtmYwZzh75G
         FYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386205; x=1777991005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=;
        b=jQ1FfZ8hkhBVcqkjb9QNK/0NZJoWdbRPTk/RvGr/c3eR9LHs0zJWoXY48JiybKrQUl
         iK8wZE4L9Qp5Pj6csCTo+txM7x/u7x/Zp9evToyYgiDvJHtzwhohxpfXCzZtDtMx2YYZ
         d0EXTbmgnDiQXQLEJs2jpw6KVP5Tax8cZVgM9LRSLZEyeAmb9KWrTvYYNuaBwm3O2X7q
         apRpi8Jkk/zixpsS5aC2JtoHWB35azyqxOLOxtjWx+lJSBTE/EwR2SSVBzMFQ13wfi/K
         u3IP/5ZFWUS2a2TotcqGObLzBT49kxlEv139MyEssuhSrmAL15kXTPAeQN34+YD/x2OD
         yQqg==
X-Forwarded-Encrypted: i=1; AFNElJ94NqDQRpgLpSBohrtAWODrch42AKkN+AMc3dC3qYBL9zuCUIzzqgqRudyVgdmrM5HzCyEqF4A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw068ZYRZKId+cNm44q1OX9ffvMkfipmEXC6obxJdHeGjnifpRJ
	qVFhHJbXcFZ8tTMd4wwcDAwowH62lGZzY6Djii4RQGxH5+O2hNl2lAWiL0cJyWa9DHCLockGoYu
	V7zzGmT/R7Q/tgBKVgy+ZVH5WgKXDtgdVlu/Lf++yQlgYO0yGgVHSyh6UbGhdmZhA
X-Gm-Gg: AeBDiesDtvLFCl/N31J2qVtR7a/4LbQ2VBW4NM9g49m6MVczUdf9MNr92sumXqUN/Ni
	D/cCUeF85zRv5r3sj9aisT2DFSSyOiPqXPwq7BGr7U6mQjtC+2CVtjCEu4mNDsRnsYT4hgqAr8l
	TRHO6Jhp518JWDXwL+4RcQn4jHa19IpvhU43h/0FnofAZ6/p5YFuwYl8TXE9n+ecNaP4fm2htTb
	RiUv1n31odhR75KQ7ygVmqDfDAvefAF8wNkz5t/HAKJpua+ppWUPgdw+s4Kewa2WWg/Ma+UhkOo
	GVBdKP3nMx5ch3PQWVxDXtyh74CEy05yHEK8X1kyc8Rv49KYHuhQFoFnGEJ9sqW4kC1TjxnR5X4
	QLuvHUIa0yHp2PNW0a/RbDuldWul6mzGRwMiIP63KenjvLfXYj0J5aWBy1MlB1AcXQWRbE3Nh4Z
	mxGcps6zk54PkJDd/PdgLjKTgybwo=
X-Received: by 2002:a05:6122:1d4c:b0:56f:8f5:b135 with SMTP id 71dfb90a1353d-573a56fd202mr1557391e0c.14.1777386205096;
        Tue, 28 Apr 2026 07:23:25 -0700 (PDT)
X-Received: by 2002:a05:6122:1d4c:b0:56f:8f5:b135 with SMTP id 71dfb90a1353d-573a56fd202mr1557313e0c.14.1777386204513;
        Tue, 28 Apr 2026 07:23:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:10 +0200
Subject: [PATCH 5/9] arm64: dts: qcom: arduino-imola: Get WiFi MAC from
 NVMEM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-5-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f0c2de cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: MLcDO_y8WjUBZZ6ddun5o5RHaASuzgY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX5I3dTx0kdvy4
 1rZqQmNz2pW8zPrzBZZ5khZNM9IQs/4IVtQXJDcF/v4XEzgQRC/rdqjOOREvGKAHqCK8QqjQ81f
 oIIi/NdOqw3bDw5RAPwzcpaAw9iWRWuthc4b0dWe47fijp57HsLzvM+dsyv3O+v3to+vcuURNs0
 jMAjIzKXvTzo6Y/tP5Xwdw6XifRMZ41ioGLdjWxbJ+9UuGujzOWsM1YQ/uzokthYsC0wRXp/XG1
 JBdZ+TGF6XlfRMAnJKqQWi2C4LKChmsU6dtXoJ5O2t7RPXQMZ/ME89Tzc6No7WIww9yE5X9+TKV
 hZrsyoLJBgSY65qejvs8NSeZuDZhfLz4tdbMu9BDDhVRstkFym3HBvsYTfLB81hbKtVGC/I5/rA
 WnZuw5k1MuDY/JyLvOvWgcVWz3QQyjfpN5TI9wuHTKtZYRZ3Azsj1ZH1W7Z488qiC+Pi0a1QWEb
 3kq9KCG/sV7tJQsdmhA==
X-Proofpoint-GUID: MLcDO_y8WjUBZZ6ddun5o5RHaASuzgY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072326_883657_E6975FB3 
X-CRM114-Status: GOOD (  12.18  )
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

On Arduino Uno-Q, the WiFi MAC address is stored in the eMMC
boot1 partition. Point to the appropriate NVMEM cell to
retrieve it.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index dc85cf94f71cac8666cab30ccf37cc2d2f8fd941..35a30cd6f47d6d2e018f6841a05fe929fec15738 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -581,6 +581,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


