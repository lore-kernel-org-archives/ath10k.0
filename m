Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7p6-0001on-Gj
 for ath10k@lists.infradead.org; Mon, 11 May 2020 12:46:21 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mk0FM-1io5lh25Au-00kQzm for <ath10k@lists.infradead.org>; Mon, 11 May
 2020 14:46:17 +0200
Received: by mail-qt1-f176.google.com with SMTP id g16so6965198qtp.11
 for <ath10k@lists.infradead.org>; Mon, 11 May 2020 05:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200509120707.188595-1-arnd@arndb.de>
 <20200509154818.GB27779@embeddedor>
 <87zhae4r35.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87zhae4r35.fsf@kamboji.qca.qualcomm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 May 2020 14:46:00 +0200
Message-ID: <CAK8P3a2i-jqY8FnY_Tu41VDxQGqHHKRCyJ5U-GQbNmrqa=n0GQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] ath10k: fix gcc-10 zero-length-bounds
 warnings
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Erik Stromdahl <erik.stromdahl@gmail.com>, Networking <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, ath10k@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, Wen Gong <wgong@codeaurora.org>, "David S. Miller" <davem@davemloft.net>

On Mon, May 11, 2020 at 2:03 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> "Gustavo A. R. Silva" <gustavoars@kernel.org> writes:

> >
> > This treewide patch no longer contains changes for ath10k. I removed them
> > since Monday (05/04/2020). So, this "Fixes" tag does not apply.

Oops, I forgot to update the changelog trext when rebasing.

> Ok, I'll remove it. Also I'll take these to my ath.git tree, not to
> net-next.

Thanks a lot!

       Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
