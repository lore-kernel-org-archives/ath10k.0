Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7566DCD8CAC
	for <ath10k@archiver.kernel.org>; Tue,  9 Jun 2026 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=aWe1G/17fOxHwiRqnedLnqYvnC
	TSoHNnpVTN58ObCm4cREvKk3KvRb/E9AvvXeeAzs8T1H4CoOWwdeo2vnDalSWbM3Nq6Qi8c4wN+lo
	aga4n/RfaSnTo2nlRchCMlKYr+fMjvZjrSdZfKKoBuI3r/ypz6wOXQAH6ZHBb1HtJETODZij51cRX
	U+/wDEMPIJ5jiRUMYxfC3wowOZaGZ0EbQjy2GsYHgEIP1rhmsfCJR0yo4vlkBQODLonCgguxldztB
	Fbl5BWArQTj7MDfB4PnhpekvvoTaQvA1h4gcpboRCGRom/UrxSTLHFw0wKy+++WlPkjDPCUmL1MzE
	sOxkgrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrHJ-00000004zvh-0An4;
	Tue, 09 Jun 2026 07:53:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrHG-00000004ztt-1bWQ
	for ath10k@lists.infradead.org;
	Tue, 09 Jun 2026 07:53:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rbTU1923220
	for <ath10k@lists.infradead.org>; Tue, 9 Jun 2026 07:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=pDnRdHs5lvUfpYdk
	Ud7E9GB+W2dPNMQO/F37Vuj4hfqhj/dnsPgXUigUgbsOozzEAotANNaANu2+epFV
	RZXk+ZcPNYW2muCs5isIcfRMowSvT8ovPCDdjGvQLfJ1fAlU2vDmP0d815XesRRc
	cEqYZgd4Ojg6gjoN18HGi0nTRx9ok2UBrBSV6TRnoovNF+dxD+9f9Rk8tWqeHaxS
	rxToI+W8CGDXDn5OOU9hNQ3hOkLV6VQC97yivM6z0UcRKs55eEXVJlQ7TmsDrkdb
	M4JeYKR0v0lrmSdYdrTrZTFD8zllT2t3jeSt57u4g8FDAM3mV34VZCPfafE/RJln
	/zyrtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4g3jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 07:53:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177f07eb05so102318291cf.3
        for <ath10k@lists.infradead.org>; Tue, 09 Jun 2026 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991614; x=1781596414; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=LblG0oTzgW3aA0q69+jv/ZLcdoO5MkHwF8FRs7IeIhSs8xLH0yJfohLlUrucCWfs7m
         Wneiz3Gq4fRYjicyXq9jpgWMwd1G+xG060/zgCe2I07rBxj4iuWYCoCSPFNEFBE8AxwC
         7bRgObdV6Ww5XcQBjW/FBK+iH+lidGc4WuL9h7fvKfumldWIMab7X+NQ6H8XbJ2DdFHj
         jmJhygMBRdjEurEqDY+E73/k2N6wnhmenr2M/qx90km60YZR+7DHKHwJnNg26aPTGp9Q
         TH9nP08quhUEhKeC73Vwxz0PohxvCOkI22nIT83BNPVEFkfo6BHf3m11Z9kgQQLkL4XR
         d2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991614; x=1781596414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=RfIpwKaWsywux9d9fFVa6r+TaIzZWjaORgDt95phdLEHd07/jKhQ5pUsZrIw/28OiU
         gLnDzVca1Gn9VOJ0sZ3xk0ljBFU5a8Biu9AtXA0EbNDDzY6etaABYItgtV/Sf/0NTmbu
         1j+hgPrh5ggLUXq9fsn9EPCItj8Pwn3GYmLxN6S6hTklo8bmNx5e+2sf9q5AfxPIEHCA
         C95ptaEwCHjBx1mGbpXpP/MfEsE2+X5l1Ko1fdkH2EOExv3JDMRLst15uanxehASR2tV
         CyYAQLAkE1IlOWvaMNZcNmwlhsI/FQ7+GKnAmqlAZHJdehoCc4bcn2maBMeD/KOK2S8o
         FpiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Luqa7IkNsSJJgrJjWFc1q0w56yk9LT5dA5HNFEaEpSeSIK2IfO/xQJEXJWFcR6f3SFE6HPWo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4dD2ti3UPJw0DyoNvh0gKX0qeiGOpidQY3eLyBIwP7G+Kbaen
	9WSu8FzTjjGje4Eyk/jIGImnr3zJ3lgwVnlSXeFueBnjhIJcNolg9DFRDJTJz0JEkoYxe9jlP/4
	cjM2ii6bltTaVt+urB7Kw4EIl1W9V3KICPnfog+KRGo+sdS1ZdDvHN7hNcWzeN4Zc
