Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7A6D29C4D
	for <ath10k@archiver.kernel.org>; Mon, 19 Jan 2026 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KHvHOGQMTvf7yVqvc6PEckmL8H0oxTcEyimip3Z3H8o=; b=IFc1QACcbxLdPb
	IhuqqFdek/vDojHT3nWErwcXPnesfX/emwHRiYK71FMFpDFwpQIJvotvWymCVPDVVeiSkN5g88Zm6
	ltTX/NzlB4ooRveIwn/Sbg9teXhTdocmypGxog1O6+IUxRpxxnAcfqzb4Kl93DgyCpdq87cppjhZl
	RmH0+Oc9zuxBeWh/uR2U2or2uM6fL23lm7HiewsYARAMjnsAIYtOcMtgHmz8zieAwuJNIxgNdDcOI
	ncvU7BypQCgM6NSBukeVX0qkIcr4eZpfJyjxma0/K5x2J+keeZYpZ4h5TkOq3noRw4YBlsmRpeqoT
	/Ojs726GfPcsF8XUuWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjV-00000002aj7-2YTN;
	Mon, 19 Jan 2026 17:08:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsjS-00000002aiS-3Qml
	for ath10k@lists.infradead.org;
	Mon, 19 Jan 2026 17:08:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JAJhVY1531246
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KHvHOGQMTvf7yVqvc6PEck
	mL8H0oxTcEyimip3Z3H8o=; b=bdXh/LScrAyN34xW7iSR9JhUU4/JDLdtBYuaVu
	2rK7iEJ1Yzc5f9Yr9HP4lpxQtDkrtk8gCtTw5lhOVk8p7tZAcQv+NTa/uxfLz4H7
	T9jiX/ZFL6tbs5IUuYlaZZ0FIwiDm7Yi5swCFGIFaUjMNi+9hqrzPWAdAtisbLBa
	1tGBU5pnf+2ycZtAdCIWTzCPHcj0ymchQ7O8TWz9q1OeTYFPottpuN2F8prLGABr
	jCNtelwgdjxNsUOzfAqims+qjjDi7tIZKh82LwD2eINE1FOlLp9QpFAAPspJFgqF
	TZcqlk2JQ6t0g7EyHBKBL+gKNpkWKSO0rhUxZvcT8/Cyx2OQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxs5e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 17:08:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a341ac9fso777144285a.3
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 09:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842481; x=1769447281; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KHvHOGQMTvf7yVqvc6PEckmL8H0oxTcEyimip3Z3H8o=;
        b=Obrn5Yep/guDJFttPbZqDd0GGUCH/bL9PjnejFQgKAX9UKh3Wp9ytwoFdN5InVykCt
         gwBT+gvJfXjwplCpkofHcvSHLeV8jhr7WOoELUtSFGwYMa4k7H83uhMyJDWWLBEfG6qH
         rIymmeEsg4MtFsz7IkCv5aeOYj2zhdRPk0BWnI9X3aDADzR1YBAb7XZZ5w7wuZyUMKNr
         /cwQaKSgkfTRJrDTQhJuEDa8tBCf2/0Xh8H2+8jGrmQSe9G9duzFelLXnnDVvOzjcVCk
         xSJIdtikTxNHG5XNKKlPJhxCaoxsEOdxEpsG91MkuAG34XIms5oQfBVVZy9rr5oSRS81
         ELEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842481; x=1769447281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHvHOGQMTvf7yVqvc6PEckmL8H0oxTcEyimip3Z3H8o=;
        b=BFwb6bDgoUzJZaKA2cKhYEWTXP7SuWgjwrbHD94/JBcxOogXz+fjjS1dxaHlTDbk5w
         uFesE6ESNLVid9G8Picrxt+NnsrwauuzUfj+Emcmp8w+W0MCGyIw5rdNwvPX9ikDZeaf
         jwZE4TmbWPOaqKgJRUgKnCB1fVOlL15OIIg5llWUtDClBRGl4lCpdT1gYgmqkZXwpawq
         lGNOors2btATbkf2GoY25yNAZKXCLmpcDcavZ7db73Au2lGmZu3Bnt9W5MnA4zMiK1Xt
         6OkZzNrjIwmvHHweRS7BQe/dNHPiM42ZXl2E1yUyG3JXe8HPkXx1RRO0oToiSRJHCzPg
         Mliw==
