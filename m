Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A354108E1FA
	for <ath10k@archiver.kernel.org>; Thu, 19 Mar 2026 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=en0S3rhRVuk4HdDoGfU9riboUz4vLoI59qsRVpHjXPA=; b=oCsHhigIl6KrVV/rvrqwAg6+wy
	AmChrR0wcLYvcG+nNnhhLf1UbhQh6VBmWDl5aNp9dsu4NB5Q+/t3g8NndYw6Tb8MdT5Z5Joegt3IL
	/MxADOYIFx1/q8S+XfnSaasXOP7w+pV5ItCqAxcKH+xTxQKTZKUovnuJ1sIdeoElCqH3teDPTIwmv
	s6QXYd5+LrWpNpZ1wYs7slK/tk/hiiRTWNs3C7j8lRRKO0GXO+nCg11/SMRmw3Sfj2lxCnNn1dU/f
	aQhYPG096xjlwMtAkF/rQys52LQX4W5SCkZ3cJdKWVyGuBMpCt1jtaPPZeYQHFLj21gUP1LGKc7fL
	oPpzH7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CSb-0000000AbNP-3N5t;
	Thu, 19 Mar 2026 12:26:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CSZ-0000000AbN5-2x2I
	for ath10k@lists.infradead.org;
	Thu, 19 Mar 2026 12:26:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b04fc8851cso8269585ad.0
        for <ath10k@lists.infradead.org>; Thu, 19 Mar 2026 05:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773923202; cv=none;
        d=google.com; s=arc-20240605;
        b=dTHOc/rxJ4JKE/15iKkyDXpORuKkhCZ/IIUs8rMwxQDrTpm/SD6xdD4ngTzT3WsqiA
         calDQbj03d5loiv8eoi8HZKDRXuCFv4CvPfFP5IYdZ7m12hLP2HFrYaKafsC18IjDEqw
         5kXGzLy64M4OGR8lsIJwyWeRUdVYGdlBH0jxgq7RCd7im19v6U+y9SCH/qdePicmhRZQ
         raHbiVpAVWZzbIJYHbVwRWVWWcEmmLZEj5aJjWxwy+It/obT+uN8t46JNmiAZXpk81/5
         3gdkNAMaIEmLHBSWX1e9MhdKz/SyI3tMadCEZnsGNktHqz/VholNN0GNJvKOJh6gMEKr
         PahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=en0S3rhRVuk4HdDoGfU9riboUz4vLoI59qsRVpHjXPA=;
        fh=9/vkY4X0mNnDL8VYRWv2EOnpogoPAt871YzTsZnzaH4=;
        b=TbCg9y7COAWpEDo2E5uiTQVZp3GbMqMIlCvaczUiaYkF/qJXKtrgbumq9mZF3boB2p
         t1KtUOF8Fm+FFXD95V3bI+vSvcS5dTZIQtAHhmtvXoMplB9G48niAi2DDnaeBLgiAGNW
         H407WeFQT4JrXiRkXIvH4RAD8tVg23XNC9vcmKQbBI8Agh5Vv3CVkzZ3FSouKzaps5hT
         RXJm8U268ZLIhNRHLCF66KnCAWBCkGFaaiMQm10xsu7njM+Mb1FkqLH4Ovq+TP6CyJ/a
         c6+hQ+MzOfJvr0eDsKXACLPMubIhIMomDZjAGGfmrjgYgqXfQvhtA8eclyCN9LgBPyJ1
         DnHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773923202; x=1774528002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en0S3rhRVuk4HdDoGfU9riboUz4vLoI59qsRVpHjXPA=;
        b=SxD7YJU99OnMzeOR4ZLCn1lSkesdlNnFTm6vAcZCD4AD4MVNBHx0MRPi2wmxjPxQqH
         yVuTL4LWtxijR7tJ6LwWolSrA/m49LjVqBW9A3KeIwJ8wDqNdycQ2almyc6txMbm7FBU
         XBlXskz3nqeVRqc3yX4x2F0Dl4M9z7PYZqPLXpnJVZaxusTQsUhh8KMUoz33VEuy6Shd
         JsezeQ2AMNP+ULofpjccBxZBmbWIL3JAKENa+DqwL7i7/SZOgTnYYMIOfh/IsB7yHyyO
         Iia81Mvr5r0zjt49Aw6JuQZciKej1mUmJqeFRctu36yjAQQ3SRNbeXQD9Mpbku6hBg6P
         dfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773923202; x=1774528002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=en0S3rhRVuk4HdDoGfU9riboUz4vLoI59qsRVpHjXPA=;
        b=Kx/bqdpwAWhJzdCr+d0cAY31Klwxi6tJgEgfLZ+YmepjoiwTLCAtlP2JV/00rk8UmA
         CSp0FWJGPJJl9T5TwVuCGqNsZzcKzPJd7yUgs+3FOeULa6zjjdwo0lIf4bmDB8o+xqPp
         ZvhZfY8ks0POSU/dHMcEPUQXSIz5N+uSPIGZEwT6qHA7cWphyanycTHbE8U1GqmWqq8N
         SpMUnhViEY2S8CD44FqZXgxDpa0v+w4FGOXsQK60KPxouGiL/PWytMO+0w0LtmvcF7i+
         tYQdmkvJ39CwQ5h4nX8t0Y0Oe8gjgEOV5oLtyp9jJdWiFvEm14fpR1hFNAMag2AzVBgw
         Ox5g==
