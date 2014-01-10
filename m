Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1YnA-0004qZ-S0
 for ath10k@lists.infradead.org; Fri, 10 Jan 2014 09:54:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: firmware dbglog and debug print events
References: <20140103105718.13474.70922.stgit@potku.adurom.net>
Date: Fri, 10 Jan 2014 11:53:51 +0200
In-Reply-To: <20140103105718.13474.70922.stgit@potku.adurom.net> (Kalle Valo's
 message of "Fri, 03 Jan 2014 12:59:13 +0200")
Message-ID: <87ob3k9n80.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Here are two new interfaces, dbglog and debug print events, to help with
> firmware debugging on ath10k. Please review.
>
> ---
>
> Kalle Valo (3):
>       ath10k: handle WMI debug print events
>       ath10k: add trace event for WMI_DEBUG_MESG_EVENTID
>       ath10k: add debugfs file to control firmware dbglog

All three applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
