Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC1ACE7AAB
	for <ath10k@archiver.kernel.org>; Fri, 14 Nov 2025 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=; b=hRycK29gZDUz4CmkVwCX5UN33j
	62PY8jfkP/eSaXRgroon5/jBuC3THtpuPgChq0bosgtDRbAfIlizNRjW9XTFvtZ9eJfnqgJC7zhCP
	2FxRAfqx1ICWWLHARC1cjmEVx6d2Jt4xvt/BGg1kdvQ/JE7eG1yE0ROdgRctMqdPoO7WcM37a7OKt
	VfCTJV8Bt8f8ZummAvGzvLw24IBj/Rl+cWFWVN4PciRVA2d8ghs0CH6/ElmAd7DY78QmE/fCEjHR6
	cIaBGeWkLCVMs8kiD+GcBOwv6dilsnKa34cJFOKKSldYOHxT2N/G+KeuM/6kdj2WwS5FA/CgUA8GE
	a5VuBX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrZa-0000000C54l-0yFq;
	Fri, 14 Nov 2025 11:02:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrZV-0000000C537-2DMW
	for ath10k@lists.infradead.org;
	Fri, 14 Nov 2025 11:02:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE41fxc2263541
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 11:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=; b=XjjCXc00U1MwFPzf
	8bPPHsWCyQ5uSogsh0zSw2ThKZS76fCn40FGGtJeALNAAYSSKj76lMBJC8u0q952
	5lL3OLSXFGOL6PacJrFI/3RhHasEqtwf6BwHOxPZzcQwyQp6XdTayZ80M0SOwKQU
	vCnLXlZDysKwxYP/xXcuRc3dH6/cjt0Vg15aZyjNEdy0XH4tzDN9Mr+Ftr1FoYnU
	28onChHHLXvVZtjto2OITSKMb74IIeW/8vvtrbKh0xNHC/ehu9c8PUM3yCkUDZTR
	fY1tINRlIjG3VF7IcK4jLY9t6IciF5bqyyxorzMqqt734aFRE35i583bJgpOSGG2
	S4e/Zw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adw1j15uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 11:02:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b80de683efso3645336b3a.3
        for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 03:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118148; x=1763722948; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=;
        b=gjx0EfpTZueEcVMsAIpbA19SqRqn1Q7PIUwASNZs8udY9UxxnvLzZae+9hZR7llaEn
         FhbRQf+kbuuZwavDZhPP5330IMK4yV5BjD/MRU+Yn7sNw2KjRqeVDKs+l3Gskmnle4+3
         BGvLsKxRX5NX/Kg53bxlu8RwDTKpEW4Hx06Vr3Z6hxAodBlVbW0VMq2YlodBzejzdCIr
         aP8dESado24s0H9pUgW7RXSHfJVdbxJpopVsIWiHzGP7OEooavBGw+edaWy0jxtSS4Gq
         nAjsapqtEDLmCysuBH9Bp/noFBwnS7LW0nQuRllwtlJRwKImXaxHDT1XSEREPvP90+p/
         bH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118148; x=1763722948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=;
        b=v1pGtwppqAjomH/hSHAQL5F/h/z5br3FgPz1KBcSp76dfTs3mMJAiJT61OgVJnuHtq
         DdSb2Brv7Q3Y7GNr6WywX6iH8hHXPJp+dCb5oFTdjkON1g99zX1ugXvw7Ij4JbL51/9p
         I+1GYtinIgOLP4mQWBHltW93S29QcmEwuYjGpXcnAZGovK2C0fY0F5AStG2M+OaWN38N
         ukutC7WLTPAVmwv0huKe40DVLnq2F5P+w8GSYz6OCLpED3HGIT54VvSI1VWXelpSxVZ2
         X41lnQGc21KHea9qD6y+cPUYvoxtfgvsAF2T0bvkjs+l2vPiH6YyPhDFDs5G5b9nJrOo
         h3dg==
X-Forwarded-Encrypted: i=1; AJvYcCVDxeqkF6hHylZH1ngMp1kr4zT8T5lzjB61/Fj4kXB8wUhh9N9BTWXJkdGcH3uYcyZriWfYNXc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLcu5SfKpDgUhq4/RyMmOffgBzTHmFMeiaHMJ2aN2X5soqbsp7
	CAd7Fin7HOmFpDtBBsIKfi1Si1FkPsLhspPQJS8L72BOvZSC8W9DzMk6hS/kB5n/zdwLcSBBDWp
	ZJpozYT5zHtkG6GFREDmzdbGmnM6xZzBKjj975t2hdxYzvQPYUKGlLKJiF6HJ4rpZ
