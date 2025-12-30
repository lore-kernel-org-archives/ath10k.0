Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E93EE01F6
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ux95GdgAy7hFfesGPlF9hWlnbmmD5+m3uisShSQL5Is=; b=rRtjF5Q1VQ2Be05rfEPlfDmmhD
	7PykFydPCM8DQTJLDkBn9GP7ypFuj6Y6k6poHSQpNTq+iG0C4hQBNULIZJNaOFE62C5U+YzaN5fP2
	AIQMVm5cvR/Aqklfz0UCNBC+8L3EJ6tm6xBsPE0Ecg9WV6e06BiTKGEjOXH2bhQVBxA69neF43bpV
	vKBTUtZiF5SEbYy1QvQO/4D4TEGjKDAGLZJtdEh0PHWSOcY0a3r8UJHHcf/LrcVmtNMcFxLGkI4Uv
	lbDRLKaz/zeVXDTphAP4M8RwRlUlQDOTiL6bvfM2ea8gN8bTMMmI61ri+p22G+NOc9FiO/wTddSFn
	kQEaE7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGd-00000005SWk-2FqM;
	Tue, 30 Dec 2025 23:36:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGV-00000005SQu-2tvL
	for ath10k@bombadil.infradead.org;
	Tue, 30 Dec 2025 23:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ux95GdgAy7hFfesGPlF9hWlnbmmD5+m3uisShSQL5Is=; b=aEy3tIl67NEuzEsv99u4LKJ6Vi
	aleB372CkrNEkJ6kVpCTbbabeF4QnbG3P/p9OuoK+ZUzT4hdAaNPHtTBM7DchRFL6CM/0ARzFRHF/
	xx2SjVApeq9QD8ne1/VxHtGbK7baK4qL+YFJc3YvT49BQXb78M3nJ1jUyRRCtlRg+mJE6ZSucAD0F
	kZHxWKfIuGhjYvqmvBBrDHcq19Gc8cMag8wZC5sS0NBcT0Dn9d7VyKG4qXS9uC2wUuWbjhqU1dNcP
	Qqa971GmLVMZWip+H/WIj3weKBJg3N3THn4cFpMTP2xVY0O1GWHYlsuZ+4A4clpEs9JyqUaVIu424
	eGpqwUVw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGQ-00000004E1x-1c69
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB8uoX3971615
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ux95GdgAy7hFfesGPlF9hWlnbmmD5+m3uisShSQL5Is=; b=ZyHOKL3hcpp7i4qp
	0GIrq1tf5hu5F/14rTt4lUV1lZd0g/8nefz26aBytS+Bm3VE12Jtjnh6syzFyadx
	Bco4rsrmgTZHVZGfIYpYM+HNFdznF6j8Xs0eMNQXsoq154cdqvALhkqxo+FV9+8Z
	M65IziGfNfQlMzR6MldybzIwCh5CzeSPSMAg/hMVIBmhWbVzMoUEHC5DThIVpadC
	fPoYi9HvvEkzFZsHuktLdol239sG5SmoBuygBI439pVIpIdpcKMLK/ZD8Y9UXmDg
	LS8zEID76r4fhShzaibzWnFPVW8LYRx+YpyEVWtFDVCp8Z5LuGoxwnA3+w908wRu
	4q/76w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky1dgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee3dfe072dso270938171cf.2
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137785; x=1767742585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux95GdgAy7hFfesGPlF9hWlnbmmD5+m3uisShSQL5Is=;
        b=HS1aCQPYMQKA8MCf78SObDu8IRztFk2+O617i4qJQYArsBwxNEzWeqkcUzX30jvn0+
         DqAczOQ/iBxo/n9lL75uAfTw6cYQmoBB9QlTKLMdrCu8kiOeaTT7u/I7/USWqhZlakRG
         R6nqgSaOgEjiRh0DWBlar2Evkebd7L1O81xx9jx8S1A4j+DF2yjW1f5TyJwe4Smxztoa
         Z45Qqbbqe2xOAhmd4Hn3GKh9HTYJpBhz9o6TckWxkrnyC8SS1rkihJNPLxUwVyqpryCv
         A2pROX/geWpbjR252AxcGRP9hFGmv3oDM6LaoV5onT4IykA6O7VHLO0lJf40m6aRcjEK
         wGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137785; x=1767742585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ux95GdgAy7hFfesGPlF9hWlnbmmD5+m3uisShSQL5Is=;
        b=kGkhsCv91s6J6wUiBCSdQgZGUxYZrg5C9SaJEdIvhvjFjqEISJ9S5l08uU7Lc15+9D
         vFbP6m1HdwEdijqpO2VKSerYSSHx7x8hshUS1EjaA7mr5anTrBHrQa9K1uQLlQl89dNK
         o3iuPcAXGhIHWZNKbYZpX0yKvEZRS4o/1UPBcrZTD9tDyGAHdFMu6VvMM9vMqXS7foCd
         WZ4UP74QVZRgsB5yMjPk2UY3KL+gbfO+yOJLPuIzVhmMda3+hbRNs+HTVEo6ztuyVX3C
         /QVevtGOMoIQIKPmsxY6UaOPdapNbs1Z8OQSMxy9LSVL5eiC0GqqhnbtPzsSWay9K2eQ
         UAIw==
