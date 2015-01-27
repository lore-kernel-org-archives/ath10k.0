Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YG6ZA-0004W7-Tf
 for ath10k@lists.infradead.org; Tue, 27 Jan 2015 13:52:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: add wmi-tlv debug event handling
References: <1420715897-18706-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 27 Jan 2015 15:51:53 +0200
In-Reply-To: <1420715897-18706-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 8 Jan 2015 12:18:15 +0100")
Message-ID: <87bnlkcow6.fsf@kamboji.qca.qualcomm.com>
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

> New wmi-tlv firmware will deliver debug messages
> via new events.
>
> Note: This may yield some (trivial) conflicts
> against my beacon/presp template patchset.
>
>
> Michal Kazior (2):
>   ath10k: implement diag data container event
>   ath10k: implement diag event

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