X-Forwarded-Encrypted: i=1; AJvYcCV9RJayLnoVw4o8pGPhmzoG8O6RMn+vfiNbH+zUmbxqrtgB9mDbqesR2Pbkf0oqOOpfut5z7hs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz56nFmPvAXYgWHDm2UdzQCc2OZnCgOP5LpbeVhC9u1/v8lg6Ca
	E5RRyaDlaszbjRHUgnk+GY4+7xpvcnIr3fZ6l1NBfNoufraYQjBNKJ9YvUA0XCFB5CsV9mPctzA
	+VXJv217jaBdn8sCy4+nIFrXuuGUz68ZEJGU6hsFj0cZACob7nkbSe5rJozQbjRGi
X-Gm-Gg: AY/fxX6bPf6evp79aWcsQjhYJ7IPjZsKdv2ZysASRL8tG1G3oi3PbOfUHXloQ0ePOhR
	yHbJtyEGza9g7GQCoc0xQUa1OshO6834L1ozi7DItIuak0fHgO0snR/8WF9IQ2Uti8zGVMwez9p
	rL7FYsoXrkFo1hBLIIFF7+qLtA6Q0aWITvB8LNZulCpmxmD0Xjvcvate7KcgRflmfK1ibQujriL
	1ng8GRb8zox65cYHDBxDqsS8a9/mZvEqndOrpuKKLfJMOc4FSExTV46TDc1/OPwS+G7kEgBYtrp
	y8umCgj4BWZQ1guE/M1hAaCoYTCTWIijCV55MC5z8Y+cSaZCSXPdU13DyY9wA1YIGmLTXoRKF6H
	MeQg9f1lTujaqwDQ5VOyDlTGYO5mAhOkqApqwriz48LMGe+qC5vHEZ0UZ/SvipwiYj5S+zwPHwD
	B/Wx012lgkvu7FqKW4eiE4l6c=
X-Received: by 2002:a05:620a:f12:b0:8b1:8858:6ead with SMTP id af79cd13be357-8c6a66dae7bmr1539048185a.11.1768842481007;
        Mon, 19 Jan 2026 09:08:01 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8b1:8858:6ead with SMTP id af79cd13be357-8c6a66dae7bmr1539041385a.11.1768842480440;
        Mon, 19 Jan 2026 09:08:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790a9sm32661211fa.26.2026.01.19.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:07:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] Bluetooth, wifi, arm64: extend WCN driver to
 support WCN399x device
