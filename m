Return-Path: <SRS0=1Jc9=PQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8311DC433F5
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 20:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A23610EA
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 20:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40A23610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IflYJW/fxtPj9Y0ej+fToQeiX6KPU+fVyKDfwmH7ZcE=; b=oqSAkGxi6uCwH9
	U/pkCq8suZdxMuUl1o+3Y1e9+PvxSZGlgTCN1dNjpOlDc4UOeQfgtuUDUGzfCYDxd7KsDmA7YW8fg
	bwizKylkjcafWrCLV0IqGkwk4/VbBkRzn9NgjKSNgTfaq4/nM2Mypnsi/WNZ6Xq8Cl34NB/4qA03V
	ZF47GRDMwBQ8F5RtycUdEoKkY1hBtsw45J1hBCT4yO3JkuiQG2ngI9/NPWgSmaRxLecwFlcYafP2T
	hvWaSaYBmdjGQo2Fj/2wPH3kOhVUvO1AMNJLVs4bVFbV7WqrXuubjf1Ocb7b2bM6Xf9CA3/XWVlVl
	xnhwK2XaoCjb6twfcYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgC1r-0092uQ-Hf; Thu, 28 Oct 2021 20:29:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgC1o-0092ti-88
 for ath10k@lists.infradead.org; Thu, 28 Oct 2021 20:29:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso2413840wmd.4
 for <ath10k@lists.infradead.org>; Thu, 28 Oct 2021 13:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UNdKYXhS7qV0l6wjFDAccaOC7L4yMliNcw90vERiz8Q=;
 b=maxwUy6iRwTx4f2NDKdA3IJIrec8wTUIllsMDdNTPs6/SA8sJ+Fdoo5Y363JbyUzoH
 RYHbMOaxAWzycLypTYL9pNdNo9G7qY3EzILR8mb+67aHcu9qFbldb7LEZsFyxrDUHFO9
 D9I+0WUG194gfIPhyjmfRgoXEvU3bdbxEH7x5elx99La2MCPTVwPpmHzL0NCzxW0Gef1
 DzwSf+d+ejquOursnI06rCrFG889ghsqK3ywx9BR3/VMXHH2yqwpvAkp/4G4+sNppu/1
 uMJXUN/5HfJMnbzvjm7P812Z5q6Q0dzZ5yCwjr/Mfv1BMuyj9R564Z8l1kLIq0rOcvmS
 aBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UNdKYXhS7qV0l6wjFDAccaOC7L4yMliNcw90vERiz8Q=;
 b=nAuwHQU8kfysZc0jnARKHGQbp0pO1A8P0TTAAmfzLyHQkaYx0NGyFp7TyehgQVh95H
 GmaJdtsdrVUb/AxdRCzoAGsrhbm4v+NB8azJwJoZppkqsNzaPkSeN76e+yoO0BTp62TH
 4yAS8eGUeLBwcFKU7vQcZC881nr0X2uv6mpd+ZSDhn9NIDN68NJLvwtm9ITreOgbTLna
 pwyC29LncDjfHIVrDRvWqG9fqDmICvoUqJtKAyZxS4ZAZJ3jFZF62ZSsK73yVz5GZ/IB
 +PmFs+S2Bn3tsVZrQJlOBxlOiPC/Fp7Oiaj+nZCVl2KPQAwHjEVo265AOtvaCqqNwSiP
 XTkQ==
X-Gm-Message-State: AOAM532nkYthunYI2qtUGnIR+nkhnS6/ZwQiPlcjeZZVXjKWixgg/+PD
 9en4NDGb+r/QjfM/JtdTluQ=
X-Google-Smtp-Source: ABdhPJwEzpK17orfuCeujJO9/8hy/wGOYVfWtt+rhkncma8YjBkMWhivmgTzWzhjPjN+OL5XnxhJvQ==
X-Received: by 2002:a1c:a405:: with SMTP id n5mr6636097wme.49.1635452972946;
 Thu, 28 Oct 2021 13:29:32 -0700 (PDT)
