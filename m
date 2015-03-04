Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT86g-0000yR-P6
 for ath10k@lists.infradead.org; Wed, 04 Mar 2015 12:08:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: workaround corrupted htt rx events
References: <1423490695-24829-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 4 Mar 2015 14:08:26 +0200
In-Reply-To: <1423490695-24829-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 9 Feb 2015 15:04:55 +0100")
Message-ID: <87pp8p6k3p.fsf@kamboji.qca.qualcomm.com>
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

> qca6174 WLAN.RM.2.0-00073 firmware uses full rx
> reordering offload and delivers Rx via a new HTT
> event. The event however is incorrectly generated
> in firmware and becomes overly long (with trailing
> garbage). This was hitting defined CE buffer limit
> that was programmed to the device and caused
> device to crash upon busier Rx traffic.
>
> Increasing the CE buffer limit for HTT Rx pipe to
> 2KBytes seems to be enough to workaround this
> problem.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
