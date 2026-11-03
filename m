Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6CC606A81C
	for <ath10k@archiver.kernel.org>; Tue,  3 Nov 2026 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=btTohmyo;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=R4j3j2Ac
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Zp3HhZWdOqhjmPq6xmi/Tj3ka8PFrAOHqU0dCBIgo0=; b=btTohmyoXrMWo+07GabeBfvmH+
	a+i4xrHzClIgew5Kf1etFp6LZmnChvODcMKJfx9oLDvVQLZdX6m3anKaUIs35LCrZ6jfAfFy9LcKy
	jR6S3/kzScy79v0ej/S3kmya0vLaR3MqAfyTFPGxamoY7E7y7Hus+Q4R7s6x4V+2FXPeuuXkXTXKC
	V8mdlyU2j+0nGS4+CjK1EZgy08+GD+44cq149UUPbASmvR1rP29cw9/Mk3fP70H9ds4pvyGJGC07i
	GktxhhNjACYv13RnKOiD2X9COy/hW3kAkgpzFkoJpvNj9TnVhQArrNUWXYx1oIHOCxyohW2amQLcy
	SVRSPhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCNG-000000028mV-3uVI;
	Tue, 03 Nov 2026 11:08:18 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCNE-000000028kp-2wy1
	for ath10k@lists.infradead.org;
	Tue, 03 Nov 2026 11:08:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c40f29667e6so609510366b.0
        for <ath10k@lists.infradead.org>; Tue, 03 Nov 2026 03:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704095; cv=none;
        d=google.com; s=arc-20260327;
        b=Wumg/iwhzMxGFSHko/+c9770rX0lk4DacH80nEfUyVPto8cy8MQ4gGbUMIFIuQbIlk
         LHXvDX6zwzh+BUtSoPQkZKiPBMgKHMEudyyjXHrT+1GrxvLI9JP+ZnvK7rhvTSf8XbqB
         6kWhTzezgcJ02+tW6QBwk6xIkOhISkrcZU9EG41cRJio5XTKv+QyFsZ2qWOxkw6erywQ
         nQrIPuHysR4IgRe4tDOSls/elKlJYHh4PW1YDX9HW5MkUSULcP7BRtJaEAd9bm8g0YG2
         2GiABmx9Qz0nG6cPIMdi3gdc+LdNSKD3uGg4sb3L/qDUJQ1aKlBqgol9brcWSChqhlTS
         /B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Zp3HhZWdOqhjmPq6xmi/Tj3ka8PFrAOHqU0dCBIgo0=;
        fh=eErJZBBrOw3+r456C14eWh+nhrdsR15Th7e2PZCAs3s=;
        b=dX3khxQXcWVifEYqBqEdhwND58MUZwVdlGBp1Fuvf/5aX8TOAo0WT+lcgHarEodOIw
         9joeOiolmQpCr4SY9ZaOpwZWUpgtgOi+pfzod0J6S08BZo1r8M2RWOWKzxyXDe1VkUj+
         1wrXWB6MnaYCO7JIoW4QkRQU4pEveNkTYPLy4RS9IKvxRaPdkV33JVUHm58LFf6B0iX6
         GGj0JoKI0Py1PpT4lT3MgvGblFTYmITPEbuE5QmVYyaZ+D8fus1e9QU9HYhr1jeVSl51
         2dKWKkWzq9Mq0gn3S7o2GM7EBd2N5ueZ/jmAc6tTuFovrCTAFo6jkST2p5gh8HYN5gJ8
         Dzxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1793704095; x=1794308895; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Zp3HhZWdOqhjmPq6xmi/Tj3ka8PFrAOHqU0dCBIgo0=;
        b=R4j3j2Ac8z+jD8In6B2/IXjLJRhTLl6KWwheDD3nuLog9jb2cHlO3imrtQ9OUBb1Pc
         MvDFZp7n2BxQYITK7niANGH0v8gbi49xCvwv9xd/jnCLXxqUu1aQs47d6ohGhRpoqZOj
         NUceVnD0wiAsbMUDypxGCdnxN78clkOReDpqU1XJEXTGsY71g4Jc5dKhECS9xZ0kP6ay
         qazKolyywwqlYYG8hrulxxUFTtQ6ooTzD8eSs4ZiKGAexeqps7t9ue16eCcZcOYyqh8L
         lQevyMB4WOYCo0HDJY9HwL6DYjwY6125Tx7WtzNNhzRys/IgYmwm6ky+DgrtONmEXXPK
         aWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704095; x=1794308895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Zp3HhZWdOqhjmPq6xmi/Tj3ka8PFrAOHqU0dCBIgo0=;
        b=j1W9kdM04J1K795JY/jZB0wYSBlcBLnYulpEnmQCGG2fZaYjEimoWQT5/WpkGmW6G9
         tY4QPssG8iVQRoOln6zzb3FJQ58b4AAH4vjmyPlFuZv3bSZ5hrnuXzFRhMO74zCmz6as
         476v8FcWY9zn4cTwtCpfTaPBFWJICcrKnZ/yki33kn8IcW0ywaWU9vvBoV1Lbf1ez1c7
         lSmTkKGQx/zvzqPN+tHo1lK96GWJsGhZa6bKLkkvoQWUDcT5ULtVcmad/eN2knOXZSiA
         sHhhhjeQMpJ8fK7ostS55OpQwzbAKarHQfl4M0TQ6e2RGNBsVY+zRp26SzQIc15tog9P
         Vmkw==