X-Forwarded-Encrypted: i=1; AJvYcCV9FV1+5onQr6xBPyjhR0HRag49mif4CVqMPeDHVUj1Mj3xBBPAvAlU9lWgKNE7eKo9zvM1ZuA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww0X4uvy/iP7AD2o8NGIw/j9XR8f1dbk8k8jXBlRIs5edFhzZs
	wxMn27aR97lfdauC0Z4mUoBTt7x+LBTOdj/5gVvqwUIs8ziljcEdnM532Gclm1+7OLhilr1oZvg
	rYiiHjhqBCdmU7Cyid7DkqAnrD6DdjGWbDSw=
X-Gm-Gg: ATEYQzzfl753DtHPd3Jfo84QfAbAettXhVnFnNYNAgc296MEYkii6UPMjNqYznvGNq9
	VNRlCP1uFaPCUKpN/bVOS7lG96hUC3dzDhNy9efEbm6xR0VGrFDFE4RTl1YRWA2npuxPcBtO7Tg
	vg9uIczWOpTK9ozgEi390RyRWDh1+8JUvvevKA5Zb2PECmgPPfi2qWoNcdtBEwXSq++w7121Yde
	xAoe11Za+/G8AxIr+B5ER8tEcyqrRdUTiihgtkdhCJukd6qEx6v/EYdjZ7O6Uv2u13kSOhWimJx
	iSY+OA==
X-Received: by 2002:a17:903:1a24:b0:2ae:5a0b:9ce8 with SMTP id
 d9443c01a7336-2b06e428cf4mr71732845ad.45.1773923202129; Thu, 19 Mar 2026
 05:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240801202359.794035-1-frut3k7@gmail.com> <20241009065051.51143-1-frut3k7@gmail.com>
 <b58b5b2e-bf9f-480c-810b-2cef29aab82c@quicinc.com> <CAKEyCaDUfn4jtCdTt9JJ-Qe+CCudORPwcjj5i5=G28ANc+eCRg@mail.gmail.com>
 <87ed4dr5pj.fsf@kernel.org> <CAKEyCaD-1GO1NL-=1E92BE9=XKa2PymOAY14vMmtwYGLsPjeUg@mail.gmail.com>
 <CAKEyCaAaJGUX56Xp57KWkouCgpOyPNTqysRZyGtfsyoJ+ERMpA@mail.gmail.com>
In-Reply-To: <CAKEyCaAaJGUX56Xp57KWkouCgpOyPNTqysRZyGtfsyoJ+ERMpA@mail.gmail.com>
From: =?UTF-8?Q?Pawe=C5=82_Owoc?= <frut3k7@gmail.com>
Date: Thu, 19 Mar 2026 13:26:31 +0100
X-Gm-Features: AaiRm53LS3YV2vNyYE8NB5R2KfS-Y_ilptPOBdpZbFHdnSuk2kgBOOWrzrVvBX0
Message-ID: <CAKEyCaBi=mpZjpAra+sUJgNPqF85xxpQHE19SG1aVmLyKA7Phg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: add channel 177 for 5 GHz band
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_052643_767829_CB196239 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 17, 2025 at 6:17=E2=80=AFPM Pawe=C5=82 Owoc <frut3k7@gmail.com>=
 wrote:
>
> The changes are added in the ath10k-ct driver:
> https://github.com/greearb/ath10k-ct/commit/8f2254b8e0554e78efcef5fb752be=
0eb3573d281
> Is there a chance they will be accepted here as well?

Kindly asking if this change can be accepted?

