Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYId9-000861-HH
 for ath10k@lists.infradead.org; Mon, 21 Oct 2013 16:47:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Fwd: ath10k related kernel crash in wireless-testing
 (3.12.0-rc3-wl+)
References: <52588F0C.3000009@candelatech.com>
 <525EB81E.5060305@candelatech.com>
 <87li1t5gmi.fsf@kamboji.qca.qualcomm.com>
 <87fvruu3jz.fsf@kamboji.qca.qualcomm.com>
 <52654F7E.3080606@candelatech.com>
Date: Mon, 21 Oct 2013 19:46:31 +0300
In-Reply-To: <52654F7E.3080606@candelatech.com> (Ben Greear's message of "Mon, 
 21 Oct 2013 08:59:58 -0700")
Message-ID: <87ob6ishaw.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

>> We are working on fixing the wakeup issue, doing just warm reset helps
>> but there are other problems with that. Need to investigate more.
>> 
>> And we need to fix the interrupt race properly at some point, I added a
>> todo entry for this:
>> 
>> http://wireless.kernel.org/en/users/Drivers/ath10k/todo
>
> Thanks.  Is this the proper repository to develop/test against?
>
> git://github.com/kvalo/ath.git
>
> ('master' branch)?

Yes. The master branch is basically no more than 2 weeks old
wireless-testing plus latest ath10k/ath6kl patches.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
