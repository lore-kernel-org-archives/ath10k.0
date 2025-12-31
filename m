Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAE3EE642F
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAiyfMF/g9yjPkCOoTBHtDUTlB8CTuK3gitehBAPkvg=; b=rbgRhUl3TZcGWbwkQ2iVmrFHSF
	ZoszmM6kjavwJSjdk4aydp+Yds+SHIhf5fktgrdW9m3aDVksP+AkVKFeYGcQ5yuo6to5I7dFolou+
	2ATpigwILHOajjASOy2v8s12Q1eut2iTphGrEi/oIJQVvjTj3hUkWNNJJjJMxPvIfF9DkBfLjdi+Z
	WcbCvvYIUdEcCsc03+m8pR9VVVnoCA8ewlyFe/VN58xHmMiIl+79zPjmz6rqIwhxtxAaOIqL0rjRO
	VFd07iGA1e1134SgrWqCZYDAp0SZpi5cp+/0VkuPkOnpJlxePXcW8Nbgp90GpgaC/97ejut//63kR
	bJGR90Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauwr-00000005wHq-0b4O;
	Wed, 31 Dec 2025 12:05:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauwo-00000005wHS-3F3a
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:05:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV3dRWF1830517
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAiyfMF/g9yjPkCOoTBHtDUTlB8CTuK3gitehBAPkvg=; b=YbOT9Q4/hsa5nJM8
	TIFznLqkCr/ro3BwOmX1HN8+eyL3/4lPdrtWG+XrICtYanVCzX8mUnVPczlkRzS5
	NgeTX7fejQHXSMu1pOHPa/Z+IyVCvdG+xIYNsx5b7RjPeoiwGpSCdZc6laz/yrMY
	vuGlayM4mcukTYOTHWmZv3oHMtYvcQ2DJLg9Ams+UUrqsauc2nuHISzYeG+Xdthg
	GXMGPqrKoJEOTdmf44BGdWSUTC7fepB1sRo1f+MIaP2s+ktpdsa8GO7m07pB3YcU
	HTU5eLieB4kLQAVLLd644PsW58xTHipwv9YCKX9rRwTz5icQPRG6R20ywXgLLDNr
	jCQy3Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcv4agtja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:05:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88fce043335so30561676d6.2
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182701; x=1767787501; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAiyfMF/g9yjPkCOoTBHtDUTlB8CTuK3gitehBAPkvg=;
        b=MCrX2o5COPuwspQPANnudqdp0dCnvFFsvoVkR2mkdoozzqH92tvH823PdbOiIab7YZ
         X2wiibcZVm/iKuRI6gDb3wmdQ0bLrEns2cyynFenzB5/jX7IF4pvXAj6x+QWiJeyTM6M
         NoMD43rMdLtjQKyr3SblAcxeWvnh/rkZ+dZXa7sq8VzsWdgmh1MZDVWIE7Q3/AR4TM8E
         zsrL1bG0w3zxUDT3D48Hs6Y7WobPH3Wzrxy0+P5GBMHisG89nlHK3fm3/Ck3VyoyGp5w
         MyPQ251hF7IOXEanAQftgURqPpCZ5T6nvtlcI2RdiA7v/l71lsS+oH9RCNwgAN9LNhPD
         vYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182701; x=1767787501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAiyfMF/g9yjPkCOoTBHtDUTlB8CTuK3gitehBAPkvg=;
        b=kf8DDm4fvlZ/srzJXC1Rikmb2lsAWtSQE38njabYEUqjKcdSXU4mdn8ckxnyvX7PZI
         GQrzyWLocW5NSEQZTdPmFSn5AIqVHev5qiI4IRK2YpCsOshl1zVbCl9lGIVYFGBsI5b1
         wbgrCQPkRY0H0uEITF6Akb+ri1t/1R+2LzID95+ivjDG9IhSVS9oHXBkcKVNYJiqceIi
         SQ0Yx1J9Nl9oAzrGTpyUHMYpOzEKnytHh9C+TWmXCNWTJ/an7JKy29MV9RXJDIPW5w4y
         UUGkVDdB0SdrAgun9aXMM6AUFBHCUAKwScs9SgQXSPORmlzAJDW5rtClmPjvbSPSOyyF
         qigQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqGO9gc/Q2TxMH6gIsT4fuQopuX+p7PHx74CHhjzZdpy+F3Eon9mwXJOYDEH3e/Z3Mm161yIc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf/DS7InpT/kikLGyu9dinlDh1HYj56S1dwgJyf/57KeMkCwA2
	xpJ9wKUodj1aPjz6zIamagrIzK8L3Vvg13jmIr2SMEYED7BJL2GlSyjILEg1Y78iX/MnrMPIzft
	jL46tnzPcPTulW4kMUM6fZ1WKDb6/fr1mdYWQeAGj/g8j9FVxMC9vNitFJmBXamkV
