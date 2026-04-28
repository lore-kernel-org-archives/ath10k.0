Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A9EFF886D
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+OP4W0xAiPDjd5bYE2eMNSeXnhE/RBCJAZjyE4cLE8=; b=XRiWTAymS8PdHP9OgPjURuAi3h
	W2HrqVG7qd17EKvpkWBN0xPQUGU3Mvp9l3qxBF9gwrdgBE1PhXlbecfcHfAgF2nDa1t98xDwzqNje
	67ii16+vLYLpuey6/OgJZBP3COwieKZm8P5oS/Utvf3uPmaUnz7Gahb+QO2H8Y/hFNdnmOIpKo8m5
	GkxV9AN21X6KSzM1iDdJWI0/KFNbsf+KC7eBtnKoxCU1g7WnXVudhWAemtAs7JBSw7uz7wlOmfKwx
	L90le/xm3zAa8SvBTQ1aYHkt3zTaS95/wONjKNmaOd7NtL6ANjYGRdhg6x4q7ybfdHQvR30eXACMC
	8T2z601Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLm-00000001e5B-1POG;
	Tue, 28 Apr 2026 14:23:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLj-00000001e2k-3lEz
	for ath10k@bombadil.infradead.org;
	Tue, 28 Apr 2026 14:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=w+OP4W0xAiPDjd5bYE2eMNSeXnhE/RBCJAZjyE4cLE8=; b=K8xGMbE1pdkJUFiAbiF+H5+oH/
	P0cvNMJhCEJsuQB5x/3fGK1HIx7z2fgRY6SWZ/VzULM7bExGviRua3ePB871BfgISmD1QxHy+V+XX
	vIez7vxtF+gM0ivqF20oaJTsraJFuOLX31ikLti1lnIztaB8vAP0hf+/FHq2AXMLAQVbIRqHMboFW
	kmyCfopqBHdsz7YxX5VU56WtRunS3MLbEG0koc3NoCEApX0+J1wcSYlL+GmEv78zLZ0pDP7VABVBr
	V9ulXFnT8xdllMh2lk4X6AmYwQlWqF5hh58aw+e0yzmTgz/+fGwk2rLMSkVWdjSkrm3aRZueD+PHw
	w+OCOebA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLf-00000003Jil-2XFI
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9riVb2111945
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+OP4W0xAiPDjd5bYE2eMNSeXnhE/RBCJAZjyE4cLE8=; b=iPGoa7IDfNVUwgax
	iQmx3Hn13dlYxiKhW6NWQgJkVCcfVhWY3w1NXgiUS/AO4kbXtAzsbJqfdPE5LbOD
	aMaZdelub8/Unp8pb+HXCzEQBsR8xginxDxZ9BlF6F2PJ0wLwDzUrqo+sdtDjJgg
	8FcBPFGCgBaJlXLIhj9Wis1DcxlQZz6GYLY/WXYtai2KxqkaTJ3x+/fi70R8b0wg
	68KmHm/howOh5nqx9HVMUGO44qYYBxUDt6ASdrC9UxNoI8W+c8giWCAV02VWXESm
	vxIU4fZTShIm+pLIAwBfOkXCqylEyi+86em422/0qZen+6+ECfncdGkpPZGVtiQ0
	f5FCwA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbm0hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56eeff9a2e3so19652504e0c.3
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386214; x=1777991014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+OP4W0xAiPDjd5bYE2eMNSeXnhE/RBCJAZjyE4cLE8=;
        b=OlaIJNH2UecVrPXVDCdVSx9/qEwJ6YKnPQDxwU9n3pOw0G9bOzXXhBZjz6pWJHy3tE
         4psmnyYkZXsisS4sV1pxw64l3ZJzC6Uw/4T6Ac95RUwfUyoblbdn5erG2ErQEpUjLf8A
         XrEU9nUNKW0DtrjD6ZFqRV+MYCyViOiQyxYHZqNAirHndOf4qumZ0Q6iWDJExFWcFYK1
         u/TJP+Iraap48K5iFwUwdyqdJ1sMrtzCQeKjzOATM4UHv2MAoFzZr7ejXNtKhnvJax23
         CPo3JwUwYj2/GdPAYe2UOKLXzJDqV8kUOUwU0xWrEsdj5z0FUek509Hn9X80mQXWryF+
         E38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386214; x=1777991014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w+OP4W0xAiPDjd5bYE2eMNSeXnhE/RBCJAZjyE4cLE8=;
        b=lmoe80ES2W+9FW8CfAKlBD8rLGVjL7p+bwdjIfodektc9nvFwoZFbe2yZtSNiWZ2WB
         aw+bIoJ7Y+TYLznNCinnsX5G3f2NAoORH6Terpc+PTdz50Rnes8H/ey/+A3DBiojj4JC
         Yx/izJTOzPz+rOrXbbhqQT+nPNZQLHRDD9ameW1mmSLoPDsmc+VOz6bws+GVV9oNqUWz
         3zZ5eV0wU/1eJZql2hHj79Gylnhz52rgO7WGVv+PgOBMPrleSz7URhmAUhIMr1WAH1gr
         bKLBW+zzpSh2RrhKAAf6+SkcJxeOe7nFwMF8QYlzjg9SK5n49v9A+yZFbAA/4Ot8QmIa
         /lvA==
