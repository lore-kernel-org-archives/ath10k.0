Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486ECCD0428
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 01:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIHZTxnOdazQFGAJQSxqsY8ozTjZjXZSimhBE4+TrtU=; b=BgxVrb5dZwD41XGQoKd9Kgpl7R
	PPR+voRqHMq8mDs4MzElAk8lMfh9ikqYKfPserhajJcL6HQVJOU+oKSZ/z67vWZkklSmqx1iPlJ+5
	ZQ2VWutN3dN/jeU8FSjytFCDKOnYVLuXTiDu44Hs/KqtetNLnnNFPQ+PLxfzd3O8ZslnWcjwwPX6i
	8/E7EoLzjJAO7DZAOFxhhl30q2M/J2aEkJFNBwplCXwOtcyRGiTqLL+q7cHSTBl0iCxbpbaCL9zp9
	vcg00Lwh7JrZ8f/HEQt8G5NF3oQP8942fuBNpDZKZYQfBkS2kdLoY3W7B6TvHcjWauhIBCs5tiAUp
	3IyVViAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvS6-0000000CHfa-30vF;
	Tue, 06 Jan 2026 01:01:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvS4-0000000CHd3-0iMm
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 01:01:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nK7t2943623
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 01:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIHZTxnOdazQFGAJQSxqsY8ozTjZjXZSimhBE4+TrtU=; b=aMl9wn13r2pa8iQc
	y5aGy7bCAivl74SpmiNNqY1QPMmnGAr/jIZztOwzuVz2ne1Foxd0c1Vm4a2qlWtN
	VjAtWDfj0yitBmaOwJBEc3u9vDK8uCaKoTCDQ3T+2pUMdzphj2tni+F2xmQf7ycM
	lYCoH76UOSv3y50Ty9kIVEMRcQsv4CiZzbwrQ0q8dZ7mY6ITEmM523AqOoDG8y/J
	6KcUIzgxvpSBdjEvcH/C4kk90HZXjVG8av5Xzla93Oe37X0FH9AFtlyVieXFwBR9
	WJlqmhB7R2/XaoSxeXrj5lsIukCnvEmROEiUmYcx3R1xuJJTIHEk9R+eqEFIdB9y
	NZ1zyQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv01ex2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 01:01:35 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94125ded3dbso1067602241.2
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 17:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661295; x=1768266095; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIHZTxnOdazQFGAJQSxqsY8ozTjZjXZSimhBE4+TrtU=;
        b=B0/WYP+eTKn7JXWX3YcU5BVx3GS6Fs4xrb+0jDfFUAyGH4+Ru4l9IlvNoCJ/lryZOP
         qz7xbYRpZodFh8wiQpyMbbpsHFpMEqWrWdUqFq7bq4KqaG24+fL1JBNToIKGPVqtQj61
         PY+tEU3DdOGo2aTeNRP7gHnzvXNwniVl87SQx8ZZulD0KyRjat+yOEGgNtUP0eRZ4Lhj
         lbctdlIZy7rUCOWdd1Nqc/v08WxjrCwBCorPHOVfMdK98Xb2+6H05NLL/aR0gsswF3nW
         JRcQ0Xkk7znhLrEEpvSr+C/lj+MP3aQj4S5zZ2UuH740/VNEQU8nk6Lp+xDs61ZdHzZW
         a9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661295; x=1768266095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIHZTxnOdazQFGAJQSxqsY8ozTjZjXZSimhBE4+TrtU=;
        b=aQLtjD7i1kTNQXYoQE6be71OcY7p/PqrzwHtwnj5UUAt9SLpPOVKjKfrYj/9mWQfEh
         DWKWrRQjK/jmY0K6WazJCX8GPyVHIX8Uw9C2Sri5KVqSpTGY2DCz3eCxLILU1Ye15zX9
         2Hx6REsd7eWNC1PPEqQr1pvRT4k+BkDlZA/P5UfFMwhMhO/uli3lJCnZUGMJz7WxlOe8
         M46iNfurC6YJbtV30AgDGzlLVofQTk7GxFpusDcjKMFmtSyUFllmzsd8RLV26uu5M3JJ
         zYJTIq4gVc/Kodpc0jZYfg5B2gpS3D2p1QUEEQNJ5N0QVFlv0sVM5aU39Fl1z2KkFUKs
         d5BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHlrp+pkzmelKfE+XSYvff95UAVdbBcaC7dZcfqm11Cc6AD0TYaUqujgg/obCO9U603juKOOo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKC3is+9rG+Z6YkK5r4v+6IbkaG/BA9JerqeJVEYzk482omdTu
	ozQe0mfQ8AUBVLVXUgSjoENvVGRDZ9p2FL58QpLTufE322q1YU23iPVmkitZA4EseRTGEmvwR3Z
	gja0X7DJ3CNamrBce2sMSsQ5VzgjuoKlg3YDY006aM566aC9g3od9djvpPaoWW1Jg
