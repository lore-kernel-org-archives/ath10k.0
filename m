Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13423C87FCA
	for <ath10k@archiver.kernel.org>; Thu, 31 Jul 2025 18:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=08+kTVK5TnP77fGcL4psx1wkPldZFq12gIluqSusvjE=; b=TE394K9gBbLqP3n9SMOn985Cnj
	7QooiRWDZIRVcy2PMC5URPb1yDTvno7sq7FdBxeufxCxdhcUGTIbmX1qXBr8t8PTExsvTWkpwYQSe
	qv6vGOxdvtBI5vhx1/ZR0QW5KrOD2/1fBClOyPXKfiggsV1K16TzZdpidjGyhHMzHMIM/Of19CQfb
	T3MIBndCtz23LJ88YjW/+HT0NlpuAZyosoEXiW4BWj7neJi4ZimHTIvznD3EV8WaIpT/b3JZGq0vR
	XhmdN47wEm9EbtODM8miA0Wj+QyHehnugOKsznfmTbzQQfTiTmLfG6rXDg+E3DkxrFGaV0o6PWxhg
	MnuZLSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhYDo-00000004GH4-3yAD;
	Thu, 31 Jul 2025 18:41:44 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhYBG-00000004G67-2HEY
	for ath10k@lists.infradead.org;
	Thu, 31 Jul 2025 18:39:07 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-74924255af4so96235b3a.1
        for <ath10k@lists.infradead.org>; Thu, 31 Jul 2025 11:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753987145; x=1754591945; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08+kTVK5TnP77fGcL4psx1wkPldZFq12gIluqSusvjE=;
        b=O3/IY67HCmEL5wNJ0l6DFYW/mImu4tVoWRn3pyc7RoXoLlwyo5mqWW1QwNZyzwgIFO
         8eT6mmJMhcfUU4eW1b5zqLGNgLrcu65fcPjsD3WTNc9tOuCLK3UZ4f6fEMURb+OnDciX
         2Y9hMQVKi3utovuAjQfyEfuRZkAlI5T+zYhb8nRGh5STK6+VINpNwRpezepaxu1ceGws
         eUwh6LL0Ap1xsgWcW2DlIXi140rSTdVEBfpkT5FKCjyro/2d3xwOlPCLZa7iReoFFHPe
         mX4shruvZNfwSAOzIAlCAaHvlI09KaXSt8ogNS3NqlYJ1/gP16fBxdJVrjutP+720Jc+
         DQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753987145; x=1754591945;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=08+kTVK5TnP77fGcL4psx1wkPldZFq12gIluqSusvjE=;
        b=bPmkjiDENT5fdk5NKg8LCwg8sBr5OLJFYviyyRGhCGgkT1m01YkWVHsu9cD9oeYInA
         hMAuKofwTxofXVrjJ3rVnEdO7nNezY4+jRhqjcE21bEUdlLGCxgz+xfIMMq46Oix1dWn
         WqeYoE7YCepYRJMXN8b3xsUtwjFvQerSm5wfuZlLjrpR3klzwwVTezK0nHaok6MKFkR2
         Rrm7dMVX4e7CUc16lnX8/Q+SaOZd9jtuBnzVoObLrNrmYABVcVwxAPa+5kfOPzgDNPiT
         zJ1XH5ChmI6n4NHjxlXHSlC90bkV0em8yn1WmoO6EUbxW0GlM66LnBG9d2UgkQNI6YGQ
         l6IA==
X-Forwarded-Encrypted: i=1; AJvYcCWHKvXeMhNuI1DSUQgClBedNz/2cQEU8XlSL7cU1Lw6BalbWoI3eLzqApqsQxwbexuBSlP0s6o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsidZ7EWTA2LHwlIXDVIeaEcVV5tApdDkb96pi/IuX0N2Iasps
	ef1wyZ1RWzrBlbdcxRq8iU6wGPfC+BIQG84FoqYl/C1fM9o8D7OOkE4+
X-Gm-Gg: ASbGncudySZbuDua3w5UYanfAth5Vx4ZcyUZwf4TImHbbVCae6ewogFj4Sttat0rkrQ
	pty+VDOmNV1F5clbI5oI899sKNBcE8oLo645BqL7G8spdmMZMZkGD0X8PbeiNKiKIOI3Qp4vfOm
	qcUDuKR9RbzvEGNcN+KO1mk9FMHxtWeNkiiyIJs+zuS8bLSZCczi7js41yeJC0Sr/qHvrDn8nm3
	1pUwx0nMmH/R69H68ioUydzrnVgbCxW73qcawuYrlyqScEjX1E3nM9GSZKPjVHOHWhS2Rc7d6w+
	pXCWWo4RQj+kNE1FZY0VBFRPpg6S7vL+9lkL2yXdviGwyGWUWhMlQ2SQ9NGj7hIC7MIxu2iyvLD
	5zZupDHpV81yqRkBIVZa0R6hNlLxCbZXmJ+mvdZoaS0bP
X-Google-Smtp-Source: AGHT+IHj63wzFIZza3bhFHHm2SuHQrXkq+NcdithZPzDBHtJMrcMqRLH/EYYvu3LV+cDzB36l9LcKA==
X-Received: by 2002:a05:6a00:1486:b0:76a:d724:d71d with SMTP id d2e1a72fcca58-76ad724dd83mr13778547b3a.8.1753987145482;
        Thu, 31 Jul 2025 11:39:05 -0700 (PDT)
Received: from [192.168.0.119] ([115.187.48.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfecf2fsm2238064b3a.129.2025.07.31.11.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 11:39:05 -0700 (PDT)
Message-ID: <2b41300c-2034-4cad-8549-2622c224330f@gmail.com>
Date: Fri, 1 Aug 2025 00:09:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
 ath10k@lists.infradead.org
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Subject: Packet loss with QCA9377 (ath10k) on ASUS VivoBook E410KA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_113906_580982_6B76BB7D 
X-CRM114-Status: UNSURE (   5.75  )
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

Hello,

I'm helping someone who was having trouble with their Wi-Fi on Asus 
VivoBook E410KA. The device uses the QCA9377 Wireless Chip.

The device suffered from a single packet loss within 33 seconds while 
running a continuous ping. There might be some PCIe-level communication 
problems too.

All the relevant logs can be found here in a redacted form:

First part (ping, hostnamectl, ip addr, lspci): 
https://gist.github.com/BandhanPramanik/7eefd192c3a728d2473687a786fbbc01/raw/e77f0fa1cf35c748730df220b0057399ac78f539/miscellaneous

Second part (cat /proc/interrupts, modinfo ath10k_pci): 
https://gist.github.com/BandhanPramanik/7eefd192c3a728d2473687a786fbbc01/raw/e77f0fa1cf35c748730df220b0057399ac78f539/miscellaneous%25202

dmesg: 
https://gist.github.com/BandhanPramanik/7eefd192c3a728d2473687a786fbbc01/raw/e77f0fa1cf35c748730df220b0057399ac78f539/dmesg

We’re not sure if this is a driver issue, a firmware problem, or maybe 
something hardware-specific.

Has anyone seen something similar with this chip? Any tips on how to 
troubleshoot or fix the packet loss?

Thanks,

Bandhan Pramanik

বন্ধন প্রামাণিক


