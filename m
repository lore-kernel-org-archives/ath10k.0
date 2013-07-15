Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UydkY-0005cS-9G
 for ath10k@lists.infradead.org; Mon, 15 Jul 2013 08:03:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 00/16] ath10k: pending patches
References: <1373030117-18077-1-git-send-email-kvalo@qca.qualcomm.com>
Date: Mon, 15 Jul 2013 11:02:45 +0300
In-Reply-To: <1373030117-18077-1-git-send-email-kvalo@qca.qualcomm.com> (Kalle
 Valo's message of "Fri, 5 Jul 2013 16:15:01 +0300")
Message-ID: <87a9lop7x6.fsf@kamboji.qca.qualcomm.com>
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
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> here are pending patches which were commited to ath10k.git while
> ath10k was under review. They were only sent to ath9k-devel, I'm
> resending them now before I reapply them to my new ath.git tree.
>
> Michal Kazior (16):
>   ath10k: fix teardown ordering
>   ath10k: fix possible deadlock
>   ath10k: setup rts/frag thresholds upon vdev creation
>   ath10k: do not setup rts/frag thresholds for suspended interfaces
>   ath10k: remove ath10k_bus
>   ath10k: fix typo in define name
>   ath10k: silent warning in IBSS mode
>   ath10k: lower print level for a message
>   ath10k: provide errno if bmi read/write fails
>   ath10k: change function to take struct ath10k as arg
>   ath10k: rename hif callback
>   ath10k: embed HTC struct inside ath10k
>   ath10k: embed HTT struct inside ath10k
>   ath10k: improve locking
>   ath10k: abort scan properly if wmi_scan_stop fails
>   ath10k: add missing debug prints

All 16 applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
