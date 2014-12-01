Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvLO0-00035y-O5
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 07:27:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: remove callback argument
References: <1417082978-1701-1-git-send-email-michal.kazior@tieto.com>
 <1417082978-1701-2-git-send-email-michal.kazior@tieto.com>
Date: Mon, 1 Dec 2014 09:26:42 +0200
In-Reply-To: <1417082978-1701-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 27 Nov 2014 11:09:37 +0100")
Message-ID: <87iohvrft9.fsf@kamboji.qca.qualcomm.com>
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

> Pass the eid argument via skbuff control buffer.
> This will make it possible to work with queues of
> HTC event buffers.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

To make the title more unique I changed the title to:

ath10k: remove transfer_id from ath10k_hif_cb::tx_completion

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
