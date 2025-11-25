Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154B4CFD37A
	for <ath10k@archiver.kernel.org>; Tue, 25 Nov 2025 09:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=; b=rveEt4W05Gi4ID0EW/9jvtnDaX
	EjA+nsFNfH7zJtDZ+F+jDyreBobElGhSSu9IlXEsrVEnpML34fmVZYHffFG2gSMxvsW0Ah2q2/3Ga
	spS2c5fq9LGISqv7cfeHw8nQ6pj/qe30TsIfyBwwGPOxoZjQvlp5WL02Tpjgf7HfXxQJh6UtKGc/9
	62uLrcVXLEmEvjohXy+VgJ2JDdEYbcqOZlJNcMLhuy7//77T8X9fxdMj+KXuzBqDrAjzg0vmoIrjV
	EuC7/4BcLQrp46k4hWep9V/xsmUSTmuxAeBIHG3Q7jBRYenOJaiht4VLvvLMwoBzYYHTWwNolbaU/
	IgwsBg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpo7-0000000D3ke-1v75;
	Tue, 25 Nov 2025 09:57:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpo5-0000000D3jy-1eqy
	for ath10k@lists.infradead.org;
	Tue, 25 Nov 2025 09:57:58 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b735487129fso772243266b.0
        for <ath10k@lists.infradead.org>; Tue, 25 Nov 2025 01:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764064675; x=1764669475; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=;
        b=DZeQGtADCy2RJHLbOxVCfbpH/CSs3uNLxBpZnDZPjGrj5zcnJFf44JpPOUFhYV5Kgm
         6z0LBXBs3vcFWiVuczU46pej8WFrTPiV8UJEL47utfH5Bwjq2OCYp9sT1PDurN9kYWC6
         XbQVvKW8Rr4UhNIZKpLY5MGhQJ4PSs+tTrzwZULXvWZYEuh+/YL4aKU/x7lBCksoUGtJ
         tNAQ+Mb5YHAsnyi/ELtEXl85KCnJ2stYrE9HPZNdybkQJV+DUbWiSa0jHV0I8o7JIPyn
         8Xm5PdbRqJDstfBrt/ALyVXcLOTHI6oRuURRyTv4lvKY/b+tC2uKInmsjrmHao2/grNy
         HNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064675; x=1764669475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=;
        b=b3AldFiVQi2nQlegQsjN70qydLZauH/vq271ho6fBM+70Y+AGdWyMaerzSjUsOw8qd
         imjwEr/365JXRyYaB6cRHIHSwHdJbexneaWotnklyjutKiVajvJLT4k4sMx5qzzc/hSW
         +NqKqvo8kTtGHQMJbN4Y7Af8dPRs4wT1x6khsQkJVtYz+C0lfyjzV+XRMcvFtCB2UsHr
         arWv1ahzgQ6iwVBCqYCnIzYpEln0Oj4uMM7cIzjftUJJEt6VfsG+AcIyBn/lhSPFVg1+
         qvxbVPVSre3AP32XZyob1FS3eZLcNMG0cVZ35OVQy0bN0DrkBwlq/NGNnlD4yVdoUKL1
         UYew==
X-Forwarded-Encrypted: i=1; AJvYcCUavdacQ/NiLizURNs/aHPPwPgOEBQiqXnG2tIQ8jp9+o/iMJtiM6o9Dk6QrRhPG6J8v+jZ63c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzWZcpUTFkD96Xzaqg4+przjl44vcFlqvtBmlO5QMuDn41gz8t
	KEHEVDQiZxRXGF1lmrNCAq40KZmiSL3j3I7QDn7QhHiHmlxvWZBNQnCq
X-Gm-Gg: ASbGncsAVuL2lkx/8zt6F69N8/R83UIpaVA29fcZyUXfxCz7wyUg0gQwhX8rdg+2JRk
	9PhuJuot++iTJ/A2Q5HOmOecDiXFg8d4Y6ew3moJ0MWg89SpFmAqY2pmeG5fG8NOX+dp9qtBPX4
	UtIatsQjBbE9vbkXbWdhLDxCU7mdAmKHI0wOWY5EnDjhLBAlsYeo/YS+Y1m+N8BuoLT/jeHBIUx
	C2p5Ik60rPGzva9w3StIyYAZHWRtXeqexzmRfl6yyBQ76fO2s9k0UF7W2uuU+oEW0HR0YfGYegJ
	1wEvqv4I+qOoVakfhRm4mGbTwk9ome6RCEmvPnAzY3Xitd4FzCLCuBOAb4a4R5r2kTlMM6UxsCY
	hrmT+zrA2anzM8SV6a5ZqW61M88Fr5GxgzDmU1fTB22cG6/Khl77Gphc/pIrRWHCxKJbAqfJWrr
	7k2RUG+8KZfZHz0bZPFrgiQ4JxdPcLOG3gaJZt/OHpveJZpiC3+2F/PXJVErzyoGAq8HSBWZntH
	wW3oZvP3Ryg7w==
X-Google-Smtp-Source: AGHT+IHLisWyuG15RnJSodDThe/ELizaIWdtNrkb9dhnJFuydOtd23t6sLVr0LkGdKB4Y4UIprMu/A==
X-Received: by 2002:a17:906:c156:b0:b73:7652:ef9e with SMTP id a640c23a62f3a-b7671a28d01mr1625571366b.55.1764064674836;
        Tue, 25 Nov 2025 01:57:54 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ff3bbesm1539477966b.51.2025.11.25.01.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:57:54 -0800 (PST)
Date: Tue, 25 Nov 2025 10:57:53 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
 <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
 <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
 <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_015757_449181_BF3118F8 
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

On Tue, Nov 18, 2025 at 12:23:20PM +0530, Manivannan Sadhasivam wrote:
> 
> ath12k doesn't seem to require a calibration variant. But even if the user
> replaces ath11k chipset with ath10k one, the calibration variant should be the
> same as it is platform specific except for WSI.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 

Hi all,

Jumping in on this thread to ask about how we should handle variants.

We are using the WCN7850 device with the ath12k driver and received three
board files for this from Silex, signed by Qualcomm. All three support the
same board (SX-PCEBE), where one is the board file to be used for the
US/EU/JP and the other two are one for higher emissions in the UK/CA and
one for lower emissions in the UK/CA.

Since these are needed for regulatory differences but support the same
board, we were wondering about your views on how to handle that in
mainline. I see that there is no support for the board file selection in
the device tree for ath12k, and that there is some discussion on how to
handle variants in general. We are using a device tree-based setup and no
ACPI.

Thanks!

Kind regards,
Ernest

