Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCE3C56207
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=; b=m7lU4UFrTjV6gzhWI/IVK1GQFN
	2lhh8mX679tQXlmAqzmzBUOZ2J0qJlqrhWZYYYBsjgPL4vIAQ50Lvn+iwXlxxdLDjJBRujdbnzkhC
	7bbsYLWKr6ZjEUcSp7CxE6+16NFFo+2XBzEnC6n2Z0DQmyIaYcKcuNZyUH6kuX4f6W6/QW7BlloMh
	i1ytiFcyIpimB3F2D6Nnlooe3lE4hTp3b4YjWUBg207NQISiECg3xJr/7fqGKnFdfYB4GEiEGDj0Y
	VWbMbtpUCf0HrFvZjBw+7Q8arNUjqJHEYQIXh0w6j2O9SmjRIm/KV+pTp5QeH+IhPkJjDLZkqV3+b
	nPvG5nEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFf-00000005zuk-0KpK;
	Thu, 06 Aug 2026 14:39:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFa-00000005zmu-1vIP
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:39:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfYN1277858
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=; b=QiS/BjLC/B/ZEeVX
	leRVFOHaAJqMLNNOkf2Jz8C6MGNXVKN5Vf/0NWYe41lq8NiS1jJPAV3YsY3ZOUNs
	828C4l6IgPKiuUH9sVJXPZUZ085ZneGDG+p2OKNlHwsdG+fW41bKbCeQLr8hHJc3
	lKivAWR5nCfpgOhkRRH8A155NsVkGDA/oChU9txG0xMG/y0xq5MBWRurXXoTRIEF
	kyXUAFfO20Y98sbh8K3eRAvfb9xHes6C/yLXmWyqSRdhSJjVT6ki5NH3cBDLNPAl
	1w42y4alJ7hBsZ6gbmV5NPkMqY0IRRSxlgO9CsWyiGJa9+7r5nAehiEXA6VjAla5
	noHa+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuejr9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:39:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso24627221cf.2
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027152; x=1786631952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=O5dJaSYlkyve2e2q/ho5/3fiIiC5+tT54XTFXehtKTxtlLzD7EdN0zj5be9qX01oMo
         KNeiR3Z3JGaj1TChkh4dp/Uq0wuLP0nD9McxBRMCOkUIE71WODdl1se898Frs/42xjHQ
         tsriUff7vbCulmGaXmhxUuyAlaKUmW+IKF7NGeu7/HLyMhzhndsUJmstEAUEoP/Q3wfj
         Q8qRz2isnfq4xzVsiS0iJA1qz+rg7WT19CYxDbbEcexDsCHFm60PjIE2V66Ga/n4BteX
         ooxdyELVg0He7aeCpOrG4hchftAl7n+DC6nHEvFNc/s9ZzNmn1PcSex3+QhfvW98n/66
         lDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027152; x=1786631952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=ZRLi8NNXNA3Hh3GR7QQVP7j6XggvvS6mdMmWcs/DINpspAiB7cg7B1DZnII7C9rIws
         z0/Zt62RqogfdCZjs09Ptze9mlQHSAmUzmmv01+D4ENCZtJzXQdCxDajLJUc0tozHNnx
         H62VUqCYvUP5RcbX3F0tBEeJSSNgIW2lZHylhBRULagtqGPxtumhg5XzT/xocUUXpmFO
         Klt653C/ujkP+rKwYQuCglVC2H/MI2UZsm/1wdAw/VPgVDe/PgQJKGh9k/HERnMMnf9i
         vrlTAls99Ye8gkCTyW7aLW26lzY2gLkBqlGI/kO4rWZQ9PCnK7KtFxqy81iWwEIv4OUy
         SDtw==
X-Forwarded-Encrypted: i=1; AHgh+RrjPC34bdDfZdxkr5F2h+d9eqjseRO3nhlpzlPu5NSJRiTVkr47SVPyM8usxxsCTWs2CJFVnCM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUCcF/dZGsEHJeDwbQWZx+1lFDCOEr9rn6gLXkCqNiZbyl3aSx
	5RlSlAZYbdPx6V3sRAwBcFiBLb9obOJ8vdX7Nazkew0W5s1eKFlGQXgVklVgISA/X3Sezk7qtfD
	uF7rmeEmW4TnHdtkh/e3DYaDg8w/DSrMbdbQ5jdOo/TQVCRNzxlViSB+sVPYazQLs
