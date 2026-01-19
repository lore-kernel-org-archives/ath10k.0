Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49923D29C4C
	for <ath10k@archiver.kernel.org>; Mon, 19 Jan 2026 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=; b=vin4oUrCVx4iJ2Lx6KHzBJR5Gq
	eAoSUJc4a4QsAqGy1lkCnkQDKvnZE9rQ7epHTgwuUcVuD/cSebDga5cbk4GPmhXz1vWGmpEbhuFlA
	KcaBylrmzTBMftYcj98iHHvohf8V9L8MWnMIXAbgBohZoCwslZFLS44jULe5yzJwPLMbae+fXQDTj
	qHCQ9Ik+SUZqIOCJsLPcaIWGQ2U9DpYH/gh8I8wRRf+TLQmEnAw4TL0TMtrpPI8O4UVghUDqTdhA1
	8NILFoFYJXB/yx1wUrl9hWtJ9Jf6kHc+tDlDT3dfaiRaVArvDFMT+Q6r04gTWD9Nnwz1SgznTFedb
	UXSN1a9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjt-00000002b0w-2x77;
	Mon, 19 Jan 2026 17:08:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjq-00000002azV-1BGq
	for ath10k@bombadil.infradead.org;
	Mon, 19 Jan 2026 17:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=; b=VNTIPSVcOUDdVIbKd3pCsXPucs
	mU2GvVUIzLIWJ8XNqMnUCCVNh0d/lHjH30FwVI6XbxAdnhIN3aAHmzO9/VlpIpn5CiusT5j8QIzNo
	2EebkE68BNUTFqv/OCBVPx6fT4YXGtIENRNXYjkbsO5lr6oqSbrsM2oRu8YbkyukCgKT/tMimAJT8
	jDo4JBjgst9Zrjqsgdf/EW/fmqEClP4j9daB2XgTxxlh+OSAz1hx0C7BQd2OQG1ujnEcMHqCt/KI5
	zb6s8MxxObDWicOx173uyI52w6duMejBm1JUGXtKkobBGVL/nx4BEsTsQtZyck5MT/oFMILLDIhw+
	WAOTigpA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjm-0000000CdXV-0NUC
	for ath10k@lists.infradead.org;
	Mon, 19 Jan 2026 17:08:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JGi1bn1044289
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=; b=f+48wByPlf+opHLs
	gY4ySKU8LbHbYfXr2GoJGFQGupH5cCyOJ5q1VRzqkzCO+S9C/U10Ee8us+fHco0x
	arrDfJF1xBzLLbMaFdBzcwyBg84ONmfBAfeisD7VW8YgGqQv326+zB7SXFuQQJ7B
	8hVPIPf44hX/iEMn6vSyz+RrozG5REyHJMggXxOjO6gaYimTRZKpOR3ATqhnnyPh
	LrrCUjnwBvT1fcQCyWYRMDbB1re6QsT/bwqCGWMJwi1Pd9vTI5Y6/WWZ9qTepsL4
	sZwewb+4Mh9e09EH6wkORbLIPPyMrGQYKXgf4APiEvQDQLVwVEP66qRa98NNQvTs
	oEvKUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ejvn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ad709d8fso554407785a.1
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 09:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842499; x=1769447299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=;
        b=LGvA9DsGYUVEmIala2eg59mhKffIFGSi/GhrNc3mjju5qeglEa8m3jpzPchSgzAtkc
         DOgS+J/0RT0r6ryW5einncPYqUFFT/INt64OtO09zG1IieQpXOmdClGqmlcUkKDC1WG/
         T2C5uQPcWQPFuO9w20C6+D7Ba845N0DVA7OHtIUwiC8PNKmJRIoEYPDuPFxqoXlSv8fL
         uuyhYMteXAu8lIXbpM0cSlBH+PK2AsRVVOIQx+3GODBGV/uTthNy3PIszQCbhnyKrpGV
         4q4/18gnko/sm6igUSwj0NM0usXffhrmaS5O13tfM8JSXvjyXVOQGcjxd3zuISzUWSU/
         CGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842499; x=1769447299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JO4Pi21OVHijpMNbTgyCYWdKmobPiE/rHbiYvQZIfKM=;
        b=L5cxqbk4Iy8FbmFiLfIo8gSG93WhlTSTnTwNhPizcIznpR70CtY5ROhlYVvrCDnnEK
         kcOSzmu1I2wrrDKyisVL8m3XF6xq1GxMiQ+G7P+ycWYl5lKj8lP4nmSOSUzYnsoORRC/
         mkTFRt8lDZa5Afek4eMKGlwfqOD6+iVehkgF1N7Y+rlbQu7vgVtQVTPQPBxsO7ePjENH
         sBSH0RvJdSOfBlet+99jqKgOZSk6fh6NxSX9szpmw7PES3W2jPrJRb2C6SfOfTWfkfk8
         o+fPy51N6beXOpZUgEmmRIKNoWtM2svpBrPJt5bU7SpZbIZ/OvP3ngebcEFKxKFEo7ha
         grnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa0JghOJqc9BLgg1idBd+WSvwb68HC3oyxSEo/SYTY72EW+qJvqH5vLDVS/sGcD3oH6oRPpiU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1l2sXDfeDZNmvqjznK2kup6bTvLMd/+ybzD51vxfhpnWlArzu
	sm4boB+Ed5VzprFAQRcZjSmv3yKaYnjY4Qr4LD55U71dg1H54H3+yoYB2XCEX1BERCqqooER+7w
	sKnzFfjL47ohUlYLjNtpkJbzGUXN3vvWDEQHT+3p5bLbJ5PeDlK03vggD66LPc2+T
