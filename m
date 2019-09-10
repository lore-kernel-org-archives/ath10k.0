Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7aTL-0001J2-Td
 for ath10k@lists.infradead.org; Tue, 10 Sep 2019 07:21:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: restore QCA9880-AR1A (v1) detection
References: <20190906215423.23589-1-chunkeey@gmail.com>
 <20190907214359.1C52A21835@mail.kernel.org>
 <CAKR_QVKv8kgXSSCwd8esw28hARA61Pah3usRi+ZZG6ss2CcS=g@mail.gmail.com>
Date: Tue, 10 Sep 2019 10:21:48 +0300
In-Reply-To: <CAKR_QVKv8kgXSSCwd8esw28hARA61Pah3usRi+ZZG6ss2CcS=g@mail.gmail.com>
 (Tom Psyborg's message of "Tue, 10 Sep 2019 03:27:28 +0200")
Message-ID: <87h85kfwfn.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Tom Psyborg <pozega.tomislav@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Christian Lamparter <chunkeey@gmail.com>

(dropping stable list)

Tom Psyborg <pozega.tomislav@gmail.com> writes:

> According to this very old post
> http://lists.infradead.org/pipermail/ath10k/2013-July/000021.html
> seems like you've been misinformed on amount of these cards that were
> put out in the market.
>
> At least digipart only have >40000 units in stocks
> https://www.digipart.com/part/QCA9880-AR1A and other retailers
> probably few thousands more.
>
> With that large amount of cards I think it is justified to request
> firmware support for the chip. And probably a lot easier to make few
> firmware modifications than go hacking a bunch of API calls so it
> works with v2 firmware.

I'm very surprised that QCA9880 hw1.0 boards are still available, after
six years. Did you confirm that it really is hw1.0 and not just some
mixup with hardware ids or something like that? For example, you could
try the old ath10k and old hw1.0 firmware to see if it works.

But if it's really is hw1.0 I doubt there will be any support for that.
I recommend to avoid hw1.0 altogether.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
