Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZc6t-0000EB-Mi
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 09:56:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath: use PRI value given by spec for fixed PRI
References: <f9db7f54d12e2589bcbb39215049d51a762d5d75.1441731619.git.poh@qca.qualcomm.com>
Date: Wed, 9 Sep 2015 12:55:39 +0300
In-Reply-To: <f9db7f54d12e2589bcbb39215049d51a762d5d75.1441731619.git.poh@qca.qualcomm.com>
 (Peter Oh's message of "Tue, 8 Sep 2015 10:04:41 -0700")
Message-ID: <87h9n39ask.fsf@kamboji.qca.qualcomm.com>
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

A changelog would be good to have. What changed in v2?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