Date: Mon, 19 Jan 2026 19:07:54 +0200
Message-Id: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpkbmkC/23OzQ7CIAwH8FdZOItCmbh58j2MB8aKkrgvwG1m2
 buLW7yolyb/pv21E/HoLHpyTCbisLfeNnUMYpMQfVP1FaktYybAYM8BcjroWuQ5o+3gdLhTbZR
 MTV5mXB5IXGodGjsu4PmyZofdI7phbZJCeaS6qSobjkmNY9hVygd05D1+sz407rm80/Nlfr0s+
 PflnlNGuTFpKRlkqtyfGu+33UPd3/g2lkXs4aNIxpn8USAqTGQSWCogK/CPMs/zCwO6b+ooAQA
 A
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2936;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pF+NoNB27rR2B5kf3GRbkX0b5W1kFhH3f5ZtNMnq/f8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbmTtvK+kYfrPetMIGRSwvfUD63/MiSK/3+mtc
 BXPEUZDDN2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW5k7QAKCRCLPIo+Aiko
 1QOWB/9emxmjm5KsLSNTBbh0w2WqVTrV9TpgDhif+2mOdRm1jJUm3zmOsS+0wKk6sdgrEEMjH1q
 pgan36DmIA7eJsTGQxhvN1C8aba4E1/JOhrwkt3xVVWJ2NQpNSqeb/SPMGogUkdqNj5mEwnoNos
 8z2KVckqEehWmhyRZSjUHn3/J2EdQh8W87GPyBzNt3kprOb+UK02x9XWK5MYIowJsXzt9sftW/c
 bL20sCjFsWLuAayZv2MUhFshX45o0Ngb7rkSIgJS2mIdZ137O+hhdQynSTNeGKTT3vU+LdYRo5k
 r3lNnSKHKAh7xb/cMtdvVJLScU+WPI5/hxzRh4DqPkljtTos
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX7DsgEyIcQS4o
 0srXEiJZlmW02O3wWRKgHjDhUTpGr1M5etXfeX9klz10WPcv+3RQ0SZaHrZ+CFwr0ksMbelRfPJ
 Ve2fZpjxcbUgKyUICFhErDh7dXjSVo70NaunP9WD5qJlTCpWy0WiTrl0X8vLehrorH+D76ziWj1
 znx+xIl4IC59VB4p+uc8jWPEg+J9HLSoqQlUTt68vhKoKpD3mF2G2BvWvFXw1VIaUtVXbrRGngG
 Fv8BbKcIHHax6/R2jKZ/LkDucd2P6u1ka2A1BD/o3uEnoETd0b+nruCzgmXeT/DoP+yNytgvlOg
 3nAx2b3pbuR8fhh+WUS1qH3w9XlsrP+jHIuCrgGnIAniN3fL1GqYz5sxnyQ5T5qcA3tHgW/ALDX
 ccwdHONU5SNICmn9MC2gWd4dxgX2vKnGtbKYiahsyUlQv5eg1JniDohz5uvvVVsjbMO64AE7Mei
 zotMO/yDXVTRzBQry5g==
X-Proofpoint-GUID: vjBBxEVMpWSdT2VsO15vDbCqlkyEO9UA
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e64f2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sVAF8I02KzBGxPgs2jAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vjBBxEVMpWSdT2VsO15vDbCqlkyEO9UA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_090802_891511_A20F29A2 
X-CRM114-Status: GOOD (  16.43  )
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
that all known instances of WCN39xx family work (fixing the issues
meanwhile). The rest of devices might follow the pattern later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Dropped patches accepted by maintainers
- Changed ath10k to call pwrseq_power_on() unconditionally (Jeff)
- Added copyright headers to the changed ath10k files (Jeff)
- Link to v2: https://lore.kernel.org/r/20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com

Changes in v2:
- Split the WCN39xx PMU schema from the qcom,qca6390-pmu.yaml
  (Krzysztof)
- Expanded the comment in the WiFi driver (Bartosz)
- Changed vddrfa1p3-supply to vddrf-supply.
- Link to v1: https://lore.kernel.org/r/20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      Bluetooth: qca: enable pwrseq support for WCN39xx devices
      Bluetooth: qca: fix ROM version reading on WCN3998 chips
      wifi: ath10k: snoc: support powering on the device via pwrseq
      arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
      arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
      arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
      arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
      arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly

 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  60 +++++++--
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  60 +++++++--
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  66 ++++++++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  69 ++++++++--
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 141 ++++++++++++++++++++-
 drivers/bluetooth/btqca.c                          |   2 +
 drivers/bluetooth/hci_qca.c                        |  26 ++--
 drivers/net/wireless/ath/ath10k/snoc.c             |  53 +++++++-
 drivers/net/wireless/ath/ath10k/snoc.h             |   3 +
 9 files changed, 430 insertions(+), 50 deletions(-)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20251229-wcn3990-pwrctl-cfa64f9d8167

Best regards,
-- 
With best wishes
Dmitry


