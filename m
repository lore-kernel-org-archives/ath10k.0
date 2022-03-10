Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA78C433F5
	for <ath10k@archiver.kernel.org>; Thu, 10 Mar 2022 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKEzMWmiT2JghIZ+WTyPA47NOvHSdsr39kHjDaOdadg=; b=rI8YYn402cqyyR
	9u6u9vxMriFN7UeqEoGqHnlBMr/SWNNaXTFcRBaQ67p/VkbxBvaKucKxTwTucPSh/NRhOEtqYZZXo
	gwGA+K5REVifEpHLCtz6PIlX74gH7kWOjBgKGWQNPD8i9ykTRzRC9T+8FddBkaKjPgzzp/GoRIwcj
	0UZ1gL7H5mxXLnGue7N4blSs59mi+W9TGi5K2iMUjW5yVMyHJGTSPCBRlM+4oPyWTxcccdBw08QxI
	x37sn5uz07OCKa1YlXExmX9jfJOJBTEkcl/D3kKFh8j+fxwupSGdrIQpX65AZqR6bbt45tWS7LKWr
	Yzs8gwCpFwmt/hcal2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSFis-00CJCT-RR; Thu, 10 Mar 2022 10:08:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSFi8-00CIrS-Mv
 for ath10k@lists.infradead.org; Thu, 10 Mar 2022 10:07:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37031B82588;
 Thu, 10 Mar 2022 10:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A2DC340F3;
 Thu, 10 Mar 2022 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646906873;
 bh=DAXaxPhIHmB2MF8XpLLIhDWnZYiL+Px39F37xpKSkgA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=e2gkrtlvGZxaRZ7LaGobNndXWLZbv48jZ6KFQEHajqwDhIoBY1Wj8DYgHjzbRRZLs
 qCzvxa5/5teYQnQmSNwOjIC/3tIQGtIWxJ3RFIcnZc4Y+RJn0kvDLAq2mHnPiM8qMA
 6s/afH0bF3XJNqCtnucZSZDOZR8grHZ5yVrOjbkchuC+5J2AaIqPffWiVUb6VNSYxu
 Rk0n4m3G9SOiyoHmEfQl9PqAG6pSU1WXcYT3SPGyPFLRFUN+6oUCnEm8B6PPXuVHZS
 d6BbrsCe604OvSj/mfLb6vjy3DnUNOUfVF/BRaZs5jhLt8NiD6tr9HATBikGX0yeMh
 oULJ4ZtLjDqmg==
From: Kalle Valo <kvalo@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>, kernel test robot <lkp@intel.com>,
 ath10k <ath10k@lists.infradead.org>, kbuild-all@lists.01.org,
 Rakesh Pillai <pillair@codeaurora.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ath10k: search for default BDF name provided in DT
References: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <202201110851.5qAxfQJj-lkp@intel.com>
 <CACTWRwtCjXbpxkixAyRrmK5gRjWW7fMv5==9j=YcsdN-mnYhJw@mail.gmail.com>
 <87y23is7cp.fsf@kernel.org>
 <CAD=FV=W-kJQwBPStsGpNu09dN+QHTEZOgb5sZwZYzWnn_Zhv4A@mail.gmail.com>
Date: Thu, 10 Mar 2022 12:07:49 +0200
In-Reply-To: <CAD=FV=W-kJQwBPStsGpNu09dN+QHTEZOgb5sZwZYzWnn_Zhv4A@mail.gmail.com>
 (Doug Anderson's message of "Mon, 7 Mar 2022 16:50:05 -0800")
Message-ID: <87o82eqfwq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_020756_955918_B3954951 
X-CRM114-Status: GOOD (  16.70  )
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

> On Fri, Jan 14, 2022 at 6:46 AM Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Abhishek Kumar <kuabhs@chromium.org> writes:
>>
>> > On this patch I have a kernel bot warning, which I intend to fix along
>> > with all the comments and discussion and push out V3. So, any
>> > comments/next steps are appreciated.
>>
>> Please wait my comments before sending v3, I think this is something
>> which is also needed in ath11k and I need to look at it in detail.
>
> I'm wondering if you have a timeframe for when you might post your
> comments. We've landed this patch locally in the Chrome OS kernel
> tree, but we are always also interested in it landing upstream. If you
> have ideas for a path forward that'd be keen!

You had a good comment on v1 so I replied to that one.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
