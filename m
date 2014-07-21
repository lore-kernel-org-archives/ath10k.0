Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9HZ6-0003QO-CK
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 17:39:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC/RFT 1/2] ath10k: fix monitor start/stop sequences
References: <1405516873-26411-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 21 Jul 2014 20:39:26 +0300
In-Reply-To: <1405516873-26411-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 16 Jul 2014 15:21:12 +0200")
Message-ID: <87d2cyy5kh.fsf@kamboji.qca.qualcomm.com>
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
Cc: vh.nguyen@actiasodielec.fr, linux-wireless@vger.kernel.org, svens@stackframe.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Fix some cases where monitor start failure left
> the driver in a confused state.
>
> This also makes the monitor code simpler.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

From a quick review looks good to me. Are you planning to submit this as
a proper patch at some point?

Did anyone test this?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
