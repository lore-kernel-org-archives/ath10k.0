Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([144.76.43.152] helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnREO-0001Fr-Sm
 for ath10k@lists.infradead.org; Mon, 02 Dec 2013 11:00:01 +0000
Message-ID: <1385981972.4445.7.camel@jlt4.sipsolutions.net>
Subject: Re: [RFC] mac80211: fix rx_nss calculation for drivers with hw rc
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 02 Dec 2013 11:59:32 +0100
In-Reply-To: <1385981647-4147-1-git-send-email-michal.kazior@tieto.com>
 (sfid-20131202_115744_274098_9362F537)
References: <1385739434.8656.0.camel@jlt4.sipsolutions.net>
 <1385981647-4147-1-git-send-email-michal.kazior@tieto.com>
 (sfid-20131202_115744_274098_9362F537)
Mime-Version: 1.0
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

On Mon, 2013-12-02 at 11:54 +0100, Michal Kazior wrote:
> Drivers with hardware rate control were given
> sta->rx_nss set to 0. This was because rx_nss
> calculation procedure was protected by hw/sw rate
> control check.
> 
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
> Hi Johannes,
> 
> I've re-checked the issue I've mentioned with the patch 'ath10k: use nss
> provided by mac80211'.
> 
> Apparently drivers with HW rate control are only affected by this bug
> and this patch is what I came up with as a quick fix. Any comments?

Yeah this looks reasonable. I guess I'll apply it despite the [RFC]

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
