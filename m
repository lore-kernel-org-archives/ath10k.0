Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpXU-0004JI-Ix
 for ath10k@lists.infradead.org; Fri, 07 Mar 2014 07:49:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Let ath10k_err take 'ar' argument?
References: <5318AA27.4090609@candelatech.com>
Date: Fri, 7 Mar 2014 09:49:10 +0200
In-Reply-To: <5318AA27.4090609@candelatech.com> (Ben Greear's message of "Thu, 
 06 Mar 2014 09:02:31 -0800")
Message-ID: <871tyeqwi1.fsf@kamboji.qca.qualcomm.com>
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

> I have two NICs in a system, and it died overnight (full host lockup).
> Console shows this:
>
> [root@ct523-9292 ~]# ath10k: target stalled
> ath10k: failed to wait for target to init: -5
> ath10k: target stalled

Damn. Do you have anything before the target stalled message?

> I was thinking of changing ath10k_err to take
> 'ar' as argument and then print out pci-id or some
> other identifier so that we can tell which
> NIC is having issues on systems with multiple NICs?
>
> Any opinions on this before I get started?

I have been thinking exactly the same. I think we should add struct
ath10k to all of our logging and debugging macros. IIRC iwlwifi does
this already, you might want to check that first.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
