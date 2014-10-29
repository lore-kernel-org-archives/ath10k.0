Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjM3Y-0000vW-Vp
 for ath10k@lists.infradead.org; Wed, 29 Oct 2014 05:44:29 +0000
Date: Wed, 29 Oct 2014 11:16:05 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: add tracing for tx ieee80211 header
Message-ID: <20141029054604.GB20332@qca.qualcomm.com>
References: <1414514885-3694-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1414515579.1834.4.camel@jlt4.sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1414515579.1834.4.camel@jlt4.sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Tue, Oct 28, 2014 at 05:59:39PM +0100, Johannes Berg wrote:
> On Tue, 2014-10-28 at 22:18 +0530, Rajkumar Manoharan wrote:
> > For packet log, the transmitted frame 802.11 header alone is sufficient.
> > Recording entire packet is also consuming lot of disk space. To
> > optimize, add tracepoints for sending tx-ed 802.11 headers alone.
> 
> FWIW, in iwlwifi I made the data portion (only!) a separate tracing
> subsystem, so that you can do
> 
> trace-cmd record -e iwlwifi
> 
> to get the hdrs, and
> 
> trace-cmd record -e iwlwifi -e iwlwifi_data
> 
> to get the hdrs, and the data, and then I put the two together in
> userspace. That way, "-e iwlwifi" gets most useful stuff, and adding -e
> iwlwifi_data when needed still has no duplication.
> 
> With what you're suggesting, it will be difficult to control tracing to
> do exactly what's needed.
> 
> Anyway, I don't really care, but this just caught my eye.
> 
Thanks for your feedback. Will send updated patch.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
