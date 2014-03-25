Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSM5q-000180-0G
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 07:48:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: How to get tx rate in ath10k?
References: <5330C701.607@candelatech.com>
Date: Tue, 25 Mar 2014 09:47:51 +0200
In-Reply-To: <5330C701.607@candelatech.com> (Ben Greear's message of "Mon, 24
 Mar 2014 17:00:01 -0700")
Message-ID: <87ha6m3ejc.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> With Janusz's changes, rx rate and rx-signal appear to be reported
> correctly.
>
> But, tx-rate is not reported.
>
> Anyone have any suggestions for what needs doing to get
> tx rate properly reported?

Firmware does not provide this information to the host currently, so
this will need firmware changes.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
