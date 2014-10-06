Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbBgG-0000Bh-5J
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 17:02:40 +0000
Date: Mon, 6 Oct 2014 22:34:01 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: add tracepoint for htt tx frames
Message-ID: <20141006170400.GB362@qca.qualcomm.com>
References: <1412614118-17205-1-git-send-email-rmanohar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1412614118-17205-1-git-send-email-rmanohar@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

On Mon, Oct 06, 2014 at 10:18:37PM +0530, Rajkumar Manoharan wrote:
> Although frame contents were printed via dbg_dump
> already it was not possible to easily filter them
> out for processing.
> 
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt_tx.c |  3 ++-
>  drivers/net/wireless/ath/ath10k/trace.h  | 13 +++++++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
> index fdfb171..9621b62 100644

Oops. I can merge these two patches it seems..

Kalle,

Please ignore this series.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