X-Gm-Gg: AY/fxX6YqxgubYnai8nOYjcRVunO39InvLzHIbm2OX6B7qa/CfGFva2RqRifZMsZi1/
	r3mSD0CM26Rz8ritAyetCelr5XD3F88DxE0YRGXQ9V2/ndI9J0bdbziBc4H+q6f/WMwwnYR29EG
	+MomxoURoyAvXyy4Yp1q/fkmrc69XEknDm97m/PGfWFOgdEw2VXvaPWhELvaYWlsnBMooObA8Ka
	5/KHYxBh5pao+3hztUZCQhqABBcPijBt3SDgx2qA4CF0ZfpV/tp3HUJE6oaIvsRl0se4ZX+jcer
	hN71GUZFGOkm3xLvzQ+vI1Q+NEYM0O7FEimKJKd/NdO0EKK0EtAw/2zIFKlRNIsX28k+Y0yugdn
	6Hbj1Z+p/euUGJXlG4JmC2tpveU71JhSi/izscf8qhRWajjjoW51PVCvEaKQHTteQWA==
X-Received: by 2002:a05:622a:cc:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4f4abcf3ba4mr419279371cf.3.1767182700790;
        Wed, 31 Dec 2025 04:05:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmspfRwTHtI0ttV2ZEBE7PjFXjLSRr3IkJr1HAIkpcbq09C8vb9gCxrZVPdH50btLnUkiSig==
X-Received: by 2002:a05:622a:cc:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4f4abcf3ba4mr419279021cf.3.1767182700295;
        Wed, 31 Dec 2025 04:05:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159ac90sm37752595a12.29.2025.12.31.04.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:04:59 -0800 (PST)
Message-ID: <dd020ebb-d005-4322-9321-b09199156a9c@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] Bluetooth: qca: fix ROM version reading on WCN3998
 chips
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-3-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-3-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L3CXu1mAnGOI1MaVtQTInU5PEW207i0x
X-Authority-Analysis: v=2.4 cv=Ps6ergM3 c=1 sm=1 tr=0 ts=6955116d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_XeksoCtAhHN6JefJdYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNSBTYWx0ZWRfX1d6hX+1M7XhS
 QmpekdrERZQE4PhMqWct3Y61mzWt4OR6NaiCWf8In4qqtb/VYIrNgV7oPDMKBDmKN0PUIjhnMKe
 AFC8K34HDsmclquCkeO80j3/+m4QpzYAKNT22dDqEnSfETqFXMO4nzCqRrXcfuyTzygIA8hK4rP
 2Tdvq+AgQNfAuuujsbdrsA5IblHN9CsBd3xu3BEWQyxqUz/dcfvDjXkczmnWRr2uaZgz1CkFeZF
 zMiJfNU/QInirpZ7HNRsdT3x/q9KJu/+u82DRYEq+SQtW972b0h4Q05vquFIZkDeNQ1R13gS80s
 F5ZMMomH8BjcgT3SO2ltvGZB+5sPtX7MM5zXew5TB41k8Q1R1T55xdB40vJWi3Wrjjy7MzrohH7
 JnM9WqhPd9238W/HLCCiJYCOVFMm30gzAs4EQAw2+NURpHErdW7MERZPRLFhq7Ynbo+iXi8H9pL
 qxesaGYmeVZVtA2CY8A==
X-Proofpoint-GUID: L3CXu1mAnGOI1MaVtQTInU5PEW207i0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_040502_825210_82867E17 
X-CRM114-Status: GOOD (  15.61  )
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

On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> WCN3998 uses a bit different format for rom version:
> 
> [    5.479978] Bluetooth: hci0: setting up wcn399x
> [    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
> [    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
> [    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
> [    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
> [    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
> [    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
> [    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
> [    6.842948] Bluetooth: hci0: QCA setup on UART is completed
> 
> Fixes: 523760b7ff88 ("Bluetooth: hci_qca: Added support for WCN3998")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 7c958d6065be..86a48d009d1b 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -804,6 +804,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	 */
>  	if (soc_type == QCA_WCN3988)
>  		rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
> +	else if (soc_type == QCA_WCN3998)
> +		rom_ver = ((soc_ver & 0x0000f000) >> 0x07) | (soc_ver & 0x0000000f);
>  	else
>  		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);

This looks like rom_ver is essentially maj|min or so with min = 4lsb and
maj being a couple bits up.. no big deal in the end, but this could be
expressed more nicely

Konrad

