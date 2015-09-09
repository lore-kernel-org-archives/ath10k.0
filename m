Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZblM-0003m5-Ep
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 09:33:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: fix mu-mimo rx status reporting
References: <1440679653-20289-1-git-send-email-michal.kazior@tieto.com>
 <1440679653-20289-2-git-send-email-michal.kazior@tieto.com>
Date: Wed, 9 Sep 2015 12:33:23 +0300
In-Reply-To: <1440679653-20289-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 27 Aug 2015 14:47:33 +0200")
Message-ID: <877fo09bto.fsf@kamboji.qca.qualcomm.com>
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

> MU-MIMO Rx involves different interpretation of
> the VHT-SIG-A compared to SU-MIMO.
>
> The incorrect interpretation led ath10k to report
> VHT MCS values greater than 9 which subsequently
> prompted mac80211 to drop such frames. This
> effectively broke Rx with MU-MIMO in many cases
> and manifested with a kernel warning in the log
> which looked like this:
>
>   [   14.552520] WARNING: CPU: 2 PID: 0 at net/mac80211/rx.c:3578 ieee80211_rx+0x26c/0x940 [mac80211]()
>   [   14.552522] Rate marked as a VHT rate but data is invalid: MCS: 10, NSS: 2
>   ... call trace follows ...
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, patch 2 applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
