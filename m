Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTWBz-00048M-Vf
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 12:47:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix printing of peer stats in non-AP firmware
References: <1395734146-10907-1-git-send-email-yeohchunyeow@gmail.com>
Date: Fri, 28 Mar 2014 14:47:01 +0200
In-Reply-To: <1395734146-10907-1-git-send-email-yeohchunyeow@gmail.com>
 (Chun-Yeow Yeoh's message of "Tue, 25 Mar 2014 15:55:46 +0800")
Message-ID: <871txmwkvu.fsf@kamboji.qca.qualcomm.com>
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
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Chun-Yeow Yeoh <yeohchunyeow@gmail.com> writes:

> This patch is intended to fix the problem if we use the
> firmware 999.999.0.636 to get peer stats when the number
> of peer is more than 3. The WMI_UPDATE_STATS_EVENTID may
> trigger more than 1 time if the number of peers is more
> than 3. So this patch allows us to do the checking on this
> and make sure that we print the peer stats correctly.
>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

Based on Michal's comments I'm going to drop this one, we need to find a
better way to solve this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
