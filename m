Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guy1x-0001ec-A2
 for ath10k@lists.infradead.org; Sat, 16 Feb 2019 11:21:14 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: -Wimplicit-fallthrough not working with ccache
References: <20180524225928.GA19570@embeddedor.com>
 <20180613114059.DAC95601D2@smtp.codeaurora.org>
Date: Sat, 16 Feb 2019 13:21:06 +0200
In-Reply-To: <20180613114059.DAC95601D2@smtp.codeaurora.org> (Kalle Valo's
 message of "Wed, 13 Jun 2018 11:40:59 +0000 (UTC)")
Message-ID: <87zhqwuggt.fsf_-_@kamboji.qca.qualcomm.com>
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
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

(replying to an old thread but renaming it)

Kalle Valo <kvalo@codeaurora.org> writes:

> "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:
>
>> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
>> where we are expecting to fall through.
>> 
>> Notice that in this particular case, I replaced "pass through" with
>> a proper "fall through" comment, which is what GCC is expecting
>> to find.
>> 
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> Patch applied to ath-next branch of ath.git, thanks.
>
> f1d270ae10ff ath10k: htt_tx: mark expected switch fall-throughs

Gustavo, I enabled W=1 on my ath10k build checks and it took me a while
to figure out why GCC was warning about fall through annotations missing
even I knew you had fixed them. Finally I figured out that the reason
was ccache, which I need because I work with different branches and need
to recompile the kernel quite often.

If the plan is to enable -Wimplicit-fallthrough by default in the kernel
IMHO this might become an issue, as otherwise people using ccache start
seeing lots of invalid warnings. Apparently CCACHE_COMMENTS=1 will fix
that but my version of ccache doesn't support it, and how would everyone
learn that trick anyway? Or maybe CCACHE_COMMENTS can enabled through
kernel Makefile?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
