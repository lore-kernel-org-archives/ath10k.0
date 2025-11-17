Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AACCE8D6B
	for <ath10k@archiver.kernel.org>; Mon, 17 Nov 2025 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=; b=JbTzBJwmziI85zypHggu8de84K
	Zmj1wGbunpPDhjKfRhlBY/GcEAuORU3Z0yzzVkSdTW1hUaKU7ePE89s0KvdYTTw5lgnYLaq2bWm1L
	Ju1t37tjkib94/7yDby8HBl4tS7twoLbGzRfmb69eIzNVdeMlOk/v5cdIf2eRJoOVmceD+6ojRp7l
	Dz/b88D/6ZsNs7O6PlWfLALHmeGbfWzh1jpZSTUnpr+8rsiVDp5ktZwS1FbkYl9IwFtC1WQPg8W5u
	TF5fvlWKZe9gNmSSIH6JSee4SyJYm3QZU1j0hLSeWfI9vK/j0izS5UIDtrpIR/CxoFaQQziEyIMSw
	AJ8jbrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv6V-0000000FjDa-0Yvc;
	Mon, 17 Nov 2025 09:00:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv6S-0000000FjCF-1dq3
	for ath10k@lists.infradead.org;
	Mon, 17 Nov 2025 09:00:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o2TJ2851944
	for <ath10k@lists.infradead.org>; Mon, 17 Nov 2025 09:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=; b=CPBjihyMHTLRrjQj
	4XHfLEacuQ6JFr9+VGc+ghla7bsIHF6CYow/WPU8FRlxZlnQO2UmfTzhvNaV7nMn
	tDGsGr8GNsv3hOYWh42aGdAEgn3sWBrkGmXxvtaNdqRdz95eegbbXiVUKnQbmwG4
	S48llXoTy0zMk3WO/C/foDUaJ7d5OI/xHKOummpHT6x/C/Zr7HZKqt9FpP7IYfHv
	YNT7/X2KTu0N8XJ0jn+IrCe0JLZ7NDzWluP+Pyr8eQVqbmfzlQhwN52iLtj1PKcA
	zTAeWGWu/wKvuK4sArEOzHmndMLq2HCZF2kQlsoHNn/kcVe2yxwkcSGKZ7eWi4xS
	BepaxQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh0byxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 17 Nov 2025 09:00:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29846a9efa5so113010365ad.0
        for <ath10k@lists.infradead.org>; Mon, 17 Nov 2025 01:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763370050; x=1763974850; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=;
        b=P9gnQVUK88UlJGMuMaGz1k4rIxyUvkQ5xe3ux9jkIFm2C6XdNfonkls+8uh7DOGJea
         q/vlYne4SJBOOvAlabr1jYzHIoozxlhwXIT/c3KJPg93iKMty0nAX9jl7TGUBBfrksoA
         uLywkgbo7jlF6HEf9CjVVasEInyjJATK0TD9snUHSZO10zGwz0hK7rWDFJMNwJ8Vh6FU
         ELtzc2PT6Y2hr0jWYP8x88Z1HRsrO8T/IVSkdVi6z+MtP3HDk2hH24qPF0TbkcQFMaGZ
         bSCncnxEL/OGbVLwQMAcpsTZbwx6o+vb2HonTgM1NTNs0HGc6dXMN4ONN88x7pDlUE9P
         diAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370050; x=1763974850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=;
        b=HGYviNf/v5bSLP4SpuV6fJ4+WuUxii94oiXvNHq696iv1fZ10oU+urh7o3KYjjXn3b
         RzukGa4nosrG/B9RLaI6rt4kBrd+nM8pVbE1nAb8tV9FKj2xxWVsxJA30RcEO1/iiPPb
         2aAMmejSEcIescLnYWZzetjOlw3bFGnXlVwQrlKCp+LkkKnalRn+6h4ocC6cQCPDWKCr
         diOCPoKxkEX8cwvqN+4vXIGZKo8zdyindpKjna4S2sBA67yXUZK5EBT9w2h9LrwN6IBx
         f9ItuwuRlmfwQNTb1H+7E56fj9Ctk+kPLTh1NaKM9G9Ja+ZmA68YBtPt98D9ZBqqQSc5
         dyUg==
X-Forwarded-Encrypted: i=1; AJvYcCVinD2EQSxkVEPz55fM3aHl8CdlyQt87/3Qrz4EjOsDqV0vtmDrHT3ylVQUlj5WhDljAfQ0eGk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJgwBYR7468VyNakrMRklxKuSReUJvIdJ/ujTNgFQcYISeivrg
	xzEfe4LYgU2Afz66BmN+swbouTwpdlHpAuS9FHK9f4cQJfU/Q/7iuHmPn6ct+lIiD1Gfh3fbNxx
	jd5TyaLXPx9mrXGPkkSNpdvlYsTxUvieOrqD4XX89dbXKEN1mv6vQHEUGulcS4rtT
X-Gm-Gg: ASbGncuBM3Y5HK3OObavoRf1GihVOTm2VPaOx8VGKZ/Wx7vBF2+PQNLb0XDQf7EUvwv
	+wJwdA0bA9w/J2knyjvnizvrX5LbUZecdXQqZrYBbIcG7ZqCxWESTIwbEcTE5A0Q4TtVlfv256V
	GbN+zWWaaMr/fBM1tYINUJDHtjGSos6XxCZn0MZz6ri2PO4vChfdXeL1EWDSif8Kx0muuwIDBS6
	QQXZ3Rz4Hrcobllc71YdH3G0hSD5Jc2DZZRdxTFCfJy2jGKx1kuLQPseMfa088tqDbi8jgwxBLS
	fO2AdbGUE/lwfSbV594XPrpKg7d8FLaCCCyb+6EBti6hiA+n9/iIxI5BqMCs630Yhzqa8bYaSH/
	X5sIzXrZbjaqh