X-Gm-Gg: ASbGncvN2SqfgIqodqS6jYbpPP9uLPYEIeXVzbfusKEe92jKw2BzZwSP7frCTDePV9X
	JgkIEoDqixhRoH3OQQfSG5w38PX2KTcYXTTwOErQlV4qJZFi7j9azMuUC0bbUBzm6puEK+y/Meg
	YU4ZFX0eRLu8AqrY6jkoUZn6QJbZODtMNhCcfZXsWoxky1JHVxKzOwK6lOUelI+THNm1XoDq8yo
	3IW+A98bOD/z6uz9/aXjJcy09jeuBvwoguwUd5R20RG6ptViucC+zPx8rhhNHN+TyUaC/+goWfm
	Fi8fFn0BZy1t8YjSFLiKy5HzrELB9rOD+0+s4+0uzHpY58VxV5O4WkwjuuRt02sKuQ6nTGCXJ68
	kBDnXpJkQArD8oP8=
X-Received: by 2002:a05:6a00:198d:b0:7b8:9d86:6d44 with SMTP id d2e1a72fcca58-7ba3a0be249mr3281993b3a.9.1763118148330;
        Fri, 14 Nov 2025 03:02:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExFNYt2MskO3W88XzfwFL4ANOFXf0FsrBkggPFobNWhKgZWFcTDPQBJLVYzM5f0k3sKC8ZFQ==
X-Received: by 2002:a05:6a00:198d:b0:7b8:9d86:6d44 with SMTP id d2e1a72fcca58-7ba3a0be249mr3281959b3a.9.1763118147841;
        Fri, 14 Nov 2025 03:02:27 -0800 (PST)
Received: from work ([117.213.102.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b8824sm4884070b3a.31.2025.11.14.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:02:27 -0800 (PST)
Date: Fri, 14 Nov 2025 16:32:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] dt-bindings: wireless: ath: Deprecate
 'qcom,calibration-variant' property
Message-ID: <fmumja63j3xvbvfxlmtnkfubgw4jwo5f43srrpfgqrxyqknrj4@izsqazgbiehp>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-2-a9adfc49e3f3@oss.qualcomm.com>
 <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=69170c45 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Nd/jlyMbCgud2ZEcqXkYLA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iIcxu6EjtSR0Qi8y410A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfXz+aojNjFM1TS
 rBumIj3+0JWB571XwQu+8R8vGn3PePLApSaScjisV4mLvTK+h7OVjA7sWbVF4eLGIa0Pg9EbED0
 yQ5Qkw38owLq8SUJWYUPJqZP+jLYSBZXwi5uwvdK2LtOTq2aigEqX32brZuVAWMS2ItaoXT4Ubf
 zQGsdcqqbqXBp9foN4m6KpZhL0DG2asxEFteGSzLgw+dEx2Fb3zE8NY7k2HVl9Emq2m1xcOqAbv
 D5bekRgwXWCzGJ6PgdoajHNkaaTdtHAuh+Xo+9PmQyRoLxUqiPpX9spbH8/0GPen9l6m6I07M4s
 gz9CIo/zFw3dqt3zdcgRNUb16VcWQ/T6lsgunR6jbNDs5t2BDwxYUbYIeljA2suH22Egxg5p7zM
 R0mVQxLZWG6W3n/lBZfarEC+G6j83g==
X-Proofpoint-ORIG-GUID: kPIqV2F6jUSeqMtCarpsMLPHDwh7FM2a
X-Proofpoint-GUID: kPIqV2F6jUSeqMtCarpsMLPHDwh7FM2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_030231_203542_F088234B 
X-CRM114-Status: GOOD (  22.79  )
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

On Fri, Nov 14, 2025 at 11:47:25AM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
> > On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
> > 'qcom,calibration-variant' property to select the correct calibration data
> > for device variants with colliding IDs.
> > 
> > But this property based selection has its own downside that it needs to be
> > added to the devicetree node of the WLAN device, especially for PCI based
> > devices. Currently, the users/vendors are forced to hardcode this property
> > in the PCI device node. If a different device need to be attached to the
> > slot, then the devicetree node also has to be changed. This approach is not
> > scalable and creates a bad user experience.
> > 
> > So deprecate this property from WLAN devicetree nodes and let the drivers
> > do the devicetree model based calibration variant lookup using a static
> > table.
> > 
> > This also warrants removing the property from examples in the binding.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> 
> The problem - visible in one of the examples here - is that one board
> has multiple WiFi chips and they use different calibration-variant
> properties. How do you find the right calibration variant for such case
> based on board machine match?
> 

I suspect the legitimacy of the example here. I don't understand how a single
machine can have same devices with 3 different calibration data.

AFAIU, calibration data is specific to the platform design. And I don't see any
upstream supported devicetree having similar properties.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

