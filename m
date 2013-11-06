Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve2rH-0007om-0G
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 13:09:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT 04/12] ath10k: rename function to match it's role
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
 <1383133346-8135-5-git-send-email-michal.kazior@tieto.com>
Date: Wed, 6 Nov 2013 15:08:49 +0200
In-Reply-To: <1383133346-8135-5-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 30 Oct 2013 12:42:18 +0100")
Message-ID: <87wqklr82m.fsf@kamboji.qca.qualcomm.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> What the function does is to actually wait for the
> firmware indication bit to be set. Prerequisite
> for this is having interrupts registered.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I think the title could be a bit more specific, like "ath10k: rename
ath10k_pci_reset_target()" or something like that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
