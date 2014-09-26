Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58] helo=smtp.tuxdriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXZac-0008PF-LL
 for ath10k@lists.infradead.org; Fri, 26 Sep 2014 17:45:56 +0000
Date: Fri, 26 Sep 2014 13:36:33 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20140923
Message-ID: <20140926173633.GF22967@tuxdriver.com>
References: <8738big00t.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8738big00t.fsf@kamboji.qca.qualcomm.com>
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

On Tue, Sep 23, 2014 at 12:26:58PM +0300, Kalle Valo wrote:
> Hi John,
> 
> a new pull request just with ath10k changes this time. Changelog below
> and please let me know if there are any problems.
> 
> ----------------------------------------------------------------------
> 
> The only new feature is testmode support from me. Ben added a new method
> to crash the firmware with an assert for debug purposes. As usual, we
> have lots of smaller fixes from Michal. Matteo fixed a Kconfig
> dependency with debugfs. I fixed some warnings recently added to
> checkpatch.
> 
> ----------------------------------------------------------------------
> 
> 
> The following changes since commit 6a5d088a923854569e20eac4f3f569926d5911ec:
> 
>   carl9170: tx: Replace rcu_assign_pointer() with RCU_INIT_POINTER() (2014-08-28 14:50:13 -0400)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git for-linville
> 
> for you to fetch changes up to b25f32cb02155d68c690255ba846796a1c248fd3:
> 
>   ath10k: use ether_addr_copy() (2014-09-18 10:47:03 +0300)

Pulling now, but I don't plan to push it back out until Dave pulls my earlier batch...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
