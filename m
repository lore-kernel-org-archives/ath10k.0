Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB560EEAA5D
	for <ath10k@archiver.kernel.org>; Thu, 14 Sep 2023 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6e4haU0Gj/y4xEwGvELOBAVczHcxDvNr59AadBlP+k=; b=gYEwtOClaMvH4U
	W+6atQMB+aOKP/sWx02ngssAYg14qoLqkubz9PTVJlgbXAEdfRglijWbE8zroOMBzoXuZjR1+AgeL
	LGmjbH7yUYWGFrv+0fANkJWK/jxHRRTne9QXU2CjcJPu2NHOL7O+ASBjzXll4W7V9NL/VdmIyevFl
	zySUA4UCU08xz0nhxRKFzBq0eX/bbkF3t7U3FjwN79U8I+idfcYQ8io+VtSFngxZVTS5XXORsAdbo
	5jg1tnyLAcw2R4vRx1McxEglWIVqpQC/ud1zNlnBTUxB/Oq77UMwnaJivKQ9Wtzl6Y9CGnnHJgUkj
	KcYDYsIvI4t2x0Q8H6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqal-0091UF-12;
	Thu, 14 Sep 2023 17:57:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqah-0091Ty-0T
	for ath10k@lists.infradead.org;
	Thu, 14 Sep 2023 17:57:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6FDB5B82A4F
	for <ath10k@lists.infradead.org>; Thu, 14 Sep 2023 17:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3281C433C7
	for <ath10k@lists.infradead.org>; Thu, 14 Sep 2023 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694714240;
	bh=k8pO9KsFAQl05Y/mSOYBuwEqT2XGalqAWAOjTf3GPtk=;
	h=From:To:Subject:References:Date:In-Reply-To:From;
	b=q7QB66lUW4kgWrav/+sjUUDEy8fMufazk6BXYIYLtxYlKw/au77cetiZm0/ETtJDr
	 M//a2EmO9+YkK61TeufE5PJgLIhd/InpAV1w4GoMdElsTwphOlRaKp6DgC5clO1tQL
	 tJ9ci2xdc/0oxSS5KYuKOOboUwXLOh/7g0jl+l+CCl+EJoXdN1S3UCMv8vcuyFPlMg
	 n+4gowz/oznlaK3kUIq+fIIXYM2R5Szx/QNSMvxzR1gnz9VYKJSdpywYoH2UNZxY/j
	 yYzTkS+FePUA3Qt7VtkAz2ncbM2LxQyv01xWO+voiHwVkkmAPlG52/o0byaju/Ml8y
	 eI/sPdEUABcOQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath10k@lists.infradead.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 98897dc735cf6635f0966f76eb0108354168fb15
References: <202309150026.yDBEAFxR-lkp@intel.com>
Date: Thu, 14 Sep 2023 20:57:17 +0300
In-Reply-To: <202309150026.yDBEAFxR-lkp@intel.com> (kernel test robot's
	message of "Fri, 15 Sep 2023 00:17:28 +0800")
Message-ID: <877cosd4ea.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_105723_342990_EC70F795 
X-CRM114-Status: UNSURE (   8.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

(only to ath10k list)

kernel test robot <lkp@intel.com> writes:

> tree/branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> master
> branch HEAD: 98897dc735cf6635f0966f76eb0108354168fb15 Add linux-next
> specific files for 20230914
>
> Error/Warning reports:
>
> https://lore.kernel.org/oe-kbuild-all/202308162234.Y7j8JEIF-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308170007.OzhdwITj-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308170206.fZG3V1Gy-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308212225.fGjY1rr6-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308212225.rDBrZgwf-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308212348.1TirdKeg-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308220024.7HnE6uda-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308220527.8csCMbMU-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308230251.2EhAALdZ-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308241150.LquDYwGT-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308252255.2HPJ6x5Q-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202308282000.2XNh0K6D-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202309101830.7uQV4SMc-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202309122047.cRi9yJrq-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202309122155.dteFhtkC-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202309130213.mSR7X2jZ-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202309142221.vrrn5D06-lkp@intel.com
>
> Error/Warning: (recently discovered and may have been fixed)
>

[...]

> drivers/net/wireless/ath/ath10k/core.c:928:50: warning: '%s' directive
> output may be truncated writing up to 99 bytes into a region of size
> between 98 and 99 [-Wformat-truncation=]

Could someone take a look at this ath10k warning? I haven't seen it
before.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
