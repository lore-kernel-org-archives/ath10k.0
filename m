Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcWbP-0002k6-N7
 for ath10k@lists.infradead.org; Fri, 10 Oct 2014 09:35:12 +0000
Date: Fri, 10 Oct 2014 15:06:31 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix kernel panic while shutting down AP
Message-ID: <20141010093629.GA31275@qca.qualcomm.com>
References: <1412759786-10567-1-git-send-email-rmanohar@qti.qualcomm.com>
 <CA+BoTQ=K=F5TodrmuaEaJfErFx1=BL-bmPDrAaeMLjjb8c3fJQ@mail.gmail.com>
 <20141008103312.GA25666@qca.qualcomm.com>
 <CA+BoTQmVsyuxjvc_s-BC6ZwRWk3ACG0CvDYHJRnZ7OqY6W1Upw@mail.gmail.com>
 <20141008110842.GC25666@qca.qualcomm.com>
 <CA+BoTQ=BuSrkBxkbsShZM=Zh8uqye5u0HydpfM9roubgi0-4tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQ=BuSrkBxkbsShZM=Zh8uqye5u0HydpfM9roubgi0-4tQ@mail.gmail.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Oct 08, 2014 at 02:16:18PM +0200, Michal Kazior wrote:
> On 8 October 2014 13:08, Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> > On Wed, Oct 08, 2014 at 12:50:28PM +0200, Michal Kazior wrote:
> >> On 8 October 2014 12:33, Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> >> > On Wed, Oct 08, 2014 at 11:45:38AM +0200, Michal Kazior wrote:
> >> >> On 8 October 2014 11:16, Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> >> >> > The commit "ath10k: workaround fw beaconing bug" is freeing
> >> >> > DMA-coherent memory in irq context which is hitting BUG ON
> >> >> > in ARM platforms. Fix this by moving dma_free out of spin
> >> >> > lock.
> >> >>
> >> >> I hardly see how moving the freeing outside the spinlock is a fix.
> >> >>
[...]
> 
> My thinking was GFP_ given to dma_alloc_coherent could impact
> behaviour of dma_free_coherent (e.g. different kind of pages is
> allocated so different kind of freeing will be involved) but I may be
> wrong.
> 
> Can you give it a try, please?
>
Michal,

Sorry for the delay.. Good catch. It is working after changing the GFP flag to
atomic. Will send the updated version and remove the backtrace from
commit log as well.

Thanks for the review.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
