Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ablOy-0000WE-Qj
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 08:48:01 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: deliver mgmt frames from htt to monitor vifs only
Date: Fri, 4 Mar 2016 08:47:36 +0000
Message-ID: <87oaauy6ho.fsf@kamboji.qca.qualcomm.com>
References: <1448888219-2798-1-git-send-email-grzegorz.bajorski@tieto.com>
In-Reply-To: <1448888219-2798-1-git-send-email-grzegorz.bajorski@tieto.com>
 (Grzegorz Bajorski's message of "Mon, 30 Nov 2015 13:56:59 +0100")
Content-Language: en-US
Content-ID: <FEFF7CC42A5C394FA644E3B35A19AF32@qualcomm.com>
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
To: "grzegorz.bajorski@tieto.com" <grzegorz.bajorski@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Grzegorz Bajorski <grzegorz.bajorski@tieto.com> writes:

> Until now only WMI originating mgmt frames were
> reported to mac80211. Management frames on HTT
> were basically dropped (except frames which looked
> like management but had FCS error).
>
> To allow sniffing all frames (including offloaded
> frames) without interfering with mac80211
> operation and states a new rx_flag was introduced
> and is not being used to distinguish frames and
> classify them for mac80211.
>
> Signed-off-by: Grzegorz Bajorski <grzegorz.bajorski@tieto.com>
> ---
> depends on:
> mac80211: allow drivers to report (non-)monitor frames

Note to patchwork:

178830481eee mac80211: allow drivers to report (non-)monitor frames

Is in net-next at the moment.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
