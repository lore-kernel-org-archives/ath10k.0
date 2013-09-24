Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOM1U-0004GM-Vq
 for ath10k@lists.infradead.org; Tue, 24 Sep 2013 06:23:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC] ath10k: replenish HTT RX buffers in a tasklet
References: <1379509691-19904-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 24 Sep 2013 09:22:29 +0300
In-Reply-To: <1379509691-19904-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 18 Sep 2013 15:08:10 +0200")
Message-ID: <87r4cebuxm.fsf@kamboji.qca.qualcomm.com>
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

> This fixes system starvation when under heavy RX
> traffic. This problem could be observed on AP135
> and led to watchdog resetting the platform.
>
> Patch starves FW RX ring buffer by progressively
> replenishing buffers to auto-balance the RX
> handled to the host system.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Looks good to me. I suspect there is a better way to do this in long
term, but this looks like a viable short term solution.

Does it decrease throughput in a noticeable way?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
