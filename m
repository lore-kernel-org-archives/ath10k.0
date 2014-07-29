Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58] helo=smtp.tuxdriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC8R7-00085r-9N
 for ath10k@lists.infradead.org; Tue, 29 Jul 2014 14:31:34 +0000
Date: Tue, 29 Jul 2014 10:23:31 -0400
From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: Pull request: ath 20140725
Message-ID: <20140729142331.GC13090@tuxdriver.com>
References: <87wqb1pzvi.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wqb1pzvi.fsf@kamboji.qca.qualcomm.com>
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

On Fri, Jul 25, 2014 at 12:10:57PM +0300, Kalle Valo wrote:
> Hi John,
> 
> here's an ath10k pull request which I'm still hoping to get to 3.17,
> especially because of the rx reordering and IBSS advertisement fixes.
> But if we don't get these to 3.17 it won't be the end of the world
> either :)
> 
> Please let me know if there are any problems.
> 
> The changelog:
> 
> Michal and Janusz did some important RX aggregation fixes, basically we
> were missing RX reordering altogether. The 10.1 firmware doesn't support
> Ad-Hoc mode and Michal fixed ath10k so that it doesn't advertise Ad-Hoc
> support with that firmware. Also he implemented a workaround for a KVM
> issue.
> 
> 
> The following changes since commit bac9832076ee3b134bc859e07698c99276fc9459:
> 
>   b43: enable 5 GHz support for N-PHY devices (2014-07-23 13:08:36 -0400)
> 
> are available in the git repository at:
> 
>   git://github.com/kvalo/ath.git tags/for-linville-20140725
> 
> for you to fetch changes up to 0ccb7a3485e5526dca69f036b0d6c5148c78b3f8:
> 
>   ath10k: handle attention flags correctly when using A-MSDU (2014-07-25 11:51:07 +0300)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
