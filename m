Return-Path: <SRS0=1Jc9=PQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC67C433F5
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 20:38:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF6C60F92
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 20:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DF6C60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4qBLHkJacZSd5n9GdhfjbZR7nlX3k3c82PhKGljgKI=; b=J9pc0l0+W1L+fR
	yJvj+zXWcDQO0l3mFcMEueFXCIV4uiph4rQhuoIEnZz8zTsi4j+VaLSud0HTsRL35bQ9BLSaHtQy4
	NrGWeiAurXiduiZ0sQRrUWYT7Opd4zWzxqpXddzVo6SozxMavPzV/DDXb50GXvc/Cqkpub+T+pMvw
	rZA0J8dS7+xeqOvSapDwRjz+rWpSRYYs+rEhIJqh5GPkxZVK8d3CO2IQH31IW51+TqT71oILSRKWP
	XZsF2yLLcSDviyl5Tobu1kvHs1At1QPtQrRLJCwd92dXNiNJ13sy9j9Os5UaAcSEVLnzItiC7NvFF
	v6Z0G2h/Py1BKMwYarug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgCAG-0093Xo-Tt; Thu, 28 Oct 2021 20:38:20 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgCAD-0093Wj-VS
 for ath10k@lists.infradead.org; Thu, 28 Oct 2021 20:38:19 +0000
Received: by mail-lf1-x12c.google.com with SMTP id j9so16172875lfu.7
 for <ath10k@lists.infradead.org>; Thu, 28 Oct 2021 13:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m748Ylk/42jFnseN0nSePnrxsWBhg1Gxw5o64vc/HiQ=;
 b=I8Tjpg0p7tNAGRqmM/T5wuG1h38R4L64v7g8CXycP8m4fhUnMXcgPfJyFiUedEBix+
 MHkp0SOBbN+gV9ZQnWjs0VBMdxLz6E0uuVBxO+FyueD6AFK7aGEsZjOvadVrD0/ncZgs
 Kd8ScIOmQIuNPD71x5DGby3GxOiqJCXOibM+c+By74IMcK3HcVS3SgZT0oJZCeMFFtX2
 CjtIXwEfHh7DQB6gLtypasmsDW7/AqtgTK/Pd2LK6ADkMMvQUdiKmahcS1yKHWPog+Yk
 4yyccxwKt6qp/0FNEk/M18MpND6NZJ8rJ1JXGgeke3ZBRU4WN9EO444VCXYbiHiGtjmu
 VqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m748Ylk/42jFnseN0nSePnrxsWBhg1Gxw5o64vc/HiQ=;
 b=iKUvW31eykusZtcB6mVdzfLlIKFX08FUcfcAR1fG2eT5jlWSOMGp1rpYsit6eZxZIr
 PX7t6NV/qw4r1etbjNedfsTKwlTrc4vPZHq8dGZxzkRLyLtAQ/VRETZi6IbvafIH4P5F
 1SiaOWiqeo8CGUxvH/6g8rZ9V/nYaOVn6rjhDOQoCK64i/uj1j7aOu+yg9C3xm00trV/
 FPeU4cQ6GhXCJj496uzVwPq+SkliUQFZ0Rq2HMKStmIRtNp+xK1vRQ/db9gcbJGmtNYc
 h0PXUkbK0oPRfBZJ2oAd0Nj5WRzKRZk07eKteEIZpudfQNJNTktvxJdtlWWdqYT9WdSh
 o+wg==
X-Gm-Message-State: AOAM530sOtOtCGGpoJXgtGCxWewxK7aOkn/w9MyIIVuy1lgCszDPnr1F
 pewe4PGRkhE7zzc78JjRc4zc2xuO1CuoahjSd4k=
X-Google-Smtp-Source: ABdhPJzzflckRfuz9r9492nVKVHj+QpvesCXckwIrvUCehouHlIU9rApdzCEgqVktJkljAhSMUvprPVEuW7Pi1Hbu5U=
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr6367525lfr.308.1635453494899; 
 Thu, 28 Oct 2021 13:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211016234609.1568317-1-chunkeey@gmail.com>
 <87ee855xwa.fsf@codeaurora.org>
 <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
 <875yth5pt3.fsf@codeaurora.org>
 <3aebb711-dc45-3cbf-43cb-12f59909baf0@gmail.com>
 <CA+_ehUxFDUE6BU3TbngKOA-VKCBkTnpOv7ibTjtpur37KrQ4Jw@mail.gmail.com>
 <e6936f55-6ca7-209c-8c3f-5eeae879c9dc@gmail.com>
