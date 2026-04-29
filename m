Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78185FF8875
	for <ath10k@archiver.kernel.org>; Wed, 29 Apr 2026 10:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqPXfsDldmKDtaexeIATflIY3d4tt42HuNRlmb0wOcg=; b=O/8WrjNgKFzCpFiAvBU4glEtrz
	OSgFFwsxsQ6Xug31DC6xYUh5XyQ31Be7RuAmrhLkR4qrtNRspSW36WNrRVH7BT5WKDBWB624ue/BL
	g1VFNdF4W1z/J9eypXAeDekhrgL2X9PHXRN6/p2tRXEDhIisEPUsdDx1jVqeifPETd67fsrT0++RI
	qoPmCwPBiUXmumQnVi008JUyz/h3B1vWmF3B6DzCXClK2sGl2BX6rrFNq+j/i2IhB8hLKtmdynfqx
	hWVU7CUKGegAnqBWAlUDYn6Y+llUjZb72iOYCNyR1rffJoErOYarLyzXOcznMwivjWSh8YJlp2VpN
	n2i2pFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI22f-00000003Ri5-13qh;
	Wed, 29 Apr 2026 10:21:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI22c-00000003RhV-0VjZ
	for ath10k@lists.infradead.org;
	Wed, 29 Apr 2026 10:21:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pqa31641527
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 10:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqPXfsDldmKDtaexeIATflIY3d4tt42HuNRlmb0wOcg=; b=doydujjdk7ha7tAY
	TSfnhBDrmSGLrwfjnnmlyv/Wfjz4b5RiY6Y30BPBE311KdAreOIxVHXcDFjoz1W5
	25Lyc0lNvy91rdsaPOCcjsbeRkgsNWRi4+0I6rtEFl1ofMM882OBz2COQCCHvLjr
	SSvmxxYR7Cbpr01/sf0Pu/Ne8Hw26ou76GmH0mz7y4QRN8i6Hw/rsDhJe0xMTYdH
	viuP7GE1taUW5PtZFpHs5nVMQQKAgF0r7Gd/onRR4lVBpj5DKFpzXHKXZ77ib2EU
	hTUgNUeyKlTjR7kb7H88v09Qa6aK6a//m87Q7ZwwDRRiTNgoFSeSFNh96/nVBa8P
	heAFaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81209-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 10:21:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb9f8bbbb3so225249385a.0
        for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 03:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777458072; cv=none;
        d=google.com; s=arc-20240605;
        b=c4shVgZOHtITzWfEkDQZoR58kbuMJLMOuz9nflB8AsgNKDMhlK5HscpMgBp4nrGwR8
         lHbPoLZPh0oT4VJN6yEsHaUfvohf8x2sKRAw7IxOhyMo2KXm5v7qa++aDiCKXlshMxZg
         exCeyCwkJpd6hurhR1I/nRAIyBY2eTNGOlOb4cjlTkgvPmTkWe4XgFrYvZncq84TamZ9
         iMdJixOZEaryOZZM3N8UHiFGcN2xcRRav+XCIgkI7T01b71i0/Rm9cAWIKL2rtYvNMab
         GLw6RTp1bvEm1JDXJ6h5/5yJ9xmPXXqz4AZTICZR4zjrAo5AfC1MQt9o2gKI831jJezL
         WuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EqPXfsDldmKDtaexeIATflIY3d4tt42HuNRlmb0wOcg=;
        fh=iIPPjmMtqZcns7ly/NHcTTS8PuVbPriNiM/lv4dMuhk=;
        b=aksOklgtQ4c5523mf2f/OlSSFFZ7+cNZHbddukuLIdrMraAOkGKJ/KNvyYRc59B8SH
         N75oEo8+TTMCZATX+Y8gM7HzECYwNRnKtTnBIF/QIxFandMgoSxMRNvhGq4bpV7zZwHM
         eAwW0Zp5MFw3BBk1ln8V3LrmUqMj9uth8OP9Z9+JGIYhRk7AkV5fUlZ/KdAQuhpoM3C4
         8OOrTyVFYF+tx7u53RDXXpk1QNr4+iTbMS5ZvSxFFzBZBO5I2mYigAkel0YCsKvDpY19
         NULA4n2pKHJhPBLHFAls/vnsUdTiS0sXuKH1tK/TDORiSh52XSJazKkAag9xSwUoLpbM
         orhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777458072; x=1778062872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqPXfsDldmKDtaexeIATflIY3d4tt42HuNRlmb0wOcg=;
        b=TVKZjrnqG7BiumUuz9X2CQGrMXS20Vm7Qcx7hRSPJUDkqrbFfQenIUX3oaxh5hDXQA
         ROlzpR/DI5aFwPm1Gp+3Ryl7PDrZZ1SQIN+cS0fCaQsY7c8jIwXY9QvdfTUwxn2nTTLi
         2U3I3RKmxOgDnu5g6Zi6Ndu5pvcfhiVbFmdUkhYBW4DhpoIRyv8rX9aCaMPTdYvrxqbj
         /PrJ4ztlTs1aRws61ZF2tWBfE6hMBuvXRJqiAB2T9pjRKlspfzua2eOuJhDVkGbFj+wt
         H+8dwhYkt8L22CQHYqHF267eyR7hMzI3qJ/k+t7VrRVxEOl/hV3/LlRBa7uml7/QMA0Z
         N04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458072; x=1778062872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EqPXfsDldmKDtaexeIATflIY3d4tt42HuNRlmb0wOcg=;
        b=sN1EmfAuRq/VX1MB/+wCr6Qkqt/qzH9Rnfu7N0bHwt92GxlpXLJBYcatb35GOdL2/k
         ylXCUFdYMN+Fgq2Ieb8nZ9d42tG1pTQPsyl0MWddaMSF0ZXqbaNxK6NLc4wlYwv/XWZE
         J4kCm55pmVULZP3cTlm0UN/Meij+MVPcq6LrtgkTtuCWokSPjGoMV2VOLwFTIvm0yMOV
         cHBDvzg4/WY+F2jUfIwgNLss1fIgVX5PU+/1ZFOoWmu+P1cZegLMFCCW4SrYMdvDfZfD
         mByP1lg6Of1Hd35iMoPsb4Z6YwTTFdPMSmVmAHZWiFgI+RxS1lWQSxT/fwVZQsbmb4dB
         kL1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+a9vBbft0cAKJ5RtsAAmgnj0sXQE/VnktC/j+K5Or3+MVGzoop67mfjr32j4dOxDb+wIO33qI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrln2EobYJaNcVHKD2EMxofMAR5jld1cE1c6YQqdVjpipnC82P
	R+A9CLrgWkSdx5ui3oNEt7UcNhR0aWqEnySIvSX7WZxi62FPOBbCuRoPQks23YRpXT1uxlYc3pd
	N3dWynWnlXNQBThaHktnEABw3mD8JWIHbCHAZbB0vUkzVSGpA9Yiol9bL9ivjGG0OMAzCXD1AUK
	3UujsGK7YQsnZJWLZh95G9pGpPf7PsEsbO7agTsHA=
