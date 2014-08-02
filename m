Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDSZ4-0006Dc-79
 for ath10k@lists.infradead.org; Sat, 02 Aug 2014 06:13:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: improve channel switching
References: <1406554132-17264-1-git-send-email-michal.kazior@tieto.com>
Date: Sat, 2 Aug 2014 09:12:25 +0300
In-Reply-To: <1406554132-17264-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 28 Jul 2014 15:28:52 +0200")
Message-ID: <87ppgj5sja.fsf@kamboji.qca.qualcomm.com>
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

> In some cases during heavy tx vdev stop-start
> would timeout on vdev synchronization causing
> traffic to stall for a few seconds.
>
> Instead of stop-starting use a dedicated vdev
> restart command and down vdevs explicitly before
> doing so.
>
> This gets rid of the synchronization
> warnings/timeouts and makes channel switching
> smoother during traffic.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
