Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhFQ0-0002A7-Dk
 for ath10k@lists.infradead.org; Fri, 15 Nov 2013 09:10:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: allow dynamic bandwidth in hw rate control
References: <1384337110-9417-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 15 Nov 2013 10:59:57 +0200
In-Reply-To: <1384337110-9417-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 13 Nov 2013 11:05:10 +0100")
Message-ID: <87r4ai3ur6.fsf@kamboji.qca.qualcomm.com>
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

> Frames were never retransmitted with
> different/lower bandwidths, e.g. only 80MHz
> bandwidth was used when dealing with a VHT80
> peer.
>
> Allow HW rate control to try out different
> bandwidths when retransmitting. This increases
> robustness.
>
> Also, document the parameter properly.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
