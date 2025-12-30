Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A490DEE01F6
	for <ath10k@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iHIv9QUmmytm0fzr7fSOVgrYUmUk9Taj3QlV+Tv7v8Q=; b=v/c2+rtRJjl6wm
	Atdr0PUSxzDYLF5e7qzZCS5s8Sl5qdstyuitOcLsnQbskrtfqJV6jNc6Wozu7L235nmUGLpj5/uyB
	pXlwnwVxcGnTDZ0yE9AZQA2YTQWajSjJEw4CAelpWtfZy/G5R6jS/VQn9wz0Cc0mU2mc37sZe8JSl
	CV/E6cKqTXJlhtOppDCes00asoW6DeBNyOAT1S7WwUrCjtMdShGDQhSmpmSnZt1xuaPIndjcxyEi8
	VrDOPcgq3o+unZMBAo672DzS7NhJ/EKXhs0utNwpwlseRMTP0rKM8MaH17HEFyF8Vx1704U6DezX3
	NFqVXxw9uNmN/YYmoECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajG9-00000005Rvh-3ZcB;
	Tue, 30 Dec 2025 23:36:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajG6-00000005RuA-2yLr
	for ath10k@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDPRNC2548570
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iHIv9QUmmytm0fzr7fSOVg
	rYUmUk9Taj3QlV+Tv7v8Q=; b=IAq3OLI8tekB7DP40aAgXOSjohTykJApdWvsHh
	e88tZb15sVvCKc3AxCjYAPVG1l+vJwRXuccUzFBCBP1BYYDSTiG2r7WAmz70Gbk7
	N21QrpFGF1sU3eUpeFYep5QsJgu+afeVcwUK3pgxqqquTSTD2qdFG4MqKPiVT4+0
	OMlZzJwQnRvUUxZ92s2GZPao5CQFyfvjN3HVNeOekpn9B6I/eXa1tW50iKuWpgDY
	YQ5kOR0mxBxWhKFeaY6cW5r4ioCh0JOvYtyYv3pER6gzxtlb+kttSuuu+Kji+WWX
	dt3PM7b12P45+rmXKBVkyr5mx3cA+M/ts4e4p5q6vQNyao0g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc739acw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 23:36:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a37ca7ffdso150795546d6.3
        for <ath10k@lists.infradead.org>; Tue, 30 Dec 2025 15:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767137768; x=1767742568; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHIv9QUmmytm0fzr7fSOVgrYUmUk9Taj3QlV+Tv7v8Q=;
        b=TPiWiX6/351CP96dTaU1m8HcBm0ELuz1EdybSOyuLxJ8at61i3BzBPO4Gr7G+QHKGc
         8NqCwWm5MNT9gtR8XsGuL9tTeidcHsRRTtR0mmJY2odmDMb29Hfca2V4jIKPOjdOa2+I
         hiu6TAIkYSwpT1FcjMxGBGBqjbdD2naQuwi6sPbqgjSlxy86/iQpCWmEBb/7DumcCD0p
         Sth7SR9Yp6b7hgx5qbWaqGxzBodTipI2FKtJiD0VDz7d2jUNLdiX0cCnQTx1u3xnm9lw
         ALCzf6Z+wZE8D1Bdy5x6brdyrV/Ol0CpE9mPUKH7lgDg5HmqEm5i3ho+RQG8swqPmwcY
         4MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137768; x=1767742568;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHIv9QUmmytm0fzr7fSOVgrYUmUk9Taj3QlV+Tv7v8Q=;
        b=XtqQAL7TsyAzDO7DeUsKZVnQeiQ507osQnrsnObRBcOTtGPoESaqMOVeKZCQ+OU+3l
         MDW3b4BXPHZvUoLfWXQ+f/nHXXc+Tm9SbjHuRvv6fkiCLxVAUFPy74EcR/XXJzcC37Ln
         hkrJVlhYwwmCqIYjfdmK5OYhVVRy4TKKtpvvufZwSxH0bor6ONozndrqflp8nro575fy
         e6WD3GTH02FMBeP8SPkAwcAb9EdeXJl98DbjBAdt2BXAzO7V3EamHeny3pzKfUR4G6tu
         dYRhxKBOE5393YKACjiX9MXafp3/BDjf/i3zQ/LZzWiaprwj2UCz62e9oCM2DsEpxLBJ
         WCmg==
X-Forwarded-Encrypted: i=1; AJvYcCWfro3vX9e6CQKjhZtsEEMLVLIbUJibqmakizhyW8q29SJoN+Ncw16dlTuMXmtkM73YRESbYzw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb3SxsR+FRgcnEqHskQbfpsS3AcTVvaIsmBZGhcnIRj16niJqY
	6gYkiaZMHVXW7XK1GTQ2LJK2+MIbXBdGUe/aDD/0z7ICFrxOz53vMJE6H2iDFXXl+aTOxk8btaD
	wmroU2hI4XaXV3Jql47YkiwSaxY7jhELFbG/uwVWuA+/MDsoeEaPU5fJF/Ay5aF0/
