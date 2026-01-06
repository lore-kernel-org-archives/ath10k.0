Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC57CD0428
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CpE/A+RJl29TLk93kJv/naTvWiBqJr+zO5MsuSOsBCE=; b=WA9kv59ruKJv5t
	Jb6Cw/UzBzreN7q3rfGCbJyfv1aSyYmLLEZqn8wGOzP9iQAik3PSJCDppfX0Pv9Qf+XhJhb90Q6Yj
	KIk3H4wwMkQ14pHhEJehFWRIw2qRGz/j3yj4hzVSadI2DmtlUqF/b0jDgIabj7cXBtT/k3X6D2uyx
	WbHVkYm0W6Gi1yZxaY7vQONgxYIDG1qSMhNGZU+ZpR/fTDG71f4TNzjrfImgS9tlIo39utkpt0rHN
	9O5oqXyqPFf7HL4MMLLom09QTn/L3B+cqmZUWZozdSEzEU4ETaMyqMckVcqMAmS+ePvODnuA0JaWa
	85YLc1fimq2mdvy5GNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvRs-0000000CHW8-3M5C;
	Tue, 06 Jan 2026 01:01:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvRp-0000000CHVT-2i86
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nKvn3114886
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CpE/A+RJl29TLk93kJv/na
	TvWiBqJr+zO5MsuSOsBCE=; b=SweYJe5XenberV8rWMUSd9F1lZRZF52w2E+hit
	vttKHo8Q00sCJgqPY4h/G1U3PVr1sKAIfZTpW42CAmxy9qLc6loxMLP1kD82OGXt
	xdILxzdbWjHJQIQvxDFkcHY7qfPFaOKYfiKzEtzPOPU1Rip8wFQ1aMp5ZxIbZpbh
	TONH6z++GlXv/KPm3o7gb+1LTLReQwSLN7jiP/+Vcl4FJamfVlC+RKG6zWfIVAak
	BHiVtWSSuptai+GHfEya8f8O8cJI4uQHa6c8+xAK+9dvvyB1RnEoXerw5mRpyQuv
	5+woCTgu04Qaflhn1ii35/AdtivCafHGZwlRZDQj+sOV4pGg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh8gwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed7591799eso10190681cf.0
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661277; x=1768266077; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CpE/A+RJl29TLk93kJv/naTvWiBqJr+zO5MsuSOsBCE=;
        b=SgWqgw408pO6jNcaUgzxJ0GtH/Dgq9j51SQq7wk9n5rmS0kyDjetU8yirbltDSqQh2
         PxNWiEKge82/lFR32K6wKGO98jyD2hDaIeizb7R5Tnvrv1URE2zTcMcJWCXkJvgSzU4Z
         xYmLf+WQNudIPdhDetrEwyfOkylkAQGgtjbfLhD8scntKtoFP3ybOQV6omMoSpSYrKs1
         bjWJgMKJ0clooSl/Wo+C4JlnnBIf1biVjfVuLDy3NTtMOtVXvQYDoQeMEYIjsVH+mToA
         /jGPYcLUOI2L+8FHNAyFTz6vtq3GmfGOBFClEpcSbu7d6N+ocmiP7VOyV5GUX5+L0dHo
         tAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661277; x=1768266077;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpE/A+RJl29TLk93kJv/naTvWiBqJr+zO5MsuSOsBCE=;
        b=nKRUlKEX2/kL/WC8o1UxKR4LApNETEuP7RysTskibZPBepDZr0SAHHEJWVvzmpyz9n
         cUokGQuhegc3O1ubPTj397j37fqlHfVMX4rNSTc15s5U8jxQHk9BWK9hhqm1gwKLMoSr
         kDWnQ8gy1FKfHJX4NomtwWVDlM9Dw4qD5BYXchI2lHIk8Kgd1eyVtWFKjoYs58Ygg2qo
         Z8QTafOPFkUEa+NOYFbYVI7AkP7HPwP5cgB3Bq+eCgK/6mp1nbqoD7QGzUsjYnU1s7zV
         BmZnc4iREXVPKoibsetfUKgpWwgf2QMAWIV97TDWt0Q/H4CvknaS7zQPe3Zur+0hNmXY
         UXfw==
