Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D851C3DA7F
	for <ath10k@archiver.kernel.org>; Mon, 12 Aug 2024 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqKGKKqYZldjBD7eez+Zmz6JQMXIJ89pfJY7GpLN8AI=; b=bYMj3XFPZmWv8goARr3DoCyyUN
	UvpXH2uYVH8Q/tOFwMKp5aZ7onsvEA45yEBfyCDtCC+W6Ld6hbGob327qD9QPBfDl6VKPFsZrPRKV
	6yohihg023MEndADO3ShaDGmlsu8eGPRcZYji4FXS052vWMnSfEpmA1MVt9EqlnxSs6pdCeGYPO8p
	/G2KhbOuXvvdVYrYAwkczzW/DK6eL/xzUOI1zc29IpQu1/itTlWwBpM7tMVxqtIuTfnf4S0xG9JoJ
	vwI3mr6VrLEvEg0WVxB1PVNY3D5OGjq5KRecGP9OFTDJJY1C+HKXmkLZeSnUnEOULOEhNy8Ig0mWr
	FByduPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdP4X-0000000H6IM-3xsx;
	Mon, 12 Aug 2024 07:02:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdP4V-0000000H6I1-1AFY
	for ath10k@lists.infradead.org;
	Mon, 12 Aug 2024 07:02:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3680E60FDE;
	Mon, 12 Aug 2024 07:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15464C32782;
	Mon, 12 Aug 2024 07:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723446145;
	bh=Q1we+g2Kf82ebRmd2zdBaMIkKNXc+TJk3q2/rStIRns=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=R1GvsBRnpcV8k2myB630F3uY/KrDzzfy4UNI1u+sLoT3m5rjv3XHJaChGO5wB5XWc
	 pzUJ6cwyGNgUA7n08/iYNUpDio7vmxtQ9W71Sdb+gO1K3tid2h0RhdkdCdOzatTsXe
	 3+xEhwweiK2QTZe0FI7wImAp0CTIYVY7F75/NnkIh7MmQGyGyXX5JGmKmNXQ2f+Gge
	 XYcog4zC7dhFGuR3DaUnjHPsROZkGlICve3fbRF7QF1oxYWQtonO/UOKzAfn6LeXGN
	 5cfIERNVhGxbty/TxY0WyaLA+5k0mLacLN0tTbvjVaryt+CP9FtkKLDgNfMgmvZDqe
	 KqDjQ3DNf2yNQ==
From: Kalle Valo <kvalo@kernel.org>
To: MOHAMMAD RASIM <mohammad.rasim96@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: [question] is it possible to enable monitor mode /packet
 injection on wcn3990
References: <CACq04CG8WCGDxf6Krx3bjxHU5OtYJJNOtD77TtPQhTfdy6ey_g@mail.gmail.com>
	<56BBE89F-FF40-47C4-A4B9-F492FD8F6E2A@gmail.com>
Date: Mon, 12 Aug 2024 10:02:22 +0300
In-Reply-To: <56BBE89F-FF40-47C4-A4B9-F492FD8F6E2A@gmail.com> (MOHAMMAD
	RASIM's message of "Sun, 11 Aug 2024 20:30:51 +0300")
Message-ID: <87zfpigr5t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_000227_377574_ADF5AD26 
X-CRM114-Status: UNSURE (   8.10  )
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

+ ath10k list

> I have a device that has the wcn3990 wifi chip that uses the
> ath10k_snoc driver, i tried to put it in monitor mode, the "set
> monitor" mode command succeed but can't get any scanning working after
> that, does the chip support such mode?has anyone tried monitor mode
> with this chip or other snoc chips?

I doubt that WCN3990 firmware supports monitor mode, though just
guessing here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

