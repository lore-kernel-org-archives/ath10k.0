Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F233C43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 10:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/6nkzPv+WrZ0PcEEcEQEu660EWyt8TZ3LWKgMKw0Bc=; b=bT8N99buzFikVbsqNDNaZJ1ZZf
	AR07WA5z8yDR7f/yGb64FoHu3F/kyfAaDUjsM/kqhSMv5RXYdNMxXYV7zV/GaSDwTRFevl+5K6Gyt
	M+4V5njevBKLUi9i4nN37ZLckbnmDohGvLE+dWxJIXc5kQrLmzOWTQ5hiMauR1ghQsxLgjX39Ga7Y
	egUUSpOM0J7JM3U2ocJmk3fDeaLbi29vr/PH0++nkfUpW+8xUGc8oDIsKTiFXgzr2CdnnB1JGO7B0
	t8NtDfW7alUk5Rp/NfeuMk9HEWUqRBKaJso4op1PuTZVTewQbHoYO7CKFYgsSxDBjasndnv1/B5VU
	LINtP9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesNA-00000001Kp5-0lBA;
	Wed, 01 Jul 2026 10:40:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesN7-00000001KoM-2J1f
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 10:40:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8nPv683610
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 10:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/6nkzPv+WrZ0PcEEcEQEu660EWyt8TZ3LWKgMKw0Bc=; b=nsg+7PGSN9LMaaHb
	vP7qwVAt0LvmfNhpwCNGGrHCO3fVvstLF7mT3Di+sWTZork4SslT9bHt26h9Mi92
	IaYhXfMfqJWclBMkqxErZVX/sXvQ1vvohbsCRngPa0TuPp5VB+JOzvndmxfZnSkJ
	ieUI1piKVL7WKls80+Aju0hIxcycUnroOorlyO/9M8hEMVrMg9Pyrww7Lxd0qWPN
	ZqzULmqFpA7/z9kemgHxgGkpVUbrJUSJzUqeFMWkqUtdHdrWDrwwRvgol4kD4Mps
	FMcvtl/2AdFVVCEzWSJDZwHSG2iEjIVD+UGCQ4/eUewg5ouFQT6h713Po8G7SAkB
	+O7xfA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqksjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 10:40:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c267931ebso1500311cf.2
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902448; x=1783507248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/6nkzPv+WrZ0PcEEcEQEu660EWyt8TZ3LWKgMKw0Bc=;
        b=N6p3l9gXX4uBliFUKG1fEHcEbU+MsxK+uNoJyvbGkGTedZ/zm4ZdRRiAnWfmhFCIGB
         G2F8lIF/BjRRYjMLtmJf0POsBIBn/TI2H75Y5NcWPtB5hXjG6SlpAAfbW064DQcvbQu9
         XvaMv0H++SeYg71BU7ky0cH5m3DNoTxTnWz6nYwc12b9xrf7oeBaRE9lo+5LxKpYTOqk
         cxlr+kkY4/PmtrYC3S2b2tKsgkz1UBpStLbb6DEgxc4jrqqNQiTgLBZQduyga6E1ULOv
         FuexusGOJOrLJHiRhHpUI+p2aGy1RswP2OrzKR28ynEBssiPT4fQQcoLl3hJBURs3gcA
         WTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902448; x=1783507248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/6nkzPv+WrZ0PcEEcEQEu660EWyt8TZ3LWKgMKw0Bc=;
        b=tAxDkFJYDCxky4JUOaE5Hg2AHa62rJmnj+SV+BCvEIq4jtfihAGIvxyICC4rdwU8PL
         XBI4pdwhz16aYugGcn0njZBySOx/l0ry8yFCgnpnnbz4ScIvzL9To8n1IhkSBHrRn7Ep
         JBD+pEt6UIbZ8Uuj3DbGr8zTiqN9DAEAhOYxQp5J5HPvN+F8Od9gSs/TpRuNuh4rzGDj
         HlTQ4x0KUrPM4tayRng4Fa5DA6/IHmeZrKc6lBiO1im9mBrEtG5Tif1AdF5kNXoTxhY8
         VVfy5/WNVt5KHuwHtHvKEgHuwsTkL5amfYkZbJHLvgJuaBpzYu5QcieXJ+SRG9gwQ+9Y
         aLcg==
X-Forwarded-Encrypted: i=1; AFNElJ/mBXFm53pLTsNnKYRsF7zW4Qbg2E09bV+qrW/JYCpXa946XXrMVxZRgvGKBjmRz7ejmYxOXas=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAXMq5AipBN/OsoloTXYh9E5rX0PYWg0i7wn3FFZ5sBEEdzxE9
	mrHAuSFQFUFyBdoNWezzfdIGsxjvFooEJ4pJCaR3lMqxqgCuCvM4AuQ/+F3XAxt0CRFXPrlqb8Z
	rUDnrPfMm3oxqh3e1Fvq+66NKuPT3q+8733YzlX9Q+A6w8iehI2Blm/53nSbZxx6H