X-Gm-Gg: AY/fxX6Ar7BA1hFFILQf9OITK5A7ZjbVeVvcdCYmMqA4FDQ8oTMsnAuwS/JLkw4nED4
	pb3VvictN2DMl+5lwaFL3bi7G0rxx9jajnKD8h4DpGwfqTH9v3HK9NzUJGoIl7zhB+b7vhMYY0H
	DLpxWWp4A7dpa9LPKZ4u7Z24cXBEA58dDpIm0ThATiVNqpS8ZyWCSviYwus0RxxdKR0wzSKlc+H
	FsR5H+Hc3VyUcydVI0bOvP2zUwYOyJqxVZr2LHR6A7I3Z1/ATJK7s0gb3wz2Mj0QFnBlwJ4172G
	/rbj9kSSkxNgrw3ElqUBmIviolQngYqODUdnLBr0nSavjO0ywlL62TOgcE0SjLnFXMLYwmkeHXR
	JjWoJOZicuKl8hDqOHKujMto77+AmvZGyIjvzBdKjfijxdnQ5m/YBx/7ti5ydRkqOYlaJaDJUee
	s/KnmdMXBUUHMXSWJmmhzdHgE=
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c5919e2319mr2036782785a.26.1768842498509;
        Mon, 19 Jan 2026 09:08:18 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c5919e2319mr2036777985a.26.1768842498023;
        Mon, 19 Jan 2026 09:08:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:08:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:08:02 +0200
Subject: [PATCH v3 8/8] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-wcn3990-pwrctl-v3-8-948df19f5ec2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9y+Dif9HlWdcnmMDM5hAVRBaWF08BPAccXmvU/QVEU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTu+r7ZJA1o77mk2TpRuSO15tDHIS8rMPkZ9
 kX3ms7qDI6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7gAKCRCLPIo+Aiko
 1dcsB/0V5kFzZwtHIqSGvv+1cFQ8ebww+6MqvikXSDrDO1RMot7omECcZXXVKK2xgqClME1XrqT
 X2sAqb7wgrXIv86pjCbwJn/fpJf4yPriyW2iHXOP49Mv6UN92sp1Dd6vRLouPWZQSmpm+yVJR+x
 nqSsorYmy1qjR4FdBIw0B4deuluimVT7jG3zH/Y0hWEbUJzWGSq4IuhzJIx0MTQ3mNrW+M0n6qp
 hmvZBWBcI4kbLGIa9dqZjOmn7zDqLCYoktL1LL8M1Q3KAagSRys0XecyKNC+3iOudjL98q8BByS
 YSAi2JLZSTtoRLu69lpwNfPGxWEtMKOxuoSj7f2gYL6ORUFV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfXz+LVA+Gdxn6L
 xhw8NDDoHNoDZR6vEZpWebuZSTHr/Wrd8fJR8gT8u5Lfcyyaskdr640sFc9Dx9w9/RFpauDauYS
 cWSrerskmJAEAnIPmH/G5ppgxy0ptWxL57oUOU6zIpUjb4xwCHEr7OSXJIoSxWG/HhQHZIUSK93
 /MQq5p2CQuChKPvDA9QOFzqv594m8KkEK5VANSHCJKXFii4RLP1qe6mEXggibzN4sF9fqPgxkAb
 5kwHTvgjZ4e6zb/libvUWKpFmB05vas2HT4+WurX3ZVL+05BL+RtmiikVxcwlwoImSnEJOtn6Tq
 HYHtukVq0kEurZQsCpZCRQqAVyD42y8+vyqiUv4IEwAw81yAPM+OfJnHxgs+Mi0gbDWQ4NIFrL9
 G2v7/X1i3tM7vwzhFbBJJ5bIDnWkTYDhFtfgoF+mqT+flMMHHV2pqojubtMey95cBqlcPCLHuuC
 vx4oGa+it1qyHKLwDEw==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e6503 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=daeKR1c1ZtUuBhPExssA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: qDkssyX8uGzfJUw9lP-2NQDHiEqNa3IH
