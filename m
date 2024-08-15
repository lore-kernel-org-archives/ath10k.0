Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BFAC3DA7F
	for <ath10k@archiver.kernel.org>; Thu, 15 Aug 2024 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRPQHy8NVuYfweq8H/XE/bGOW/EAgCc+Ux9mT+dORpg=; b=uFfaYWggIGq2PtiJjPXs2LS9KZ
	5857m7Y6oMAQgIhgforCUo/K646UYLuVWmOTbHsFQeNQEZgaoELJ8Kq/Mo649hjqdlZpCdj/UPmps
	7PoU35CrPdC4fshbaBcH72cQsfOpgD1uRs6kz506aMWTmHCni6jYsr96m+Qa6Pp7HNKZHO24FNjbQ
	krTjHuO3Bj/EHukkyoyfCzzyeVL5mG+ZEpdr1Roic/X8DqIgcHS94pbXKuAiBBGEvtgJa7JfoC3n+
	9AnOllqhuVy55Q4XkFfk0k/JoClgTw8QwfWJOOttrwnMh4TsUH7cc+WwlofAlnQAo5gYpLmLnaWSF
	fr6NBjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secs1-0000000ARjv-3SIH;
	Thu, 15 Aug 2024 15:58:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secrv-0000000ARiL-0scR
	for ath10k@lists.infradead.org;
	Thu, 15 Aug 2024 15:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5740961F0E;
	Thu, 15 Aug 2024 15:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F37DC4AF0E;
	Thu, 15 Aug 2024 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723737510;
	bh=vV69M/rpZM35DO1TBNNyQ3w7yWmttvCJ05EdXdKKqWo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=l9MIfvMZQzq4+pPytYlvww/yykLHs9AIAkjSUqjVVE9Ymp/N69f7CViygMdLol9FP
	 F5h12TmWb+WXKRtBk9M/RNjdNKZ+QnEPmLyrZm5e6enhn/n5ltf2aGKU3riCRzPMQq
	 D8mwXzpS7ld4LKnqQDYi/zrlXO/OiwdPTKojc6euRxO4YAN8pR/slLaUDtAm08CQek
	 CSF9wIIlz7mGx2luFKKvv4i7SrcacAkPU4+L4H09JEp1I6qSCxcNV320C166XFOMRu
	 4ikZQofQuTtqHWCvELN9MwJj1foCmL0BbChZ034OTpH/p/MwHH+baqn0wDWvd56OI4
	 xVkpQxGd/Z3Kw==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
	<c407064a-1c2f-46ec-ac57-32bf9cf6f5c6@gmail.com>
	<9eafac85-2262-4f92-a70b-32109f65c05a@gmail.com>
	<87r0apyjc3.fsf@kernel.org>
	<6ba02350-3c8c-4664-9d68-67cb7e90eddb@gmail.com>
Date: Thu, 15 Aug 2024 18:58:27 +0300
In-Reply-To: <6ba02350-3c8c-4664-9d68-67cb7e90eddb@gmail.com> (James
	Prestwood's message of "Thu, 15 Aug 2024 08:47:35 -0700")
Message-ID: <87ed6pydzw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_085831_317053_9DCC6C4C 
X-CRM114-Status: GOOD (  19.38  )
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

James Prestwood <prestwoj@gmail.com> writes:

> On 8/15/24 7:03 AM, Kalle Valo wrote:
>> James Prestwood <prestwoj@gmail.com> writes:
>>
>>> Hi,
>>>
>>> So I have no resolution to this (trying to get the AP vendor to chase
>>> it down), but I'm toying with the idea of trying to work around
>>> whatever issue the AP is having when this occurs. The only thing I can
>>> think of is that there is a 3 second delay between the authentication
>>> and reassociation, and perhaps this is causing some timeout in the AP
>>> and in turn the deauth.
>>>
>>> I'm wondering how long it should take to add/remove a key from the
>>> firmware? 3 seconds seems very long, and I question if this timeout is
>>> really necessary or was just chosen arbitrarily? Is this something
>>> that could be lowered down to e.g. 1 second without negative impacts?
>>> The code in question is in ath10k_install_key:
>>>
>>> ret =3D ath10k_send_key(arvif, key, cmd, macaddr, flags);
>>> if (ret)
>>>  =C2=A0=C2=A0=C2=A0 return ret;
>>>
>>> time_left =3D wait_for_completion_timeout(&ar->install_key_done, 3 * HZ=
);
>>> if (time_left =3D=3D 0)
>>>  =C2=A0=C2=A0=C2=A0 return -ETIMEDOUT;
>> I can't remember anymore but I'm guessing the 3s delay was chosen
>> arbitrarily just to be on the safe side and not get unnecessary
>> timeouts.
>
> Thanks, I have reduced this to 1 second and have had it running on a
> client for ~19 hours. Still am seeing the timeouts, but no more than
> prior. And even with the timeouts the roams are successful.
>
> After doing more looking in the spec I did see that there is
> dot11ReassociationDeadline which may be coming into play here. Of
> course these APs aren't advertising any TIE or even support FT
> resource requests that so its impossible to know for sure, and hostapd
> AFAICT doesn't enforce any deadlines even if you set it... But in any
> case the timeout reduction is helping immensely and avoiding a
> disconnect.

Yeah, reducing the time out might a good option. 3s feels like overkill,
especially if 1s timeout passes your tests.

But I do wonder what's the root cause here. Are you saying that SET_KEY
always works for you?

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

