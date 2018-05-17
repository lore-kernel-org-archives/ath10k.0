Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJScI-0003uc-6H
 for ath10k@lists.infradead.org; Thu, 17 May 2018 23:47:27 +0000
Received: by mail-lf0-x241.google.com with SMTP id i11-v6so5987079lfb.7
 for <ath10k@lists.infradead.org>; Thu, 17 May 2018 16:47:15 -0700 (PDT)
Date: Fri, 18 May 2018 01:47:11 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: ath10k wake_tx_queue issues
Message-ID: <20180517234711.GA13270@localhost.localdomain>
References: <20180515134516.GA30397@localhost.localdomain>
 <6b81aa2e-09a3-ae48-7626-8ceb33a2a6b5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b81aa2e-09a3-ae48-7626-8ceb33a2a6b5@gmail.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: johannes@sipsolutions.net, toke@toke.dk, linux-wireless@vger.kernel.org, kvalo@qca.qualcomm.com, ath10k@lists.infradead.org

On Wed, May 16, 2018 at 07:28:21PM +0200, Erik Stromdahl wrote:
> Hello Niklas
> 
> Quick question:
> Are you using my patch: "ath10k: add htt_tx num_pending window"?

Nope, but I definitely think that your patch should be merged,
since the current code can lock/unlock/lock a lot of times for
no good reason.

(I actually tried it, but I could still reproduce the bug with it.)

> 
> I assume (from your logs below) that you are not...
> 

Thanks a lot for you suggestions Erik!

Increasing max_num_pending might be a good idea (perhaps we will
get better thoughput in the SDIO case).

However, increasing either max_num_pending or
HTC_HOST_MAX_MSG_PER_TX_BUNDLE would probably just move the problem,
since it would still be possible for us to get hit by the same problem
again in the future.

I actually took Toke's suggestion and cooked up a patch:
https://marc.info/?l=linux-kernel&m=152659902128543&w=2


Kind regards,
Niklas



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