Received: from debian64.daheim (p5b0d7857.dip0.t-ipconnect.de. [91.13.120.87])
 by smtp.gmail.com with ESMTPSA id
 l20sm8476656wmq.42.2021.10.28.13.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 13:29:32 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1mgA8q-000CCq-U7;
 Thu, 28 Oct 2021 22:29:31 +0200
Message-ID: <e6936f55-6ca7-209c-8c3f-5eeae879c9dc@gmail.com>
Date: Thu, 28 Oct 2021 22:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: new "[1/2] ath10k: Try to get mac-address from dts"
Content-Language: en-US
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <20211016234609.1568317-1-chunkeey@gmail.com>
 <87ee855xwa.fsf@codeaurora.org>
 <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
 <875yth5pt3.fsf@codeaurora.org>
 <3aebb711-dc45-3cbf-43cb-12f59909baf0@gmail.com>
 <CA+_ehUxFDUE6BU3TbngKOA-VKCBkTnpOv7ibTjtpur37KrQ4Jw@mail.gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <CA+_ehUxFDUE6BU3TbngKOA-VKCBkTnpOv7ibTjtpur37KrQ4Jw@mail.gmail.com>
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_132936_333983_436ECC7D 
X-CRM114-Status: GOOD (  20.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 28/10/2021 20:57, Ansuel Smith wrote:
>>
>> The "[1/2] ath10k: Try to get mac-address from dts" patch
>> will need a respin, so it can apply cleanly.
>>
>> Is Anyone interested? If not, I can take a shot at it on Saturday.
>>
> 
> A refreshed patch is applied to atk10k-ct repo so it would be good to
> have the same patch on normal ath10k. Many router would benefit
> from that.

Found it!

https://github.com/greearb/ath10k-ct/commit/e6a7d5b5b834737cd12e357b5efdc2e42d923bf6.patch

Hmm, Author is now "Ben" and the whole commit message is gone.
Now, adding the commit message back from your original patch
is not a problem, but the missing "Signed-off-by" from him and
you might be.
...

But then, do we need it? Because there might be the option to extend
device_get_mac_address() instead?! ...

>> (There's the tiny question of that device_get_mac_address() which
>> ath10k currently uses. It looks a lot like of_get_mac_address() too!
>> but with extra ACPI (through FWNODE-which also includes OF), but
>> without NVMEM.)
>>
>> Cheers,
>> Christian
> 
> About this I never manage to understand the priority... Should ACPI
> variant have priority and fallback to the OF api or the OF api should
> overwrite any mac if a nvmem cell is found?

Hmm, from what I know the device_/fwnode_*() functions are just wrappers
for either ACPI (on systems with ACPI - x86 and ARM) or OF (on systems with
Device-tree) functions... (There is also "software nodes", I think these are
the lookupd stuff that came up recently with APU2 + MX100)

This confused me too. But I might be able to show this in the context of
ath10k-ct's current ath10k_core_probe_fw() and this threads new subject:

<https://github.com/greearb/ath10k-ct/blob/e6a7d5b5b834737cd12e357b5efdc2e42d923bf6/ath10k-5.15/core.c#L4044>
copied in here for a better reading experience:
|
|device_get_mac_address(ar->dev, ar->mac_addr, sizeof(ar->mac_addr));
|
|/* Try to get mac address from device node (from nvmem cell) */
|of_get_mac_address(ar->dev->of_node, ar->mac_addr);
|

The device_get_mac_address() will on OF platforms essentially check and
process the same "mac-address", "local-mac-address" and "address" OF
properties of the same device-tree node as the following of_get_mac_address()
will do. There's no priority.

I think now, that instead of adding of_get_mac_address() into ath10k,
the time might be better spent asking what's the goal for device_get_mac_address() is.
Is device_get_mac_address() poised to usurp of_get_mac_address()? And if it
is: Should it be extended to get that "mac-address in nvmem-cell" as well?
Because then we don't really need to touch ath10k at all (well, maybe except
for -EPROBE_DEFER handling).

Cheers,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
