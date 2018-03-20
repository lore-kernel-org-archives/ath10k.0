Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyLw2-0001nx-0A
 for ath10k@lists.infradead.org; Tue, 20 Mar 2018 18:24:35 +0000
Date: Tue, 20 Mar 2018 19:24:20 +0100
From: Michal Kubecek <mkubecek@suse.cz>
Subject: Re: [RFC] ethtool: Support ETHTOOL_GSTATS2 command.
Message-ID: <20180320182420.u5aa7eny3fbix7fj@unicorn.suse.cz>
References: <1520452289-14172-1-git-send-email-greearb@candelatech.com>
 <20180320103747.7kcfdu4yzof6bwxw@unicorn.suse.cz>
 <37830d46-762b-2a92-4506-5792a65d2ebd@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37830d46-762b-2a92-4506-5792a65d2ebd@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Mar 20, 2018 at 08:39:33AM -0700, Ben Greear wrote:
> On 03/20/2018 03:37 AM, Michal Kubecek wrote:
> > 
> > IMHO it would be more practical to set "0 means same as GSTATS" as a
> > rule and make ethtool_get_stats() a wrapper for ethtool_get_stats2() to
> > avoid code duplication (or perhaps a use fall-through in the switch). It
> > would also allow drivers to provide only one of the callbacks.
> 
> Yes, but that would require changing all drivers at once, and would make backporting
> and out-of-tree drivers harder to manage.  I had low hopes that this feature would
> make it upstream, so I didn't want to propose any large changes up front.

I don't think so. What I mean is:

(a) driver implements ->get_ethtool_stats2() callback; then we use it
    for GSTATS2
(b) driver does not implement get_ethtool_stats2() but implements
    ->get_ethtool_stats(); then we call for GSTATS2 if level is zero,
    otherwise GSTATS2 returns -EINVAL

and GSTATS is always translated to GSTATS2 with level 0, either by
defining ethtool_get_stats() as a wrapper or by fall-through in the
switch statement.

This way, most drivers could be left untouched and only those which
would implement non-default levels would provide ->get_ethtool_stats2()
callback instead of ->get_ethtool_stats().

Michal Kubecek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
