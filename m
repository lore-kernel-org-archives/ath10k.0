Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65514C3DA4A
	for <ath10k@archiver.kernel.org>; Tue, 20 Aug 2024 07:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YJ31/mvFWQvwCB13NgtSMTOc3NEQzYFfp9m3vbJmsWo=; b=zuQ0X6Rub9ykGRW4m/Sy0qI0di
	Dy8GJ/hD7AZ7zXE7HOHPfLa8f9Tig3ANnskOzPcA4KiAGXtzUI2vnUYRT2Mgqv9Rx8KsnXI8DpN/O
	3yi6td665H2rduk9ftlhM+hdK9OA8fK1oblYxAUWPEITyiWgSbqDfWQR+vULXAIMeL7S3snXwHguQ
	yM1Y2tFuC7dkzN93CteyDdiQpKFQia3TOtk6Q987RsHC37sy51P6OKywJungWZmGJWqjo1sYkGM5g
	zgN5hCbaBxKy+x1qH2rkvr0ROhj/yWIIX52XzCvvJsA+cEp6YYC7FzqVgQ/3KtUtqyFgLgOz4b53i
	oupInbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgIs7-000000047P9-0DSx;
	Tue, 20 Aug 2024 07:01:39 +0000
Received: from a7-30.smtp-out.eu-west-1.amazonses.com ([54.240.7.30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgIs4-000000047Oe-3S0n
	for ath10k@lists.infradead.org;
	Tue, 20 Aug 2024 07:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724137294;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:Feedback-ID;
	bh=i0dJ9Pixk8KIFYTtdhBHJuuxQlvG3l15VuA7hgOaOB4=;
	b=FPiMOuR6EesqweD5raGhY40G8whAGuVz+sb0vzd+aSJrkBqk/4bHU37cjceMeAGR
	qjQO7dqKEPnr2QxZ1vHsV4XtF5Ax8HWX+gzbJ3RWn7QhAVj9ZIHbPnt/nX+SwPqR0k8
	3E4ZHke3K8o5KZ7qd2NzM8m8hk1ZY7e6kuQA6+ao=
Date: Tue, 20 Aug 2024 07:01:34 +0000
From: Riku Voipio <riku.voipio@iki.fi>
To: ath10k@lists.infradead.org
Subject: ath10k usb support status
Message-ID: <010201916e974ab7-0dee7485-07f9-458f-a0e8-d49e8e756a44-000000@eu-west-1.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Feedback-ID: ::1.eu-west-1.eQtNY3bfGboUEo0vzk/Zj4VaHDTS//4rWFBnt7DEpfU=:AmazonSES
X-SES-Outgoing: 2024.08.20-54.240.7.30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_000137_021405_63F9296A 
X-CRM114-Status: UNSURE (   4.13  )
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

Hi all,

I note drivers/net/wireless/ath/ath10k/usb.c comes with the warning:

    /* TODO: remove this once USB support is fully implemented */
    ath10k_warn(ar, "Warning: ath10k USB support is incomplete, don't expect anything to work!\n");

Is this still the state? If so, Is there alternative USB-connected chipset with good mainline support?

Regards,
Riku


