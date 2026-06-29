Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B5BC43638
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=oRkc0ufZs+9zn0R4VNFIOknyrU
	LD7tKFmli51nAtYXKhsmufyivWrdmtZh1/MUfCIOnwrAb8rY4waLGYY0naJi0EFz3SisDLGnKfcfw
	+91jkv99ZFTr2HcK2ktvI7sIgV5UYUa9r/JvT9PddLW1gR4uw4aHzzwRNVlvhVSBDwQQrW97mAPlz
	7CZzxAMq41rqqaEOaT3U2u6ZblYOOTWFsu303Dl/ivz2mvH7vovipkftx7YbtMegQCnOe1vaGxQA0
	/zD7ZGWDZnG0o9Mv1VIxrNlB3WLUCHIv0BiN5WU12dLWRMSFjUeGK1UBxKg2TqaUHanvhj4zpCMUx
	3jHsA/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mV-0000000E3dy-174l;
	Mon, 29 Jun 2026 08:55:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mR-0000000E3YP-2Y6L
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 08:55:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7DnSM2188694
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=czdkQeM5XH12mExK
	rQBsqBTVulz05q+nbLZ/hDzVsMaEjL1c4QwPswA294pcy5d4tcPszTVQCbRi8HFP
	dtuBQ1P+Bref1rX/fKTpVD1kLVqSOt3e/EB800H1TnmQgUGmPM4PlepUhLErNW44
	9L2MaE6m38IyfAfaUllVU0PMbM1o0ZbvVaKFeuDqb8+sTN7qkI/nJskmKo3OhiY4
	tE1bJ4viyymvwTGiUg56tQ+T6nrlqNQAmrSjp0I/1d8xds94EULEkD3nhT0qa8He
	Cmo0MKo0h+oEXuMSPN5Fdcd+wH1BMYPzLzqKIB8xXhQE2auXmxUYLIPsNsKbMDfA
	Ws2w2g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trdmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:51 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbecd250b7so1158955e0c.3
        for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723350; x=1783328150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=bcz1H/g59dwoA74o5E5tkjbAS2l8k+grwlt0eqCPZYt/zabhM9e/9/uRLY5NjWwWoF
         FIv3o5B36lkNSH+Z37g/KR3AAXxU3fgLUxPF84Lijp1giQHFCvJM+EhxfBGZp6eWICRt
         uXzb6X/i9xhhkYuLMM1Kf+zNQThfbCwog08st61bXmj0VOMuXiSxoaNZCxl0X8FwFFwu
         pAAuRmpmlCj4jNUgZi5j5sVzyKjH4eC3S67fX2NYzs7d9avbuPSi7lNL/lr6IIbEgxPj
         vT9I0EP5+iJZTpMIF7xUmwgHrVCwzkWROhwi5JcPi5JIdHY+3WqYkaKUIjEqoMPeN9Bp
         6NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723350; x=1783328150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=jNRsSLeNHW9Ua8NYgn4pf0FmttArH6QP4BElWqKXgVPkY/kbg+xAEmyw2qH4PUzCx9
         vHgBOFD6Y4NZ7tLpVWRIqgj/yRKJ9KEi0ZfEv3VSpNsNpHm7AQgdcR660ZfNVOevsBba
         ztyv0eMXL1H8bhuWmsqk5T5sj9BYW/Cb40BcZkLpmlBFr/vJMnAh/xfacAUBcP3pqCDw
         Otoas+ofEKzf4uXRPc/CfYeFewIuuvmw6UNTRscrt5lWOJT0VGR9LKNEoT8j+VG+JA3c
         u2TOIHd1qBsW0xn6I9EHb57n13/N3JqP5qBGtpT0n8R+M19KxjIKpBLV55J+sjlCZjoD
         eH5g==
X-Forwarded-Encrypted: i=1; AHgh+Rrm1qjLbUQvqJhN4WV219pldg3j1oFnTfK7HBoQYUzET7YNXb6+EFeYknymQ/9sEUI4tK2ETog=@lists.infradead.org
X-Gm-Message-State: AOJu0Yza6XmR0JAGh0+AplK1k4bH4FmiK69/ryTA/10Qi6RXDMM9UT94
	kiJi+gbUpf3BZKyXK58xWORjmI9XwCGqXKnOfq+kHFZkV5eklokBkY1xR64oc/X6k1C9eKpXcbt
	6LH29NSNdYjOso7mSyCEitX2C2Z0C6Np/o+jKkLV8wEnNSnYujwyEWCe0EN+BaoGd
