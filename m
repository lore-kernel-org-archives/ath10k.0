Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC496082BFD
	for <ath10k@archiver.kernel.org>; Tue,  3 Nov 2026 16:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lc7Ze74h;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=TweQbgJB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Un7Sh/vOuUsV6xn2dwiqUFHaUUkNjRn1fxqbgvpHoaU=; b=lc7Ze74h4RT7vE0OuoUrdph6fS
	9J2Ke9FieEU7skfhaUyXIEZftc1/1S2y08YCYcHEWZO+xcDrkqR4Uxgie6xmJpq2rHdgnnxeFBKhO
	5S54Ejk5DU0x7js52yiZHDLMZl3xtffhEOuoIZeeMb0DwmjbRHrca6OB+J7WWU2UGvAvWF0/qKrLV
	OuOF7L6aPz/paWHwGRqo+sKA62+7g7E1rSBC7SxfT7IXiKC/mc614ScZgcESOlNNJisfiaA4w1WP0
	xEeLIPvmC6SO/k2eknk/vHd0z6+8R7WLI/AfeQzieurUgjKikswVHYWCdjEwLcZne0VcJgcrJtQqO
	UVd4OJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHcj-00000003CRM-1pgv;
	Tue, 03 Nov 2026 16:44:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHch-00000003CR0-06nd
	for ath10k@lists.infradead.org;
	Tue, 03 Nov 2026 16:44:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c4ced671398so160913566b.3
        for <ath10k@lists.infradead.org>; Tue, 03 Nov 2026 08:44:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793724273; cv=none;
        d=google.com; s=arc-20260327;
        b=HQEVjAHnPfUKQUv0rGP1cqDsyLu7gmbncRpS643JrN9exP+ptNKKUhXtQE8DGCg/DJ
         lUAC+NaG0bfbyhbpkGOTw6t4Tfwb3bGzmA1hMZs+utg+vuo/8ou0pSUFMa+2AhwY1eLa
         mUaWkH/uySCKS2nzP/9z7ebRJ+CJWhN43pFX9AgdbqXEkMxZqUroSCR7nu+pGsLhwG9m
         RpDhxm+JYNeMoFruffFQbvUEOLIfYAI/KSwAPaDLyGlC2u7VIBVyTG8N+Id/LSCDBh47
         0XdcCrIwwKBgcQZpixS4VsmC1eBTGh8tV966Nw3JpwcDoIUxmdDjVMdo29kAfVHM9NTU
         P7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Un7Sh/vOuUsV6xn2dwiqUFHaUUkNjRn1fxqbgvpHoaU=;
        fh=BMrZVYT3Y85asQjmTDmW6pmKV50QIE9U8QJyXfespaU=;
        b=cku/zk6CI1XLgoALMVMgiTmkf+M7mmgnDmo01AZnyotcT1E3PGYzw52ttVOTQ23fEA
         o0Y5oerFFUQPBH5NxBeVE+5WStqve7gta2eTlEvcXNPq0WGLM2+kSBJWlZg9IxOEujb0
         BuR36m/PGDxqIi/tIiUK+CKUexufcJmxF6g4yPxWhzQEjnp5LMNXaBWVdTtG6eB2VcPc
         mDbyMz5WLu3u+FaFe9BorXBHyniMdTiEh53q41t7LszkMY26GrFa/lK9qhcSoF7TFKkk
         ZBwxFzAMU6Ab+h9a0DnuUR5DziNisXgCFqZmd1ob/SkADuMdLtDraS7boS+G7XXwO79c
         gyXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1793724273; x=1794329073; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Un7Sh/vOuUsV6xn2dwiqUFHaUUkNjRn1fxqbgvpHoaU=;
        b=TweQbgJBCRc1/NZIg2bDhjwNWVK7s39gqMHrkXSObmDdwSmEyvkv+ZJ/wtQ8XYdj3F
         SKf/UP/VfYtGV3LSRqcdtBXlJyu9gkLTp+Ax3LMhZimTKgt2/hBbbRwrYfZQv1HIM3Uj
         MZoTJAugHPTvVvpjbF60E4fOtnb1tSUpnyhq/liid1K7RXwgoVbgCZRaWmoAH83BqjtR
         FInlXCQeKOTKpH/e5bbPCDr9PddGUZpTnCO4Xcnc8cq8KofP3WQ2Dg4izOTAt7ykZ4cA
         yoAd9DIgDllf6waOzPG7i75qELiia5rvwX2jkqFiw8khVye7Reb1gbirshC2FHFhJUqA
         7uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724273; x=1794329073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Un7Sh/vOuUsV6xn2dwiqUFHaUUkNjRn1fxqbgvpHoaU=;
        b=DdKJN/+j6l+HLeEYurjcF8XBUztCRkqvO7Zax7mJNXRQ5iwSMOKsCcMclOJkbPUI3h
         w2qdu3rGeg4rFE2r/XUH1pNxtP+4ky1ifizNiFUZSXzV+w0EapDbl1SNtN2Ftw1nBEJn
         Ol+dAan3l9XaRmc8Xsn85OuLAuB7ZMEykTOtGEyui3RhwHiD+wU5jl80fG2IpOrtIqjt
         pSP8ZM4iScYzFGPN+let6dmNydjUnz5esbjOFPdrwKPki7ckpTy5asvWxdqN+g7XoUXN
         reIkzBVGwG5ZyPbzHohe58Jpv5qFcgk140yPIT2O0ouF5YgSF1qIv2bR/DCUJBWHUfwu
         xKpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp2IwAi+3w0DtH4Bw0z+t8RbbnFNYuxq8u5aYgLGb/960bN08mWT8wDnVzyWvfb2SBQsrZrrY=@lists.infradead.org
