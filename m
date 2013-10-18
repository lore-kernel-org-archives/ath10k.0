Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from tuxdriver-1-pt.tunnel.tserv13.ash1.ipv6.he.net
 ([2001:470:7:9c9::2] helo=smtp.tuxdriver.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXEM4-0003yi-Q0
 for ath10k@lists.infradead.org; Fri, 18 Oct 2013 18:00:57 +0000
Date: Fri, 18 Oct 2013 13:57:33 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20131017
Message-ID: <20131018175732.GD28130@tuxdriver.com>
References: <87mwm82rmu.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mwm82rmu.fsf@kamboji.qca.qualcomm.com>
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

On Thu, Oct 17, 2013 at 12:06:33PM +0300, Kalle Valo wrote:
> Hi John,
> 
> here's a pull request for ath6kl and ath10k. Notable changes:
> 
> Bartosz added support to ath10k for our 10.x AP firmware branch, which
> gives us AP specific features and fixes. We still support the main
> firmware branch as well just like before, ath10k detects runtime what
> firmware is used. Unfortunately the firmware interface in 10.x branch is
> somewhat different so there was quite a lot of changes in ath10k for
> this.
> 
> Michal and Sujith did some performance improvements in ath10k. Vladimir
> fixed a compiler warning and Fengguang removed an extra semicolon.
> 
> Please let me know if there are any problems.
> 
> Kalle
> 
> The following changes since commit 6e712d427cb0542afdd5220edb6e4f4f8a5b952d:
> 
>   ath10k: replenish HTT RX buffers in a tasklet (2013-09-26 17:22:54 +0300)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git for-linville
> 
> for you to fetch changes up to 56b84287d14aa74823a9c290d0c5839d38365110:
> 
>   ath10k: add might_sleep() to ath10k_wmi_cmd_send() (2013-10-16 15:44:47 +0300)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