X-Gm-Gg: AY/fxX6XevlMczmF5JYa7QKwP90zM8Dv0KREfMDzBxLNZOfn5nriaB95dg5Lx8Z95ge
	fxqt3whZxgeyh+t+2ngxad4g+vBZNyiV2+8d28JVvUT2PIYA/FACvtC9oEKp4L+BGjJ4fFr16YP
	JzGZM2vRWhAr6tAtGqzJ2xB785dmt2NnXkCqu4Ls+OOMeLMZO821kcleJgkZMo++QQCE8G1jYKI
	daUyA39MAQ74mqxzwQX6M7tpsmeKfFb6Qu5Al3BQVRQJ7BJl7CDxp0oOdY+hjQ0xt4Xs+D72w6k
	3o+qNmkDDMW3+qxWW2cypmKMEVGdQZaK2UsXkkua3nRe3HKAuxkQRGNXUDnC/y75qge8UM+L+gT
	bQStsnQMVTvML076OBghxxOg3tlOBDpK9EiCOKxLIj3oayvgh0LFt1pOz23ulnt8fu3ypCZBbjP
	9Dl7sOwQAY51cxZuLcMKPVBlQ=
X-Received: by 2002:a05:6102:370e:b0:5db:cc69:7399 with SMTP id ada2fe7eead31-5ec74329c39mr406518137.5.1767661294632;
        Mon, 05 Jan 2026 17:01:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGebirOgsDiT7jy5CL+h38CH91id84REIWuMIjih8Il5xh+FCp6mTy2jPQ3VA807d2Ub/nd3w==
X-Received: by 2002:a05:6102:370e:b0:5db:cc69:7399 with SMTP id ada2fe7eead31-5ec74329c39mr406501137.5.1767661294163;
        Mon, 05 Jan 2026 17:01:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:17 +0200
Subject: [PATCH v2 07/14] arm64: dts: qcom: sdm845-db845c: drop CS from
 SPIO0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-7-0386204328be@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sxwe6pBBzgKc/Rbx3hGlBLXglP8Dn+Y8xXV50hDaYm4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7ZlqUdRROe+lrbb5qeAmQzNxwRhkFbuQafZ
 1LnRVCUW9SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2QAKCRCLPIo+Aiko
 1VsbCACUB9ZxKyeCESIpnYkNLBvtnArQbybVrFIjFFgB6l3oeJuYSCmeGB8KtWBcWFX2p27bPvy
 l4Aze9U5+0VUf1taw5VP9+CAZWtu0J9j/xyuRRkykC8Cy4zqkDxHYPHOEijFrDMm7mRL+R5SMX0
 EH1oqdcUgqMlq0H99DIFM4hm6AWODt7utQmKjM5NQjq6qy/clKrEbuwMXOFqdJq3gYt1yUbMY+b
 RsiCT96M2hDYAk/EnNDrvSNw+PX1El55uN7ExzhDgQeQ+xxpacGhZkL1YLw54HrtKMAcGhvvDId
 WiS5YD8VbDIFZwP6j7BaWXuWjm97vOokxspiSsDKglf8y87A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695c5eef cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Vj5tKrsnPMLlX677hvEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: O_gGQk-_51U3uirec2r6K-Yd5cwFpiPt
X-Proofpoint-ORIG-GUID: O_gGQk-_51U3uirec2r6K-Yd5cwFpiPt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfX81gkbfiq0L0p
 ml6hDeP6Lxm+U3+BraLm/9pE9Ynr20n5oNFEnJYObiT+Yzsfi5P4QnfcoVZR9far4WF2tBJJL3A
 9WjVzucwrz8jEmloyoXB5I29sSY3WvrcIbWEjOyF1km8e+XDE/OQTm1IEv8zN3Erzf4tnYmpSYF
 JA/WD3jeFVCUV5GPtxyxd5xywTQrto3WDOfVzeopXa45hu9iiR5PIRrnTvZqoa985wwNUiv6BBF
 Kn0cOqaDin68J1fwHvdebRKf+lWuP5CX66LuXDbOZbQe2y6remf4wPKwodP5UIAQsY4DlucAPaj
 gplbSgtlrbrGRchNP7RaXc0nYZrNGDNMxE+s6r+iEDIQskPHaBVJy06NnZSvWMEpYnEud0NM2Mq
 K9TJbqreP+qcnjmZYUvsT9HIILOAavMeao6cs8DKCVv9GDO3sY25wCI6OitXx5QwCXziJBNWmGB
 uwEIHWkDAT+fEoP3qhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_170136_220916_19132918 
X-CRM114-Status: GOOD (  13.54  )
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

On SDM845 SPI uses hardware-provided chip select, while specifying
cs-gpio makes the driver request GPIO pin, which on DB845c conflicts
with the normal host controllers pinctrl entry.

Drop the cs-gpios property to restore SPI functionality.

Fixes: cb29e7106d4e ("arm64: dts: qcom: db845c: Add support for MCP2517FD")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index ce23f87e0316..ad283a79bcdb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -850,7 +850,6 @@ &spi0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&qup_spi0_default>;
-	cs-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	can@0 {
 		compatible = "microchip,mcp2517fd";

-- 
2.47.3


