Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x229.google.com ([2607:f8b0:4001:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ea334-0004ut-KV
 for ath10k@lists.infradead.org; Fri, 12 Jan 2018 17:23:24 +0000
Received: by mail-io0-x229.google.com with SMTP id v30so6608383iov.7
 for <ath10k@lists.infradead.org>; Fri, 12 Jan 2018 09:23:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <284de21d-c341-b52f-a1f9-23839871dfed@dd-wrt.com>
References: <CALAE=UAPXYsCfO+QXxPsnEe2vkcMcCoknSAc8RVyOVk85MC-8Q@mail.gmail.com>
 <87vagh7kq2.fsf@kamboji.qca.qualcomm.com>
 <CALAE=UD3kCG8_=o16D_JJ1_fN-PqQ+b0VxjWjxU8O_Sh1uHSFA@mail.gmail.com>
 <a0eebf0b-f24b-05f1-27c9-26c3a708f014@candelatech.com>
 <CALAE=UAmS33_sb1z0bVKwu-qb=WWn+m7vuRR2vYSnUFF6xLt2Q@mail.gmail.com>
 <284de21d-c341-b52f-a1f9-23839871dfed@dd-wrt.com>
From: Robert Jones <rjones@gateworks.com>
Date: Fri, 12 Jan 2018 09:23:09 -0800
Message-ID: <CALAE=UB1Su4xD4ttMVLyJWL_MQDGE3iT+SVfPKJhdPOsW1DNqA@mail.gmail.com>
Subject: Re: Bad TCP performance on WLE900VX
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: ath10k <ath10k@lists.infradead.org>

>>> Out of curiosity, did you try the patch that Kalle suggested?
>>
>> I did not unfortunately. I have other cards to qualify but if I can
>> come back to this I'll post the results.
>
> this patch wont change anything, since you still need to modify ath10k to
> set a sane tsq value
> see this additional patch from lede
> https://git.lede-project.org/?p=openwrt/openwrt.git;a=commitdiff;h=111b49902465116a8353d29afe02eff0f56ea0a3

I was just planning on hardcoding a few values suggested by the
testing done in the Kalle's commit message.
But thank you for the LEDE patch, that will make testing this easier.

Thanks,
Robert

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
