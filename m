Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBhk3-0008Va-Ql
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 10:33:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/5] ath10k: implement beacon offload
References: <1420715550-16017-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 15 Jan 2015 12:32:59 +0200
In-Reply-To: <1420715550-16017-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 8 Jan 2015 12:12:25 +0100")
Message-ID: <8761c8z63o.fsf@kamboji.qca.qualcomm.com>
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

> Hi,
>
> New wmi-tlv firmware will support beacon/presp
> offloading. This patchset adds appropriate
> support.
>
> These patches of mine were originally posted by
> Bartosz before christmas after I went on my
> holidays.
>
> v2:
>  * add a comment in patch 5
>
>
> Michal Kazior (5):
>   ath10k: implement new beacon tx status event
>   ath10k: implement beacon template command
>   ath10k: implement prb tmpl wmi command
>   ath10k: implement p2p bcn ie command
>   ath10k: implement support for ap beacon offloading

Thanks, all five applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
