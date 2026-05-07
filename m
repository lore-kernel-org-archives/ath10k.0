Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E43BCD3442
	for <ath10k@archiver.kernel.org>; Thu,  7 May 2026 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=; b=XgJM6uOtkrgKtdKJjTL2iPCjha
	NoG7swBVFzCNurDNAZ6Op0luMDFHIDiPaRZsLD+I6+eooUjc1G7psQpDBaRcSJNmPRtykmTzKn0Jb
	3+e91HwaZTEWLbb3BPRP4aOmTLwa3IhlwOcGdA3uIta5D8v7us62HOoKQa9UhO3Buv+bIw1oJ8fG8
	oNn1xWwfXlXFoLDbrp1rgbT3RAN9MPxLzfV1yxzTKtSU0vnyjeZu+pV8pyHFo8/yR9ERJKhJcx3Fv
	S+WOQN2xVy/E6JAKM5mov9TObkBKrLWEqGWPCpklESWF/GiK/a50vWgEOtwL76Wyk+etGnc+oSfZR
	G+nRopig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0b5-00000004AkT-3AmM;
	Thu, 07 May 2026 15:25:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0b2-00000004AiQ-4BMr
	for ath10k@lists.infradead.org;
	Thu, 07 May 2026 15:25:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AVY3O151029
	for <ath10k@lists.infradead.org>; Thu, 7 May 2026 15:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=; b=JNRuu/6tQg8Iq2yd
	efyuW8NpXjne8LakeYYrmxE2IXd0811URgteAZuuZe7hSFzFIjLDs4geR7VhamFG
	n83UxzHDzPwQY0bf2pDm74l1Dbpi+19LuNU2e8Iozs8RmX3DhPdqyCEXe9F58AMu
	8VrFY4AoYHnLwTjLpcLSAYm7/UY4JMH+8frEp7SibnG5+D/O78QB0nBkVdm1mpO8
	TYSdd5vt7KWPhF+nOUX3+HPbeX0X8iooViDwgbzYKKlaHtpQU+ybcnyGr9XHY6wG
	ikXlCr+7RoRcCJ5Tl11QBu+mpsMILrxsHNJNLdBXZoQUHPyBKpG/LJw4k/Phl2WZ
	rI3n2Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kcttg5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 07 May 2026 15:25:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575242b4308so2218240e0c.1
        for <ath10k@lists.infradead.org>; Thu, 07 May 2026 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167503; x=1778772303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=;
        b=NwqT1I0ursW86z3mma3NacyYdm+v/zZ8nAY7WyDoUkY1XheJGPa7Z5fcL96GePbXdh
         koCDB/YUJhmgLXBvEfzHRuX6eVMxfJ/6qtrVv1JDVH4IRapTZoZdv+DtR1w5QmcvCouy
         6yoOoM5aO0jniFMrtt0pGZqKMKIG06PlxEjeDfDGpnF6f/8uEReYA+xt2yMKQXtV1PCm
         U2HxCUGmYj2ub7mFwm9+pCI7vIjrqx4BCVXMNY7mczRNFwO/LHBHZN6d66Ob+AfnCPwW
         mEfVNYNC/02JB+8eOkYNqIcLMAeBTE81YFgRRuxKZDx8VbX/lDy4Gb0YWeY/v75vtbt1
         /9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167503; x=1778772303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oEdzPlvkzmsz9XRBy398mVsjWjXUxo2umSQ5Z50zP28=;
        b=bS1pS7UIVWU7Ix6Uyqh+y6Zs5WXQhlRPWcKgFRNWx/m4FHgvW6kHJ08FS76+CymXd2
         R9d+y82BASorudiwuqOLef7M5/OIYtWNfaLDqRtQg/5Kax1uRFS7eETtmlbCTyTOqepJ
         /QcQYz9e82E+QtE2/NFdz1qoacpLO3Q2Csvk+wXsrV9nxpf7iKDGg6EuDQkbx8kXu76j
         5r7W9EAEohGKR4ccwuwjsqWUObT/t36EiY8ZF8gFAyqltDy2AcpSTW22mv37LiUEbLW7
         7o8DP+qTyMnHh9db1GYsubpwyS2BYXHeL/aHJ87CgLJQlYnsVriaLIN9XygSSxDbkFTP
         z81Q==
