Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from tuxdriver-1-pt.tunnel.tserv13.ash1.ipv6.he.net
 ([2001:470:7:9c9::2] helo=smtp.tuxdriver.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRpXi-0007yq-6N
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 20:30:38 +0000
Date: Thu, 3 Oct 2013 16:17:06 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20131001
Message-ID: <20131003201706.GE3142@tuxdriver.com>
References: <87wqlw6fwr.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wqlw6fwr.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath6kl-devel@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Oct 01, 2013 at 08:48:36PM +0300, Kalle Valo wrote:
> Hi John,
> 
> here's a bigger pull request including patches applied during the merge
> window. Major changes are:
> 
> * throughput improvements including aligning the RX frames correctly and
>   optimising HTT layer (Michal)
> 
> * remove qca98xx hw1.0 support (Bartosz)
> 
> * add support for firmware version 999.999.0.636 (Michal)
> 
> * firmware htt statistics support (Kalle)
> 
> * fix WEP in AP and IBSS mode (Marek)
> 
> * fix a mutex unlock balance in debugfs file (Shafi)
> 
> And of course there's a lot of smaller fixes and cleanup.
> 
> To avoid the pull request getting too big, I didn't include the latest
> patches from ath.git. I'm planning to send them once you have pulled
> this one. Please let me know if there are any problems.
> 
> Kalle
> 
> 
> The following changes since commit 9d0e2f0772d394060bf3b17cd1f3a35574365103:
> 
>   ath6kl: Fix invalid pointer access on fuzz testing with AP mode (2013-08-07 10:58:59 +0300)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git tags/for-linville-20131001
> 
> for you to fetch changes up to 6e712d427cb0542afdd5220edb6e4f4f8a5b952d:
> 
>   ath10k: replenish HTT RX buffers in a tasklet (2013-09-26 17:22:54 +0300)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