X-Gm-Gg: AY/fxX7JSOgImjjMM5DVwFAuTRQhiyg4Y9hoLIpZzOt6muhs+s6YrmuJQs0o5YG4GgC
	Sl/ZWFfaDcV2Tp5SSXJX8dHHDOELiqxUV8pKOLYFEgLg+PlVn9nH0n2dWh/7USiru4lZJzCX+3c
	XB8DUYuQBF/YD3pfPlfGV5BMiIQJYcLffO1McT5VecyUgV/OyePZa/K/U144+IS/LfRpqGJn9cJ
	Vb1meFzR44XkFCH75w4wRt+lJBU4YkEteWETwnYZcUC01TkgFDm+DqbBofW3dbyg1sS51CCeN46
	DjLeqmgITWFlw7zz8BuzHcj7yP7OJLqqrT6/Kl1D+xjs1l5Jr1maPAiwmIGA3yNPhXK1Iw/jXWn
	NlMtbikja7+WudGTb7Gu3x53/qMMhhJtBL7a3hxjTAedIXkmVIqlDGBdz5YBDf8dzh6sLX1mYwZ
	R1mJdHe5z8qB7q/FzVatI8TuQ=
X-Received: by 2002:a05:6214:5346:b0:88a:577b:fa4f with SMTP id 6a1803df08f44-88d816677dbmr455657516d6.12.1767137767735;
        Tue, 30 Dec 2025 15:36:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdnza02N3sSIYqg8QIbbm0Oq76vXy4hsYlfyFT5vTsSTcIzXDSLfcpiTPdwPf76j1mcmQ+Ew==
X-Received: by 2002:a05:6214:5346:b0:88a:577b:fa4f with SMTP id 6a1803df08f44-88d816677dbmr455657166d6.12.1767137767195;
        Tue, 30 Dec 2025 15:36:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620337sm10349574e87.86.2025.12.30.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:36:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/14] power: sequencing: extend WCN driver to support
 WCN399x device
Date: Wed, 31 Dec 2025 01:35:50 +0200
Message-Id: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANZhVGkC/yXMQQ6CMBCF4as0s7aRFkXLVQyLWqY6iS0wrUBCu
 LuNLL+XvH+DhEyYoBUbMM6UaIgF6iTAvW18oaS+GHSlr0prIxcXa2MqOS7s8kc6b5uLN/1dNTc
 op5HR0/oPPrrDjNO3dPMxwtMmlG4IgXIrIq75HGzKyNDt+w+JUlN6jwAAAA==
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
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2926;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bXiffYe+pGwR6NdvYFKSdqs2/i01fTSO8sfcFDANfYI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpVGHjsWqyWw8firHhZXjG//YGd+ddG8rzLWWCL
 WXNgAt92o+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVRh4wAKCRCLPIo+Aiko
 1dM0B/9/9lvHUyWnm4IW8UQUVd6Ydzg+g+mgeLq4Q3CFWTqW9Ic1I/uar9yFDIiUOKm/1iqlvKu
 XzHHVPLclr7szWyZVYQoGRDbpQBulW9Gv9dLrugNavrtjSqXG1A/O/eZa/P9f1efTR07zOXsMBx
 ZK5ecfcSL+j14c6PNvQpqXRaR3NDjgtqcj6QRTX+5oiaTTsfdGFjoZYCN0vZr5c+0aOlWgXyOdG
 TzywGECxV6EHJSutjs8MgHgjyrVeiGTFUAxKYZ0nrp6mghBowjfA3aWRIgbRzJqwLr08OZaH687
 gv0DA0MhoJeg3kRPZJYoRGKy/UFCIz/lzBcyIAwmF9KPMGM2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: QHC3iB_gqZP4-X9jH1V08HdNh0Shn9ai
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=695461e9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qrAnp46GSAHW5yBWPzcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDIxMSBTYWx0ZWRfXw2f00/K6vAaR
 11sYJz7FgNAQ51rzkGrucWx0UUfmbn6e8+KwdMBSKSjT3hOY0QBW1VtTS9E4GdSvwOIu04k0pSc
 5NpNc+fVoqlVDYzR6KQZIogIcZ39b8fwo4BagVdlst3tTrmnbrAPZx1a5mJbM7LZ3lWS0/Sj5cw
 FxbpO0l74D+Mbwct+b3ucCyxpmP8cxWTyYBhIC0P0fbiMK6ebhU4gx7LLEc50HcHout/8e/XXIb
 4JBUB/x53bN1MhxofQH9RcUVS+cWlXBcH/XYQqbUsaWUyu1aiLwv+3F7v09G22RHapbuIZooGLF
 zJbSq8j92O/kELyhTs895/CTa95ZVRjh+j0Iym/F4D/yf7jxnOkQurdyTiIRK+9JHKe8rSXgR3N
 YS35Qz756ucRQZPwj3IYoXgZkbeCCUILJ7KyzxtmS9b3o5SJaK6liHir2G8w/kB8dC4R9ZhzfpN
 xs0YLdLGrhHt8ZNS8mg==
X-Proofpoint-ORIG-GUID: QHC3iB_gqZP4-X9jH1V08HdNh0Shn9ai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_153610_830849_5BCBFEEC 
X-CRM114-Status: GOOD (  13.74  )
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
Dmitry Baryshkov (14):
      regulator: dt-bindings: qcom,qca6390-pmu: describe PMUs on WCN39xx
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

 .../bindings/regulator/qcom,qca6390-pmu.yaml       |  36 ++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  60 +++++++--
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  62 +++++++--
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  66 ++++++++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  75 +++++++++--
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 141 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   9 ++
 drivers/bluetooth/btqca.c                          |   2 +
 drivers/bluetooth/hci_qca.c                        |  26 ++--
 drivers/net/wireless/ath/ath10k/snoc.c             |  43 ++++++-
 drivers/net/wireless/ath/ath10k/snoc.h             |   2 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c         | 130 ++++++++++++++++++-
 12 files changed, 596 insertions(+), 56 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251229-wcn3990-pwrctl-cfa64f9d8167

Best regards,
-- 
With best wishes
Dmitry