X-Gm-Gg: AfdE7cmz1WnIj11q4fOY8CVJ/EQXp05uCvPykluAuR/vi9SlJl9D//nzwC8fiMdepwR
	lkzx8pThthvQ7qtD2xF5/qs5gIxwuqMQ2BuA2XAeCvCGIAyoJExaEbJcVZ7mhPkwTeNP3jrieta
	OMeNl0mI7B5eoKLw2SJj09BJvDcQZZ8DwS3DTiz5NuFwuz2mpXtWcfdw5ewRbxzcVhEAhWuN734
	J0g0t2+pnQp3jNqCSRJw+IYrStOT6OY/y3xqgzZCi+F5+cRYDEkAr/t09Pjcrt+T1x0WupSYSb2
	WSUyKfhQfmOKsyI9f4ZwTrVB44a4EYl1/L6KX6e6bQm7rkNtZMFitOSPCQpOJd0Gc7viqxf7Nhp
	loxD94IpCBHZPb0UCmT9gf2H/VCYsC7ddfpY=
X-Received: by 2002:ac8:590d:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c26b25d63mr7031651cf.9.1782902447986;
        Wed, 01 Jul 2026 03:40:47 -0700 (PDT)
X-Received: by 2002:ac8:590d:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c26b25d63mr7031251cf.9.1782902447419;
        Wed, 01 Jul 2026 03:40:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1296b1f9cesm165809466b.16.2026.07.01.03.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:40:45 -0700 (PDT)
Message-ID: <175f7835-df18-4bc6-8267-ceef35696af8@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 12:40:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
To: george.moussalem@outlook.com, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Saravana Kannan
 <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-3-02770f03b6bb@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-ipq5018-bluetooth-v2-3-02770f03b6bb@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z_fRZG77WxLELcoptd8Cvp1LG73ypNIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX6fEOKrCSCt74
 1KwStppBo3V9XfBs/wN2zx6pJAYY2lyJpDJxxTnnKBzDfgkxvhIwM6wQcTae/8PookRrkhOnLHa
 qVS68VXmDkbsU99mQYoudvlHpgljHyO7LPW5JIhER8TnCfuMC9gOavJB22XG06ZCugmhi22j55A
 nMhPguKijCxTTOuwXZbleXjN9IXDfTR231mwrdpgVik4aSZEr8cLHP0vFXAouSm+g9vaE0QEMfX
 Fe3m7g5ZJolzqpYeqtbM9D4V8BEi77ZRJrjhYiE8ByuboTQtQtHZ56hn8W+ScC2AMfMt2q6U48l
 Iw+f4E/CD6A/7ei9KXvr5mR/njHSB1aprwWUhDYMxOiGpLhgw9IDhurk0lfmALwZ5jmbe4z/RwO
 bhEAKPIZ73KKgn0j5O8tuEyzGWpkwhT6DNVG9ji6O1sEgZGXFXGmALXGcukT+P3zEOp96twetwW
 MgO+UyZlUerVpi39ECA==
X-Proofpoint-GUID: z_fRZG77WxLELcoptd8Cvp1LG73ypNIF
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44eeb1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=506_Lbxh6H-Y4vAdgPkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX7Msbbfq6wZRM
 NEmPOwiP5Du2ar/oSjzOdPh8TpnB9ew+NZbauaym8sboWtZ09jiw1KgBeP1PFap5tLp11OXmgSP
 9De5cxg0n7z6rMaglQnMdVQ2oCntofc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_034049_597527_E112EAF6 
X-CRM114-Status: GOOD (  15.98  )
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

On 6/29/26 3:01 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
> modes which are required to be configured through a Secure Channel
> Manager (SCM) call to TrustZone. However, not all Trusted Execution
> Environment (QSEE) images support this call, so first check if the call
> is available.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

I'm amazed changing this setting is a secure operation

[...]

> +/**
> + * qcom_scm_pas_set_bluetooth_power_mode() - Configure power optimization mode
> + *					     for the Bluetooth subsystem (BTSS)
> + * @pas_id:	peripheral authentication service id
> + * @val:	0x0 for normal operation, 0x4 for ECO mode

If there's just two values, maybe we should make this take a `bool eco_mode`?

> + *
> + * Return: 0 on success, negative errno on failure.
> + * Returns -EOPNOTSUPP if the firmware configuration call is unavailable.
> + */
> +int qcom_scm_pas_set_bluetooth_power_mode(u32 pas_id, u32 val)
> +{
> +	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					  QCOM_SCM_PIL_PAS_BT_PWR_MODE))
> +		return -EOPNOTSUPP;
> +
> +	return __qcom_scm_pas_set_bluetooth_power_mode(pas_id, val);

Let's just inline the whole definition here - it's single-use anyway

Konrad

