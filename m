Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb8S5-0007q5-6y
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 13:35:49 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21554.39629.93084.875971@gargle.gargle.HOWL>
Date: Mon, 6 Oct 2014 19:06:13 +0530
Subject: Re: [PATCH 0/4] ath10k: Add tracing for tx and rx frames
In-Reply-To: <1412602024-31706-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1412602024-31706-1-git-send-email-rmanohar@qti.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan wrote:
> These changes are the extension of pktlog for dumping tx and rx
> frames to user space. I am rebasing Michal's work on top of pktlog.
> 
> -Rajkumar
> 
> Michal Kazior (3):
>   ath10k: add tracepoint for wmi mgmt tx frames
>   ath10k: add tracepoint for wmi bcn tx
>   ath10k: add htt rx tracepoints

These tracepoints look really similar, maybe you can
group them into an event class.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
