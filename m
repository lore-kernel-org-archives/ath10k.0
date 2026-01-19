Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E96ED29C4E
	for <ath10k@archiver.kernel.org>; Mon, 19 Jan 2026 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwfHhB1nZVxoEXqN3zZuZTlTKGAwslL0h3eFOKQFT8Y=; b=eaSKn3KBGxFwJrGOhiZtilBu8T
	mmxDVSkelF16B0AsCN73Fcw8jxalnobn82CuBmQfac7O8zMWQiYzFiD8dGHsVnBPR2+qdlb/ndzfk
	5EFoayGMPs2myKBaKPlsb8arjGkwFb1Rd9yiDfplOxvojj8C7C4akEEGCLp2DiLR9biFltWzZB7g/
	jiJ2DNl+Ey3iBFZS7v4MYuCoW1Tsh6axWx98YE9pEGUjp5ISrLj1NSIjhzowNmymPRItagpP7qUH2
	UbS0QXO/ldTS8ux+c4Aiz370J3cY0vnc1WwjOYghc8KmteLYl6kUTzFHHqeVrvuBZtK6jmzWu0M5j
	ihAE2RMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjZ-00000002ake-0kVt;
	Mon, 19 Jan 2026 17:08:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjW-00000002ajL-0wBe
	for ath10k@lists.infradead.org;
	Mon, 19 Jan 2026 17:08:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9mtTu2965047
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JwfHhB1nZVxoEXqN3zZuZTlTKGAwslL0h3eFOKQFT8Y=; b=TaMyBYgyxqXXI66n
	ldL5EXs6VC5C72Ry0oFp3PMW4hxS+q3AMfXur0xUyfTesIUhg63/B4XScxlS7Q+4
	I3PZA0hoTAYjh1LHwEwJ215w8EWDUdgpdbQ2P/5nykqHHYBd9KH7a+654t+4wv0/
	6BRekUrbn4sQq4h00zEjaEGbUYtSTCcQ1S0kMsl4wB28jVBPvgw2MrEoRQojWVCb
	NUEvVpGKg82/6f3UxdwxgH+WRVVHBB261VTWwly4Bj9wXFpKZMAsPZwEsTtUOEAM
	zl+ZixhjnO5Dg2EVSkoUpGT1YUMCWCswl+6wV7lQ8e1N2L25vYMpfcTZBEBDTxie
	Fd+DoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa9964-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a87029b6so777213585a.1
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842485; x=1769447285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwfHhB1nZVxoEXqN3zZuZTlTKGAwslL0h3eFOKQFT8Y=;
        b=gB0Q+fR7B37ggZPs79z+ncAqORW0JtLV33toiMAhdtHZsIw7QDsXliRTNGes4TMfNf
         HnMvzN1N3GqyTej7A8lXzvgsqXEob+bLeRjGK2R8J8+Fgs5xrhZim76CCll1i/8DWgor
         ZABiVmMdxVtBZJKlw2NggxsEYIC2QXygBDHC8v9opJyErYjvvzrouGi+RPI32oHFJhtP
         zNSuN0xHguvFCcS9jmqa+6VjxdhmaQHiG6Wphsn9kQBf7wQDAnQt1Dwt/+ImUUl494MM
         Sf2mVD1zMRk/eAfc0SBcR3LrVgkzktXgmT6ZCqjQnJ6BgFNq4pSAWGT78ohbnZqCULZ+
         jx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842485; x=1769447285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JwfHhB1nZVxoEXqN3zZuZTlTKGAwslL0h3eFOKQFT8Y=;
        b=KY3cWSqjqAuSWophSSSfs9kLHOlG1eeNjLYQ1NkgDpv4i+J2tCrb5ODsTb79F+QhBq
         2wx7/+H6gp+aSkYnOhDQ+eU/ZbIUxZquWjC9JF40jD/1RuQiZtr4pwlJ8mSeXvNhPxcV
         DSYOjilwAzMyEf+ARKeAv3/XnUhL5bgV6c13/mlbLU+20w+0cPF3b3y7AjaR0Y36O5dy
         lkxgJiiaC3RZj0et731P4i888tQ5HZv0IIlF/s9RCudF1G/w5J/gvHFhzt/5oGIBk69N
         yZwb+bqlf2/flHk+HKoXQlcDEpTV1lImSLuHhv84+LgdCVTAqQi5EH6gyHTRyFyaWwBL
         KZlg==
X-Forwarded-Encrypted: i=1; AJvYcCXTUqYhNxpHlRMfzwOkm/pmjzjdMh4AWejjwKo92re3KbgxnAD2dlsXcm4QRP4ly0JykpibYt4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDhjSm7NNSsLG8v7eYrVik5jTeIPZQc0A3tthZtxSYi5rFeFOo
	3JsoB7wNDQelIsx7iJPhIBGYNvlO8xUF2qP/IKKshVMjj8wDquyiUfNjlAliGZBMe6Vts/x2NLS
	w7EAtruiag7RCiDD7N6MTRIh6L9A9/N/TnXldyduxGcUuFfk4hdL6XAY+sfsIJaIY
