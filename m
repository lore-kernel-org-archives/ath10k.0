Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXQ07-0005Ev-0p
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 06:59:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFT 4/4] ath10k: improve tx flushing
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1396611464-5940-5-git-send-email-michal.kazior@tieto.com>
Date: Tue, 8 Apr 2014 09:58:20 +0300
In-Reply-To: <1396611464-5940-5-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Apr 2014 13:37:44 +0200")
Message-ID: <87k3b0mho3.fsf@kamboji.qca.qualcomm.com>
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

> Flushing was prone to timeouts when powersaving
> clients were involved that went missing while
> asleep. The common culprit was NullFunc frame
> being stuck in FW/HW queues.
>
> Introduce a two-pass flushing with WMI flush
> commands interleaved to force frame drops if
> necessary. This allows for a decreased flush
> timeout time and should get rid of some warnings.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

With this patch I see a new checkpatch warning:

drivers/net/wireless/ath/ath10k/mac.c:3785: WARNING: line over 80 characters

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