X-Gm-Message-State: APuU4Z9qaSlvjBiv5NKvNGQ5ozdvzqaI+Nb8Ah6wc8w/EMg4WB+Gi+GQ
	q4mlSPOF6FS/EydpXWSRUNKcci/j9h5P7UXnLYYxwcBKcf6S3Wu0WfhM6Wv0IgzJT5PNYVbeHMC
	y3R6FE03SHaaD9YhhRpdGN2LgztVXjm8aOv5rTGO6
X-Gm-Gg: AYBFou3vAO4rX9l9eg8cAV2lGiF+WW65rbZHIKlIBaxS0VzGkpGCcG/EqF9EtlHRj2Y
	tGflKXvoVATgwb5255JxkMW9e98sMiRxiMbwoyzHupweRjr0S5wv7erKcTnZwjaOVGTH62OipxL
	6jML1X15TyLfBajiYt76bpnua0pKFJ3xnENfknCNP0QGLWOMsdHXYHDnYzkwB4rTgdrWaUWqU54
	Grhk7JPEUZWAfpCj/9V+6KMssYuuajYvvMTFvK+gh5NiptO6453mOJk89Qvpapty+WBLfw3V4LR
	btzBR8hvwTsjVTIG3sndc7FP+aFTPWbftVBQhqBy8T2MKYnC9J0kBb/6S09N6MdwJQ+jQaSCSiQ
	lWiUroK+pun0R615ykPFy/RkA4IWWAEQpQTWBgMMdPyAjskW2VjV/fBl/kiqCoBhVb1GgBcPggc
	9kRRT1RSK6VV/3l63E9G6iM8ef7BIjEoNU5T1a/4FRTehjbr71if+aPQnj
X-Received: by 2002:a17:907:2d8e:b0:c42:102f:15df with SMTP id
 a640c23a62f3a-c4ca7a0dc8cmr1250439166b.8.1793724272776; Tue, 03 Nov 2026
 08:44:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
 <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
 <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com> <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com>
In-Reply-To: <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Wed, 4 Nov 2026 01:44:06 +0900
X-Gm-Features: AclHuK97lyxSBpGOAJS72d3gT5RDULXKKysd-w5qBGIFB_PFqSCBaZ_ICIFvFWc
Message-ID: <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Conn O'Griofa" <connogriofa@gmail.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Fabricio Akio <fabricioakio@gmail.com>, Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_084435_104683_36C007D3 
X-CRM114-Status: GOOD (  13.32  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Loic,

On Tue, Nov 3, 2026 at 2:46 PM Loic Poulain wrote:
> If Linux-firmware ships 01387, someone will need to confirm that the
> MFP capability addition works with that specific firmware version. For
> QCM2290, I can probably test it myself and provide a Tested-by tag if
> you can describe the expected testing procedure.
>
> Yes, to Jeff.

Thanks. Then I'll start with the qcm2290 file only, and leave the
shared 01387 file until someone can test it on a db845c or an axolotl.
Note that qrb4210/firmware-5.bin is a link to the qcm2290 file, so the
change covers both.

Test procedure:

1. With the current file, dmesg shows these features (crc32 a79c5b24):
     wowlan,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel
   Connect to a 5 GHz WPA3-SAE AP (PMF on) and run iperf3 to a wired
   host, up and down (-R). Do the same with WPA2 on the same AP.

2. Make the new file (qca-swiss-army-knife ath10k-fwencoder):
  F=wowlan,mgmt-tx-by-ref,non-bmi,single-chan-info-per-channel,mfp-support
  cp firmware-5.bin firmware-5.mfp.bin
  ath10k-fwencoder --modify --timestamp=1706616060 \
      --features=$F firmware-5.mfp.bin
   md5sum: 58982403c9c56a4b888fe0ab3104d7de. Only one byte changes
   (offset 33, 0x00 -> 0x10). Without --timestamp the tool writes the
   current time and the md5sum changes.

3. Put it in place of ath10k/WCN3990/hw1.0/qcm2290/firmware-5.bin and
   reboot (ath10k reads the features only at probe). dmesg should show
   these features (crc32 f9e8f071):
     wowlan,mfp,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel

4. Repeat the iperf3 runs. Also disconnect and reconnect to the WPA3 AP
   about 10 times, note how long each reconnect takes, and check dmesg
   for "firmware crashed".

On my comma four (WLAN.HL.2.0.c10-00459), adding only this bit to
its firmware-5.bin, with the kernel unchanged, took WPA3 from 22.6-31.6
Mbit/s up and 21.6-21.7 down to 273.8-287.7 up and 242.5-243.7 down,
close to WPA2. Without the bit, ADDBA Requests went out unprotected and
no Block Ack was set up, and with one AP a reconnect took about 24 s;
with the bit it took 1-5 s.

A failure would be an association failure or a firmware crash. If WPA3
is already close to WPA2 with the current file, please tell me too:
then this firmware may not need the bit, and the test only shows that
it does no harm. A monitor-mode capture is optional; with the new file
the ADDBA Request frames should be protected.

If it works, I'll send the file to the ath10k list, to Jeff with you
in CC, with your Tested-by.

I worked through this with Claude (AI). English is hard for me, so AI
helped write the English. I ran all the device tests myself on my comma
four.

Thanks,
Shunsuke Nagashima <shunsuke@nagashi.ma>

