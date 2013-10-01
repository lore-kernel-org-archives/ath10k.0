Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VR2vl-0007Bf-3E
 for ath10k@lists.infradead.org; Tue, 01 Oct 2013 16:36:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: fix scheduling while atomic bug
References: <1380292567-2363-1-git-send-email-michal.kazior@tieto.com>
 <1380292567-2363-3-git-send-email-michal.kazior@tieto.com>
Date: Tue, 1 Oct 2013 19:35:45 +0300
In-Reply-To: <1380292567-2363-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 27 Sep 2013 16:36:07 +0200")
Message-ID: <8761th6ja6.fsf@kamboji.qca.qualcomm.com>
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

> Recent WMI/HTC changes broke WEP with multiple
> keys. If WMI had no HTC TX credits to submit
> command for default wep index update it would
> trigger a bug.
>
> This simply moves the wep key index update to a
> worker.
>
> The key update may happen some time after first
> frame with a different wep key has been sent (i.e.
> some frames will be sent with old key). This was
> the case before too as WMI commands were
> asynchronous.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

This looks problematic. Basically you just delay sending the WMI
command, but there's no guarantee that we actually have free credits at
the time of transmission. So to me it looks like this fixes the issue
just by luck.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