X-Received: by 2002:a17:902:e1c5:b0:298:3545:81e2 with SMTP id d9443c01a7336-2986a6bfa2dmr88167965ad.22.1763370050054;
        Mon, 17 Nov 2025 01:00:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnrNdIz6rZtkHkqRUVqdF32sENFrtojZo1qL47E8dcBWurjeZGz/LHdZ+VRed2ABXDGYua7w==
X-Received: by 2002:a17:902:e1c5:b0:298:3545:81e2 with SMTP id d9443c01a7336-2986a6bfa2dmr88167425ad.22.1763370049309;
        Mon, 17 Nov 2025 01:00:49 -0800 (PST)
Received: from work ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2beb34sm132716465ad.76.2025.11.17.01.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:00:48 -0800 (PST)
Date: Mon, 17 Nov 2025 14:30:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nqQQ2h-ejDjmJkthITDCh6sozv9YCS9C
X-Authority-Analysis: v=2.4 cv=A8lh/qWG c=1 sm=1 tr=0 ts=691ae442 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rZNuoRbQ_TWyfwDSFJ8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: nqQQ2h-ejDjmJkthITDCh6sozv9YCS9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NSBTYWx0ZWRfX4q72n0N94wL1
 a8SZVz3MS2ADue2ds7K1laMbjh5vQwgfIVwWUlO9EznGISJqFwaXWnZ85Vk+VdsMlyX9dUTBOWw
 kbB1B8FPBD7FPSKSOASnnknXqt1g+/IhGoD4FGNVhI7rUnydSF2HVaoFh9jpQEPNGOkzC7a+JQ5
 6WqZd5bxA47XdeoPAq9E+LYt4SUSGo/qgGiDubKNXESYZMpAoUk6lYXYzCoe6emA8GIWTzGFn2J
 zm1ox3/K8yPfU4DKwUlSih8q8K5M17sJk9kGtH5O487S7Thzw8ZNG6GwOOnV8WxICOlWINNTON4
 uHoqsq8t0aalhWOpTbjj2AXGIowqIFYnO0Dx1MDdvw7pv/9sK9/6GgG9HgvSqXvzm6kA+//aw0U
 dTc5UMDmgx4LxTfrIgAQnxct0qLccw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010052_435433_52C1FDD8 
X-CRM114-Status: GOOD (  33.97  )
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

On Mon, Nov 17, 2025 at 10:36:39AM +0800, Baochen Qiang wrote:
> 
> 
> On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series aims to deprecate the usage of "qcom,*calibration-variant"
> > devicetree property to select the calibration variant for the WLAN devices. This
> > is necessary for WLAN devices connected using PCI bus, as hardcoding the device
> > specific information in PCI devicetree node causes the node to be updated every
> > time when a new device variant is attached to the PCI slot. This approach is not
> > scalable and causes bad user experience.
> 
> I am not very clear about the problem here: is calibration variant device/module specific,
> or platform specific? If it is module specific, why the lookup is based on the machine
> 'model' property? While if it is platform specific, why do we need to update devicetree
> node whenever a new device is attached?
> 

I think I mixed the usecase of the 'firmware-name' property in the above
description.

But nevertheless, the calibration info platform specific, and hardcoding the DT
property fixes the location of the WLAN card with a specific slot. For instance,
if the board has a couple of M.2 slots, users should be free to plug the WLAN in
any slot, not just a single slot where the property was defined in DT.

Also, if the users plug-in the WLAN card of another vendor, not Qcom, this
property is irrelevant/wrong.

PCIe slots should be plug and play i.e., users should plug-in any M.2 card and
expect it to work.

However, as I learned from Jeff, calibration variant property is also going to
be required in cases like router boards where each slot is dedicated to a fixed
band and the calibration variant is going to be different for each band for the
platform. So unlike I thought, this DT property cannot be deprecated. But going
forward, I'd like it to be used only in these special usecases. Most of the
upstream DTS have a single calibration variant for the platform and for those
generic usecases, this static table should be used.

- Mani

> > 
> > So to avoid relying on the "qcom,*calibration-variant" property, this series
> > introduces a new static calibration variant table based lookup. The newly
> > introduced helper, ath_get_calib_variant() will parse the model name from
> > devicetree and use it to do the variant lookup during runtime. The
> > ath_calib_variant_table[] will hold all the model and calibration variant
> > entries for the supported devices.
> > 
> > Going forward, new entries will be added to this table to support calibration
> > variants.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> > Manivannan Sadhasivam (2):
> >       wifi: ath: Use static calibration variant table for devicetree platforms
> >       dt-bindings: wireless: ath: Deprecate 'qcom,calibration-variant' property
> > 
> >  .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
> >  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  3 +-
> >  .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
> >  .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |  6 +-
> >  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  2 +-
> >  drivers/net/wireless/ath/ath.h                     | 98 ++++++++++++++++++++++
> >  drivers/net/wireless/ath/ath10k/core.c             |  5 ++
> >  drivers/net/wireless/ath/ath11k/core.c             |  7 ++
> >  8 files changed, 115 insertions(+), 8 deletions(-)
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251114-ath-variant-tbl-22865456a527
> > 
> > Best regards,
> 

-- 
மணிவண்ணன் சதாசிவம்

