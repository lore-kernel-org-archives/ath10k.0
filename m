Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1288C6FD1D
	for <ath10k@archiver.kernel.org>; Wed, 15 Mar 2023 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6u3oD+r7iBbeQKw9h5Sma2+gzpJjq33ICoi92dc9ygo=; b=Zt42g8jzLwQDKT
	MBqG9SJi8GWJEYcelTDZzgwiw0itiTBzqdaU+gyoZJbZlt85QmOMeZOZYsTM58moqkUeT98xnKz+I
	NO9Ak5YN8HvjdzinHFdH/0/MiOjHpIk4PCZyXqJopio7T8ZXwnXrKGn3KZZHR8KFfjfrFiKjg+Ps8
	z+xwypcvGW0AUV6lW4dSexnHVDsrsNZnECY3todwMlu60/hIeqYVy3JULlsuNO4rCgewVRhrvWacp
	CIz7U5qVrrliKwB+ovZimMtzvP/qYJZW7PBRwe1plhFNlq/2J5WC73ZK03J0jhKQIYFBY3XcAmK7k
	lntjwoh5eFk9TAa3ra+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKcc-00CWga-31;
	Wed, 15 Mar 2023 06:28:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKca-00CWfm-1b
	for ath10k@lists.infradead.org;
	Wed, 15 Mar 2023 06:28:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BFBAFB81BC2;
	Wed, 15 Mar 2023 06:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C76C433D2;
	Wed, 15 Mar 2023 06:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678861701;
	bh=Kxs1ixjde/xHKf3SionGwNBkPkmhkANdt5+Lb0JzJW8=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=X6BGftaSM3bY5uVUB7ZZXkFshEvhxvNEgK8S1tQaB+2CVXCT+YYRt2u9w2YcxoBud
	 tAbXe/GOSQ76irbkr92Kd+v8SY1BJ0oVf2PUO8g6rbB8TI6SokqlkmIn4/gXyDBiP4
	 A6c+u36bFE0nlGxDgda+K0OVV8kE3HSeSRLIFvn01V3Y/FITEKcOTZAUZ9MY/XKn2y
	 rjLvDheZcnAkAznyRivI6rcBYz5KwnH8FHdmLrF4yGWE8C1DTNT/v4onvlgmc9AUY9
	 Sp0EJzLc+fLQecMcL30Vf+mQ+vLLKlNwUvn9TOP4Rj+yHdWZkA2Pf1yov6G1Jy+5A4
	 0NzWtvK90o1Ew==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-firmware@kernel.org,  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
References: <878rgzuw37.fsf@kernel.org>
	<c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com>
	<87a618517g.fsf@kernel.org>
	<97b7f35c-f7c9-1257-ff67-e5b61efe0ce0@gmail.com>
Date: Wed, 15 Mar 2023 08:28:17 +0200
In-Reply-To: <97b7f35c-f7c9-1257-ff67-e5b61efe0ce0@gmail.com> (Christian
	Lamparter's message of "Tue, 14 Mar 2023 13:59:47 +0100")
Message-ID: <874jqmo7em.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_232824_691430_BB3A024D 
X-CRM114-Status: GOOD (  13.33  )
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

Christian Lamparter <chunkeey@gmail.com> writes:

> On 2/20/23 06:56, Kalle Valo wrote:
>> Christian Lamparter <chunkeey@gmail.com> writes:
>>
>>> On 2/15/23 10:17, Kalle Valo wrote:
>>>> Here's a new pull request for ath10k and ath11k. We have new hardware
>>>> IPQ5018 and various updates for existing hardware. Especially many have
>>>> requested the firmware update for WCN6855 which seems to fix an
>>>> important suspend problem.
>>>>
>>>> Please let me know if there are any problems.
>>>
>>> Could you also please include all the QCA9888+IPQ4019 boardfiles updates
>>> from last year too?
>>
>> I will try to go through them later. The problem here is that I don't
>> have much time for ath10k nowadays.
>
> Ok, should I just post the board-2.bin updates to linux-firmware?
> I have them ready to go for IPQ4019, QCA9888 and QCA9984.

But is the problem that then I don't know which one you picked up and
which one you skipped? Thanks for the offer but I think it's simpler
that I'll pick the board files instead like before. I put this now to
top of my todo list so shouldn't take long.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