X-Forwarded-Encrypted: i=1; AJvYcCW4+pLWzmmLnSrbzmXlUi9x27kgYUlFZPRGbWuvZX1XJx21JEu2PQ4D+fbiSIUu9b8UD2PWtr0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGEidfSussV6l65mDwZKWRKDErv9D5fzKGzUkFUVQu+HjX9POB
	Au/HaN1syZxCvGBcm6e6tnylM5t8OPht4CCgtq2PDGOe+cMD93pMP43yEjWxLLWGyODD4cZ+Utp
	rVLPenhRdYJASvsouv4R+vSHLz/yTeTPoA8k+fJxnvmfUlOXtwocQZ7I6eIgxb0MU
X-Gm-Gg: AY/fxX4yxcHF13sQM3TgPa6KSACE5M0K0crfZx6DY6fQBLFCHzAdYPT3NxYzTxYxcmG
	D26VwrXDfXDFW7llPdyH247GF2Qf9LPl6aY6gOwMyyzgAjf1e1kHgw7zwMIcmumHqqUPqrSBn+4
	vnRJ5ypya6nQIupDId7n9/ZJfQCpHQovYo9D1HxA5BFbTuyrIBiRNDEtTbpCS7TmW3Dl87uRtEq
	vvQ+TC9aaOCQttilp1ZiYfWYxjrs8Z2fEEiPk//tCWHj/GIbJ1pV1RhwwfUqXgDF7V7sDctwZPQ
	f6NLcHVhs2jcLv/45zkEs5xsUb+PDvbnhoxw5SQ994JTX/vjPywRGaDQYsGmulAbHt3zPUZYiJL
	uLhDwtTRRU4QOJw3yVGw4iHPoiZOcG0kAf+OFfbESa6sPbClvUTjH/oVsoDd2rdQyWrSM04U2EZ
	YUzrVcqGVSKUJKAFO9ci0pVC4=
X-Received: by 2002:a05:622a:11cf:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4ffa76de52amr22746431cf.33.1767661276627;
        Mon, 05 Jan 2026 17:01:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoPcIoXtZ5S3sACfb6AlbO/bvWBixeg6CDOT9VqCG7O0cs7fHG9tI8NmT9nXBGmCXl0qhHmQ==
X-Received: by 2002:a05:622a:11cf:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4ffa76de52amr22745571cf.33.1767661275935;
        Mon, 05 Jan 2026 17:01:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/14] power: sequencing: extend WCN driver to support
 WCN399x device
Date: Tue, 06 Jan 2026 03:01:10 +0200
Message-Id: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANZeXGkC/12Oyw6DIBBFf8XMuljBR9VV/6NxQXGoJIoK+GiM/
 17UXTeTnMmdc2cDi0ahhTLYwOCsrOq1B3YLQDRcf5Co2jOwiKWUsYIsQsdFEZFhMcK1REieJbK
 oc5o9wB8NBqVaT+GrutjgOHmvu5bw5haJ6LtOuTLQuLp7x61DA0e8Udb15nu+M9MzfzXH9L95p
 iQiVMqkziKW8zp99taG48TbQx76AdW+7z+G70fn4gAAAA==
X-Change-ID: 20251229-wcn3990-pwrctl-cfa64f9d8167
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CIG0Is9FpLut1uuuiBQ9Ij+nmpKB6QNbq141HKGdsi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7YalStl2pZB8CIWM7xWNVMoyMjk4VhBVVLW
 r/nqGqZmJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2AAKCRCLPIo+Aiko
 1Z7jB/0VmTg+9TxqCA3shr2UhDZ+pWcE6JzPASajt3+q8+WTb/DbAFIE4bO0En5q0Qts4XrLyue
 5Wv9S7gcT8v8cCzMAqupR3c66Xgup9gOhlUhOc+Eg7kN8sM3PIlK/fT6MplmL4arM6HnKUAMKrZ
 UpakFjS/+uZlFbZfZR/QOkdwe3BIU280FXovJ3DDfpnNdG/CvFEMK6ykujZWhFpenT+EDRUw7Om
 E8fgRuD6g5VuSjZtMIz0mqxws954yB3UMtsL8VjB2ddORxCxHERyvaVBOXfmdNCMeOqExxd9DcG
 sY8QTJhCxpPrZhMw82Ks76WPSS4pOD1B/cyCbcn+th/MwyXx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZRiBpGUHHNgDXOYxmQ04q_jdfZz89Quu
