Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58] helo=smtp.tuxdriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvY5X-0005B7-UJ
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 21:00:56 +0000
Date: Mon, 1 Dec 2014 15:51:50 -0500
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20141201
Message-ID: <20141201205150.GC7266@tuxdriver.com>
References: <871tojr16m.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871tojr16m.fsf@kamboji.qca.qualcomm.com>
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

On Mon, Dec 01, 2014 at 02:42:41PM +0200, Kalle Valo wrote:
> Hi John,
> 
> here's a pull request I'm hoping still to get to 3.19. The changelog is
> below. Please let me know if you have any problems.
> 
> ----------------------------------------------------------------------
> Only ath10k changes this time and no major changes. Most visible are:
> 
> o new debugfs interface for runtime firmware debugging (Yanbo)
> 
> o fix shared WEP (Sujith)
> 
> o don't rebuild whenever kernel version changes (Johannes)
> 
> o lots of refactoring to make it easier to add new hw support (Michal)
> 
> There's also smaller fixes and improvements with no point of listing
> here.
> 
> ----------------------------------------------------------------------
> 
> 
> The following changes since commit 47b6308b643302e642ca2a5cb6470926f7e1c428:
> 
>   ath9k: Move roc completion to the offchannel timer (2014-11-17 15:32:17 -0500)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git for-linville
> 
> for you to fetch changes up to fe2407a889f7b6530b7e231e7c866f5c5d223657:
> 
>   ath10k: simplify rx ring size/fill calculation (2014-12-01 09:29:27 +0200)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
