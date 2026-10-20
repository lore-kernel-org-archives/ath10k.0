Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7845606A319
	for <ath10k@archiver.kernel.org>; Tue, 20 Oct 2026 02:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wQNEzYL8;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=Ed7ZRfoU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=262A8gCU3R+nsMKHC0ROKoLNJtacXiiDwGq2rzQbdsg=; b=wQNEzYL8ZVLYAuOnq7zHP2fG9h
	dPZw4y3XFMs8urcuA1uv6FwkSO+IP0/tlk8R+2Bb+iH8WCO+yK41mrQyxj7Rd+WQ0tssnXkZSeKJF
	ih22lA8CuvOA0QJ0larV3UWKJhkhPX2OsFxmksEvdOJ+uK1ystQu1oLS/f6kPovaUtC6wm/pw4qdw
	4PpVUZVa9cPH9Du/9U1yURY3vEL4X3KNsGkGrEHSA1Tl+Ew1gFm7WUgGoCOXToND6y1h2BWuG2xIj
	YK3KalYuLz9J0OCJIo0DvE2pN8JjHq8wcwTXnZ+rv3Zjg/8ENcKurBNAnGo/lqnC9d7z9Ten+rfBZ
	7VuueNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIztV-00000008iw8-1eyD;
	Tue, 20 Oct 2026 02:48:05 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIztP-00000008iuw-1SDU
	for ath10k@lists.infradead.org;
	Tue, 20 Oct 2026 02:48:04 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c40f29667e6so237442466b.0
        for <ath10k@lists.infradead.org>; Mon, 19 Oct 2026 19:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792464477; cv=none;
        d=google.com; s=arc-20260327;
        b=SJXWdEzsNTtLLH4yzCk6Iaad3HD0kfMX6fntyS77dx9L07xc6EgHCJK/MCJT3UMw9H
         qx/1vzJDA81v0vFrQo8BexgytLcpWpNc8LNP7LcWQIisjZb649kZ0Uo0F6WysNUFTFNi
         LI7VtArkjXtRNVotQduR7IJkccX1Al20m/YX7cWcMH8zKqI5YHT3BZxdnH4xX4dhLaBF
         AIYyCkNS5VTBgSQJtNS+GSvMiwGqpLqFB2bNTQiJmAStPpH8ZRE2STDtQPnAQq8mo1k9
         1HuBPRNI++jhbP82Hj4jX03hBEomCeIv22KKZIYll2xKfAtUaOiTEo2FLAO8qFe2fkN2
         LoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=262A8gCU3R+nsMKHC0ROKoLNJtacXiiDwGq2rzQbdsg=;
        fh=m1ENmUW/Ls4Mans45uWAZ0pmd8HAZaU6A/6L4Fwui8g=;
        b=ft07YIrs70N7WKIW4bln3Frwjluqj/+iDaqGDMvesnrbnUbt8462kX3Dd6Usp2udks
         6At2w8/7m0c9z+u2mPceyXeJq01WH/xwKAaqXxLoPEH6yiLbpssi8Ggdozx/pZvx2Hy5
         NHaRgEkCspy2nF7/9WRV3E+MQsSo0jGqIk0UgPsPECk3HZ1IW+g0+tI6HxRiX4f2HN+C
         4uDHTvmoqZ6tm7qRkR+wUHh1I+/WEH5syvImV8U2xeP5GayHsSYjDvc/YxbrRubUcuMS
         URbfYs6Q/IW3Z4u+VGUDb0CLZrKsJHqbgk5ZdCet/XFH8J6VPJoJYY54mld/D0EQPco2
         KeyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1792464477; x=1793069277; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=262A8gCU3R+nsMKHC0ROKoLNJtacXiiDwGq2rzQbdsg=;
        b=Ed7ZRfoUeDMvBAiqwS+oyz+YaMnmbp7KodeOtX6+vwwBBAZCn334rzs8L4vsOLKNy3
         bd9LFFgoPieMiq7WlX7wRQ0wcEcToFFZbZ6yWy5PNjQvtN3xLlM5tcIvsWvmFtmupOnJ
         AB2HkdL6lt8azPaJyx83JergoUjuueUkpQJHy00MibvhvkdH18ioY4Q6agxp907zikO9
         kGUMX6ir1Es0XVnMIrgCOBsf0Emb3TEIYbt3Il0yV0/XKGHPOiy4Xn/jYjxgMIIGUbxQ
         QaYRnvO9uS9zDoga1bdzD3On+WEnfPoD/l6yjUoJhi4L/LV7egeC6mFDMQqNeKGVaxIj
         7ndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464477; x=1793069277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=262A8gCU3R+nsMKHC0ROKoLNJtacXiiDwGq2rzQbdsg=;
        b=xwF/OOsqE+feZkrD40zSktdN7qY4aXIAoIsahbKGXFaB/QvSqHw1rVpLjUpu/bdVk8
         IfFVVVqhIQrBwSneS0uO51tae6eZFaN6ogYwod0y4XSs3hoD4XGf8FHUxeul91tJ08/z
         k6EcWGEEPxFjM16z8YEJD/ci6YsrpIQ5YDMQxnlOzMolY4K9Cp2NVy/ZOQfgoj1kYu2X
         oBk20/IZjISPEILG09HZnI2cacBBUvtNVrg3MjW/Vyocl/g293ZwLy+G3BIYp5zOBkOb
         Ao/cEZ7lPMdAEbdBQM+JAs6pKsaLcuiJDPF1F6CGDBuPed2NUEWtB+nhWrHmlNiPLuDk
         aX8g==
