Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2FDC4167B
	for <ath10k@archiver.kernel.org>; Mon,  4 Dec 2023 14:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY5ZtFPKzchwRJHmxEo7sesQgEPMP5kGYxecLnC33sU=; b=QB44qDUs/hzveAgAPsY5WqO/Vl
	RR2sweJnzbmZ/MtiRdrF+vt4MuPz5QwNKr+/P7nvMwg+BYRVMlvkZ4uAgcRp43qAbaghzqyWwNICw
	SORLUgNLEowfRlgXhjVkHD9UC5fnoBJnYTbZXGIpiBn01Ec4dY3VacNTbDEU7hzoVxD0fePMW3iw1
	BttBSv+rXNqgS0f1URsrFdjZRss1gEaKrwGw9JdOfOk1OSW5F/LYTqWs3jLKfEvjqjuasyff0FaRf
	ny5B3q/mPnfrgspk+jHJqawsbgZshM3+Fxhj4KeXOojEuBUPcxg9Xwktnnf9o/IoT7f1Rzj8Xu7pX
	oVbSFAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAG0-004qLX-1I;
	Mon, 04 Dec 2023 14:49:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAFw-004qKD-1C
	for ath10k@lists.infradead.org;
	Mon, 04 Dec 2023 14:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A914CE113E;
	Mon,  4 Dec 2023 14:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E3DC433C7;
	Mon,  4 Dec 2023 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701701345;
	bh=kcnrh/6Lh/jU/Ro0PuQfGZ/SwojaPG5lgb/owoG9ktA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=V+H4aNkVyFEnwUdtT6rLJzH6qbEuIjB2HKZPo8JmGrjHzn1xcbsXGoddtltFAXNWF
	 kvOOQ1lSLvGkmbwZ4hBfcdl0InD0pVSI/8e27F/2jriaZWmkC2LGDYvHHRj5LZfqNr
	 oi2zDDsk6CBhdAqyJvGO9+lYoHKNHhHDeZUyFJ/1SsEpbDS2gcraCm5BrbGu4hK+3a
	 eFyEOeNjCGuH2o0Qz5yGfyP6bLtpIJgDWhg1YVoXwSVzpEMXDTgq7TFjwgLmSjM/nN
	 1Ifhgytl2mN4+h9G0rYmBxjq2jfNe4TloxQ4F2ws6zQvYbhB4ClvpXu0Gv5Vj5WX63
	 hbTku4KBX9OJg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k/ath11k board data
References: <CAA8EJpp2XeATTauOZJeU92MHTGYj_CK_MTAb0A3uVTO_eGebjA@mail.gmail.com>
Date: Mon, 04 Dec 2023 16:49:03 +0200
In-Reply-To: <CAA8EJpp2XeATTauOZJeU92MHTGYj_CK_MTAb0A3uVTO_eGebjA@mail.gmail.com>
	(Dmitry Baryshkov's message of "Mon, 4 Dec 2023 16:39:13 +0200")
Message-ID: <87h6kyqazk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_064908_602738_302F9497 
X-CRM114-Status: UNSURE (   7.49  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> I just wanted to check whether you have plans to update ath10k /
> ath11k board data files. The last update was IIRC 9 months ago.

It is very high on my todo list. I was supposed to start processing that
already last week but it got delayed as usual :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

