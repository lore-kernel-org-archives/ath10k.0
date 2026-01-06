Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EABCCD0427
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8Ik7VDuVyBmarpdKkvCHwUmh0SVZadWNDXRUJ33//A=; b=rjdBnv607YyvFdRutXgaWwVLu6
	NWCpsykxGn+f7u9+GGYbglL2bWDYWpTrCwypdWRoLjtr7X7ecjHxD27LGMIAdJ5n6tri5eudTo8Hc
	OtMZl33AHzHL1Fu2ar9iPhOo77dHrKJCP+uANHmYZdV55frf6NXdg7AaxpEL2dMkyeLBkDLchokJN
	V7cL8K3m6+VGRYwDRAD/c2i6g2PcA6CT4ZmZ24+E0nADRFGpsYWEDdbQsZQPLXzbRfbDHDvCjnwY+
	AOlXGXuHgZlW/oNUS9FXE9cetq6Lan6YdYjQdLbvo5Pw3xrATlbC13kq3UR42kizwH0bUWFu66+HL
	CxpjtIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvS5-0000000CHdw-0eKM;
	Tue, 06 Jan 2026 01:01:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvS1-0000000CHb2-3ona
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nZYR2528273
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8Ik7VDuVyBmarpdKkvCHwUmh0SVZadWNDXRUJ33//A=; b=Iq25W79QOFtdouNw
	ioka5oq/roDN02gFaTYy+Q+ikgRwZEV7UqDgdFZ4S5zFlPMfzVYDJ62yALrwSvMP
	Nn+2mEY9zNI6pRNpo52unhpDlH4ZJSviT8nvqCKUTZw1ZjEW0+nclIVALaAnTodY
	PDj6lkV2zM7Eipzib1Bex93VWk8H0CzzGQd95n/9ry0vdVzpsD+MSdSYynnynWn/
	QxzK4TyBuA4EvbBJh6JyO5/AMK8TT1e/3RSBN2V8tEvGLRgt1iREwqsI6ySrfu5Q
	/iHiAncTh7r8qk3xdNroCiTkfQarxc+3F5U+6aFrPvykKfIAyvM460uT0Xnd697p
	GutiPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus2be5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74e6c468so6210371cf.3
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661292; x=1768266092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8Ik7VDuVyBmarpdKkvCHwUmh0SVZadWNDXRUJ33//A=;
        b=NujKukEpvnPy1WwDOLh5tzuciIoZTNMBjHSSZNzpp5dcVRA6Ju3sKdQncSQbPOw7Tt
         4o0jfwIkFU2BTG8BLcmlM4cQUxw7KhcAkKZn773fK5hqdPqIF84zt77Pw5FHzHeP1nmJ
         onm5E8hOs6EEEi6pW/CF+PAwJjro5KydTZDxL8E0J/ZINBXE1QN4HZ6zbCcqGYjAZt84
         veq8iBxQnUk9vKtXrxGv4XTHW3/wTc1ZdJcHzTN3fYaiid9xAMuHh9fMG3zId9W87qDZ
         B2i4vXxdrLjNQv0l8Eis9ObnZQKbvMPAg+4RxQ57WYYhGMDKMptiGCEI81Jpy3yWWpnH
         fqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661292; x=1768266092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S8Ik7VDuVyBmarpdKkvCHwUmh0SVZadWNDXRUJ33//A=;
        b=b+vicTgOZI2WoTOPQBBj2Qts+G7o5raxAX1u6brIJqXxqzUXk0W6miGZoEulxCJonk
         s2ied+lMfaRCyq+PbxAHzX9K6dnDTjiE4iQXb1KHrx52zy0qYvg/RbLlsR3zAjcJaLQ1
         L+bSp8of+uw8t3xOsvut4fBTJWXiBbbq3Bxu7+vMVMhrmj/bSkL6gUvFE1L0L1q/jgJn
         oXvIDNKtH9xKP9J8u0lBGn5yuRNnQxrdFKpzN/i/VX1SG6Bl2SHynBsYhXRVOhwNZAgo
         veyCeN3nPgklMplfI8PPhC9hIWC48d4UuYzT8a1wo69V4MPCA/gjG1A3RGf5csbAVwHq
         oSpg==
X-Forwarded-Encrypted: i=1; AJvYcCXdNW0SP2HmtKaHdC76TSW8K61fQ4Vef67RSvmfU5212QEiUFBqJt9GIASNUMvgEUeVRBUsohg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo3oxqJ/h/jptLlnAixYlDGPVAD+Xwix+Y7/o2R5Y2i6R4YXPT
	6B41U5WZcRkZm8INc8s55mWd0nRjNzHvZ+QCwQ1FSh1RTOCaT4LSxPsXq9UsMckgvVttHISLqbL
	W6n6HqRnd/1TvSkinoFef5FZT0cODCxaOhG//TQ5WJYyEGncR8qAvI+j7+NOuYk3Y
