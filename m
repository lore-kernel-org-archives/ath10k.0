Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP620-0004xm-Vp
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 07:30:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 04/11] ath: Remove extern from function prototypes
References: <cover.1380137609.git.joe@perches.com>
 <a3dabaf02d36dbb4051188b706a3e66e6465c56b.1380137609.git.joe@perches.com>
Date: Thu, 26 Sep 2013 10:30:00 +0300
In-Reply-To: <a3dabaf02d36dbb4051188b706a3e66e6465c56b.1380137609.git.joe@perches.com>
 (Joe Perches's message of "Wed, 25 Sep 2013 12:37:22 -0700")
Message-ID: <871u4ct4zr.fsf@kamboji.qca.qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: Jouni Malinen <jouni@qca.qualcomm.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org, "Luis R. Rodriguez" <rodrigue@qca.qualcomm.com>, ath9k-devel@lists.ath9k.org, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org

Joe Perches <joe@perches.com> writes:

> There are a mix of function prototypes with and without extern
> in the kernel sources.  Standardize on not using extern for
> function prototypes.
>
> Function prototypes don't need to be written with extern.
> extern is assumed by the compiler.  Its use is as unnecessary as
> using auto to declare automatic/local variables in a block.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/net/wireless/ath/ath10k/debug.h  | 8 ++++----
>  drivers/net/wireless/ath/ath6kl/common.h | 3 +--
>  drivers/net/wireless/ath/ath6kl/debug.h  | 9 ++++-----
>  drivers/net/wireless/ath/ath9k/ath9k.h   | 2 +-
>  4 files changed, 10 insertions(+), 12 deletions(-)

For the ath10k and ath6kl changes:

Acked-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