X-Proofpoint-ORIG-GUID: ZRiBpGUHHNgDXOYxmQ04q_jdfZz89Quu
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695c5edd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OJCnd7j_un46Nmgy12kA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX7nx3nyxNK2oO
 9kijPYX+/HbXLJ9XXcWqEeS3UgGkd7HUB0B5nEdcAGPxzyMtVC0mOykjsRHs5bWO5H0T+G7pG7Y
 UNXWV+u8WwyLOGsiDf4ZTsr2be2e+pArq+dz7CJ9hHXbQBJNET8ulHLX68C/E+x7m7jKVT84UrS
 xywnhDXNuDAmAe8CXg6TAcmLFhNC+6ZtH17V3021zd7eBkuw1avWNTNo7jcw6rj3a8oZ9jfk1OV
 fnend969deyb61ZemhreEpq3JU/0sBp6KOpIe2O4/nel3j2eVfSikfUo43NpaF/IbFHqpsG30AS
 8byj2piKaq25B4dtWAvwqjffj2zSY7PXaQ2Sirxtg9HGCDSGEPOzq7qGJx96vrHt552DnZF06kU
 sSnHcEf96w6fP4TbHuUlYb0y+V3eMxWuZj1HXiFYsGfT3kRCB/LkN7m2gvMnlLoHJzOwNRYKMEw
 2LV6Q9d4ukSjPdb/vWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170121_949233_876E3929 
X-CRM114-Status: GOOD (  16.78  )
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

Qualcomm WCN3950, WCN3988 and WCN399x families of WiFi/BT chips preceed
the later WCN / QCA devices, but they still incorporate a very simple
PMU on die. It controls internal on-chip power networks, but, most
importantly, it also requires a certain start-up procedure (first bring
up VDD_IO, then bring up other voltages). In order to further unify code
supporting different families of QCA / WCN chips and in order to
maintain the required power up sequence, properly represent these chips
in DTs and modify drivers to use power sequencing for these chips.

Backwards compatibility with the existing DTs is retained by keeping the
regulator&clock code in the drivers as a fallback.

As a part of the series I've converted only several boards, verifying
that all known instances of WCN39xx family works (fixing the issues
meanwhile). The rest of devices might follow the pattern later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Split the WCN39xx PMU schema from the qcom,qca6390-pmu.yaml
  (Krzysztof)
- Expanded the comment in the WiFi driver (Bartosz)
- Changed vddrfa1p3-supply to vddrf-supply.
- Link to v1: https://lore.kernel.org/r/20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com

---
Dmitry Baryshkov (14):
      regulator: dt-bindings: qcom,wcn3990-pmu: describe PMUs on WCN39xx
      Bluetooth: qca: enable pwrseq support for WCN39xx devices
      Bluetooth: qca: fix ROM version reading on WCN3998 chips
      wifi: ath10k: snoc: support powering on the device via pwrseq
      power: sequencing: qcom-wcn: add support for WCN39xx
      arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
      arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
      arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
      arm64: dts: qcom: sm8150: add uart13
      arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
      arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
      arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
      arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
      arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly

 .../bindings/regulator/qcom,wcn3990-pmu.yaml       | 100 +++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  60 +++++++--
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  62 +++++++--
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  66 ++++++++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  75 +++++++++--
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 141 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   9 ++
 drivers/bluetooth/btqca.c                          |   2 +
 drivers/bluetooth/hci_qca.c                        |  26 ++--
 drivers/net/wireless/ath/ath10k/snoc.c             |  54 +++++++-
 drivers/net/wireless/ath/ath10k/snoc.h             |   2 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c         | 130 ++++++++++++++++++-
 12 files changed, 671 insertions(+), 56 deletions(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20251229-wcn3990-pwrctl-cfa64f9d8167

Best regards,
-- 
With best wishes
Dmitry


