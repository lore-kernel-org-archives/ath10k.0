Return-Path: <SRS0=1Jc9=PQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE0DC433EF
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 18:58:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21DFE601FF
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 18:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21DFE601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvagQWvzCkA43ac/y53uECdwzHZ5MlLA1KzEkKoKI3Y=; b=FZXurqf5EjEtSd
	ydiXlSdPW2DSlnv66gc1QH0aTxc112SI/if3cntcFmTGP/HoFCzZf0Xr4aWJMcomq4iXaq53K782k
	Cwgh2dJtiLW+6aM92rvLS8knj8AnbCkMEtMTY6vTzwN3rAYVgKcN1YQDOXbVeqCx90TchFa0POKBD
	GgF7XcXhJgGdzx6itNGhazRqN1rK6pFrRFAtMiP5MVNU35UmZW9z5r4JCvvGjFVdQhIKWJlHtY3Mu
	sc+CD+u71uzOfXqYZxfceB0NLTiP9aYl4hHZqEtKIKZHyqb7YKwQHSaiag5qCN6XlX3ojJ0twDJTQ
	uo7Y2QVamfcPHuZphnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgAbB-008x32-E9; Thu, 28 Oct 2021 18:58:01 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgAb8-008x1b-F9
 for ath10k@lists.infradead.org; Thu, 28 Oct 2021 18:57:59 +0000
Received: by mail-lj1-x235.google.com with SMTP id d23so11030364ljj.10
 for <ath10k@lists.infradead.org>; Thu, 28 Oct 2021 11:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mw+VDcV2kIndQWct5dm6yaq4vBp/HlTp8mqiaJHsvbg=;
 b=ICGC40s8o4poV1N11X+JXRkG65G5HiSh9m6kiy/MXKFbogpX5+e3xaC/U3w0X0hK7L
 RIVKJ36JuKUvhHSAzL1Ggg+RC5+nZt8Z4MoLAc07Xx1/hoRJwu5hCqjebga2Nj1K9jIn
 nDocNb4MoyZeW27InIJDB+jsoCQ+vcn5D+qmmkqVEiMyfVlciVnwqLADMq48u6QKC94y
 32jsEC8/XeBcJipMhANCYuHSvNNJJTIvGuO9YH7W7nln7iubrcMNrSqd8W0qQJ/9GPke
 099po2UkO61mWCI9Vqea2wr2vnVUL+hOa/KhmD2GB9zSoF45FbFna8FS118NL5+U7+eh
 Ez5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mw+VDcV2kIndQWct5dm6yaq4vBp/HlTp8mqiaJHsvbg=;
 b=7U5mEcnfMhAgal2nIrhxR+LQtyHab4SFUO1N/lSBBG2ryU9ewtTea0wTuSZacvlQpv
 XD79pdpYpRjxDZ7/zPA1YvRQQ70yyfT2qnf0L0z8acCvCArcPUVwFtgFgRsKKRtdj6pz
 sAwi0A9SCSWQ2nil4to3+WjTj+AE8j0tp8derNTxKefJ9n2QxIyN6hB/3WAe1vTYvN9i
 OKXXsBMNEe/DLWK3ONfez72qIRUoFEjH/SOk7++Ed2HE4OlcHi4iYcILSZReX9ku4IT/
 zvwfXebUukEUgRvITmuGVisnPP+kfC5H4MDE4u1lUEBXYQ2NCfjNv/QIhJMSc0QcZECI
 PPCA==
X-Gm-Message-State: AOAM533MtL+WbMt+bHrf5/ZcOYyH0DMrntmqUNI/ObfNf1SYYfPPhSW9
 x7J/ZC6E9rGu5NqUMUhn5LM/84iFLbsQyREBop0=
X-Google-Smtp-Source: ABdhPJy6w9QiUN2QnFSh27vBZFYIzNqbuYhYoH0/0aT2+EGXnwahFIOa+UM5Jx47XpDOwgcwu6QFyH5jRpBJh9Juuo8=
X-Received: by 2002:a2e:9b81:: with SMTP id z1mr6577518lji.518.1635447476629; 
 Thu, 28 Oct 2021 11:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211016234609.1568317-1-chunkeey@gmail.com>
 <87ee855xwa.fsf@codeaurora.org>
 <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
 <875yth5pt3.fsf@codeaurora.org>
 <3aebb711-dc45-3cbf-43cb-12f59909baf0@gmail.com>
In-Reply-To: <3aebb711-dc45-3cbf-43cb-12f59909baf0@gmail.com>
From: Ansuel Smith <ansuelsmth@gmail.com>
Date: Thu, 28 Oct 2021 20:57:45 +0200
Message-ID: <CA+_ehUxFDUE6BU3TbngKOA-VKCBkTnpOv7ibTjtpur37KrQ4Jw@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: fetch (pre-)calibration data via nvmem
 subsystem
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_115758_536842_B4B060C9 
X-CRM114-Status: GOOD (  25.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

>
> On 28/10/2021 13:52, Kalle Valo wrote:
>
> >>>>
> >>>> v1 -> v2:
> >>>>    - use %zu and %u in the format string for size_t
> >>>>             and u32 types (catched by the "kernel test robot").
> >>>>    - reworded commit message + successfully tested on QCA9880v2
> >>>>
> >>>> I placed the nvmem code in front of the current "file" method
> >>>> (firmware_request). Reason is that this makes it easier for me
> >>>> to test it. If needed it can be moved to a different place.
> >>>
> >>> Looks good to me. Before I apply this, I want to mention to that I have
> >>> had a long in my deferred queue related two patchsets:
> >>
> >>
> >>> https://patchwork.kernel.org/project/linux-wireless/patch/20200927192515.86-1-ansuelsmth@gmail.com/
> >>> https://patchwork.kernel.org/project/linux-wireless/patch/20200927192515.86-2-ansuelsmth@gmail.com/
> >>
> >> Oh ok, serves me right for not looking thoroughly googling this first.
> >> Alban Bedel and Ansuel's work made this nvmem all possible. And indeed,
> >> the second patch here looks eerie similar.
> >>
> >> Do you want to go with his two patches instead?
> >
> > I would prefer to take your patch.
>
> Ok.
>
> >> I'll change mine, so it just consists of the cal_mode for the older
> >> QCA9880v2,QCA9887 and add the -EPROBE_DEFER handling. This
> >> -EPROBE_DEFER only ever comes up with the Meraki gear. This is because
> >> Meraki likes putting the MACs-Values into SoC-connected AT24
> >> eeproms-chips. Everyone else just have them in a proper FLASH
> >> partition. Though, this's usually nothing more than adding the
> >> following line:
> >>
> >> if (ret == -EPROBER_DEFER)
> >>      return ret;
> >
> > So I'll drop this version and wait for v3?
>
> I guess that "waiting for v3" won't be necessary in this case.
> If @Ansuel doesn't voice any concerns, you might as well just
> apply v2.
>
> The "[1/2] ath10k: Try to get mac-address from dts" patch
> will need a respin, so it can apply cleanly.
>
> Is Anyone interested? If not, I can take a shot at it on Saturday.
>

A refreshed patch is applied to atk10k-ct repo so it would be good to
have the same patch on normal ath10k. Many router would benefit
from that.

> (There's the tiny question of that device_get_mac_address() which
> ath10k currently uses. It looks a lot like of_get_mac_address() too!
> but with extra ACPI (through FWNODE-which also includes OF), but
> without NVMEM.)
>
> Cheers,
> Christian

About this I never manage to understand the priority... Should ACPI
variant have priority and fallback to the OF api or the OF api should
overwrite any mac if a nvmem cell is found?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
