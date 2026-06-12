Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FF5CD4F2C
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWlVxwNP0J33Tyh80UZciLIdM0pPmHRLu6KbBtI6/ys=; b=ELcWgi0AhOmq3hSnZxI4mwvjR8
	33/xqcnNGvq3pZAW9Ia17zbw/W5pD50DG6gq8V+NNV5hkGQAWwXhOeJ8V0GhBrkrGG6KlDaOG84U3
	4fYcElxcbU79A6RyQbESbwB2MnJR/35+siM3zjZjn2S0vhDJ6anl+yw2C3nMQfRH98rs/z8rTi2V3
	pMMocXHkgBKRvSS1BKbgI8GqNwl2xWAgoxIy6L9eN/yi9TFyUh3vc9wdVrwR7YdkOcnzyIX3bvNoC
	7QG/LrxJCxRTYNkvWeqMsapZhENQTj2Ya9jLzFgE91U5KWTC9O4fLhq3m3aHf54qzXEjA2F7U1CU+
	B1lywrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxvQ-0000000Adsc-2Oa9;
	Fri, 12 Jun 2026 09:11:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxvO-0000000Adrs-0Cxz
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 09:11:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3CNIt2403086
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 09:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MWlVxwNP0J33Tyh80UZciLId
	M0pPmHRLu6KbBtI6/ys=; b=aVuTXDZ/skZo9mrZ8H+DnfiSbPM3ru7HoXwGU7V2
	VzsH4v1NdM8uz2jofMhDBBSpV/dVsA+FHFT0XcAn0Rnc9jW3X/f46s0JtVrOK7dx
	IhHaqUk4N0oIWgVSGDtip7qjoKGlwfImWHQlV/Gpq4TqIYlKI/pr0kOhzdCPU60I
	+UwtIs1r7wSjgjYoAYfLpZxuhEGfCiQXZaoL09qwrDApCKR/4omYM/FdwiGOAJBK
	kigAO1j5mBber8zp30yI+XcnRqojTwNqgrZa5FIDVjo8UL3hkHgZCiMUja2ng8Qt
	LSdiyHjuYU4T+2qxZ+wGNVm61P7Bei8Ky2LgN6r3JlGolg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30gaa9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 09:11:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517c65c019bso19817121cf.0
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781255496; x=1781860296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MWlVxwNP0J33Tyh80UZciLIdM0pPmHRLu6KbBtI6/ys=;
        b=T1qVs5c9LvlsW2kc9L3EJOi5x8suFhNH5kMJF/fdpHHNayPyyEYe3G/w+QLMVpk7KS
         WC56gLcD1hhgzCM6ACvJgFwmGM/mu1cNWyKnlesPiQnaHT3S0KZ3gnYc8lywFXwmJsr8
         zAXXhPCbfzXsMrt4SkYF33gXuoSlDPT/rqtR7D2aj1PcS8sspVVVJN93rd0ZrbAwvMDf
         wccoYDSDdo7y2XD7RmXC0Q8wAMPbHIASAytkt+4piClq4sMg2CsmVQaI/+ry56eQKV5x
         LfiA4Fqti9UK8X8ci2l9daGbxKtcCtS6D1H1oaybW40rst6o1STnU68KQv7rgN+OxBuN
         GUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255496; x=1781860296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWlVxwNP0J33Tyh80UZciLIdM0pPmHRLu6KbBtI6/ys=;
        b=IJto3Van5X3o1/58gzrrizxe1/rvc8cpZfCpuIH0DROCVnNRJ/eHh2ALcjrGKfcQGt
         dR/zKURQ7bhUjglH4Xlf8jLYltvQYSL2mtI0X3np93QqFGlA3Xzz7/R7DU/zMbrDH8OP
         HAmJ9o9YklvKEXoUwmi/ZaK9YlWIZSxM1+kkg+6K2csVgTffnqqGGYjSXVxPqaw8clVJ
         foBYhThdKjIxfP0RsOYYh6I/EKFYxdhFSSNU31K5ryln73UYBII4mHqec7p+9Yj7m2pN
         cqzcg8Tlbhsa1F/nKB4ObssW3DjGGy5KlJ9QT3OM+TWHmOnhUuEiINiJ1P6Oc2a48jAU
         5HTA==
X-Forwarded-Encrypted: i=1; AFNElJ9wcFxMowlJNmpir/v1A2CNX1pgTcZSeNSjPMY72a6N3xclSCRbMjmlLVRIVIQYl3kxSE4w7QM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZgexWwb0Yq+hVopP8jyxUMdZPim5I/2AiQU/JERBGPrw5n65G
	Dmf+aG/PKwPwJzstIQjtWDSAgZYhKBumb+i8Z+aUXWCGr5vR0pdO43uDWfAFV5SDdtGkcWAZ5UN
	RKv88zIYXAOCiASoc2KBpwrwG3MaAJqZdyY31QLGwRsLAMW2+GVOGMDrcmvJGgV1+
X-Gm-Gg: Acq92OF/3Tuzqs85RY6Pit570UB9zNB1DvYLT2GRSPfQ1zkOHT1wv/vfgZt19z25pqR
	fip6J/LafAd+xL+kOxBcLhhkqpH8lZU1AFwbwP4rjTC38TdqqX5sB8thStdoQs/r64Sflzf75qq
	fUzKLFuFAs3whEZmdTwA3wKh1yXTs4zKTluC8JHQIPg5X4eIkJzpD+MaHkRLZAvE6HILAiYP4K6
	xmpEl3gYoT/t3+nc+RzkUT9rPKDwJ0l7MEHIHO7XMEahPUelLxACIgzpW3YY7mhzQpO0FxNjE0Z
	b1RQabSuLf8dqHfuftG6Vm+wLfcevLeHJRrzrm9ul3IiPKm7iUAXxGFJU7zrxb6yI6d7db0B2il
	ubQs8BQsMyxScpCXP7ibkdc99c+wllai4FCHOeR+ZtS9UlSxQL8bdqHxp4QhtpLHAnIEDpwn5z+
	a3iKsNR5KLB5d/PRvFIX8n/tiaSfxG/uDCVF8=
