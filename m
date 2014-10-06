Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbBQO-0003OU-2c
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 16:46:16 +0000
Date: Mon, 6 Oct 2014 22:17:32 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 0/4] ath10k: Add tracing for tx and rx frames
Message-ID: <20141006164730.GA362@qca.qualcomm.com>
References: <1412602024-31706-1-git-send-email-rmanohar@qti.qualcomm.com>
 <21554.39629.93084.875971@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21554.39629.93084.875971@gargle.gargle.HOWL>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon, Oct 06, 2014 at 07:06:13PM +0530, Sujith Manoharan wrote:
> Rajkumar Manoharan wrote:
> > These changes are the extension of pktlog for dumping tx and rx
> > frames to user space. I am rebasing Michal's work on top of pktlog.
> > 
> > -Rajkumar
> > 
> > Michal Kazior (3):
> >   ath10k: add tracepoint for wmi mgmt tx frames
> >   ath10k: add tracepoint for wmi bcn tx
> >   ath10k: add htt rx tracepoints
> 
> These tracepoints look really similar, maybe you can
> group them into an event class.
>
Nice catch. Will send updated patches.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