X-Forwarded-Encrypted: i=1; AJvYcCVXyf15f7M3LCOZEK5aV0GP3HdlqQKPQbv/9/JLQrUzmxYMFLh3KC+2/Jownlk2t7YZMBUy+Y4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyGgO3gMg5Cedim6wIEMldOowrQnDfuAmXu7jtNGC3ZsX5AqUY
	8JtoKij/XBO87tM3iC+UlBOkiW6Kw00mjDl6QDilnXqoOoyDrmOLja9pVFoQO/LbRj8ae/iAAaD
	2ZMAhd4W4HXHxgKNvEDpDSWkvhkl6PfAQSWEJ5+jcF70rPd2o9u4axaf88eWDIYcu
X-Gm-Gg: AY/fxX5/zQQK9yn8662je5/cmSQPxiXK44NwT/7Ex9hTTcdiNphhzDdZ8KVY4PpLUvu
	F5T3SluRzL5kYj+ZQ7D3SSmAHLg3kbWK6uQTdw4X0WGQt5SSvjAv2T2qPSWMOIPstEmxS6FDyxH
	uNYAbQl/clrjPqQWBrfp6AUeGR8tlV8iPMhu2Vcq8J6nj+SZhrCen823W2dtTZ7YcuxlvvoGcEt
	uaZn9a8wwsPUvxmLPYtumsXaBfdS6rjTFf06BZCnJ7CxujxX4RvOOQlcXMATIuQIRjrhul1gTHw
	GypwOFXa4hHzmflJcmvAWNcxTBjaV03WozPfuqqPgC4bghpWXkjqQLEV49Js6cFANmbxTHiG0nc
	yDetEdP4zF79mp4q67tMIj6nIqrPPqDp5Om1h1F7c+b/JS4pdIu6yovG/3yyekzF6FVfyzPqMnQ
	IbNsGucPrGZstr5NqZR4qN8C0=
X-Received: by 2002:a05:622a:cf:b0:4ee:1e95:af68 with SMTP id d75a77b69052e-4f4abd1da6cmr579228121cf.36.1767137784789;
        Tue, 30 Dec 2025 15:36:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgR39HskKDK0VPENv4JCEhQfvh2ZibF0b4cYURAUkvz8grVJGOP6SkuWxVIrZPWDN84BJ6pw==
X-Received: by 2002:a05:622a:cf:b0:4ee:1e95:af68 with SMTP id d75a77b69052e-4f4abd1da6cmr579227521cf.36.1767137784225;
        Tue, 30 Dec 2025 15:36:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 01:36:04 +0200
Subject: [PATCH 14/14] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT
 properly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-wcn3990-pwrctl-v1-14-1ff4d6028ad5@oss.qualcomm.com>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5614;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8vfZDA0+eLe1oxx8QbS4fcx/NwTCXaa5C6ek/BD4aCo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZI4lN9j3hTM6s03asXMy9bNyhf/3Jm0nFG5vitli6Sa
 uVTpuh1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi7j/Y/9nxJ+x5+6+5R6ff
 MV49rT0kL2PdIhaH2VZlUUnLHK69OHCxX9Yy84FzdMWOxBeZF5iPByeJHfEVNX883/XVzW7m3pz
 D4lmdy0vjpi9N2xrGObuh3qfDMVnv41qJ/LfRt1UjpQ88DTQS4uuatfr+3SM7H6/dEyhWyfHQmz
 fU2bR5+STlbaUGN+24P3D7Pe0svnVeVFQ75mx2Ss/WdY6H/i0I0Q5uObJ0xrLFrrsaparUtOYxR
 r1l97zlEVC3ILCVtZtLIY7hom720pM2a0y8Hp5bbXa+Y4Ze5tz9ReuFLNfWORx2zJl1sHzZXNbw
 Lmv+mTbeH1g/3TzCkBna0x3w3Jn5XsHuIpOW+G2l+hkA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfX9j/khob9s1Zb
 lcNjJGAiDBmGLOEVALRKzoUu9iKX64AwAY9BHxg1DTQ38ulML5v8FslOH/q7vHvHsP7WFRjD5oS
 1GvToU/oWvSTrwNA5tLz3MQdWyZhJ8b5DVzJS1o/jqFsxPJb0pvYLF/EFpJktWCKhepi2NWlcR2
 A5AUNzK8wzWgD9Du4/Xs3kgI4ua0AcmHA4yx/Sw10TZZJxKuvfednCwuZY5yAL3qD3LOr+Dnvhf
 dNXMV7S5U2fZ80Lczvchs4xqU5y+ENLmcr8fvwULto5szoZLV/PRpZG2i9VfcdODn9zih9+5tyD
 EzhNTWykoMhBFTDkiTOIci0Yy/jIzS5nDGy6jJDfEHs6quASwvlIobWpr+WBKAfvtJ3eEQbLTiW
 vCP/6SlcVT306eFKBSzFL7p36918H9HnAIrTKOQFnhG+l1Vu9wZ4f/XW0PLFEiivjbL9RbMtU+J
 3UrV4FYfas5SMEC1cvQ==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=695461f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=daeKR1c1ZtUuBhPExssA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: elvVlLi4_FizLLtIoV4FdX2caMX1T7_y
X-Proofpoint-ORIG-GUID: elvVlLi4_FizLLtIoV4FdX2caMX1T7_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_233631_033708_E051AD02 
X-CRM114-Status: GOOD (  13.24  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 141 ++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 0339a572f34d..18b51a1236de 100644
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
+		vddrfa1p3-supply = <&vreg_l2c_1p3>;
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
@@ -594,6 +632,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	status = "okay";
 
@@ -626,12 +668,97 @@ lt9611_irq_pin: lt9611-irq-state {
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
 
@@ -705,12 +832,16 @@ &usb_2_dwc3 {
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