X-Received: by 2002:ac8:5a41:0:b0:516:e10f:7140 with SMTP id d75a77b69052e-517fe229bc2mr24342641cf.35.1781255496182;
        Fri, 12 Jun 2026 02:11:36 -0700 (PDT)
X-Received: by 2002:ac8:5a41:0:b0:516:e10f:7140 with SMTP id d75a77b69052e-517fe229bc2mr24342101cf.35.1781255495685;
        Fri, 12 Jun 2026 02:11:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e170386sm379979e87.30.2026.06.12.02.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:11:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 12:11:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/8] Bluetooth: hci_sync: Add NVMEM-backed BD address
 retrieval
Message-ID: <sy2ofvdbcxspxtmfdavjvdz7oes5ieuep4znf4ayknmuwhrlgk@7lp3bkegaeif>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-6-45712e6b22c6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-block-as-nvmem-v4-6-45712e6b22c6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4MiBTYWx0ZWRfXyRE4scID1av8
 5uQasuM0qYnhMEA929s8ZgPvyA+8wqlMRcqWIKs75mo5rAMB+wnKaqdDWC35kzbWgzUTGD7AEHV
 BuZk4he7pd5b58pAYTvg6eHiRlUtNig=
X-Proofpoint-GUID: hTFOqyPi1kkEC6v7eaJdoyGwUJZReT50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4MiBTYWx0ZWRfXwwPZ/dbKjKq7
 LKjm3IxwMn6uFB1EmXI6sAE4zC2Iex5CTPF/9jsLgGrmygSW2LF3RkBw4iRoYe+AssVKcRyEKmL
 SPITkZl3Xsaqqs6/IeN2P/3NLLSpqeBnfjtf7VJB1EfTSQaQ3VooTABDv0G4KnNtQ0kY6tDg4i4
 Z5fXH/28PdFgC+uSUdTDGPXDsjqcfgLufzLyma8pGGuSPRuc+l6r7vWAA6GEpOoTaS37n5xmTVh
 lQFb9RwNdLkHWIYaZsnG22DmmyAY6BPChgr68zMqxOJJ5naFvzOAiQeCB0oFXtRHMoZG209abnA
 XpZvjRLO9ol+4GHMfoGto5cKJLfOwhmVYiq0wj0m/kjc70Mr1gyAstZjWCCg01EqRigIXDXxLIj
 b++NFqckFbW7/6mSo3O/odNdMGitgJz2ypRGFTgPWoc/ayvLL9xbHw6HWUbCry2CDkL/g5jT6IF
 RGlISlpVUnHjjH+xJXg==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2bcd48 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=dCyu47M02oNEJ4VrFMgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hTFOqyPi1kkEC6v7eaJdoyGwUJZReT50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_021138_207983_4D97559D 
X-CRM114-Status: GOOD (  26.98  )
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

On Tue, Jun 09, 2026 at 09:52:31AM +0200, Loic Poulain wrote:
> Some devices store the Bluetooth BD address in non-volatile
> memory, which can be accessed through the NVMEM framework.
> Similar to Ethernet or WiFi MAC addresses, add support for
> reading the BD address from a 'local-bd-address' NVMEM cell.
> 
> As with the device-tree provided BD address, add a quirk to
> indicate whether a device or platform should attempt to read
> the address from NVMEM when no valid in-chip address is present.
> Also add a quirk to indicate if the address is stored in
> big-endian byte order.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  include/net/bluetooth/hci.h | 18 ++++++++++++++++++
>  net/bluetooth/hci_sync.c    | 39 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 572b1c620c5d653a1fe10b26c1b0ba33e8f4968f..7686466d1109253b0d75edeb5f6a99fb98ce4cc6 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -164,6 +164,24 @@ enum {
>  	 */
>  	HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
>  
> +	/* When this quirk is set, the public Bluetooth address
> +	 * initially reported by HCI Read BD Address command
> +	 * is considered invalid. The public BD Address can be
> +	 * retrieved via a 'local-bd-address' NVMEM cell.

Why do we need a quirk here? Can't we always assume that if there is an
NVMEM cell, it contains a correct address, even if HCI command returned
a seemingly-sensible one?

> +	 *
> +	 * This quirk can be set before hci_register_dev is called or
> +	 * during the hdev->setup vendor callback.
> +	 */
> +	HCI_QUIRK_USE_BDADDR_NVMEM,
> +
> +	/* When this quirk is set, the Bluetooth Device Address provided by
> +	 * the 'local-bd-address' NVMEM is stored in big-endian order.
> +	 *
> +	 * This quirk can be set before hci_register_dev is called or
> +	 * during the hdev->setup vendor callback.
> +	 */
> +	HCI_QUIRK_BDADDR_NVMEM_BE,

Also, is this necessary? Are the devices which store the address in the
wrong format in the NVMEM?

> +
>  	/* When this quirk is set, the duplicate filtering during
>  	 * scanning is based on Bluetooth devices addresses. To allow
>  	 * RSSI based updates, restart scanning if needed.

-- 
With best wishes
Dmitry

