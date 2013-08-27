Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEDE3-00024C-IE
 for ath10k@lists.infradead.org; Tue, 27 Aug 2013 06:58:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/4] ath10k: fixes
References: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
 <1377507205-5386-1-git-send-email-michal.kazior@tieto.com>
 <CAB=NE6X=P2hTnOC8xqFwb=-32-hBgx=ndq3KHoUG83KptKv0vA@mail.gmail.com>
Date: Tue, 27 Aug 2013 09:57:22 +0300
Message-ID: <87mwo3mxil.fsf@kamboji.qca.qualcomm.com>
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
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

"Luis R. Rodriguez" <mcgrof@do-not-panic.com> writes:

> On Mon, Aug 26, 2013 at 1:53 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>   ath10k: fix issues on non-preemptible systems
>
> This patch looks like a stable candidate fix. Please annotate as such
> if you confirm. Also, I reviewed other ath10k "fixes" and I see no
> practice of propagating any patches to stable yet. Can you please
> start doing that? If there were patches which are already merged
> upstream that should be propagated to stable then they can be
> submitted as stable candidate patches.

I disagree. The point of linux-stable is _not_ that we send all possible
fixes to stable. Instead we should send fixes only which really matter
to users and for which we have received bug reports. I haven't yet seen
any fix for ath10k which should be a candidate for stable releases.

If we start sending all ath10k fixes to stable it's just extra churn for
both Greg and people working on ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
