Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0221BE6BF11
	for <ath10k@archiver.kernel.org>; Fri, 30 Jan 2026 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIZREWITnjl1/FIFaSe23yCY0lDik0S4hWoOA7m7i1A=; b=wUPLtLjqQFT1wyPzKOg0ocVcc4
	TX4q7BZACQROuOQ0eAQHeU2qtDY+0/wcXZGqnnHyDlEmKDSd0cOyatk4RS5DDDK/XyK3j0bd/FhOj
	C4VSxmVtulH0TNTQExbTnWt7RQtE5KVDUVHA45eCG6i8xXYDKooPCpkFHwO/7LsxX4hchC2UJlzJB
	cK1cKQYEWZe43BliQqu8LNZGcUQCdWUbS4c/0/LNVZ6SURMqwHG3svLTuOfe47X7ltl7EqpM5LXQs
	gVBBq8Afk4MQKlMDNdsrLFdWRtHsdythBTe24CzNa05a3QENncYa+VwmlnpMSKYJSecVFPmEeulyI
	ILybBlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDl-00000001crl-1M6a;
	Fri, 30 Jan 2026 15:15:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDi-00000001cqu-3c2W
	for ath10k@lists.infradead.org;
	Fri, 30 Jan 2026 15:15:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UCfJQp2295378
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIZREWITnjl1/FIFaSe23yCY0lDik0S4hWoOA7m7i1A=; b=gmy6svRUWsYWQg1H
	gWSRgxZf0Y0BcJ+NOrGdoSUG5V7/ls2X5r52gEI9QycnVMPVifK48Mrt5GBRwtLs
	KZ3AGcmmf7/Xqp/htdSQJ/cD3kp+iTy2l3RzxfQdC/TOFRcZsgFQoO/taFNk57Ke
	tDWiLOow69qFqk1Drw1xWQtl/UibG1/NncZpP/UJOIGGfOQtt5f3wKcXO+eIrhlA
	DBpvKLoM+dSTgfW7Z3KbAtoZSTG8XrBEvVlUf55jeccCvNcXGen46bcVNUjj+NoM
	Gaez8yIhsu4pQ4PIRdbeMF6L0GPKcP8pNWJvmI3YbhesqEqYOCjZISXxuWc8/qbm
	OQjBKg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1x9rv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b74766fae7so2679108eec.0
        for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 07:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769786136; x=1770390936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIZREWITnjl1/FIFaSe23yCY0lDik0S4hWoOA7m7i1A=;
        b=HGgxpn7V0PRYPhM/EZ9eUIu+kpRPcLt8jxZBkUal2+bnOKKKNb2UAMQekhipLR+TpA
         wscv5cwJi6FwrEfIuvc6oxRm6QV+Q/fZivLDDXgV2LgtMJseqJFDf8VjyOGR7gCPM76/
         URCJf0v0s5L7Y9UqDKRKGrmmpSurcRGomU0VMVz7sYrDgMNJc9R1hO89L7ZjEpqzafc6
         t106jlTCq3X++7k+2X4w0/0Zx2R3uXUD4yuuq4a0ZlU41sfA6zmKooYsDvuOvcmt7rQg
         pj3xJPsjlBMF4Hf+XLxM7ABs//kCCPgSgnQXnJLKhpQFiKcI0GbSCiCdw6lGEKwjo1/v
         stDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786136; x=1770390936;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mIZREWITnjl1/FIFaSe23yCY0lDik0S4hWoOA7m7i1A=;
        b=NGIqyc52SeirMXGM1kKdvDUpGMT36dYjTIul7dycZCZisEiiD8bALuulOYhxhtyX3Z
         FRhs6TFgjQA8eUvE38tg69wTVpTU9lbRWXEIW3PPO9VZIWu1AyPTWRr+Hr8hODWMGyIK
         JSfN9q9D7pard3BMV9g9mUFs8OxWvnWAaCpkBt6qXRCP7kwLGRiF0etqR8xs7XI8/E93
         zMZw3jdEJhpKAs7ZKKdQBzBlIUsXKZwx+7VMz93pU718mMd0PPhdMfIB7cN41yEF8jqz
         MLbLe59HCih3cJ49KBTzzhmSSok1A8mdXd5JJWDGEsRTrvntG6/czOGCyYhjoPpRn2X2
         R+fw==
