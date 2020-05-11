Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY8CO-0005gI-PQ
 for ath10k@lists.infradead.org; Mon, 11 May 2020 13:10:28 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH net-next 1/2] ath10k: fix gcc-10 zero-length-bounds
 warnings
References: <20200509120707.188595-1-arnd@arndb.de>
 <20200509154818.GB27779@embeddedor>
 <87zhae4r35.fsf@kamboji.qca.qualcomm.com>
 <CAK8P3a2i-jqY8FnY_Tu41VDxQGqHHKRCyJ5U-GQbNmrqa=n0GQ@mail.gmail.com>
Date: Mon, 11 May 2020 16:09:57 +0300
In-Reply-To: <CAK8P3a2i-jqY8FnY_Tu41VDxQGqHHKRCyJ5U-GQbNmrqa=n0GQ@mail.gmail.com>
 (Arnd Bergmann's message of "Mon, 11 May 2020 14:46:00 +0200")
Message-ID: <87mu6e4nyy.fsf@kamboji.qca.qualcomm.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Erik Stromdahl <erik.stromdahl@gmail.com>, Networking <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, ath10k@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, Wen Gong <wgong@codeaurora.org>, "David S. Miller" <davem@davemloft.net>

Arnd Bergmann <arnd@arndb.de> writes:

> On Mon, May 11, 2020 at 2:03 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>> "Gustavo A. R. Silva" <gustavoars@kernel.org> writes:
>
>> >
>> > This treewide patch no longer contains changes for ath10k. I removed them
>> > since Monday (05/04/2020). So, this "Fixes" tag does not apply.
>
> Oops, I forgot to update the changelog trext when rebasing.
>
>> Ok, I'll remove it. Also I'll take these to my ath.git tree, not to
>> net-next.
>
> Thanks a lot!

Weird, I had a conflict with this patch but couldn't figure out why.
Anyway, I fixed it in my pending branch and please double check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c3e5221f3c3ddabc76a33ff08440ff1dc664998d

At least GCC-10 is happy now.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