X-Gm-Gg: AY/fxX5+LG3otAajfxfNIAw8YJLGEgmft508IiaywZk3fS1cuXYcRkOreQVD2PM/AEq
	wGjl0wWHe7gU+cAUuAfZpabDz59954x/nCn4A8HiCOf7/hRiwvpk5X8GGzCNqNYkXr2g9aqMM9h
	tEpHt2xgVQtfI7XoJFHuvAFAKJ+8DlJA6CsCHoCpsBElLVC8TTVcWGD897lzy22JliZbLP0O6Ag
	GvF1wQWKqtelHF1VdP6sljxK3weC2a2DtBu/hO3VAD4UKcMsrXHSSU6vXSVOqLIgeoaZ+UbLSib
	bVdOOshkRu2yH3Ja8/7/dIGsRYK51IE5sFaletrSXoarnpC5JT44CErQK5qZK6V278Fu+jHw5D9
	Put2fBtZURICaT6I0ap1qdwmaDwUvMAfC5c9KPNi2kXBkWMIOmE58n6AE3y4eyxHd2p0Fi3W1HJ
	I8hHoQ7wCbJjLBgQ/KybVuxsY=
X-Received: by 2002:a05:620a:2801:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c6a66e8b5emr1918763685a.5.1768842484754;
        Mon, 19 Jan 2026 09:08:04 -0800 (PST)
X-Received: by 2002:a05:620a:2801:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c6a66e8b5emr1918757485a.5.1768842484156;
        Mon, 19 Jan 2026 09:08:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:07:56 +0200
Subject: [PATCH v3 2/8] Bluetooth: qca: fix ROM version reading on WCN3998
 chips
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-2-948df19f5ec2@oss.qualcomm.com>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
In-Reply-To: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VErys9hqLxgSS6Lrdz1CsakdJ/riLD4OBXw0+DkoA9Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTtbjApPeOwaS8Ui7htTq4t79FkzH+7eN26N
 Wsg/RM7z2eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7QAKCRCLPIo+Aiko
 1W1yB/0VywSU6J5rQUN6Srp/NRmC/d0jzYMzo0KObisnCcmnAiur+qIhuxBP8UUnwD3z4nVb0t4
 7wOEgvr9+ctMeME9veNQD2ljbj01uhDPTOkt6Bx4LRi7b7lq8SgVbDaSUXqo7OxDrZcCYvuYCzT
 LrgBwaxzr4/EJFttxsOMb0Qkovr+OIvq+Ha523Tjrz0kkcxyxXQ9L2ZVG3FQuo7tJcCZrpRKeh2
 yyJh4OSMWmD5A/QmWk9wA9hkHl2YzlJ5NFewrNcZgLXIQws0tUTDsPSGRGPD8SrPs7DVQpsvOVC
 qfrpvTNWyrusyF845CefxPShXNEcJD20U6t+FAQqinaCNOBZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX52wmccZChg63
 depyH5zZy+gccM56GC6amoCV4Vxck2zI3dewO+Syj7K2hJvwDl1cIa8Bfqbcx/COC+/2olWj4Ls
 EKemWTx8x4JKooISaA2u1Q1m533KZ9BQIp7M7X2piUi6NScvnVwLgeWvTQl6FMkYV74RjEGdrNV
 juTwYKXlZtJhOMVMFKvdxcS8Llk2hJ0xQK/975fVDVXvD1jdhDwzZLGIM0b9+WyXB4YvUtOtHVS
 0gIm7ZwG8Zjud6lSi2IfKyxVIF2QNW2q6udJEO/0OQbRcA61GXiebGlnqEpPmRcKQCBvFe5xU3/
 QRAOD/Sx66mPhnLMhnqAyN9TlQcwFhe/443eipDTUvr/7u4TBrwNbsFjHwi3/tU1d2yUpBeON16
 p7MSbp8KXq9y3uTVxH2uoviZ1EgOye2RL7a7p7nIEF6XWbdlYroLTiGq77/Dr7ZML/WzFwGbUrx
 MsGTI+L8EdU1Yq5m3HQ==
X-Proofpoint-ORIG-GUID: SpQtdK4qjAdWoSf3q4JlxS686tpn-aBZ
X-Proofpoint-GUID: SpQtdK4qjAdWoSf3q4JlxS686tpn-aBZ
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e64f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TaVSYX7Pq2PjI-6xwy8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_090806_269839_EAFEC0EA 
X-CRM114-Status: GOOD (  12.37  )
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

WCN3998 uses a bit different format for rom version:

[    5.479978] Bluetooth: hci0: setting up wcn399x
[    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
[    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
[    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
[    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
[    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
[    6.842948] Bluetooth: hci0: QCA setup on UART is completed

Fixes: 523760b7ff88 ("Bluetooth: hci_qca: Added support for WCN3998")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 74f820e89655..3b0626920193 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -787,6 +787,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	 */
 	if (soc_type == QCA_WCN3988)
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
+	else if (soc_type == QCA_WCN3998)
+		rom_ver = ((soc_ver & 0x0000f000) >> 0x07) | (soc_ver & 0x0000000f);
 	else
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
 

-- 
2.47.3


