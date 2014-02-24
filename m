Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from tuxdriver-1-pt.tunnel.tserv13.ash1.ipv6.he.net
 ([2001:470:7:9c9::2] helo=smtp.tuxdriver.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WI1wO-000216-0s
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 20:15:52 +0000
Date: Mon, 24 Feb 2014 15:03:06 -0500
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20140217
Message-ID: <20140224200305.GF24810@tuxdriver.com>
References: <87txbx3etu.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87txbx3etu.fsf@kamboji.qca.qualcomm.com>
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

On Mon, Feb 17, 2014 at 06:05:01PM +0200, Kalle Valo wrote:
> Hi John,
> 
> here's a new pull request for ath6kl and ath10k. 
> 
> For ath10k Alexander did some cleanup to PCI error cases and switched
> ath10k to use pci_enable_msi_range(). Michal implemented AP CSA support
> and sta_rc_update() operation. I enabled firmware "STA quick kickout"
> functionality for faster detection of disappeared clients.
> 
> Also there are lots of small fixes to everywhere from various people.
> 
> For ath6kl Julien did two small USB related fixes.
> 
> Please let me know if there are any problmes
> 
> The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:
> 
>   Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git for-linville
> 
> for you to fetch changes up to 9797febc4cc112869b19a110f70e0dedb1bb63d6:
> 
>   ath10k: implement sta_rc_update() (2014-02-15 08:49:02 +0200)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
