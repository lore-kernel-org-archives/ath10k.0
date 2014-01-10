Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1ZEf-0005Za-Vl
 for ath10k@lists.infradead.org; Fri, 10 Jan 2014 10:22:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add support for AP CSA
References: <1389345563-3445-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 10 Jan 2014 12:22:14 +0200
In-Reply-To: <1389345563-3445-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 10 Jan 2014 10:19:23 +0100")
Message-ID: <87d2k09lwp.fsf@kamboji.qca.qualcomm.com>
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

> This patch implements Channel Switch Announcement
> for AP mode. This allows for a smooth channel
> switch for connected stations that support CSA
> when radar is detected.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I had few conflicts while applying to ath-next-test (the branch for
pending patches). Please double check my changes:

https://github.com/kvalo/ath/commit/c7bb77f4bf9986e6be4b522ba1e01cd78ebb66af

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