X-Forwarded-Encrypted: i=1; AFNElJ9oAQgLohlkNyyQV+Kqgvsp1NNx5KTJFYgGt2ExIGC8ijyegZOiOvJllHS3FaGPZKlDt4ces8s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk+gIbdP+4zL+IxjY6R00f+9LwSs8uCYrY8iZRyXoRaILEZOrv
	vA793+C9hrUc47kMUCa4uCC0c9vZ5tx0UqhW6w7c/hyYp9IqhXxbA8towGkN+Mar+cYl4D1dYMw
	NrneQ1i8nkkO62ViqJCnh5VyB0OISUqi+CPJIcRClC/vEvuVKi+0DbNgg7WsVHVuC
X-Gm-Gg: AeBDietA5AOEDJrzS8jHFWQykmmANNWz8kFtkj/Xz19v+qESgl9TQhxn78roU8WEYTx
	DrOhS1Wifgw2LAtzAUlYyIJlb5r/ccZ9VYSHu/7Tp03aYi+9qldS7a2DrBu13bde674NKwZAhyz
	L6uHL/lg9FtjBQ3Okytg5zdtGmA5kmV7UwT7NXxVuozYAYNItoiaOYP1Sag4Nw+hdIphTcS+cZr
	45VUZgQtB0RgSfkOn09J3adAAQAX9L9lBYfYYkXZBk8mYgI7v+c5BkZWHw6xSiXDhpVxJQ3TSJQ
	JyNKrKwBGgaF8VJTlmYzGi8KX83UyVTvuDbH82LJR4gRKfl1uwhXNXj52JCiBABxv4noIy7PMGV
	b2nvcGhOEAtAyYqn7m2JhKEw0XNWDOBSdQE1OS4WicIY67HV18ZzVHW/xLGhonUMrcysvkDHaOz
	kiRl4800QW2oOhW0kG3SoC2J4eUgnjGJjpUFlqrg==
X-Received: by 2002:a05:6122:e14b:b0:575:37ed:f787 with SMTP id 71dfb90a1353d-5755968ada9mr5305794e0c.13.1778167503427;
        Thu, 07 May 2026 08:25:03 -0700 (PDT)
X-Received: by 2002:a05:6122:e14b:b0:575:37ed:f787 with SMTP id 71dfb90a1353d-5755968ada9mr5305758e0c.13.1778167503042;
        Thu, 07 May 2026 08:25:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:25:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:42 +0200
Subject: [PATCH v2 7/8] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-7-bf17edd5134e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fcaed0 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: uA1R8T2tuJhGumUZ9K4LMT2ZO5OFbXvC
X-Proofpoint-ORIG-GUID: uA1R8T2tuJhGumUZ9K4LMT2ZO5OFbXvC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX+lK1GEV/nEH/
 8AmCqfDpK2gRrw+jfdAzkH//TJ7y2g9UM+XTCZOjnCPFzRMM7Oj3WMTz7A5T6X3wPPa1Pl722v2
 GUL00lDD7abQqW/N/h0KLZSFna7JTL3Qdlb6jNQ37x4AnUyENrnH4yMjAnl8QAHdJYjx/EM6fXk
 X0jFIDomUJmClEhugzhneToim8BPerc5/CoXlxE2sXdMNY0+7OpnNyb2Fc62PzQ55kuvr4SZCIc
 a3Q1yDWXuudmaT9xSX4RJgjI2llWx0vw7Ogj0kHVmG2GKiHz74CrfnJSWJUA7omYM54sjn7gEX6
 hHzcPPtw5wXQEEJC9ke19J0kUl0vk6mS74ITNy4oq7Hsqi9VzwaQX01zH3uxh3kL3rEvnuzvs2A
 FZpKrWEtmRrg+rxjm88rKKtuOeZPKhuGPP0URDShV5xhs4qlhekBaGp8sM3kwCIgX9QtuF4j11M
 wHbrJzKVQALVIlzvAbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082505_160502_168EF6FA 
X-CRM114-Status: GOOD (  14.46  )
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

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


