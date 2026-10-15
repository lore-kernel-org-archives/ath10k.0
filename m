Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A6DCC6B3A
	for <ath10k@archiver.kernel.org>; Thu, 15 Oct 2026 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAQibhB3BU4XK9rhY3Rtg4MZdwMJFrdXgDdCbJcLw0w=; b=OScCQUKyvzMaoRhg2HiOeSg90w
	WJh3xb4XL04KusvfA+dJPBFiDNtF3IchXiVJarA/3rvdcwCaNSZS8zYcGL3QBge/7dyvXVIMnfrpl
	P7Pu+RBBxdBYPSDzInPNxXpYmTqykslIh6/SXdXY6CEQ9Ybwc66PTqUhv17lFWZnEBHh3Kqp/7Wis
	sr24niXGIK40vikFwqkVDXxfK6PUTUXDZeCKCbzvK975ASuG4+9Kk1W02IgkH+04+/jEexG+brDVR
	sPztQoPFJjzexWKmDKxkM3IMRS/w99PDuaAPq6bMsQ9xWVD9CowXBO150hkNCXqbEqkUEPuRwArDn
	0vw+shIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMQ5-00000000Mjk-2Evy;
	Thu, 15 Oct 2026 14:26:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPh-00000000MNX-34CU
	for ath10k@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jKCY4077497
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAQibhB3BU4XK9rhY3Rtg4MZdwMJFrdXgDdCbJcLw0w=; b=Iw0htt73hPoa3S6X
	Ojct/r3qln6GOZp7WBO6DEMClDLMEQJRWp7Td8e9zpUQJ/tu+yy4xjv9t2JEpWni
	KSAhnFn57Ir9dor9hoq7wInt5FFDn9ZEEw0P1k/VCX8NvDjxtbCCdYglrRWVN5Pe
	v7VP2wYwgjuB/zvmgYsLA8yPeSNQG4MEIcXNHtJDGhV4HeU3KcI5py/60TE0tLbe
	LO3Y7lCcX8eDDgiAetqWvqGj1ZSUtzRLmtU633jFMfS/n5mwZ9C9v90ZXBSg+UU/
	vXwCl6wlLs6Tj9TtsZNb3fFuHRG0qBUTO8rN0EFljZhP+NIj5xT9JWfNcGJOUycv
	8LozVA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc160j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 14:26:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cb6dd9d07eso411025137.1
        for <ath10k@lists.infradead.org>; Thu, 15 Oct 2026 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074392; x=1792679192; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAQibhB3BU4XK9rhY3Rtg4MZdwMJFrdXgDdCbJcLw0w=;
        b=efJEgJ8jWXkWYMSOOA3a0AEWh0k+dh51UQES0e4GYJnzo1LH2cp5kUAlpDVJ0ivHod
         YyaO1zzjKjuKv092ytqvROwBDKeR0r2DKjSQ3Dj3tqPPbVVVL51ecccAQ3gb48+/l73j
         z11dvTgEBUZ6Bv/MNOH6LqAuBcZ8RRJVBIEu0JUdqKgVNNWhyHBMY6wAr8k1h9n+bsth
         orC5k6xsSFQoFI+IxtMRglz1P16TADuQqpcJLLqmX6RVRS6JvafSlxIG0S1kZceoAqgl
         uNRCLzBqW6KxIzi6O4DyD9eN6uvK+TginoIY43w3vIwPzA7gjRT07hIIiaxibM5hQDmA
         suJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074392; x=1792679192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAQibhB3BU4XK9rhY3Rtg4MZdwMJFrdXgDdCbJcLw0w=;
        b=ROzISbSIpdSBEOKqcPM7KL455DTnYoejVD2LyIB4ubj1G4d3XGjITtnJfkmF7InEL1
         RTvnpYYOzfpjfrdZdfmQ0dYY0geZJ8ErpXRU96y8neuUGhq8GFBIjQ6plhr4VRrr/cqG
         d28/QhIjRCzJNhlVxtr8ZzG+OP6ysykX6/U2/5XxJhmOtcsoc9sVyMQZXDiHPYgfGx9D
         6z9yROA5fG6c4k5vQm1EiPPgHZmEnISAO0G5GFv8ltlbG9Q8rV3Dniet2VY6LvgLVGfj
         g4X+ccaTPPKmfrt/k3kyRPpkeiwg9v775O4MfuyqHVXEmfJgHEjBQ7WqZLUZSpm7gOHV
         M3/w==
