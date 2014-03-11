Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNKgR-0001GQ-US
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 11:17:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: unify warning messages in mac.c
In-Reply-To: <8761nv44nd.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Mon, 3 Mar 2014 18:40:22 +0200")
References: <20140303154327.1290.67278.stgit@potku.adurom.net>
 <CA+BoTQmQndikH5uPDwBpstp9KmcD3tmHSGP5NpEreYEOtRm0sw@mail.gmail.com>
 <8761nv44nd.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 11 Mar 2014 13:16:46 +0200
Message-ID: <87k3c1gf35.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

>> I think we should agree on one of the two approaches:
>>
>> a) start with a verb:
>>
>> "failed to add peer %pM on vdev %i: %d"
>> "failed to initialize dfs pattern detector"
>> "timed out while waiting for scan completion"
>>
>> b) start with a noun:
>>
>> "peer %pM on vdev %i could not be added: %d"
>> "dfs pattern detector could not initialize"
>> "scan timed out"
>>
>> These are still mixed.
>>
>> We could probably also limit the set of verbs, e.g. replace "could
>> not" with "failed to" as it's practically the same thing (assuming we
>> pick (a)).
>
> That's true. I would vote for option (a).

I didn't get any comments about Michal's proposal. Can I conclude from
this that (a) above is ok for everyone?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
