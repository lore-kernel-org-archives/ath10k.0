Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVMZS-0005wn-Qb
 for ath10k@lists.infradead.org; Tue, 10 Mar 2015 15:59:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/4] ath10k: Fix interpretation of cooling device state
References: <1425715380-11200-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Tue, 10 Mar 2015 17:59:19 +0200
In-Reply-To: <1425715380-11200-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Sat, 7 Mar 2015 13:32:57 +0530")
Message-ID: <87d24gyhbc.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: Matthias Kaehlcke <mka@google.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Setting the sysfs attribute ends up configuring the duty cycle,
> but the interface through which the attribute is exposed
> (cooling_device) is for setting the throttle/cooling state. This
> is confusing the user. Hence renaming the cooling device interfaces
> for better readability.
>
> Cc: Matthias Kaehlcke <mka@google.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

The four patches don't apply for some reason, please rebase.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