X-Forwarded-Encrypted: i=1; AJvYcCWta1iESEcW63SRs79ldLb1+yNw52XpSU5GAZ5icGaTF6GHsYro59VA6Gl86HPONPYKIotT54M=@lists.infradead.org
X-Gm-Message-State: AOJu0YweRVCvlDVNCqDsX2xWULl5Xs62N+4ybhrA3+oh+IEZEoIBQMqT
	qn2CKUvcm99BRkGWC4N646jehfB9ex/R8zK2l8vEjIa1zjgJlHXI3H8ic5wH4+LklnAb66U38n4
	Uuf8MRmONRgk3+3l+NsVA1f534IhoV3HlHAKY/WZ87E62US0VGvRSNfFtKHCj77j0
X-Gm-Gg: AZuq6aJY7FjF2boeAxihnvlzwqux4ff3PysWVSiy21+FjVmRqNkPQQnmDzRi0IR9f60
	lOg3t6ZlZGWTO1u9zsq1w40Plm69thZsq8CBXqDxSagPN20ou7XL8KuUJGtD8FMa7z5rwLaTCyj
	ug3+fOS01rPXgSamlEt+rD6a0zR4EFwF4GxAbK7Dnpq2ThZmdfKbItUUpgALrS6PiX85hDV3CQU
	hK6xdbKJn4klanQ1iSgp3wCV6he+1RS81a96xEf7AoZGRhrlm7yH2uzYcZMn04PXyDqMnfdM3WT
	dLRrq82l4H5dwajXKtILO3EFybFnqzUllD3qSbiSAXMeJeGmhKHkUUZmtTzzqP7NNw4KZeeoUJm
	TXZ9u8zkTOqjMpk4uOOt3nZk4eHtv9RvkXZ3iqVnJ28NBOv3yW1z6w9sYPGMqSFHO
X-Received: by 2002:a05:7022:396:b0:11b:d211:3a64 with SMTP id a92af1059eb24-125c0f1e671mr1354685c88.0.1769786136379;
        Fri, 30 Jan 2026 07:15:36 -0800 (PST)
X-Received: by 2002:a05:7022:396:b0:11b:d211:3a64 with SMTP id a92af1059eb24-125c0f1e671mr1354659c88.0.1769786135739;
        Fri, 30 Jan 2026 07:15:35 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm10252849c88.7.2026.01.30.07.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:15:35 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
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
        Matthias Kaehlcke <mka@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the
 device via pwrseq
Message-Id: <176978613488.3951544.16310124318895182345.b4-ty@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 07:15:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: nf-36W3RXJ9uukEUgao6ZSYSIoRPBouY
X-Proofpoint-ORIG-GUID: nf-36W3RXJ9uukEUgao6ZSYSIoRPBouY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNSBTYWx0ZWRfX60F44atBTgiK
 27jxUo+YKUctPApJhX3KVlnsNlHIAEXp1YrDoGBTfbNcG/pDF5byTK2+TgMXKw0oXJoY0kfWv1g
 e0NcUMKc9fES5/OnKuc0gD6hbAnzYoHH/ZqjtM899+NWjBjxF5ya+9Zf6zGFBJ3JUNGDNMwnmIn
 DUzGDJrnO4n7ShQOYhpaDM9V2x90yA4R/LGZwSjY/t2QsIMzzUqdM4VJ4IhqgB9tLptmXLZv66P
 +CTxoKevOQqAXUZEwxwMi2RQJkNMrhWZVirMM5trhANMxgNaAlX3L/BT9+5BKnNB/4sVS43TZgi
 kwIRWlfkpUCI6vSqXZTJVBPnyFqlC40988V8zaOWr1g54TNhyB74EfKUKjxzqSsVwQIbMrJcKZh
 Yp/o6tr1V7FHxBMaTXtuUV99IW01ickg5APjfrIlScnD9l+3CWfq4n71uNY0ehGfgoer7++3p7Z
 I5aPxG8UFdYFz1RELng==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697ccb19 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9BDlGpjYJg453-lo7M4A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_071539_045499_130D19F7 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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


On Mon, 19 Jan 2026 19:07:57 +0200, Dmitry Baryshkov wrote:
> The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> voltages over internal rails. Implement support for using powersequencer
> for this family of ATH10k devices in addition to using regulators.
> 
> 

Applied, thanks!

[3/8] wifi: ath10k: snoc: support powering on the device via pwrseq
      commit: afcf3ec615c918dd71139e7ca2f4812ceea48cd7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