In-Reply-To: <e6936f55-6ca7-209c-8c3f-5eeae879c9dc@gmail.com>
From: Ansuel Smith <ansuelsmth@gmail.com>
Date: Thu, 28 Oct 2021 22:38:04 +0200
Message-ID: <CA+_ehUymo1nQ8bzkBNKQttWgFpWz7vNs8-jj2Wo+3hkEXHYx4w@mail.gmail.com>
Subject: Re: new "[1/2] ath10k: Try to get mac-address from dts"
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_133818_061129_E5C10EA0 
X-CRM114-Status: GOOD (  34.81  )
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
> On 28/10/2021 20:57, Ansuel Smith wrote:
> >>
> >> The "[1/2] ath10k: Try to get mac-address from dts" patch
> >> will need a respin, so it can apply cleanly.
> >>
> >> Is Anyone interested? If not, I can take a shot at it on Saturday.
> >>
> >
> > A refreshed patch is applied to atk10k-ct repo so it would be good to
> > have the same patch on normal ath10k. Many router would benefit
> > from that.
>
> Found it!
>
> https://github.com/greearb/ath10k-ct/commit/e6a7d5b5b834737cd12e357b5efdc2e42d923bf6.patch
>
> Hmm, Author is now "Ben" and the whole commit message is gone.
> Now, adding the commit message back from your original patch
> is not a problem, but the missing "Signed-off-by" from him and
> you might be.
> ...
>

Let's use the patch in ath10k. Seems cleaner and ready to merge.
(probe_defer to handle)
https://github.com/openwrt/openwrt/blob/master/package/kernel/mac80211/patches/ath10k/984-ath10k-Try-to-get-mac-address-from-dts.patch

> But then, do we need it? Because there might be the option to extend
> device_get_mac_address() instead?! ...
>

That is also my concern... It would be good to add support for nvmem in
the device_get_mac_address().

> >> (There's the tiny question of that device_get_mac_address() which
> >> ath10k currently uses. It looks a lot like of_get_mac_address() too!
> >> but with extra ACPI (through FWNODE-which also includes OF), but
> >> without NVMEM.)
> >>
> >> Cheers,
> >> Christian
> >
> > About this I never manage to understand the priority... Should ACPI
> > variant have priority and fallback to the OF api or the OF api should
> > overwrite any mac if a nvmem cell is found?
>
> Hmm, from what I know the device_/fwnode_*() functions are just wrappers
> for either ACPI (on systems with ACPI - x86 and ARM) or OF (on systems with
> Device-tree) functions... (There is also "software nodes", I think these are
> the lookupd stuff that came up recently with APU2 + MX100)
>
> This confused me too. But I might be able to show this in the context of
> ath10k-ct's current ath10k_core_probe_fw() and this threads new subject:
>
> <https://github.com/greearb/ath10k-ct/blob/e6a7d5b5b834737cd12e357b5efdc2e42d923bf6/ath10k-5.15/core.c#L4044>
> copied in here for a better reading experience:
> |
> |device_get_mac_address(ar->dev, ar->mac_addr, sizeof(ar->mac_addr));
> |
> |/* Try to get mac address from device node (from nvmem cell) */
> |of_get_mac_address(ar->dev->of_node, ar->mac_addr);
> |
>
> The device_get_mac_address() will on OF platforms essentially check and
> process the same "mac-address", "local-mac-address" and "address" OF
> properties of the same device-tree node as the following of_get_mac_address()
> will do. There's no priority.
>

The question was with the strange case of both device_get_mac_address and
and of_get_mac_addressproviding a mac what should be taken? In the current
implementation of_get_mac_address sets the mac and has priority.

> I think now, that instead of adding of_get_mac_address() into ath10k,
> the time might be better spent asking what's the goal for device_get_mac_address() is.
> Is device_get_mac_address() poised to usurp of_get_mac_address()? And if it
> is: Should it be extended to get that "mac-address in nvmem-cell" as well?
> Because then we don't really need to touch ath10k at all (well, maybe except
> for -EPROBE_DEFER handling).
>

To me it seems device_get_mac_address is used as it has ACPI support and
fwnode seems a better implementation of the OF api.

Anyway yes i think the current patch should handle the error as nvmem can
return probe_defer error.

> Cheers,
> Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
