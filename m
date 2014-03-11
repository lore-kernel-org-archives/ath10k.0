Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNQdC-0006M7-2O
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 17:38:22 +0000
Message-ID: <531F49F2.3030408@candelatech.com>
Date: Tue, 11 Mar 2014 10:37:54 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: unify warning messages in mac.c
References: <20140303154327.1290.67278.stgit@potku.adurom.net>
 <CA+BoTQmQndikH5uPDwBpstp9KmcD3tmHSGP5NpEreYEOtRm0sw@mail.gmail.com>
 <8761nv44nd.fsf@kamboji.qca.qualcomm.com>
 <87k3c1gf35.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87k3c1gf35.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/11/2014 04:16 AM, Kalle Valo wrote:
> Kalle Valo <kvalo@qca.qualcomm.com> writes:
> 
>>> I think we should agree on one of the two approaches:
>>>
>>> a) start with a verb:
>>>
>>> "failed to add peer %pM on vdev %i: %d"
>>> "failed to initialize dfs pattern detector"
>>> "timed out while waiting for scan completion"
>>>
>>> b) start with a noun:
>>>
>>> "peer %pM on vdev %i could not be added: %d"
>>> "dfs pattern detector could not initialize"
>>> "scan timed out"
>>>
>>> These are still mixed.
>>>
>>> We could probably also limit the set of verbs, e.g. replace "could
>>> not" with "failed to" as it's practically the same thing (assuming we
>>> pick (a)).
>>
>> That's true. I would vote for option (a).
> 
> I didn't get any comments about Michal's proposal. Can I conclude from
> this that (a) above is ok for everyone?


I like (a), but I would also suggest giving user a clue as to the
severity.  Something starting with 'failed' or 'warning' is pretty obvious.

A timeout is less so..ie, how much of a problem is the timeout?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
