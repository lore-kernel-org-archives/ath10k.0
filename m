Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from tuxdriver-1-pt.tunnel.tserv13.ash1.ipv6.he.net
 ([2001:470:7:9c9::2] helo=smtp.tuxdriver.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VA3ip-0008MX-5V
 for ath10k@lists.infradead.org; Thu, 15 Aug 2013 20:00:39 +0000
Date: Thu, 15 Aug 2013 15:54:36 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20130812
Message-ID: <20130815195435.GF2133@tuxdriver.com>
References: <871u5zuhbm.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871u5zuhbm.fsf@kamboji.qca.qualcomm.com>
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

On Mon, Aug 12, 2013 at 05:14:37PM +0300, Kalle Valo wrote:
> Hi John,
> 
> here's a small pull request for ath10k and ath6kl. The changes are:
> 
> New features in ath10k are rx/tx checsumming in hw and survey scan
> implemented by Michal. Also he made fixes to different areas of the
> driver, most notable being fixing the case when using two streams and
> reducing the number of interface combinations to avoid firmware crashes.
> Bartosz did a clean related to how we handle SoC power save in PCI
> layer.
> 
> For ath6kl Mohammed and Vasanth sent each a patch to fix two infrequent
> crashes.
> 
> The following changes since commit 424121c365aed6ec93bbc8b515548df79c5af61c:
> 
>   ath10k: fix rts/fragmentation threshold setup (2013-07-30 18:01:21 +0300)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git for-linville
> 
> for you to fetch changes up to 9d0e2f0772d394060bf3b17cd1f3a35574365103:
> 
>   ath6kl: Fix invalid pointer access on fuzz testing with AP mode (2013-08-07 10:58:59 +0300)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
