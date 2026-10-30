Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFAF606A31A
	for <ath10k@archiver.kernel.org>; Fri, 30 Oct 2026 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T8qYUHHL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K+urJ5nQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P20Sssx6yjJUYGIDtxb2MekE1dkGAS2a+bVdnxR+A5o=; b=T8qYUHHL9T7oNR
	ZeBo2h7rsMWBnB2Dx5xPhEuq0hJuHpChUSArMwKFl+lnCl2JCB+TYuQ7kiNN2RdJD3CETIv8GhwqT
	epjwCv6Bl5kGh5Uz7vJKhgxdqsFQGiS8A70faaCXdTbTMKWryY/t0rDps/Sm0AzhejrzW3d3dZx0d
	XHyXRBC8CF++C81ZFskixR6+8AQ6dN/egYsr5bRFRIDJcLOkwYMBKSU6Gnuwjvbh8ahjOPjCOkRYe
	oRR350v2DR5IvvOJHr2/4HTSQCGnLz18xJIyiQyDI5Jp+eL8c0btKRT9kim/fpv6HotXBVmdxXSkd
	bQCQkCa5J0hs7gLzi1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrAa-0000000CO95-40SH;
	Fri, 30 Oct 2026 18:17:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrAX-0000000CO6M-1v5f
	for ath10k@lists.infradead.org;
	Fri, 30 Oct 2026 18:17:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48c4d870d54so666511f8f.2
        for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 11:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793384254; x=1793989054; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P20Sssx6yjJUYGIDtxb2MekE1dkGAS2a+bVdnxR+A5o=;
        b=K+urJ5nQtBCQJ3zw4A52WcxOnUxK1MaNCmJXRDZPsQPohUggOsKf9tP3hb9/f55fsf
         yOelkaNRQXYUcPXJyTvDuptpVtSfrJwjbfqSFgpWZ5k/1Obv6Lt3993IVs8a+fDOBXh1
         8vfpkp/OpM23M95tqA6OunCqBcRoMt/3IbhcB6HOmiTnkW8WNJSEjUCt8PLNrT25cfvm
         4QjfJRDcAGXiMEH+4v6kJkTFPyFjiaTXRum3qa+NVpibTCIe/KIn+4Oczw/4bMbpQEfe
         9aLvn2cd8Y2SeLGq4p6jqgvtfdyXRSncRGnrgyO6HaBR8uuYz0WDhgII3hMn3JAuFntF
         hXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384254; x=1793989054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P20Sssx6yjJUYGIDtxb2MekE1dkGAS2a+bVdnxR+A5o=;
        b=FYtFr+QR8oxBhOL1J6Wgtcg+vx1Spo9ZeoRdm0r2bOk5bG+lv6mZ9XhV7y55AgJdU0
         xFoWf90/AD71slonAijNi7av9w6w8VXV5vWfmYm0Ewi5U8lfj3v+UU/qlZ5bPoOY7B4Y
         T/EgPIsiwm7L3oeY43P2Ggeh8BvXiDES53hsgdG0guLbDcRuvCu/XPbu8wwGUF+J/p1l
         saXDDFYzyD8jC9HdiiG83/IoYK0opnBzLw8/342YNRGoft4u8u9sMVLKnranzMY3GdWf
         Pvr6xDqW5wck/BD5LqF8sHd6Yvq71ToCgbqk5d/GwXxo/sAIJG7I3oSYhF+4PDENzVnt
         n1aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBSmnTrmY2WnVA4DETj3TY8b1rQzK4LFaJppiZR9PAVhAzIV/L6HUweDcog8+mbeIFFDTKyGE=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/z6lqYiAq5yclfSDRuzvQnKCAtCf+NVST6d27RGFCvTvgRp3w
	5H9N6tP6qwLDP4bX1i4o5yw3ueePiAeKCtL6RGk3kf3vVP0Hfxe3Qm88aQgslBaM