X-Proofpoint-GUID: qDkssyX8uGzfJUw9lP-2NQDHiEqNa3IH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_170823_411272_49814941 
X-CRM114-Status: GOOD (  14.24  )
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

Properly describe the PMU present as a part of the onboard WCN3998
WiFi/BT chip. Enable Bluetooth part of the chip too.

[    5.479978] Bluetooth: hci0: setting up wcn399x
[    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
[    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
[    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
[    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
[    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
[    6.842948] Bluetooth: hci0: QCA setup on UART is completed

[   81.510709] ath10k_snoc 18800000.wifi: qmi chip_id 0x30224 chip_family 0x4001 board_id 0x55 soc_id 0x40060000
[   81.521713] ath10k_snoc 18800000.wifi: qmi fw_version 0x32040163 fw_build_timestamp 2019-10-08 05:42 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.0-00355-QCAHLSWMTPLZ-1
[   81.554143] ath10k_snoc 18800000.wifi: failed to fetch board data for bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk from ath10k/WCN3990/hw1.0/board-2.bin
[   85.467464] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
[   85.478132] ath10k_snoc 18800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[   85.487223] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
[   85.758168] ath10k_snoc 18800000.wifi: htt-ver 3.73 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
[   85.901630] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 141 ++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 1eea9c5c6684..6ae6e07c37df 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		serial0 = &uart2;
+		serial1 = &uart13;
 	};
 
 	chosen {
@@ -66,6 +67,43 @@ hdmi_con: endpoint {
 			};
 		};
 	};
+
+	wcn3998-pmu {
+		compatible = "qcom,wcn3998-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l2c_1p3>;
+		vddch0-supply = <&vreg_l11c_3p3>;
+		vddch1-supply = <&vreg_l10c_3p3>;
+
+		swctrl-gpios = <&tlmm 50 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -598,6 +636,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	status = "okay";
 
@@ -630,12 +672,97 @@ lt9611_irq_pin: lt9611-irq-state {
 		bias-disable;
 	};
 
+	qup_uart13_default: qup-uart13-default-state {
+		cts-pins {
+			pins = "gpio43";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio44";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		tx-pins {
+			pins = "gpio45";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio46";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	qup_uart13_sleep: qup-uart13-sleep-state {
+		cts-pins {
+			pins = "gpio43";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio44";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		tx-pins {
+			pins = "gpio45";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		rx-pins {
+			pins = "gpio46";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio50";
+		function = "gpio";
+		bias-pull-down;
+	};
 };
 
 &uart2 {
 	status = "okay";
 };
 
+&uart13 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 46 IRQ_TYPE_EDGE_FALLING>;
+	pinctrl-0 = <&qup_uart13_default>;
+	pinctrl-1 = <&qup_uart13_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3998-bt";
+
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
 &ufs_mem_hc {
 	status = "okay";
 
@@ -709,12 +836,16 @@ &usb_2_dwc3 {
 };
 
 &wifi {
-	status = "okay";
-
+	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l1a_0p75>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l11c_3p3>;
+
+	/* WiFi / BT PMU */
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	vdd-3.3-ch1-supply = <&vreg_pmu_ch1>;
 
 	qcom,calibration-variant = "Qualcomm_sm8150hdk";
+
+	status = "okay";
 };

-- 
2.47.3


