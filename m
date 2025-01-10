Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B03E7719C
	for <ath10k@archiver.kernel.org>; Fri, 10 Jan 2025 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6nPcemujhcaUpXh6mF3n+lPqFRLYr1FBovbwC4wdWs=; b=d9FkyYFJpWNHw/mNEKHZN++TyM
	FnfRgBHUepRwagtSYYuw8HVWkm+FdhQqpZL+WFDnqcx9TQj+jcycjebBipZvHQ4n0InbchqIY79VU
	nQF3n0Z243ilOXjSbJsS9djKnWS9vgvAv1/dRO2ZgyLDmgYr0AjIgs3OiLl2e8n5vzLFBcqke3ykw
	L4NHYsS0bvVhJn8Et4WTbMNlM7+f7ljrNBJT1ORAGcWH71yYeSBhj3THvuKh9n6MV3SNLyKMQLE0t
	aTHo/co85pyGm6A3gwfqTDxvwa30KO8mmADyt88CR4NzVG0vIFZwJWPxJNC0ebQOiGLHqAkkhK651
	aru3s8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWE83-0000000FGeq-0bwJ;
	Fri, 10 Jan 2025 12:28:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWE80-0000000FGdC-27qC
	for ath10k@lists.infradead.org;
	Fri, 10 Jan 2025 12:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4370EA41475;
	Fri, 10 Jan 2025 12:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6B9C4CED6;
	Fri, 10 Jan 2025 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736512119;
	bh=fFU+KELsOlSeFgOoShwCsHprcd4LKutco8qjr9j8o2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bVEc+R2JrzQSfEksFMdQpzaDFa5j4HzW5xMdbRGqwxqnNKQ5WWFYzf3ln/8jpVtWo
	 AeEiGRGjRgGDKx92oLFBHEbTf8UzGnKh39LioVxkud+h1Yy6Y0RHE8D6AAspHaJGtk
	 dGTsYa/idgAtWH4FhsZ7k9uIRWcd0LXOvGJ3GH4B7/bwSLqxFADqJlnE2mJHVPEVNk
	 tP4qZKh4rTlUqtKPFnSSTN+Fi+qXT/oMuaUoxxQTK6khtfjikVxEWtzqMk4MrZCl/W
	 coxcr6nfS8T7JaQsnQRoUOU8T7GhgeHpzKq0Tvo4rPOB0RJwcvMHCmhLw7iJNIKnSd
	 dc7WFSFStS1SQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  lvc-project@linuxtesting.org,  Fedor Pchelkin <pchelkin@ispras.ru>,
    ath10k@lists.infradead.org
Subject: Re: [PATCH] wifi: ath10k: add extra output check in
 ath10k_wmi_event_debug_print()
In-Reply-To: <20250110115024.1497597-1-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Fri, 10 Jan 2025 14:50:24 +0300")
References: <20250110115024.1497597-1-dmantipov@yandex.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Jan 2025 14:28:36 +0200
Message-ID: <87ed1asvij.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_042840_609947_1A0834A9 
X-CRM114-Status: UNSURE (   7.35  )
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

Dmitry Antipov <dmantipov@yandex.ru> writes:

> In 'ath10k_wmi_event_debug_print()', passing skb of the very weird
> layout may produce debug output of the zero length. In such a case,
> 'if (skb->data[i - 1] == '\n')' will trigger an access beyond skb data
> boundaries. So fix this by adding an extra check whether at least one
> byte of the debug output was really emitted. Compile tested only.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Suggested-by: Fedor Pchelkin <pchelkin@ispras.ru>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Adding ath10k list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