X-Gm-Gg: AeBDiet8qt4WkGPMatsty6bkz7ie6Ro7BDNydlD/s2n3DpT5SUoRuYBjptNC4O/gqHg
	1+Yn2yvqU5kOG8sfMvsice7ul/1UHbUsq7pDL1oltHyy1DrdLFOlThKpC/c2zcUGOt2xN9tb3UN
	ZS7qoiLIeaXNHgEvTGhtnXFWcoDuaViS9bQjwtB8PBASMytCUFMJPcM6GCb2TNBtA5XRkl6qgYr
	ieh9Xb9B1LZcmYIRbsZb/YRTiFZ1MNVv5XeMTUL96tKtStcEw==
X-Received: by 2002:ad4:5ece:0:b0:8ac:a266:ce34 with SMTP id 6a1803df08f44-8b3ee94eb56mr37704966d6.3.1777458072277;
        Wed, 29 Apr 2026 03:21:12 -0700 (PDT)
X-Received: by 2002:ad4:5ece:0:b0:8ac:a266:ce34 with SMTP id
 6a1803df08f44-8b3ee94eb56mr37704726d6.3.1777458071852; Wed, 29 Apr 2026
 03:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260428162955.614739-1-arnd@kernel.org>
In-Reply-To: <20260428162955.614739-1-arnd@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:21:00 +0200
X-Gm-Features: AVHnY4KAGHRU3K2zVLZUPjwJZ2lqVuCedzWL56hrWlGIvT5eUNqk-96KAVnrdVw
Message-ID: <CAFEp6-3Ubj+MSvF-4G6OnVY9gdvfzq2Cmcr+OjzgSB6omGAWCw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: drop gpio_led reference
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Kang Yang <kang.yang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sumanth Gavini <sumanth.gavini@yahoo.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: aKdF443PeydVFOYrscvhFb7qtswSJkOX
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1db98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=g4MlGQxAURbjKKzBZy8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aKdF443PeydVFOYrscvhFb7qtswSJkOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwNCBTYWx0ZWRfX4tHRRFvCpEpm
 +sQqocMLqtDjAonWyT27x7azIer0798Co/cs+/890PfuAQgbikRWwilOEVkY24MyLDAXHtYL7GD
 CQgQ6eVmnvDT1Czegw6UycLFqTMAg+cQ+rCCvhumpKC5QLr6pjMJ51dzWxu665d43i3cjisZcIA
 pRO32ICiosCEgEFCYvT4gZi1NUtVntr0yPFCT7Us5LizvHI42naFtZifA1cOapfkakIL/GKa1TF
 eOn6WY3JhAYC+x5ALj9uNuIlBZ2LAt7+YgTjf3cNyWXyJJEpsYGnx5Sg1te9S7jLaJYcCjNTOpd
 JGO19rpnmvCoOnP/9SjgmWK+uaht7kTbdKNLNrK65n/A9gMM18n6SNEnmdVHVSt3XeoWif2kDNg
 W2A9Ptkr23crWVy3dqPeRbGiX6zRBxOX56stqDkfta3bTHtLXC5E/dlRokFFUYC391rnDWJdT3p
 ANP1CxWstq7kHEqNc9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_032114_296828_F72F055D 
