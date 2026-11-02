Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39683606A32F
	for <ath10k@archiver.kernel.org>; Mon,  2 Nov 2026 22:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=np/o3P4u;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=C3KbmfIQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yGaVQZD0KZYDPqiDkr26iRqLwAumk7gYrARBO9XOcpA=; b=np/o3P4uAzDn62VojsVv/knIce
	ABPjPFh0qpJIIQKtuAOBUPjkRVKTfvbZj6pxn6/xpBI+WY047e/ODrxpnvrEL3VzQ1IzOIWQqdxkO
	0ppIvPAY+Ui+TlCoM8t+5sBFK27EZXPcdhWgwqVmjj2seXXa+HJVc6AZBiI1SLqW8xCbHI3zi5YKs
	UwO+/RrsgKpV2EUHNWMG9Z6Swy8oD6dGb3Gsg/dxNZxFHLrFnjkOmsUvBA8b8umxRjpAd00plKtZY
	r4OgXqMj9prUEdOsTI6nYcluAlS6fi/EZ7uvLMuHwBPQS/q3JZYCKjUPgIB2TwPwvhhxJxStTyPR9
	5bRwUnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0t6-00000000aVz-3G8Q;
	Mon, 02 Nov 2026 22:52:24 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0t3-00000000aTk-1NqN
	for ath10k@lists.infradead.org;
	Mon, 02 Nov 2026 22:52:23 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c450ab1483cso593841366b.3
        for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 14:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793659938; cv=none;
        d=google.com; s=arc-20260327;
        b=OYis3eWVYllrel8qHKmoSNKjAt31PHpQC8K9jsp/G0XvkS7eABbm2j5hlKiU7Sc26t
         x4f6K6gzXDQd35EeupUEFMGifmPfRHdaefO2RmXzQnzkRTszDt4gobqYy1JjeMW2op9W
         6ZaCub7Ty1V5qw+2qpJn6lABSI3fH13ERN1ruD3LkgDaaOBtXsfbzbpXe7S0K+Gwu9uN
         T2AQP/rHBVSzvcV0O0/opYd99sGE7AU519ut0qGXxSXiZ86eUeR/KPGyMYtazwRt1IkY
         TAl2eNnqjM4aIBv9cMJuUVzMyPOI5d7FH4zm3CaZNQYGm23BaltU8N/Pu1uUIohnYv41
         RVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yGaVQZD0KZYDPqiDkr26iRqLwAumk7gYrARBO9XOcpA=;
        fh=qkcifq6DG/N2dNF/9IXtXjYtCGMIkCtHjDpHwNRpB2Y=;
        b=AzW4mNcs34Y2DgSG80nejtrAkEjWWra1cMR92NqiL4XQLrRcR1M+l1Vukti8leBz4j
         EgZHBwm6GsjCsf0r9/eS45O4OIYAghysktbElgSMFjMCRdIGUvF7dLrVRkbZbo6YybOk
         UpxnsHeac9jjX1k0UVu9x4xZQ0Ug8Z5yP1IJlduLoWV0zhAhPLMKlz6PxwM02CZK5k5U
         bf6bfZ20IFfJxhGURksxNQD1z/rBOXPn+2UQo+6JpwgXZDYgLefO8lQaA/ksNg5zTPR1
         vahiDqrG6HNGJ5WLKtHOVruyo0Ug6tTR0tpyLT75s5cyztOEaDTG5drlo+uk1dQubtVz
         4M9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1793659938; x=1794264738; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGaVQZD0KZYDPqiDkr26iRqLwAumk7gYrARBO9XOcpA=;
        b=C3KbmfIQPLTeW5GGzfW8wMa+lPbhi/YDeqrMVM4AeOBijLjTtRKIOsAH01iDUSBAEO
         9jjz+TAi6FFYXnje53chMzZ0NaOg/UFEww0++Po4nFLQ1DApj5yx56LLlxDu8PBljDK1
         jPAGO+FuojTdF6ggpDELObMA/xLm1FkB7sYRyy0CGl4vxjR2u+XsApVns+JhqfI5f+1c
         WkbAyrhjty86apyM1myimtMJyktb6rVSkSQAR4A/T/xVjuaXs0wgvOS0FBaXoDdLndTw
         SrE3OLbVNQfdc5rMeC856xq8K0QFa9upYkwPRhEM41hIlKai6fHYePUgRqEHDgZ4NwCQ
         hChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659938; x=1794264738;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yGaVQZD0KZYDPqiDkr26iRqLwAumk7gYrARBO9XOcpA=;
        b=0AD8Nhvz4Qu7L4DzVDxKtjF3G2FmcsniPAfESSQaQrHiTxp6mHuyxyhjXuvv+m2T/R
         +fBdvrDcrBSdU/f1hOBeArGKWFLpaAsF9CAaM2Nk1SbFoDVz5kAc8duurgoZFyf7vHvm
         lpa3TXjRfCTXqTMASqZNa3TfBHjBm6+baV6/RMr9NhpFsHdrS2Ny4Ja66TT3yMkxU4RO
         9n7R7GV+UHJitefzmnpm3zsycYrYyJkezBGBpFCVTMRXE1Y6q7jOStQ7AK3aDZiSPmSr
         GLidSF8RN/CE9KMtPsqGHNM+g1DSkGIuuptF5AlX/DQHyEezVljD2KR/U3763gCSYGRz
         sfAA==
