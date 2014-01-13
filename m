Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from tuxdriver-1-pt.tunnel.tserv13.ash1.ipv6.he.net
 ([2001:470:7:9c9::2] helo=smtp.tuxdriver.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2nS7-00038g-6e
 for ath10k@lists.infradead.org; Mon, 13 Jan 2014 19:45:40 +0000
Date: Mon, 13 Jan 2014 14:40:24 -0500
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20140113
Message-ID: <20140113194024.GD14400@tuxdriver.com>
References: <87fvos3xcz.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fvos3xcz.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon, Jan 13, 2014 at 02:00:28PM +0200, Kalle Valo wrote:
> Hi John,
> 
> here's another ath10k pull request. Major changes are:
> 
> Janusz added Kconfig option for DFS. The DFS code was there already, but
> after fixes to mac80211 we can now enable it.
> 
> Bartosz added a runtime firmware feature flag to disable P2P. Our 10.1
> firmware branch doesn't support P2P and ath10k can now disable that. He
> also added a limit for how many clients can connect to ath10k AP.
> 
> Michal fixed WEP shared authentication, in case someone still uses it.
> And I added firmware debug log to help the firmware engineers.
> 
> Please let me know if there any problems.
> 
> The following changes since commit 39731b78b4afebb7501c05b68e2443a1b250b41c:
> 
>   ath9k: simplify/fix tx packet TID handling (2013-12-19 14:41:57 -0500)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git for-linville
> 
> for you to fetch changes up to 51ab1a0a09a894442e8b091d57222c5425b6d700:
> 
>   ath10k: add set_bitrate_mask callback (2014-01-10 11:54:49 +0200)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
