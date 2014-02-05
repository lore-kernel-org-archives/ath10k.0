Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WB5h2-0001Al-EO
 for ath10k@lists.infradead.org; Wed, 05 Feb 2014 16:51:21 +0000
Message-ID: <52F26BF1.7030105@candelatech.com>
Date: Wed, 05 Feb 2014 08:50:57 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] ath10k: Better tx/rx debugging.
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
 <1390435562-15473-4-git-send-email-greearb@candelatech.com>
 <87lhxqoghd.fsf@kamboji.qca.qualcomm.com>
 <CADnKcViuR401=cmsMSAVGL04pQ5U5+Kwn5-iUjQ5HfEbbhWcxA@mail.gmail.com>
 <874n4enkbs.fsf@kamboji.qca.qualcomm.com>
 <CADnKcVi5YEgVMtpmMNWOwwqv18ayjp5oiLfOSZxQ-1QJPHzhhA@mail.gmail.com>
In-Reply-To: <CADnKcVi5YEgVMtpmMNWOwwqv18ayjp5oiLfOSZxQ-1QJPHzhhA@mail.gmail.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

On 02/05/2014 01:10 AM, Marek Puzyniak wrote:

>>> So probably it would be better to have choice to enable this log print
>>> when someone need this information otherwise by default it should be
>>> disabled.
>>
>> Maybe a debug message is better?
> Yes, for example with flag ATH10K_DBG_HTT.

That one is pretty spammy already..maybe I can create a new flag
ATH10K_DBG_RX or something like that that is specifically for RX logic
debugging?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