X-Forwarded-Encrypted: i=1; AFNElJ/yv6tnZE/JMW7yubrcJbwwdUthBaq57yA4FIGztcs9y+IgsEJF0XfbmhFEgCOBBdtFmnOsAzk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXxVClQYFZXF3w7ZBho9kRAbmbdUZIc8qYhMmxphW+O+Ogu02y
	oKt1D+1WsNmCiT/v7d39h3PAEAxez/q82pZHELOiBJhDL2oghrcCMtTEwpRkq8kg3c/8Bx0yPBN
	l+4nS51m1luc+WNNWlEPe1vMzUNDw8qZW1F4QNX7MpIAQKLRa9nbvhHWwVlh27svQ
X-Gm-Gg: AeBDiesN+j8ySAbgPBlyAbh+RiWuAiaQh/09Wz7KSH5a9SjE4g9GqeDqDAmm+moFRFP
	TzOD0TLqWhwxnfDxS52qK3M1RtUFseIqxvdLi0HAEdUMTiPUEEGYXzJ6Wa1G/Ze6hBZvmCQsNXi
	kmO4Om+APpfLd8FROoqE34vABLgZVoEC4+a1l37y6Iok6qio1bahQ+oxTE2Dh0Lp9B1PV+9aXRI
	p0sLiOa+IPcnv3Fzg+O6f09CBeiB8tNkN3/mpoDVO9hKm0guEg5r7MjtAXkpsRDsXyt7x/+Vki+
	k5rwhtPIIkbDubWJQeje8A+Z5zX2Ap8Ix1THSA9+5AOJHSF+uFwcr4id2glPTRSddYoeBtC7ok6
	53NzYLml6jQVEtJro2Mu20YXTXPjxvyMfgvRWeoX6qjfOoFp6BYkHsE7AdLP4zszjzygTsNr/5B
	JNzRlV5xcZXa66Hd9U+L9BZv6/n00=
X-Received: by 2002:a05:6122:4201:b0:56c:860b:c34e with SMTP id 71dfb90a1353d-573a55b83fcmr1687255e0c.8.1777386214220;
        Tue, 28 Apr 2026 07:23:34 -0700 (PDT)
X-Received: by 2002:a05:6122:4201:b0:56c:860b:c34e with SMTP id 71dfb90a1353d-573a55b83fcmr1687200e0c.8.1777386213784;
        Tue, 28 Apr 2026 07:23:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:14 +0200
Subject: [PATCH 9/9] arm64: dts: qcom: arduino-imola: Get Bluetooth BD
 address from NVMEM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-9-6ad23e75190a@oss.qualcomm.com>
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
X-Proofpoint-GUID: KQA0X_-cmW53FehYK5m1vfAulVyD-9UZ
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0c2e7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: KQA0X_-cmW53FehYK5m1vfAulVyD-9UZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX1NL85jw3iLy0
 F6cHbMNXbSvL2JEztk4XRUUrUmGwkQqC65xuS+J7w0/Qe1GAkcuv16rrVsuvjxNec8gtAf098R0
 t6TivMGi3PKGOW3yR5lML5a3bK6xCrpNWLsvb0P5vyV7GUE+DOTfWOl+uOZYcpQeRQSbeDRvv+s
 OLgpiB01ROV5XtmbUTonjWVd+Q2TBAoJ/gpy6nfP0xiIVrLG7Ar5t689t1s0K8VKZyWNRN3snaM
 ycRgiRN0b66pzwJeNvU5PW0TYlyBQsAMBce4Ptrgxevrz2owjCbcjM6xuZHKcNDbw/TSUjFaOTb
 5SW0m38kHFjtHM8C7D0ikkRs4lykqTm+6/V818o9CnS7bGLbN1dJ2WWsVSEvqjyag61mdo7X3P4
 vSb2KU2Me84KvJe1zv+Lf3BboAsl7ka28RUK7rtSosfK8qiJipK9lgdXmJuTDS5ZiNg4ypF4xHG
 NQ5NvWNOHSFCWAML8XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_152340_124289_EE2E8259 
X-CRM114-Status: GOOD (  10.90  )
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

On Arduino Uno-Q, the Bluetooth Device address is stored in the eMMC
boot1 partition. Point to the appropriate NVMEM cell to retrieve it.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index 35a30cd6f47d6d2e018f6841a05fe929fec15738..109fa76e05625461935e321e15dbfe6c7d452e78 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -536,6 +536,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 

-- 
2.34.1


