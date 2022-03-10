Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDC5C433EF
	for <ath10k@archiver.kernel.org>; Thu, 10 Mar 2022 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ut7LTM3O1cME2G8W++cTDOiVjU50FEKzO/9+8oIUtL0=; b=KldcJH2ZgwvyhK
	+MGIJ9H6/ZEFvpNF4gNuVNQrE4pOlB7xYE3XDynyqYrCxd05BJwR3KIgqVW2aWDNZ4kpgR/qRAnRG
	LFznaZTUF71Mmpq8zLce8Smn1jFH0uQde/g25K6OCDZ467lH4btajy3yV3EiyMjwM09kVHmGACDCy
	0tPMA0VQNsK9QbaQPZAY73X6PvxJNYz3XRAhyiFwXUWPonPbz5RMwd/QwhKEf3weu7VVR8iNWj75M
	bk+NWnjE38A1Tx0V502JvNUbt+Vs9Ax9w4iIZ2NtdYxUPllGuYyzT9MPDqo4u95Vd6Pl6f9ObcwUk
	qE0/XMbF8iE0R80/KJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSFgv-00CIGT-Gq; Thu, 10 Mar 2022 10:06:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSFgF-00CHxX-Uh
 for ath10k@lists.infradead.org; Thu, 10 Mar 2022 10:06:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F9FB61D77;
 Thu, 10 Mar 2022 10:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5059C340EC;
 Thu, 10 Mar 2022 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646906758;
 bh=ZB0Y7Z+2Ou6Nqam8tSjvOtOle2fii9Lnw44DFOuOFmI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=HnELMryBkJ8+AIisKOhSdaaVLncNsWXxhw3J+DhyTsSNEiQ1yy0/+RpFM5l4+P7/a
 PPiWCiaTwYgpXJx+jmFXCCcVj5oC+G4RjfLYLafQyiQ9+r8abgRodfhPTgrcLj3Ymm
 P/qr/gzGdfDM8aC+kHGBxArHyDQRVQVZ7lL/oXsUEOtZlkeTFyAHxxkJ1YL5nQtZey
 VCas8KDqrCADG/vTYi+IO3pk/7+rOKX6HTPVqf7r2seSeBjixNujpAzEAAJlJpMVUm
 9wP8ASjId5xU2f059mmUH+iEOw+GJyfFg1611Y29uHgtKHKIdc0IIEWEe4xTi4P1BF
 MC+dY9HYG0ecw==
From: Kalle Valo <kvalo@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>,
 Rakesh Pillai <pillair@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath10k <ath10k@lists.infradead.org>, netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH 1/2] ath10k: search for default BDF name provided in DT
References: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <CAD=FV=W5fHP8K-PcoYWxYHiDWnPUVQQzOzw=REbuJSSqGeVVfg@mail.gmail.com>
Date: Thu, 10 Mar 2022 12:05:53 +0200
In-Reply-To: <CAD=FV=W5fHP8K-PcoYWxYHiDWnPUVQQzOzw=REbuJSSqGeVVfg@mail.gmail.com>
 (Doug Anderson's message of "Fri, 7 Jan 2022 13:22:45 -0800")
Message-ID: <87sfrqqfzy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_020600_104847_5D6BDC7D 
X-CRM114-Status: GOOD (  32.03  )
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

Doug Anderson <dianders@chromium.org> writes:

> Hi,
>
> On Fri, Jan 7, 2022 at 12:05 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
>>
>> There can be cases where the board-2.bin does not contain
>> any BDF matching the chip-id+board-id+variant combination.
>> This causes the wlan probe to fail and renders wifi unusable.
>> For e.g. if the board-2.bin has default BDF as:
>> bus=snoc,qmi-board-id=67 but for some reason the board-id
>> on the wlan chip is not programmed and read 0xff as the
>> default value. In such cases there won't be any matching BDF
>> because the board-2.bin will be searched with following:
>> bus=snoc,qmi-board-id=ff

I just checked, in ath10k-firmware WCN3990/hw1.0/board-2.bin we have
that entry:

BoardNames[1]: 'bus=snoc,qmi-board-id=ff'

>> To address these scenarios, there can be an option to provide
>> fallback default BDF name in the device tree. If none of the
>> BDF names match then the board-2.bin file can be searched with
>> default BDF names assigned in the device tree.
>>
>> The default BDF name can be set as:
>> wifi@a000000 {
>>         status = "okay";
>>         qcom,ath10k-default-bdf = "bus=snoc,qmi-board-id=67";
>
> Rather than add a new device tree property, wouldn't it be good enough
> to leverage the existing variant?

I'm not thrilled either adding this to Device Tree, we should keep the
bindings as simple as possible.

> Right now I think that the board file contains:
>
> 'bus=snoc,qmi-board-id=67.bin'
> 'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_LAZOR.bin'
> 'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_POMPOM.bin'
> 'bus=snoc,qmi-board-id=67,qmi-chip-id=4320,variant=GO_LAZOR.bin'
> 'bus=snoc,qmi-board-id=67,qmi-chip-id=4320,variant=GO_POMPOM.bin'
>
> ...and, on lazor for instance, we have:
>
> qcom,ath10k-calibration-variant = "GO_LAZOR";
>
> The problem you're trying to solve is that on some early lazor
> prototype hardware we didn't have the "board-id" programmed we could
> get back 0xff from the hardware. As I understand it 0xff always means
> "unprogrammed".
>
> It feels like you could just have a special case such that if the
> hardware reports board ID of 0xff and you don't get a "match" that you
> could just treat 0xff as a wildcard. That means that you'd see the
> "variant" in the device tree and pick one of the "GO_LAZOR" entries.
>
> Anyway, I guess it's up to the people who spend more time in this file
> which they'd prefer, but that seems like it'd be simple and wouldn't
> require a bindings addition...

In ath11k we need something similar for that I have been thinking like
this:

'bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_LAZOR'

'bus=snoc,qmi-board-id=67,qmi-chip-id=320'

'bus=snoc,qmi-board-id=67'

'bus=snoc'

Ie. we drop one attribute at a time and try to find a suitable board
file. Though I'm not sure if it's possible to find a board file which
works with many different hardware, but the principle would be at least
that. Would something like that work in your case?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
