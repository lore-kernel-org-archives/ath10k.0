Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F13BE77197
	for <ath10k@archiver.kernel.org>; Thu,  9 Jan 2025 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgSwxNfolHk6Q43Ui8rj5ZiMrbTvzZdhcJdBUBaAERY=; b=AXrxgA83Zp2B1nIBtwNRnwjo5H
	7fYyn7oaSvWejSKGgOx+/vgts8tVi9yNbWJX8dU3Q4q55E6pFLyWhTg4Ij5Gs3YgdPgfRdDDLAidg
	9D4HgAhoCKAr9BO3UMPa3xT3OMhtHqF/DvVbSXUcOXaMCAGUz9qExTXVL1LKzIaeZdf30NVAENe4t
	UmAZge+rnoYWQqdCrX79FuNge6ZGYpK9E1wvtrdemCLBgsdcxFz9cloUuazeyr3Rl+qAKLML0TVMR
	O5PEN8TB/CqH4ESueTdzeiQ4wY8xV+qoaMdXrnGnAbKcBxXj8m+rUGwpiCTgGf0O/8cFx9qZrdvJO
	k5BZKERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsCV-0000000Bw0f-2BAV;
	Thu, 09 Jan 2025 13:03:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsCT-0000000Bw0H-2CcF
	for ath10k@lists.infradead.org;
	Thu, 09 Jan 2025 13:03:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29C07A41B6C;
	Thu,  9 Jan 2025 13:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C529FC4CED2;
	Thu,  9 Jan 2025 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736427828;
	bh=N57htIgxqHB4759bpdKXhT7qhOV3adZnhD4UkokENow=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZU2SKfzqsNFilqfW9EY+uEmi7QllZLMKhgBRb5qCqBS0XB2vd2oiaQ4USE879ln7K
	 wX0MUdmlO7DQfe6DXWxyAVxrPxNvEMB6FBkF1oNjQu/3/VfdjQ5VQBpsUiC0tuVWoc
	 74V4Cdo6ynkbjDFcJNKldBClP23Q1jrHqlweCQYD+VWtPK1/uRd1WrHJceX1dUGOPZ
	 lrSZUvDs8g8iJHv79xJi2/WZCZQI0t/Qv3xxERkgay5hYnxNLidCVVLhA4ETI683Kn
	 6YEHDZ+HPACTD5+KNovsOoL1lSRUz9CWWSt1VfoqpOzQcCNq4W0PfM1omi+n8qYJi/
	 BETGB2SkzOVfg==
From: Kalle Valo <kvalo@kernel.org>
To: Remi Pommarel <repk@triplefau.lt>
Cc: ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Jeff Johnson <jjohnson@kernel.org>,
  Cedric Veilleux <veilleux.cedric@gmail.com>,  Vasanthakumar Thiagarajan
 <quic_vthiagar@quicinc.com>
Subject: Re: [RESEND PATCH v3 0/2] Improve ath10k flush queue mechanism
References: <cover.1732293922.git.repk@triplefau.lt>
Date: Thu, 09 Jan 2025 15:03:44 +0200
In-Reply-To: <cover.1732293922.git.repk@triplefau.lt> (Remi Pommarel's message
	of "Fri, 22 Nov 2024 17:48:00 +0100")
Message-ID: <87ldvkdtqn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_050349_626915_266A01A4 
X-CRM114-Status: GOOD (  16.15  )
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

Remi Pommarel <repk@triplefau.lt> writes:

> It has been reported [0] that a 3-4 seconds (actually up to 5 sec) of
> radio silence could be observed followed by the error below on ath10k
> devices:
>
>  ath10k_pci 0000:04:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
>
> This is due to how the TX queues are flushed in ath10k. When a STA is
> removed, mac80211 need to flush queues [1], but because ath10k does not
> have a lightweight .flush_sta operation, ieee80211_flush_queues() is
> called instead effectively blocking the whole queue during the drain
> causing this radio silence. Also because ath10k_flush() waits for all
> queued to be emptied, not only the flushed ones it could more easily
> take up to 5 seconds to finish making the whole situation worst.
>
> The first patch of this series adds a .flush_sta operation to flush only
> specific STA traffic avoiding the need to stop whole queues and should
> be enough in itself to fix the reported issue.
>
> The second patch of this series is a proposal to improve ath10k_flush so
> that it will be less likely to timeout waiting for non related queues to
> drain.
>
> The abose kernel warning could still be observed (e.g. flushing a dead
> STA) but should be now harmless.
>
> [0]: https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
> [1]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")

On what hardware and firmware did you test this? As they can behave very
differently knowing that is really important.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

