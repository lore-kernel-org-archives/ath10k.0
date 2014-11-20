Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrPkk-0008Vc-Ur
 for ath10k@lists.infradead.org; Thu, 20 Nov 2014 11:18:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix mismatched wmi api call
References: <1415935071-21422-1-git-send-email-poh@qca.qualcomm.com>
Date: Thu, 20 Nov 2014 13:17:56 +0200
In-Reply-To: <1415935071-21422-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Thu, 13 Nov 2014 19:17:51 -0800")
Message-ID: <87tx1udst7.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> Fix to use v10.2 wmi call for firmware v10.2.
> It turned out that peer association function was using
> v10.1 wmi call for v10.2 firmware during code review.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, applied.

(Actually I had applied this already on Nov 17 but forgot to reply.)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
