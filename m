Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from tuxdriver-1-pt.tunnel.tserv13.ash1.ipv6.he.net
 ([2001:470:7:9c9::2] helo=smtp.tuxdriver.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5LIO-00057v-Qe
 for ath10k@lists.infradead.org; Fri, 02 Aug 2013 19:45:53 +0000
Date: Fri, 2 Aug 2013 15:40:35 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20130730
Message-ID: <20130802194034.GE10800@tuxdriver.com>
References: <87txjct6pf.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87txjct6pf.fsf@kamboji.qca.qualcomm.com>
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

On Tue, Jul 30, 2013 at 06:20:44PM +0300, Kalle Valo wrote:
> Hi John,
> 
> here's a new pull request containing just ath10k patches from Michal.
> 
> A major new feature is that we can now restart the firmware when it
> crashes. For this Michal needed quite a few preparation patches. It's
> now possible to to crash the firmware from debugfs, which makes it
> easier to test the restart feature.
> 
> Michal also sent fixes and cleanup to various parts in the driver. Most
> visible to users are RTS and fragmentation related fixes.
> 
> Please pull and do let me know if there are any problems.
> 
> Kalle
> 
> The following changes since commit 2cdf359a521bb72286b6714478dfdbcd2691f3fe:
> 
>   mwifiex: code rearrangement in sdio.c (2013-07-26 16:57:45 -0400)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath6kl.git tags/for-linville-20130730
> 
> for you to fetch changes up to 424121c365aed6ec93bbc8b515548df79c5af61c:
> 
>   ath10k: fix rts/fragmentation threshold setup (2013-07-30 18:01:21 +0300)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
