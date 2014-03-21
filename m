Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([144.76.43.152] helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR0GX-0007Fr-7g
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 14:17:45 +0000
Message-ID: <1395411440.4164.15.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH] ath10k: dont call csa_finish more than once
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 21 Mar 2014 15:17:20 +0100
In-Reply-To: <1395410520-26939-1-git-send-email-michal.kazior@tieto.com>
 (sfid-20140321_150948_706832_25F8B34B)
References: <1395410520-26939-1-git-send-email-michal.kazior@tieto.com>
 (sfid-20140321_150948_706832_25F8B34B)
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

On Fri, 2014-03-21 at 15:02 +0100, Michal Kazior wrote:
> Driver is supposed to call it only once for each
> scheduled channel_switch_beacon().
> 
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
> This is required for multi-vif csa but since that
> isn't merged yet I'm not including any specifics
> in the commit log itself.
> 
> Preventing multiple ieee80211_csa_finish() calls
> sounds like a good idea in general to me.

Didn't we have this discussion on the hwsim patch before?

I'd argue that if all drivers must track this, then the mac80211 API is
defective.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