X-Forwarded-Encrypted: i=1; AKwUvBwKPFlFFzKOO3kmeyS8g9SH7si9QoDEwa7ifGQNRGMJmvdd3kmDeRVVCaQbSadMUpkCIdv1AqA=@lists.infradead.org
X-Gm-Message-State: AFq9FYIRkVFXOdrDPK0lCtFbk6/b2dEPvF7oxb9WX+4+1RI4jUpNHm+a
	nuJdNkbJ8doV826tyi1PfOSABHa7oyuHg+1DlgW2PFGOuPv50TPOvFjir6dmlxj7HbOHPeSTrRn
	gkPObd4jWsMM65ot7rP3KPEJaV5TrphQpcXSBlEhn6wrEE/2THRIQ2DeCQSg3hZ/o
X-Gm-Gg: AYBFou0PN8Z0E1u+nRyeQxlsqpDpyJQvEilpfscZ7kcqpag4A/1mzJwkW12XVBLR4gn
	XtH05rN++Epv3ZG39cy5YEWWZ8Xl7UK4kL/llRP3PtR0pcdITKGqqJQVn0OA9guQZgMnIV6Vkjv
	Cen4ITvL6jkXOji8QVArHwRpdpw7aptUyPrasLAzUfg9euL5vnBOhWLrQlTq8ScT/9JPRvQA577
	QQtri5vqhTohhNycTIJYfBSyrYFakTVsmyVVH2F2oGoVu6m+dQ5LNMqLGhZSOW347CDmNqgQnr+
	QqYnJJpSfqqqFdR+jP+0YgCg0CzwQnTfiq0tqcWcdLm+s+arngMEsevzn7MY77CS9czTDvzUUxe
	n7sBYMSbDz3rsg6/RbfyKieJzXLgLOiOUJbK463UWDFUcMWMNxK/td7fos18aIjoQld2s3L+geA
	I7s2DaVVs0we8u21NwVZxTO6BsImvTqqJKkvAqsAREegQ1Qw/9x/k=
X-Received: by 2002:a05:6102:5717:b0:7bf:d9dd:82f8 with SMTP id ada2fe7eead31-7cb373808f0mr3918236137.21.1792074391759;
        Thu, 15 Oct 2026 07:26:31 -0700 (PDT)
X-Received: by 2002:a05:6102:5717:b0:7bf:d9dd:82f8 with SMTP id ada2fe7eead31-7cb373808f0mr3918202137.21.1792074390919;
        Thu, 15 Oct 2026 07:26:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:05 +0200
Subject: [PATCH v11 6/7] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-6-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
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
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0e299 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX2zs/TghaWllD
 NJyqAk7XD6DuWLE/T9zD74EskuZi5ZIClhgCJsc2Wzuq2oEN/JKMyPMv33G5LmR3HGUBbRvw96K
 KfOypprltISkge0oY4VAFCMG3843vTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX5u/0fDFAhLIZ
 p7KpCJMckM3jjWJyZ6wEzqhVi0otQfhJSPu3xPppCjgS7dyCRM2OexhRDQbeRIhFJNB2A/IONXu
 KKOCcJ/K/of0F6+7zslyuuhpMq9C9qlWY7Mt///tqYbz3ThJfJtnP8AtMWKDnT/t3yxX+k0kium
 qL1LCTcwvB1H1UB3K0Xh2luueAgrwx3yjGokqQ53MVg4yzHBMDB4jzZ+IueliAjqGhIKr5uCDlP
 jg5/sJCoc39U5ZgFU2H8DvOPP7KM/cVHYVhI3MHBDUr50OSG49ny33/6UJrbeqPiTnSX65pmnAE
 bqxD1yFrkCikNNYra1sXupVXncmRMJcxQ/h6VTI+DMSrUw4f+Okq4Kbsmet5c87/M5llr0A892D
 CesLh4gJONmsLPTRLQNoWDXLucuQ+ekcO/iRPqVrdIeXkqf1U5pHBsPi3fku/IhZc5YgVSHUA6a
 4MPCDT6DyZxJFLR7zrw==
X-Proofpoint-ORIG-GUID: TZ-0mL3xvMszwVluld6Km7mC3Dn0QFps
X-Proofpoint-GUID: TZ-0mL3xvMszwVluld6Km7mC3Dn0QFps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072633_970923_B21209D4 
X-CRM114-Status: GOOD (  14.28  )
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
index 22b08ab05b829bef2452cacad9c25eb8a63cda19..08600b0fc041cb09c175bf456cefcb6493171aa1 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -704,8 +704,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
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