X-Gm-Gg: AY/fxX4abrdEnvvW7a9fpBUTeABlM3m4P7PjHkdPpMjCmiDd65s26sedjJ8+XOzunIv
	2rxVD5Be9bdVtc33tGoZqE37gqd4lyxtARG/c5tJMWbyElxQ9ytc2GKRxP3ikxxWgd3dEDWGvgv
	sp+TtyzCnm0FvB0U7GOm6FiALcOFPQoaP+l3jAx+dxxEfcEBfWxGhju/5HzgOXBNMls8WSenvz7
	YcLyx8hn2FZIOoi9FkYHE/P8ckEcJOPq5wEG7w+xwosL3eNXMIlsTeuVVarWixaPyHwIgo4kq7s
	uW75wU1mpzRFzs9AqCyM5mgYd1B2YPD6f4PtnLDRIChg+Sr+hOu/bTxoTFbYfHmdYblH4R5rcbp
	XDGwMxQekcUiv6Xet5jZ7h0FidqFzJ3KC88YH3AJoYLf1hLl61PSDxMigdFfhdJGbtVAcqmI9r+
	tpHH5I2Gbe2VXSfkPMbU98QUw=
X-Received: by 2002:a05:622a:2597:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4ffa76a1fa9mr22530891cf.13.1767661292283;
        Mon, 05 Jan 2026 17:01:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt7DDj2OmAqAuyn4uADPuy2ZgBfefpU7ocoBOHTN5kE9DO+gdCGToaNV+v3jan8nMFTXwpow==
X-Received: by 2002:a05:622a:2597:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4ffa76a1fa9mr22530081cf.13.1767661291701;
        Mon, 05 Jan 2026 17:01:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:16 +0200
Subject: [PATCH v2 06/14] arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup
 IRQ storm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-6-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HBAxrX8iV9KJiU+UamUvJGLlnBeHexiYwRIWWSIzRDA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7ZuvUFKSSgxoY07jR5chyzPO9tSWZCnONwQ
 6EwB+Xb5t+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2QAKCRCLPIo+Aiko
 1TydCACKh+wp+fnm51csTFbwKAJL8ROyCe8q4mEdQ/VZh9vvL7LRhZg+i3LZH71A2YSF+0LzM12
 yLu2lIAGKrToPnigiBC+sER+qaLwgOD0c5RxIFrzQaItAoqNrhNW0JbvO0omP/jMNCxyaTJoPGC
 5b2UPXPBhDld7/r/LhIDrQyaNi4qB2awdhal1aXTGyTQ++ia3rMGUSliuG1bzlMIYASVuhH6Wwq
 WMTPaoYL7nBQvsx0ZzJuF/9HxGvRo/661EPfI+vrBrqWNSQtJybjYqVwgOIbDXlRUfYkxij2coz
 9wN980qyF2BdAWgtZWiq4E5vid5H5iLcjounuT/EysQubVO0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: zO2llD6J1t6Qokj7XSLIgfZd9WEwwCoL
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695c5eed cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4EO7c5U0FNLfYlZKXmMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zO2llD6J1t6Qokj7XSLIgfZd9WEwwCoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfXybXyyzIAtlRk
 EkTsEvcrxVKQ/tBVjIq6Ois0/SRJnr9OJzmUEUK20LJ6mK7XnzWs27ltQ7/rSJx28Ihg29EUHJD
 chJMOnbdJNVHdHVj4EbGOC9s8bhV6X9Wwo7Z26swbgKp+6u6h4i84xsRfx1yPLLHrRqImfgh4wX
 Pw/0pTf+9hZnFKucYLOOkWPcxngDUhyP9u5ea5JPaVsv2PDC0OcDpOtSmd/wpelk8qtHlG8TAfG
 H/MdQm62ZFo4Zf2qLXFksy+2BE0d50D2mW+4pYjYEJsh7IBJH4EdglGdeTPs+2vTbAZlvctt1Kk
 WFcFJQi3L25Ww23JctO2ijRSHKmzfUrlaFn5xfbBgpeGcwzv69poT8n8ZJtYYW0/s1C8di396f+
 vZXYvNWU4tDJeBnbZx01GyjpmqvZsUoTJnFa+8dr8YBhxQ7or0fA1AI8ZqTeytqWjvKn3pkjJIs
 02xbpfxemuiNQUghqAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170133_963251_55C25EE9 
X-CRM114-Status: GOOD (  14.81  )
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

Follow commit 9c92d36b0b1e ("arm64: dts: qcom: qrb2210-rb1: Fix UART3
wakeup IRQ storm") and apply the similar fix to the RB2 platform.

Having RX / TX pins as pull up and wakup interrupt as high-level
triggered generates an interrupt storm when trying to suspend the
device. Avoid the storm by using the falling edge trigger (as all other
platforms do).

Fixes: cab60b166575 ("arm64: dts: qcom: qrb4210-rb2: Enable bluetooth")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 0cd36c54632f..5f8613150bdd 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -694,7 +694,7 @@ sdc2_card_det_n: sd-card-det-n-state {
 
 &uart3 {
 	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
-			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
+			      <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
 	pinctrl-0 = <&uart3_default>;
 	pinctrl-1 = <&uart3_sleep>;
 	pinctrl-names = "default", "sleep";

-- 
2.47.3