X-Forwarded-Encrypted: i=1; AKwUvBxSHxmTfTWUSoU6JKkWywKr6zgu1ogdz96IImV3/c1sxHbToV79bDLoVNh4NB8sK6v2WGL2/3g=@lists.infradead.org
X-Gm-Message-State: AFq9FYLsTv3t3/n5GEi85zMTVZBUuftaYEXAHXxG97TdAliqODGpk70J
	Mq9MlZDIWiXBKC0FAC6sSE6/OIEs7MGu/exbhYPFG0ApX/u6PtT1rCvltnZGEwrIhcbkBlPzPa9
	6ZFAsU/pf2KSWSSRZBCia6vAdt36w7KUQyhtsBppkodWUPTgx6MLRbnA3sQ4=
X-Gm-Gg: AYBFou0lakZyRTSrtR3fOSrkUXV7E/KzepRQF14OWvKwhUCebdaYF3NTt2FhTmILUZJ
	ANNNve2O1K3xVfP6KokXMoLdItYFLKvXpp1EBews/Cff7S/xduY1rmU8JR7TjTuo82eVHgGWErA
	mWw2m5Q8gF5fWtPsU07IFDI3FLa7tYBd3IbmCzo/S3LFFE+yk+YbVyWT0H+G/C4ZHZl6450Z+MD
	yU3Xx6b/9/g/6CHgoeeeCb9JqfQ3hZJiefPJbgkORbvtkfwvm/Xt2NbKtoLpfvSyvQ7cZEw/ifU
	X5duxUFVv0Zfv8BZcRZczkkdT1mhhPO0FXe777yOpeUsrVNaicF0oCHNUwQzCqL5QWeU4iFBL2l
	wECDX5Lh7St24qWkUtdHOv2xbGFM9F3WdH56hOCplKuwV61+UCYtL7IrsYMfyXVefBcgxwvKbvo
	BcFaTGM3V2khjwjnNeDtk0Of/b1RRvFnAI3EqSFO3de0xG7YuC5ydtUzU=
X-Received: by 2002:a17:907:3f1d:b0:c49:9231:5518 with SMTP id
 a640c23a62f3a-c4ca7a40254mr1059160866b.21.1793704094661; Tue, 03 Nov 2026
 03:08:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
 <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
In-Reply-To: <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Tue, 3 Nov 2026 20:07:48 +0900
X-Gm-Features: AclHuK-tO3aJA8d_SmuLc3ZoFMk8WdJMtEnlyIJzjfGwrGOn0GHRV9smb-wnHEg
Message-ID: <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Conn O'Griofa" <connogriofa@gmail.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Fabricio Akio <fabricioakio@gmail.com>, Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_030816_801315_0E5B7249 
X-CRM114-Status: GOOD (  11.01  )
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

On Tue, Nov 3, 2026 at 10:20 AM Loic Poulain wrote:
> For change request I think the best for this is probably to follow
> board like change:
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html
>
> Please, keep me in CC.

Thanks. I'll send it to the ath10k list in that format, with you in CC.

One question first, about which file to change. In linux-firmware, the
shared WCN3990/hw1.0/firmware-5.bin goes with wlanmdsp.mbn
WLAN.HL.2.0-01387 (sdm845 boards such as db845c and SHIFT axolotl).
qcm2290 and shikra have their own firmware-5.bin, picked through the
firmware-name DT property.

My comma four runs WLAN.HL.2.0.c10-00459, which comma ships itself. It
is not in linux-firmware, and the comma four device tree is not
upstream, so a per-board file would not help anyone else. But I have
only tested the bit with c10-00459, not with 01387, and I don't have a
db845c.

Is that enough to change the shared file, or should someone test 01387
first?

Also, the page says Kalle adds the files. Should I address the mail to
Jeff now?

I worked through this with Claude (AI). English is hard for me, so AI
helped write the English. I ran all the device tests myself on my comma
four.

Thanks,
Shunsuke Nagashima <shunsuke@nagashi.ma>

