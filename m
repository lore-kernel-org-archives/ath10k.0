Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F139FC43602
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=tQum3+I0M9Q1rocJzsLmCTpITj
	3j6gMQikYzvxhC4tBwArUQLgrr3JQtiUH0xRYVX3SQA/OGWAdEL8LWSP48xHuruFaZaJ1uoTgxv0i
	TsQd99xv4RgXc77QgoV1GTvUBGcQbLagaGctPvJ0jItHifl6ColLf1AyVyLAabxEtEGiKbZC+GwGT
	oG5GznFjFw29Jd8bkmu81g8cDQkTws5AHaYpefaEZWcXnO6zOeZ6q1eahw3z0DoBwL1obCmChmizY
	smsgnS+/Q8IRcvMD4LCVRa6HaruDWq+8WlOnyN447iHN7JdztmVFUho/J/kFmBvHZmnn/ZqEUXQ5g
	tlX5pZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexNI-00000002T1F-2zCT;
	Wed, 01 Jul 2026 16:01:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexN6-00000002Su8-3TBu
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 16:01:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoBK31468644
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=Pq5NS/nqw8AXlglr
	RFqPdkUwA1KGVsv7K+LRZtwF9K3E1Wcxk47eHkwTdnaldY7gZWQ6ibH3fP9dqRJi
	pbpa0Qh1kylkdNRlU2sHby03bKMc9gW7pcNAAmkJH48C+M/Ba4cjddY6cJ0FheyI
	pukFFt6cPC+ejY5Em3EZrEzYJJdnGgLy86amxW0eQyglo/R93w/eir4Ttv5Ov7+Y
	yhKQsOPbFm8P4KFGopv9y5LXIN9IvvMNq/SSvDowpVFLYJnc8VbvOA01OWsX/Xsg
	ntzgGP680b8EXEOjhjOtVLulFLNmnvCv5G829Z5Isn7bEB+naQI+CzXe5Y1Hhl7D
	7scrIQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sn1af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 16:01:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96910ded42cso169496241.1
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921667; x=1783526467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=HF4yylGZY9Ual8O9vRAOXl3CSo5wQn4KK9POyF2D92vrH7AUUzHXGot1J676GH3JHy
         4J8vT/zuI/t5rhBA7lWRzs0AU3hJyzsRk0frfjLt1KMbJ0es2cB+6ALTpFskwAvMdpMz
         ML49EX/fNT/1fWDfWAZ5qzpjtyXryVoS9uQ/Z5zwJCf1kPoaiE8z9UvD+/fyCWbct40a
         yWHTRllm4oB7Y/a6/9P9wIXLCkZdG9ncz9IGRW1/x6euxH8guhDexpFe0CLkv4BpmfM5
         b3DKbO8l3gbdmaSykwe2FPzXzhv/GuV4fhCVMSRCR8SmCNrfrflbuGGEnZAa1M1VtJTc
         DXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921667; x=1783526467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=A83ACVAFaVwB7JWGi+m2uZLivP9mPKcw2erspmj81hwqMEb0eE03saCwne29lrAVzk
         smeuaQS1+lddxPIfAVOPI7FOL669Elac0Rq9n+2J8Nc6O+rU5f3GqvQH+ytJ2dWDwDKY
         918WjJ+z7R9lj2uvX01NtbjCKDb/PD/SwWU09cOG65CxA7PM4mW64LTCKMgo7pQH0qW+
         rwDMTx9jGkczKxavKxdgA9UpqEYo1wlFn7mF6mYWq9RrFaCPrFTFDxsOyWOZaRW9hwvK
         ZqVH6XJRdF4f1giC6J2N3ptOYxUeaNVThdxERc2GT50lUJMvnbAAW631Z3TIx/jCn6sQ
         QBkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLwCOw2helqpoW8lTFJMt/UZd/ByoAdx0OorY9y+aYM0L5MPxbfGq5nduLOd/l06g2By6A8Ug=@lists.infradead.org
