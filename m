Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHAx4-0007md-J3
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 12:45:35 +0000
Message-ID: <1422621903.1919.7.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/7] ath10k: implement chanctx API
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 30 Jan 2015 13:45:03 +0100
In-Reply-To: <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 (sfid-20150130_133341_121083_F7682B5B)
References: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 (sfid-20150130_133341_121083_F7682B5B)
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

On Fri, 2015-01-30 at 13:31 +0100, Michal Kazior wrote:

> +	INIT_LIST_HEAD(&ar->arctxs);
>  	INIT_LIST_HEAD(&ar->arvifs);

I'm not sure why you have an interface list, but I'd say you don't need
either since you have enumeration APIs:

ieee80211_iterate_active_interfaces[_atomic,...]

and

ieee80211_iter_chan_contexts_atomic

:)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
