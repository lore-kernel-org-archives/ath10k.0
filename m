Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX9yo-0007Vv-Lo
 for ath10k@lists.infradead.org; Mon, 07 Apr 2014 13:52:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/2] ath10k: reorder functions
References: <1396337123-12622-1-git-send-email-michal.kazior@tieto.com>
 <1396610926-5787-1-git-send-email-michal.kazior@tieto.com>
 <1396610926-5787-2-git-send-email-michal.kazior@tieto.com>
Date: Mon, 7 Apr 2014 16:52:26 +0300
In-Reply-To: <1396610926-5787-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Apr 2014 13:28:45 +0200")
Message-ID: <87fvlpnt5x.fsf@kamboji.qca.qualcomm.com>
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

> This is done to avoid forward declarations with
> upcomming patches.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Like you said, I had a conflict with this patch. Can you double check my
resolution, please:

https://github.com/kvalo/ath/commit/0953accf20c325adde537a57c3e6a6a0f1ff04d7

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