X-Forwarded-Encrypted: i=1; AKwUvByXtoWVEJi2aIKYuQiZ3WoLzcCKWN3otRmRDnuxORvzDm2SdxnDb+q+yRnNEhoWBcHzf+yTUE8=@lists.infradead.org
X-Gm-Message-State: AFq9FYL9z3aLt7gD1AK2UtxDbbG8gKtacQ4KCZD8SenIlYg1H+VXTzH6
	72BoWWtRPW1whoUpgcNNsutkIbr9kUm1VrTt4D0Sqo64U2FZuaqU+mbDhIum8wkWBYySiVF71GX
	NuX4/AlmPM9kXkgo4EC+A6fS8h1HEIrAtUxs8uW1K
X-Gm-Gg: AYBFou0DLECfs13ssqVWYyMRD0T4B6gcb7BIY54c/yCd4TvtM8egNqfJH1w8G5pPwoO
	69b6wOcQiKwEvngLShSAs5o/DfTFEUqDrn9vRb5p9vpseRBPFew4SyySPKAInhW56j1sRLn2WMh
	5Z9YmR97HVd6c78H4LiianKUwbswq3WnHd8gO3ULXOOySnSs8Tl4Bk7WwxvZj21o+xGe+/wJQa2
	2vJOfDb1uh9w5kTZ3cg74U/6NErdvjdaW86ZkXV26nPa+Wc2Kvs9XbWoAvXY+MFU13CzDor9wku
	9RMmtXAcD3m6vndnFn0tuNyHFnhXsdzApx9jCT6zQlrDcWJo8sMGeTszFpl0uZR9SfkQFv+3K+6
	UPV6Jn7Hv8Si71srmc5bLATdTj40j/29DIFJ436xAkx30B1q0Yx5UzOuWJp8B3GiLaTaIO+2Vxj
	elr59BxxQ=
X-Received: by 2002:a17:907:fd8b:b0:c40:dead:7466 with SMTP id
 a640c23a62f3a-c419e538580mr642966966b.20.1792464477048; Mon, 19 Oct 2026
 19:47:57 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma> <a523eda4-5708-4427-a044-a61c0386e5a9@gmx.de>
In-Reply-To: <a523eda4-5708-4427-a044-a61c0386e5a9@gmx.de>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Tue, 20 Oct 2026 11:47:31 +0900
X-Gm-Features: AclHuK8Iv6DX-6YiVsBJ9gddXv3oItLrT6nCv_vwkm2KhJ4WNt8Fui0S2e66i0g
Message-ID: <CACB3TCJVoFbMEpbtvuO5c-udCoZgDvMBeH0RXUXp90hab3Dh2g@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Heidelberg <david@ixit.cz>, Fabricio Akio <fabricioakio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194759_578663_CBFAF472 
X-CRM114-Status: GOOD (  17.91  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aleksei,

On 10/20/26 1:04 AM, Aleksei Kharlamov wrote:
> I independently found the same issue while investigating connectivity
> issues on fairphone 4 (WCN3988, qcom,wcn3990-wifi, slightly patched
> kernel v7.2.0-sm6350, firmware WLAN.HL.3.3.1-01704-QCAHLSWMTPLZ-1).

Thank you for the report. It is good to hear that the same flag helps
on WCN3988 and on a different firmware branch. I have only tested on
WCN3990 with HL.2.0 firmware.

If you have time, could you try this patch itself (instead of your own
version) on the Fairphone 4 and reply with a Tested-by if it works?
WCN3988 uses the same WCN3990 entry in ath10k_hw_params_list, so the
patch should apply to your device as it is. Station mode only is fine.

I worked through this together with Claude (AI). English is hard for
me, so the English was written with AI help. My results come from my
own device tests on my comma four.

Thanks,
Shunsuke

2026=E5=B9=B410=E6=9C=8820=E6=97=A5(=E7=81=AB) 8:04 Aleksei Kharlamov <alek=
sei.kharlamov@gmx.de>:

>
> Hello,
>
> On 10/16/26 02:17, Shunsuke Nagashima via B4 Relay wrote:
>  > ath10k sets the PMF flag in the peer assoc command only when the
>  > firmware file advertises ATH10K_FW_FEATURE_MFP_SUPPORT. That check cam=
e
>  > with commit 90eceb3b5fb0 ("ath10k: set peer MFP flag in peer assoc
>  > command"), because at that time "only firmwares 10.1.561 and above hav=
e
>  > support for MFP". The WCN3990 firmware-5.bin files in linux-firmware d=
o
>  > not set that feature bit, so the flag is never sent on WCN3990, althou=
gh
>  > mac80211 negotiates PMF with the AP. ath11k and ath12k set the flag fo=
r
>  > every MFP station.
>
> I independently found the same issue while investigating connectivity
> issues on fairphone 4 (WCN3988, qcom,wcn3990-wifi, slightly patched
> kernel v7.2.0-sm6350, firmware WLAN.HL.3.3.1-01704-QCAHLSWMTPLZ-1).
>
> Setting PMF peer flag (my patch is crude and very similar to yours)
> significantly improves the connection performance (please keep in mind
> that fp4 seems to currently have multiple other issues, such as missing
> a correct "board" file). I only tested station mode.
>
> Thanks,
> Aleksei
>

