Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRkY4-00039i-KU
 for ath10k@lists.infradead.org; Wed, 10 Sep 2014 16:15:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: fix debugfs_create_dir() checking
References: <1409827005-3777-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 10 Sep 2014 19:14:37 +0300
In-Reply-To: <1409827005-3777-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 4 Sep 2014 12:36:45 +0200")
Message-ID: <87sijz5u6q.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> The function may return an -ENODEV if debugfs is
> disabled in kernel. This should originally be
> guarded by ath10k's Kconfig but it still makes
> sense to check for the non-NULL errno return
> value.
>

[...]

> Reported-by: Matteo Croce <matteo@openwrt.org>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>
> Notes:
>     v2:
>      * fix commit subject (sorry for the noise!)
>     
>     v3:
>      * remove Kconfig patch (I accidentally amended something I shouldn't have,
>        sorry for the noise again! I guess I need a break..)
>
> @Kalle:
>
>  - this patch prevents kernel oops but ath10k will
>    fail to load
>
>  - Matteo's patch prevents kernel oops and ath10k
>    will load fine
>
> Since mine is just an extra precaution feel free
> to drop all but the first paragraph of my commit
> message if you want to.

Thanks, I just left the first paragraph like you recommended. Also I had
a conflict with this patch, please double check my resolution in
ath-next-test:

https://github.com/kvalo/ath/commit/bee6d655eefe488b76998c9c0018a4e6b0828de6

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
