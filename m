Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F494CD484A
	for <ath10k@archiver.kernel.org>; Wed,  4 Sep 2024 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVf3bmoYZ2Rhk2M3ClOT57P+z3vtqToxptk4Q5bh6lI=; b=ihJvSpsX9FMon7pm4TCeAE7b+B
	dNqqJ+qwQrVpYo/pH40+BsT8gNv5dsq9KRYw876WghZ3Ljuqtjj4Bu8JHQKWTqxGKxnZkBwZMwph/
	Q1/O9/sB3ghcsFDfWjH+L6oodmuC0Sf/WQ/B+9ySO/X+4oMiifQghiy7O+vOvSaQQDyfdmQBMdl1C
	ZA3W2b/ImrNqEJ5Cvg0XCLFSYj56aIiNcC24Su0Qr231DdM/z8yriz0ArpTa/JFS9ILkY13uRFRFn
	xzUe5hOI3IwcisrtuU0uCzmxmsw5X9hOXoAp3xechf0TY3Vb8j2JQcC33Ep2EY2rvEhJZ6KbcdEAr
	NKWAI3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrKX-00000004rRv-0wRA;
	Wed, 04 Sep 2024 14:49:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrJ3-00000004r5t-0gdI
	for ath10k@lists.infradead.org;
	Wed, 04 Sep 2024 14:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7D695C463E;
	Wed,  4 Sep 2024 14:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63793C4CEC6;
	Wed,  4 Sep 2024 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725461303;
	bh=aSgyay04rukkSKGyNBhfbxPLHP5fFfaqSa1WJf5ZLLc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=b3018xlu7QLwoY8krfOJEpp46QB0pBmlOkn5EtTAJeb5aEZCAi7RDgN2RvCv/APQv
	 7gTc9+IiF8duZDpW8td8kZdTzc70iFf65C0Gzvb9/MMb1W88wcC73DwWqL9YsEbp9x
	 64m38WOwjO+7Cwc8XIDdjRd5Gn/Nf6MWE5CEDOnRrm7T8cUOI0+hyLDtqEoEV/AA8I
	 eFdWdzcn+GRluvBxxR6rBrYWxaQH1hi4LI/YyJYldJaISP5G/Yc+58Hl/XTG0IMaFI
	 THdGawCOnativ+acb2RiTt/dF/vzTbHOTxC20f+v1+LT1QEe5t2dc8jAbxdu8TT1Mj
	 e9obJEKbU5hJg==
From: Kalle Valo <kvalo@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  James Prestwood
 <prestwoj@gmail.com>,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  LKML <linux-kernel@vger.kernel.org>
Subject: Re: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware
 (-110) (ETIMEDOUT)
References: <d8253ab3-f4f0-40fd-a550-d75eef121b56@molgen.mpg.de>
Date: Wed, 04 Sep 2024 17:48:20 +0300
In-Reply-To: <d8253ab3-f4f0-40fd-a550-d75eef121b56@molgen.mpg.de> (Paul
	Menzel's message of "Wed, 4 Sep 2024 12:45:01 +0200")
Message-ID: <87bk13jwzv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_074825_315563_99A5F410 
X-CRM114-Status: GOOD (  11.19  )
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

Paul Menzel <pmenzel@molgen.mpg.de> writes:

> Dear Linux folks,
>
>
> Linux 6.11-rc6+ logged the warning below when resuming from ACPI S3
> (or unloading and loading the `ath10k_core`/`ath10k_pci` modules)
> having been connected to an AVM network:
>
>     wlp58s0: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware
>     (-110)
>
> Error code 110 is the value for ETIMEDOUT. I saw James patch [1], and
> applied it, and the error is still there (as exepected).
>
> Can the warning be improved so the user know, which component is at fault?

The warning comes from mac80211 and it already contains your network
interface name (wlp58s0). What else would you want to see?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html