X-Gm-Message-State: AOJu0Yykaif7uK2EKO1OSseq9abK+n0sPngu6j3BPLLH3gjxrHX6TeMr
	2L/FgxScO+aKayzxC4BGuaVrX7mjfK3kjpQHE6reCDaSlTtPIbMw9KLWCb7suhkTG+kR8BQDY7X
	3+QoYtFlQqcr/mwm1diof9GEw9cOsR7qnlwAdXU1BCauJ4+9PL3589QD+m3e9TLbd
X-Gm-Gg: AfdE7cnAvyoo3C19kqrahepqmiwy5dTey3E8v6b4DgtSS9yHLHMw9T3TOsp79V9rDD4
	ZO2PnezdqLtc53mqTL3wuwt5Qbzg8V30pNWzkFN9trNWoIGvKPMeMgdVdxNYh2JuDdObKDqD2dx
	ZpdVzHd0hwzNznv3NEuUNAS0BsCxsObiAT6LyXeu5zjpnKaJSIgCABHnc1fH+gkG6b0kjFdk8fh
	Dw8TUBCV13p1gMPWcYGzmoaR5LW/BcmUrolT5V2e1CmyySIw2d9yXvNnq9jVxMJbcJsigaaUVl2
	+YcyG0p9uE03vHZmXZdB1bx9eO/bmOqej25Va+uvSlQOvg4JjnbtP+xMs/MYYURc1wM0t7Gc6Ce
	9FCKkVcvlFh2JGmS3DTuAyjzFPZngliUenPhvzCXYQHie4NtEJZvBX0jk+6YNpMwNhYIC3n+E6G
	YIuH5TMZXZnaauKPBR1cZG9rrhHyV4tWsYYeSFWUQqXt4m8kUOo2msjMzYxb3zPbc=
X-Received: by 2002:a05:6102:38cf:b0:739:d787:be9 with SMTP id ada2fe7eead31-73daa349057mr1034978137.17.1782921666904;
        Wed, 01 Jul 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:6102:38cf:b0:739:d787:be9 with SMTP id ada2fe7eead31-73daa349057mr1034801137.17.1782921665861;
        Wed, 01 Jul 2026 09:01:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:01:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:32 +0200
Subject: [PATCH v7 8/9] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-8-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
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
X-Proofpoint-GUID: BsFZb_-nxCBxeSqlsrF0NABcaBGNe2at
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX60QjVovo9O7g
 RDD6dqNnPx7US6LNA0eBdKjG7eEDeMIvwlNoP8x3frc9xMO9f//WBcsS3ojXyLtB/brwUT0Y3My
 p9XvmCARuo9q+cyx3jTbIMVSi/CFup7JWyw5htE0wgm9UFV1SBY5p+SxURkYSjiayaXyQWD3Vvi
 74L4GMSHsXDQKug8t00jfYH8QWbpkJPkthWfXTEyA84ym6iJVWLweMOo7KWP9PO/tuE6wXl0gzE
 SXwxccujUKN/8oeUqwdVzDPFEYUZsvtSa2xDXn//TWfIMpiPGIJ+sNNpTnRjeuvW2jioFkcMy2d
 LoIXm5q1r0MUY/LIGuiv76ckdRi87+BazWfcOoiMtyKq22d/+FLE9GdxVdyjcy/Ec31S/6C7Eni
 /EgT5xZWlIVu43u+Kd4dfdeCf73khvkUX9IM8/j5WdX+cZSwX5S5eZrEIvPA5t46VU30GZwxXiy
 ute3xnI6yUybxXfLLZA==
X-Proofpoint-ORIG-GUID: BsFZb_-nxCBxeSqlsrF0NABcaBGNe2at
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a4539c4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX2CdcAWYYIFXS
 7Kln4cjEH5nRem7nunlFLsPReVLabvL61O0jvDI+jcf/CCLbmIrnwKijI6rpKvYmSbJt08Pp5LG
 GBHIWh9H5EfgcqIKbEsCa7rH74lEJdQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090108_889385_E20DF359 
X-CRM114-Status: GOOD (  14.87  )
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