X-Gm-Gg: Acq92OEds6eoPax79sSsSR2OADfSpZK+flsUr5o9QREfjXpGqgztYxQHwiT7Qx+ryRM
	oTX3sEmZLWUPF0vdYS3oS+QuCydB8HFrBoXAwL+ui8NZrZupwy3z+kcY8PworzYzhx/LzGOyDxW
	UUewoYXlmxZBHLU5NXwFMrOHl8eYZ/kITaaa7p0L5R+A+UUZxuP4oi7wFSjoj17Px4hMV77VBeJ
	MOf9vBqdco/TnnwU6K47O0WiOOnuwjorygp3HR+LnVpiCoAlsA8GmO90/KFle9Ys0Pq5ou3R0Dc
	Nhry/9wP6g4lawymREr2SpdNjspRCid2luSiQTYh0L+J9FqHv+PcGweYBslBz+vt1d4wLzEMIdN
	4wdabIVxRoLbeIeYsVrWVcyQJvN0j5iAz2UzElQ/AkLs31qCVPme94FXtVgf7LTuzVxG8s0NQlx
	ORFc9YZ3vtm+Tm0KYMIqB3434CRcNG6P7r9+NoGFq/KEl2FbII4M2YXJRJHaevrvLJv2uWXoJQB
	sL3WL/Dz25R
X-Received: by 2002:ac8:5814:0:b0:50f:bb77:a084 with SMTP id d75a77b69052e-51795afed1bmr263903481cf.25.1780991614420;
        Tue, 09 Jun 2026 00:53:34 -0700 (PDT)
X-Received: by 2002:ac8:5814:0:b0:50f:bb77:a084 with SMTP id d75a77b69052e-51795afed1bmr263903141cf.25.1780991614000;
        Tue, 09 Jun 2026 00:53:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:32 +0200
Subject: [PATCH v4 7/8] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-7-45712e6b22c6@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27c681 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: -RLHD-vH8GmF_k72efka9TPMZ7lWEFdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NCBTYWx0ZWRfXzO7ngc+v4P0Z
 l4TT9SMoKpUZPJ6nfqD5wjsbK5XULXjQ7gPkVfo466xrX+bHroa1GYnnw7Qk8eN6qKNt7jfpg5d
 o2b9kC60rqCjS0ivZTvaM2FKRpOc7dxiKx1w6QaUZIqp54ZbkgFXdiRerH6diDHD7gAjJRLNaMJ
 dKs3z0Cm1lqGIdVk6BwdT6yL+C2PgCrY5UZ6/6Fc6jeGDorKZGP4YB24ctKNpXyPnCB6HlO7jAx
 56xv/00QADVaNzLr8RzP8xqFFYwEolBjkDcDuTxT2Kr8Meg49xvKugOlD19e5rMiWlSqMzR24oq
 zissjdLV6heK7WR2DOpQEk7xmy95k8YxAb5u1JFiaI8N1iMP/ngQcbD49K3viFSmop5mxd6E4ES
 OFdd3iJm2G82de6Za78kaFWcSSWyb0GA71CGFtOqhGtnkAhnQQkFEKpDKPIgVjuGnl8R9Ti0bHo
 +ZhD3xSv1ZPBF0M9bXg==
X-Proofpoint-ORIG-GUID: -RLHD-vH8GmF_k72efka9TPMZ7lWEFdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_005338_722808_824586B0 
X-CRM114-Status: GOOD (  14.41  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


