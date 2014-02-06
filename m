Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBIHc-0003jG-BE
 for ath10k@lists.infradead.org; Thu, 06 Feb 2014 06:17:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/4] ath10k: Better tx/rx debugging.
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
 <1390435562-15473-4-git-send-email-greearb@candelatech.com>
 <87lhxqoghd.fsf@kamboji.qca.qualcomm.com>
 <CADnKcViuR401=cmsMSAVGL04pQ5U5+Kwn5-iUjQ5HfEbbhWcxA@mail.gmail.com>
 <874n4enkbs.fsf@kamboji.qca.qualcomm.com>
 <CADnKcVi5YEgVMtpmMNWOwwqv18ayjp5oiLfOSZxQ-1QJPHzhhA@mail.gmail.com>
 <52F26BF1.7030105@candelatech.com>
Date: Thu, 6 Feb 2014 08:17:27 +0200
In-Reply-To: <52F26BF1.7030105@candelatech.com> (Ben Greear's message of "Wed, 
 5 Feb 2014 08:50:57 -0800")
Message-ID: <874n4ckbns.fsf@kamboji.qca.qualcomm.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Marek Puzyniak <marek.puzyniak@tieto.com>, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 02/05/2014 01:10 AM, Marek Puzyniak wrote:
>
>>>> So probably it would be better to have choice to enable this log print
>>>> when someone need this information otherwise by default it should be
>>>> disabled.
>>>
>>> Maybe a debug message is better?
>> Yes, for example with flag ATH10K_DBG_HTT.
>
> That one is pretty spammy already..maybe I can create a new flag
> ATH10K_DBG_RX or something like that that is specifically for RX logic
> debugging?

Yeah, that would be good. And then we can later add _TX for transmit
side.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