X-Gm-Gg: AYBFou0PL+p11Zu3ozYMIL8UaWKMR4LUZ9MNSfnijIa6zAJ1pS2eC775P+6CMZ/iuoo
	ezgdzr4iQusjcigrfgw7PFraYe2IbKC19jSUqbzttRibhqbgcikbtgsfv4mt2dPU4AUAOLGSkOk
	bWS4TSDRWr6+dCbgcNVfYOXehic/gRsLfNNpBTOTq8c4pk6AlEd/bLZx/xdPaRoowLL+Zfer/Dc
	GjFVrm1bUnfEs8UvUc877kjzUE/x2vmpjnRDIL/gPXGsrsvnxR1OggHb1hUDCGxa6iw4/X+0VmX
	zXStndyCfkdoej2FsCOZlciQwP1d8/eiwzHCiyhboU6ZXRjqfD5H8BvHRKusjJnm90cp1Msrz42
	R8OrK4Pt2MEewMCyl8LdupQr4tSS5XhBgybkQLmGV7k62MrTSMEQhRuXc0YSr8FPbLgkDywjvmV
	morYe5qX+q88tmyK33bOd6Q68o0PNH1whiUGWUkEsHfYFFPsQ9DEjRaqORAf2BVkG4A+bPY+YRN
	JH8i8cej0c2N/xGnlnFxLIyJulyhxJVEJgn+9FUabgfnK8psh/e2FGdUyUp4u2eudrIWiIDT7eG
	cwrVZHlN9vi9MGr5kVBaEk/01d8gPfs7dz3KoUbvgsS+b5UXBgHiqHRtbUgxdHt+bLAkwxTiinK
	mAxc=
X-Received: by 2002:a05:6000:178f:b0:48d:f14a:9177 with SMTP id ffacd0b85a97d-48e6e4faeacmr7358484f8f.56.1793384253663;
        Fri, 30 Oct 2026 11:17:33 -0700 (PDT)
Received: from ?IPV6:2a02:8086:cd5:c900:c69f:4b72:77ee:5fe1? ([2a02:8086:cd5:c900:c69f:4b72:77ee:5fe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba5dc2sm4380862f8f.54.2026.10.30.11.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:17:33 -0700 (PDT)
Message-ID: <e2e00074-6787-4c76-a6ac-5e17d37c1e76@gmail.com>
Date: Fri, 30 Oct 2026 18:17:31 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on
 WCN3990
To: shunsuke@nagashi.ma, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 Fabricio Akio <fabricioakio@gmail.com>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
Content-Language: en-US
From: Conn O'Griofa <connogriofa@gmail.com>
In-Reply-To: <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_111737_549506_3502480B 
X-CRM114-Status: GOOD (  15.92  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/10/2026 01:17, Shunsuke Nagashima via B4 Relay wrote:

>   - The firmware sends its ADDBA Request frames unprotected. The AP does
>     not answer them, and no Block Ack agreement is set up, in both the
>     2.4 GHz and the 5 GHz band. On a 5 GHz WPA3 AP, iperf3 to a wired
>     host gave 22.6-31.6 Mbit/s up and 21.6-21.7 Mbit/s down, against
>     280.2-283.0 / 264.5-272.3 Mbit/s with WPA2 on the same AP. A
>     WPA2/WPA3 transition network gave the same low rate (23.4/22.7
>     Mbit/s), because wpa_supplicant chose SAE with PMF there.
>
>   - On 5 GHz, the protected Deauth sent at disconnect carried CCMP PN 0
>     (56 of 56 in one capture). One AP dropped it, kept the old
>     association and answered the next association with status 30, so a
>     reconnect took 24.3-24.4 s instead of about 5 s. Another AP accepted
>     the PN 0 Deauth. On 2.4 GHz the Deauth carried a live PN even
>     without the flag. I could not tell whether the band or the AP's
>     HT/VHT capability makes the difference.
>

I can confirm the same problem happens on a PCI bus hw1.1 revision 
QCA9377 in an Inspiron 5570 laptop (originally installed), primarily 
testing the 5GHz band due to 2.4Ghz being congested in my area:
ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chip_id 
0x003821ff sub 1028:1810
ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.2.1-00021-QCARMSWP-1 api 6 
features wowlan,ignore-otp crc32 42e41877

Note that the MFP flag is not listed; I also checked the latest api 5 
firmware and the flag is also missing. Without any changes, the driver 
performs extremely poorly (~50Mbps) when PMF is negotiated with the 
default or latest api 5 firmware, and confirmed to be an issue on my ISP 
router and also a separate OpenWrt router using an ath11k chipset. Prior 
to discovering this patch set, my workaround was to allow WPA3 
Transition Mode on my routers and force PMF disabled on the client via 
NetworkManager in order to coax the connection into WPA2 mode with PMF 
disabled, allowing speed parity with Windows using WPA3 (~300Mbps).

By adapting your patch to also set ".peer_pmf_support = true" for my 
hardware, WPA3-SAE (i.e. with PMF enabled) now runs at full speed 
(~300Mbps).

Further context is available here (not my thread, but other users have 
reported the same issue with this hardware and I posted this patch with 
the flag added for my hardware): 
https://bbs.archlinux.org/viewtopic.php?id=308424

Regards,
Conn O'Griofa



