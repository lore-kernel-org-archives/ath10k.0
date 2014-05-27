Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpDhq-0002Ij-Tq
 for ath10k@lists.infradead.org; Tue, 27 May 2014 09:30:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/5] ath10k: recovery fixes 2014-05-09
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 27 May 2014 12:29:19 +0300
In-Reply-To: <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 15 May 2014 10:41:59 +0200")
Message-ID: <87sinvbmds.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Hi,
>
> Here's is a bunch of fixes for recovery/hw
> restart. This notably fixes a bug Ben has hit some
> time ago.
>
> I also have some improvements for recovery code as
> well in a follow up patchset that I'll be sending
> separately.
>
> v2:
>  * minor code style adjustments
>  * extra comment
>  * sanity check in wep key worker
>
>
> Michal Kazior (5):
>   ath10k: clean up start() callback
>   ath10k: perform hw restart lazily
>   ath10k: drain tx before restarting hw
>   ath10k: protect wep tx key setup
>   ath10k: dont configure bssid for ap mode

Thanks, all five patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
