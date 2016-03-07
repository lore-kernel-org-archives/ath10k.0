Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by casper.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1acrmS-00049e-Kg
 for ath10k@lists.infradead.org; Mon, 07 Mar 2016 09:48:49 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 00/11] ath10k: implement push-pull tx model
Date: Mon, 7 Mar 2016 09:48:20 +0000
Message-ID: <87io0yvctf.fsf@kamboji.qca.qualcomm.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1456828376-2795-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1456828376-2795-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 1 Mar 2016 11:32:45 +0100")
Content-Language: en-US
Content-ID: <989C4633A7DE124D98C11F2C36217D27@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> This adds support for the new logic where host
> tells firmware how many frames are queued for each
> station/tid and then firmware asks host to submit
> frames for given station/tid.
>
> The patch count is a bit high but I tried
> splitting the patches as much as possible to keep
> them short and easy to review. Hopefully it's not
> going to be a huge headache.
>
> v2:
>  - squashes some patches
>  - reworked pending frame scheduling
>
>
> Michal Kazior (11):
>   ath10k: refactor tx code
>   ath10k: unify txpath decision
>   ath10k: refactor tx pending management
>   ath10k: maintain peer_id for each sta and vif
>   ath10k: add fast peer_map lookup
>   ath10k: add new htt message generation/parsing logic
>   ath10k: implement wake_tx_queue
>   ath10k: implement updating shared htt txq state
>   ath10k: store txq in skb_cb
>   ath10k: keep track of queue depth per txq
>   ath10k: implement push-pull tx

All applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
