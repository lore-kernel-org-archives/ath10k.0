Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDtFN-0000vB-0M
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 10:10:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k crash on startup, related to ath10k_ce_completed_recv_next?
References: <52FC2ABF.5010300@candelatech.com>
Date: Thu, 13 Feb 2014 12:09:54 +0200
In-Reply-To: <52FC2ABF.5010300@candelatech.com> (Ben Greear's message of "Wed, 
 12 Feb 2014 18:15:27 -0800")
Message-ID: <87r4779vd9.fsf@kamboji.qca.qualcomm.com>
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

> I saw the crash below on startup.  My firmware is put back together
> again and mostly working, so not sure it is related to overly
> broken firmware.
>
> I have a few patches to ath10k, but mostly debugging code
> that should not affect the logic below.

When you have your own changes it pretty difficult to start debugging
crashes like this, as your private changes can break something. Can you
see these crashes with the upstream version?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
