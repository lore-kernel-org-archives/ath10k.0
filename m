Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fueGQ-0007Nq-L9
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 13:42:36 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: schedule hardware restart if WMI command times out
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180822073952.30922-1-martin@strongswan.org>
References: <20180822073952.30922-1-martin@strongswan.org>
Message-Id: <20180828134224.4BBD16044E@smtp.codeaurora.org>
Date: Tue, 28 Aug 2018 13:42:24 +0000 (UTC)
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
To: Martin Willi <martin@strongswan.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Martin Willi <martin@strongswan.org> wrote:

> When running in AP mode, ath10k sometimes suffers from TX credit
> starvation. The issue is hard to reproduce and shows up once in a
> few days, but has been repeatedly seen with QCA9882 and a large
> range of firmwares, including 10.2.4.70.67.
> 
> Once the module is in this state, TX credits are never replenished,
> which results in "SWBA overrun" errors, as no beacons can be sent.
> Even worse, WMI commands run in a timeout while holding the conf
> mutex for three seconds each, making any further operations slow
> and the whole system unresponsive.
> 
> The firmware/driver never recovers from that state automatically,
> and triggering TX flush or warm restarts won't work over WMI. So
> issue a hardware restart if a WMI command times out due to missing
> TX credits. This implies a connectivity outage of about 1.4s in AP
> mode, but brings back the interface and the whole system to a usable
> state. WMI command timeouts have not been seen in absent of this
> specific issue, so taking such drastic actions seems legitimate.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a9911937e7d3 ath10k: schedule hardware restart if WMI command times out

-- 
https://patchwork.kernel.org/patch/10572645/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