X-Gm-Gg: AfdE7cl0jMhY0GdRA9uuFsHi1954enJw7MUH3ni51B7CccwZpnrGRWOfhW8P9T6OBA1
	j1uWPkaCvy36vjINFLdFxMqgMkhCkUfdoAc+hJO1cC7EsxhdnnEp6cqTQyKbxP0dPLInD1kaC8v
	gZ9b3sSA2KZ9qBAElGirdxKlyeWpYn31L/uZwSZIkurVjbcRNUzWcyZZ0YI3Nak0J6kvOEJSCcQ
	9cvXf16Xgbtkivz8CFJxRuUfcprueaROd4Cw8pgyLqZzLiX/3uhRP33RAFJSJoJTjkbubUUfkAQ
	NO7y6+DZbyH09nOt3xY53Ny1p+0iqtVZYpPX6qx9wMQGQpeznsN2w0PEaUqQapnqL0blo9pWMuh
	w2P3YEvMYdVvagOMV0p14BEyhhAC2ThbsG3fx9yysejzcYdXQ6cr9um0bCSjwJjR/mxWmQzPhnE
	a9G/cv1UWQ05oH0r4oYQhLKG37wNNZOw1yg46v25gcDTGNf6P9ObEzT7LIdPtseTveRB6V+gsO8
	7t6h1mj/scqgbK4XPSd
X-Received: by 2002:a05:6122:6588:b0:5bd:ac45:5b04 with SMTP id 71dfb90a1353d-5bdac455e68mr794036e0c.9.1782723350198;
        Mon, 29 Jun 2026 01:55:50 -0700 (PDT)
X-Received: by 2002:a05:6122:6588:b0:5bd:ac45:5b04 with SMTP id 71dfb90a1353d-5bdac455e68mr794004e0c.9.1782723349679;
        Mon, 29 Jun 2026 01:55:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:27 +0200
Subject: [PATCH v6 8/9] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-8-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX0Ts3Qd9LPQum
 64HZ+eMtaB6BIXwNw/6DmaRX/YRQvD6uH7YOokGHBHPJL0klpWSTf+IS1ycrdQpIo0juUNd40f8
 Y0MyIvuJU5wgewEpreIVEpq30y+EhXO3MJER72t7h7PlCfagHbnIUrXsoXYBMkbaAEfPAeuJNu/
 a0nkiMl+4Y8wyFPO/y4ugKpr3azFVJPS8/AGVsmmohk8ys/3BvAaTDy6cFi6uVOzQzCSEpO5eYm
 lDwT/L7+jBOqW9GEbwLolZFkLqXwqouLSuCKrMj+u4W8KB6o0u5MB/9pDrektKvz7BdiFMvRH4U
 InYhfeRqRA7L35w/JujbDBj+bFBDyVSshn9gW8/jRcm3wBPRglaORzwlLA3Hb8aNoFOa0hM/Jz7
 4AJ5sBDeEAjspVhXnlKBrxY6MrKQVr6zGTdF5Ne/WaD0IGF3BL0TgAoTBioM5kwJLFqkyIZ0OZu
 AT4O0AIWFywYWri84Kw==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a423317 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX10PLE0lSQcT0
 Tg9CFC5xuxyHA5vyOyV+4sBz4XjaFLjm5VaRofeMtSIWiS1qeVFNdGlM7uloCix2skxmLS0kTVR
 5PhmXJMdEZ52lN3QmDK9UfXowgX+xeM=
X-Proofpoint-ORIG-GUID: Dc_Am6Dq4WTjXf3IFqt3LjX2XtOgBZZ9
X-Proofpoint-GUID: Dc_Am6Dq4WTjXf3IFqt3LjX2XtOgBZZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015551_687411_D68BFF13 
X-CRM114-Status: GOOD (  14.59  )
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