X-CRM114-Status: GOOD (  17.65  )
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

On Tue, Apr 28, 2026 at 6:30=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The driver uses a 'struct gpio_led' internally, but does not actually int=
eract
> with the gpio_led driver, in particular it does not actually use gpiolib =
here.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/core.h | 1 -
>  drivers/net/wireless/ath/ath10k/leds.c | 8 +-------
>  2 files changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index 73a9db302245..dfee432615eb 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -1269,7 +1269,6 @@ struct ath10k {
>         } testmode;
>
>         struct {
> -               struct gpio_led wifi_led;
>                 struct led_classdev cdev;
>                 char label[48];
>                 u32 gpio_state_pin;
> diff --git a/drivers/net/wireless/ath/ath10k/leds.c b/drivers/net/wireles=
s/ath/ath10k/leds.c
> index 3a6c8111e7c6..a3961e7760a5 100644
> --- a/drivers/net/wireless/ath/ath10k/leds.c
> +++ b/drivers/net/wireless/ath/ath10k/leds.c
> @@ -19,15 +19,13 @@ static int ath10k_leds_set_brightness_blocking(struct=
 led_classdev *led_cdev,
>  {
>         struct ath10k *ar =3D container_of(led_cdev, struct ath10k,
>                                          leds.cdev);
> -       struct gpio_led *led =3D &ar->leds.wifi_led;
>
>         mutex_lock(&ar->conf_mutex);
>
>         if (ar->state !=3D ATH10K_STATE_ON)
>                 goto out;
>
> -       ar->leds.gpio_state_pin =3D (brightness !=3D LED_OFF) ^ led->acti=
ve_low;
> -       ath10k_wmi_gpio_output(ar, ar->hw_params.led_pin, ar->leds.gpio_s=
tate_pin);
> +       ath10k_wmi_gpio_output(ar, ar->hw_params.led_pin, brightness =3D=
=3D LED_OFF);
>
>  out:
>         mutex_unlock(&ar->conf_mutex);
> @@ -63,13 +61,9 @@ int ath10k_leds_register(struct ath10k *ar)
>
>         snprintf(ar->leds.label, sizeof(ar->leds.label), "ath10k-%s",
>                  wiphy_name(ar->hw->wiphy));
> -       ar->leds.wifi_led.active_low =3D 1;
> -       ar->leds.wifi_led.name =3D ar->leds.label;
> -       ar->leds.wifi_led.default_state =3D LEDS_GPIO_DEFSTATE_KEEP;
>
>         ar->leds.cdev.name =3D ar->leds.label;
>         ar->leds.cdev.brightness_set_blocking =3D ath10k_leds_set_brightn=
ess_blocking;
> -       ar->leds.cdev.default_trigger =3D ar->leds.wifi_led.default_trigg=
er;
>
>         ret =3D led_classdev_register(wiphy_dev(ar->hw->wiphy), &ar->leds=
.cdev);
>         if (ret)
> --
> 2.39.5
>