X-Gm-Gg: AR+sD12WYe23/jElP3LHy0hP8Kdfu9/0PAQr5LXG0dnIxruefJwewQORN0Yif0oDq1n
	BOLnzpmFFdZnmZLswRaDJP5Xl51CFyPqyWGHNZwenTm1su2Bm8A5fOPyxQNT2YO9WnGVCTFDQ9C
	ZhzD508sDqZ252Sb0kOWfKEHXAlYgGN5ZMWO8StuL53BQUU7uCDFsKWWdPgV4LE9trH5d3/NCV7
	g6xtUk6zEMGsPVUACFpldc5iC7EjlL52AuyUNLGt3ikBmHdws4LnosvC7gcvWP6y4DV/Kqx4Ys+
	q/zvyhMe2INMmIXwyfDKtc7mJxKDTF2mYd/xzQCy7JpFwKKZsRkRnpW61nn/LQeyab0wcABUSmZ
	NAaSGNaDWe+lbYE86uBHrzbQ3zx8yy2AWwZv8zn58T4IU4vV9sJ5iUAjV22QTPnArc1Cl9/i24R
	EaFnc9oFobQJBi7vAP97Sq66UAyFRTu0oAcGF8uanFO9yM6ansLg==
X-Received: by 2002:a05:622a:998:b0:51f:20e1:137f with SMTP id d75a77b69052e-52ce6035ce7mr175977411cf.19.1786027151741;
        Thu, 06 Aug 2026 07:39:11 -0700 (PDT)
X-Received: by 2002:a05:622a:998:b0:51f:20e1:137f with SMTP id d75a77b69052e-52ce6035ce7mr175975181cf.19.1786027150660;
        Thu, 06 Aug 2026 07:39:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:39:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:42 +0200
Subject: [PATCH v10 09/10] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-9-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a749c91 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: AEm6O2LSinAUyehoadp66QmFbYzlm8-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX3HzVzx38brXL
 F21dblK9oLVcJBYmuIbgkRoZfSAcQHb1bib9CFAN2oVbcxrPQ7LBX84JLv5nmzji8+dKvqvup9L
 p5h8vjfLIODfsx4Y24WSfpzQdQPn4bNVTzBe8OMVB8M/DHMlswXqlwrHTQximCaTQM+rJSkHp9n
 OXzbKqFIdpa5WUj84DeiniTl1WmC6eX+dF+ZoKw9eOHE51O1dene+7+kdgcbpi6LI6GMJ7pkq+F
 61CBmMSB4B+AypcXwb6Lak9e/a/iwCspE6iNcIVLwKj1xhpjKDQWOjUZBPtuJ619JK7/znlUVgw
 oEsoxHPFZ4gp4MW/KZOm9EqkiP+zPJ96JWpulOMJlreLVPnpLePq8onKzhZEHQPsahmZVcX6A0q
 es4J/NBXU7CqDGNbguNq3nznrTowmwPkVIozv8AQbAX56NM7NW4aEyoOgd2FCeTD44Ho1wmMAip
 XPQeB4dZl0or1mX7m+A==
X-Proofpoint-ORIG-GUID: AEm6O2LSinAUyehoadp66QmFbYzlm8-g
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX3auJ0lrUXtXG
 wJWmITHqq1ITZ7iqbugN0p8U5F4gbyrUmlNaS9lu2Qu0sQHElyZRYS/gBg28hj+GC9rfcqVFRbP
 /7dAowa1TsgV4wMP+5pvZCSJ/53BYPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073914_533310_2717D6D1 
X-CRM114-Status: GOOD (  14.53  )
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
index 04ebe290bc784ea854ec7743bc753c3e41f556d3..06cb787b0559f3d712ec2b88d9e25a7d46fb00b3 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -723,8 +723,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
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


