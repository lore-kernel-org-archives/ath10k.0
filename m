Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgBSr-0004Hs-Md
 for ath10k@lists.infradead.org; Sun, 27 Sep 2015 12:54:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath: use PRI value given by spec for fixed PRI
References: <f2542c539e8c0eab1b0cbd184dceeb412a3e4516.1441821191.git.poh@qca.qualcomm.com>
Date: Sun, 27 Sep 2015 15:53:15 +0300
In-Reply-To: <f2542c539e8c0eab1b0cbd184dceeb412a3e4516.1441821191.git.poh@qca.qualcomm.com>
 (Peter Oh's message of "Wed, 9 Sep 2015 10:53:23 -0700")
Message-ID: <87fv20c9c4.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> PRI value is used as divider when DFS detector analyzes candidate
> radar pulses.
> If PRI deviation is big from its origin PRI, DFS detector could miss
> valid radar reports since HW often misses detecting radar pulses and
> causes long interval value of pulses.
>
> For instance from practical results, if runtime PRI is calculated as
> 1431 for fixed PRI value of 1428 and delta timestamp logs 15719,
> the modular remainder will be 1409 and the delta between the remainder
> and runtime PRI is 22 that is bigger than PRI tolerance which is 16.
> As a result this radar report will be ignored even though it's valid.
>
> By using spec defined PRI for fixed PRI, we can correct this error.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
