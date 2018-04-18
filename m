Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8ubj-0004Ez-9I
 for ath10k@lists.infradead.org; Wed, 18 Apr 2018 21:27:16 +0000
Message-ID: <1524086817.3024.9.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] ethtool: Support ETHTOOL_GSTATS2 command.
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 18 Apr 2018 23:26:57 +0200
In-Reply-To: <1524016176-3881-1-git-send-email-greearb@candelatech.com>
 (sfid-20180418_034951_095176_E2F46A6C)
References: <1524016176-3881-1-git-send-email-greearb@candelatech.com>
 (sfid-20180418_034951_095176_E2F46A6C)
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
To: greearb@candelatech.com, netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, 2018-04-17 at 18:49 -0700, greearb@candelatech.com wrote:
> 
> + * @get_ethtool_stats2: Return extended statistics about the device.
> + *	This is only useful if the device maintains statistics not
> + *	included in &struct rtnl_link_stats64.
> + *      Takes a flags argument:  0 means all (same as get_ethtool_stats),
> + *      0x1 (ETHTOOL_GS2_SKIP_FW) means skip firmware stats.
> + *      Other flags are reserved for now.

It'd be pretty hard to know which flags are firmware stats?

Anyway, there's no way I'm going to take this patch, so you need to
float it on netdev first (best CC us here) and get it applied there
before we can do anything on the wifi side.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