X-Forwarded-Encrypted: i=1; AKwUvBz3ecHKggtNyd+3T5o6tH59xSiMHRkEjQFQ3jvnDkfM9yOogRPe8I3hhVRcjd7QeByOZTe2JnU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+QjskcscN7KP2qsqAwXLcBufANiHd9W6HjZisYt88ZYd3wmaG7
	gH/r0/VoJNPmzQUSy/YHczKUg0m45yOF8B4vcDeRBCzDDPXD3TFyRvUiW0m+soYksHxpt04t87k
	3kjota+dBitI/4/MnwUUJBpAxH69Z4bCnmshChNzYkPuU3CmMl9vAZf0C
X-Gm-Gg: AYBFou0F08djUXc43YjAUv79w6Gde4igGcyi5lxUjeADqT2YI6tBgz7LjP4xd0TCr35
	6fejWSkewqEK3ncchz+lxbz1q6++I+UYhPzCUEwLei2e08JXzrj146Ud5Cee7dI/PupGpUlvJ1l
	0gOk34zDkmk/+4j/Vh6NlQO9XNKzSoP+ebq8HIywMPIaO6V8YzFAlJYzniU6FhvCzrcTqEd2NUK
	/5/m9/UpZS0DiUqpfK3cx7VSgsVlyEuGGD+Hc1ivA/p6RRmgU6tWs1FOXCCgniRrnkgpMQvEaxR
	3bLuBjCfvm9ShICtGbVK5pbJicBn+wOGdSkLmERqAn8Ch+WCYqxPKCAlIt5dtbeppn3wQvEkgJG
	EFkAh+T2MV4L4oMkuT3hhrvP2U7lZormoTrxnUuHKgbQRNGn1te5M/EGxCqxTvY0VsPf4upyI/W
	SdB/9d/YITcP1zEj50KglSqReWKv6yu0l3duj52U5tXuHzhg1yw9oxYw==
X-Received: by 2002:a17:907:960e:b0:c31:9a1c:de76 with SMTP id
 a640c23a62f3a-c4ca7a4d998mr941316566b.14.1793659938062; Mon, 02 Nov 2026
 14:52:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma> <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
In-Reply-To: <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Tue, 3 Nov 2026 07:51:51 +0900
X-Gm-Features: AclHuK-sLaEQW8IrNvFSowd7lBj_NX50xJF9W8-RPIjopaVz_mLHu4yEVmc3eEg
Message-ID: <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Heidelberg <david@ixit.cz>, Fabricio Akio <fabricioakio@gmail.com>, 
	Aleksei Kharlamov <aleksei.kharlamov@gmx.de>, "Conn O'Griofa" <connogriofa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_145221_406342_9D44808C 
X-CRM114-Status: GOOD (  17.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Loic,

On Mon, Nov 2, 2026 at 12:56 PM Loic Poulain wrote:
> So why not updating firmware-5.bin file instead?
>
> There is a tool available here:
> https://github.com/qca/qca-swiss-army-knife.git

Thank you for the suggestion and for the pointer to ath10k-fwencoder.

I had tried that first. On my comma four, a local firmware-5.bin with
the mfp-support bit set gave the same result as this patch: the
protected Deauth carried a live PN, and the next association was not
rejected. It is also the file I used for the overnight PMF runs in the
notes of patch 3.

I went for a driver change instead for two reasons:

 - I was not sure whether it was fine to change a firmware file that
   Qualcomm provides.
 - Other devices seemed to have the same problem. No WCN3990
   firmware-5.bin in linux-firmware sets the bit, including the newest
   one (shikra), and Aleksei (WCN3988) and Conn (QCA9377) reported the
   same issue in this thread.

So I'll drop this patch and send a firmware-5.bin update to
linux-firmware instead. Patches 2 and 3 do not depend on this one.
Should the update change the shared WCN3990/hw1.0/firmware-5.bin, or
add a file for one board?

Aleksei, Conn: a firmware file update only helps devices that load that
file. If you have time, could you make the same change to the
firmware-N.bin your device loads, test it, and send it to
linux-firmware?

I worked through this with Claude (AI). English is hard for me, so AI
helped write the English. I ran all the device tests myself on my comma
four.

Thanks,
Shunsuke Nagashima <shunsuke@nagashi.ma>

